package com.my.controller;

import com.fasterxml.jackson.annotation.JsonInclude;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.databind.PropertyNamingStrategy;
import com.my.model.GoogleOAuthRequest;
import com.my.model.GoogleOAuthResponse;
import org.springframework.http.ResponseEntity;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.UriComponentsBuilder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;
import java.util.stream.Collectors;

@Controller
@RequestMapping(value = "/google")
public class GoogleController {

    private final static String G_CLIENT_ID ="253718818115-618288pgjbi00noh1fbdl69hve9bfhko.apps.googleusercontent.com";
    private final static String G_CLIENT_SECRET = "-7sdRkfJ0o7Qgb6-U2Uss6jU";
    private final static String G_REDIRECT_URI = "https://darkbisop.cafe24.com/ProjectWebMarket/google/googleLogin.do";

    @RequestMapping(value = "googleLogin", method = RequestMethod.GET)
    public ModelAndView googleLoginGET(HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        String googleUrl = getAuthorizationUrl(session);
        mav.setViewName("/google/googleLogin");
        mav.addObject("google_url", googleUrl);

        return mav;
    }

    @RequestMapping(value = "googleLogin.do")
    public String googleLoginPOST(@RequestParam("code") String authCode, HttpSession session) throws Exception {
        //HTTP Request를 위한 RestTemplate
        RestTemplate restTemplate = new RestTemplate();

        //Google OAuth Access Token 요청을 위한 파라미터 세팅
        GoogleOAuthRequest googleOAuthRequestParam =  new GoogleOAuthRequest();
        googleOAuthRequestParam.setClientId(G_CLIENT_ID);
        googleOAuthRequestParam.setClientSecret(G_CLIENT_SECRET);
        googleOAuthRequestParam.setCode(authCode);
        googleOAuthRequestParam.setRedirectUri(G_REDIRECT_URI);
        googleOAuthRequestParam.setGrantType("authorization_code");

        //JSON 파싱을 위한 기본값 세팅
        //요청시 파라미터는 스네이크 케이스로 세팅되므로 Object mapper에 미리 설정해준다.
        ObjectMapper mapper = new ObjectMapper();
        mapper.setPropertyNamingStrategy(PropertyNamingStrategy.SNAKE_CASE);
        mapper.setSerializationInclusion(JsonInclude.Include.NON_NULL);

        //AccessToken 발급 요청
        ResponseEntity<String> resultEntity = restTemplate.postForEntity("https://oauth2.googleapis.com/token", googleOAuthRequestParam, String.class);

        //Token Request
        GoogleOAuthResponse result = mapper.readValue(resultEntity.getBody(), new TypeReference<GoogleOAuthResponse>() {
        });

        //ID Token만 추출 (사용자의 정보는 jwt로 인코딩 되어있다)
        String jwtToken = result.getIdToken();
        String requestUrl = UriComponentsBuilder.fromHttpUrl("https://oauth2.googleapis.com/tokeninfo").queryParam("id_token", jwtToken).toUriString();

        String resultJson = restTemplate.getForObject(requestUrl, String.class);

        Map<String,String> userInfo = mapper.readValue(resultJson, new TypeReference<Map<String, String>>(){});

        if (userInfo.get("email") != null) {
            session.setAttribute("googleMember", userInfo.get("email"));
            session.setAttribute("token", result.getAccessToken());
        }

        return "redirect:/index";
    }

    @RequestMapping(value = "/googleLogout", method = {RequestMethod.GET, RequestMethod.POST})
    public String googleLogoutPOST(HttpSession session) throws Exception {
        session.removeAttribute("token");
        session.removeAttribute("googleMember");
        session.invalidate();

        return "redirect:/index";
    }

    public static String getAuthorizationUrl(HttpSession session) {
        String googleUrl = "https://accounts.google.com/o/oauth2/v2/auth?" + "client_id=" + G_CLIENT_ID + "&redirect_uri=" + G_REDIRECT_URI +
                "&response_type=code&scope=email%20profile%20openid&access_type=offline";

        return googleUrl;
    }

    public String getAccessToken(String code) {
        try {
            URL url = new URL("google_url");
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Content-Type", "application/x-www-form-urlencoded");
            conn.setDoOutput(true);

            Map<String, Object> params = new HashMap<>();
            params.put("code", code);
            params.put("client_id", G_CLIENT_ID);
            params.put("client_secret", G_CLIENT_SECRET);
            params.put("redirect_uri", G_REDIRECT_URI);
            params.put("grant_type", "authorization_code");

            String parameterString = params.entrySet().stream()
                    .map(x -> x.getKey() + "=" + x.getValue())
                    .collect(Collectors.joining("&"));

            BufferedOutputStream bous = new BufferedOutputStream(conn.getOutputStream());
            bous.write(parameterString.getBytes());
            bous.flush();
            bous.close();

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            StringBuilder sb = new StringBuilder();
            String line;

            while ((line = br.readLine()) != null) {
                sb.append(line);
            }

            if (conn.getResponseCode() == 200) {
                return sb.toString();
            }
            return "구글 로그인 요청 처리 실패";
        } catch (IOException e) {
            throw new IllegalArgumentException("알 수 없는 구글 로그인 Access Token 요청 URL 입니다 :: " + G_REDIRECT_URI);
        }
    }
}
