package com.my.controller;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.util.HashMap;

import com.google.gson.JsonObject;
import org.springframework.stereotype.Controller;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpSession;

@Controller
@RequestMapping(value = "/kakao")
public class KaKaoController {

    private final static String K_CLIENT_ID ="27455cf079b38009ee0184c422408895";
    private final static String K_REDIRECT_URI = "http://localhost:8080/kakao/kakaoLogin.do";

    @RequestMapping(value = "kakaoLogin", method = RequestMethod.GET)
    public ModelAndView kakaoLoginGET(HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        String kakaoUrl = getAuthorizationUrl(session);
        mav.setViewName("/kakao/kakaoLogin");
        mav.addObject("kakao_url", kakaoUrl);

        return mav;
    }

    @RequestMapping(value = "/kakaoLogin.do")
    public String kakaoLoginPOST(@RequestParam("code") String code, HttpSession session) throws Exception {
        ModelAndView mav = new ModelAndView();
        String access_Token = getAccessToken(code);
        System.out.println("controller access_token : " + access_Token);
        HashMap<String, Object> userInfo = getUserInfo(access_Token);
        System.out.println("login Controller : " + userInfo);

        if (userInfo.get("email") != null) {
            session.setAttribute("kakaoMember", userInfo.get("email"));
            session.setAttribute("access_Token", access_Token);
        }

       /* JsonNode node = getAccessToken(code);
        JsonNode accessToken = node.get("access_token");
        JsonNode userInfo = getKakaoUserInfo(access_Token);

        String email = null;
        String name = null;
        String gender = null;
        String birthDay = null;
        String age = null;
        String image = null;

        JsonNode properties = userInfo.path("properties");
        JsonNode kakao_account = userInfo.path("kakao_account");

        email = kakao_account.path("email").asText();
        name = properties.path("nickname").asText();
        image = properties.path("profile_image").asText();
        gender = kakao_account.path("gender").asText();
        birthDay = kakao_account.path("birthday").asText();
        age = kakao_account.path("age_range").asText();

        session.setAttribute("email", email);
        session.setAttribute("name", name);
        session.setAttribute("image", image);
        session.setAttribute("gender", gender);
        session.setAttribute("birthday", birthDay);
        session.setAttribute("age", age);*/

        return "redirect:/main";
    }

    @RequestMapping(value = "kakaoLogout", method = {RequestMethod.GET, RequestMethod.POST})
    public String kakaoLogoutPOST(HttpSession session) throws Exception {
        logOut((String)session.getAttribute("access_Token"));
        session.removeAttribute("access_Token");
        session.removeAttribute("kakaoMember");

        return "redirect:/main";
    }

    public static String getAuthorizationUrl(HttpSession session) {
        String kakaoUrl = "https://kauth.kakao.com/oauth/authorize?" + "client_id=" + K_CLIENT_ID + "&redirect_uri=" + K_REDIRECT_URI + "&response_type=code";

        return kakaoUrl;
    }

    public String getAccessToken (String authorize_code) {
        String access_Token = "";
        String refresh_Token = "";
        String reqURL = "https://kauth.kakao.com/oauth/token";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();

            //    POST 요청을 위해 기본값이 false인 setDoOutput을 true로
            conn.setRequestMethod("POST");
            conn.setDoOutput(true);

            //    POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
            BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
            StringBuilder sb = new StringBuilder();
            sb.append("grant_type=authorization_code");
            sb.append("&client_id=27455cf079b38009ee0184c422408895");
            sb.append("&redirect_uri=http://localhost:8080/kakao/kakaoLogin.do");
            sb.append("&code=" + authorize_code);
            bw.write(sb.toString());
            bw.flush();

            //    결과 코드가 200이라면 성공
            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            //    요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String line;
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            //    Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result);

            access_Token = element.getAsJsonObject().get("access_token").getAsString();
            refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

            System.out.println("access_token : " + access_Token);
            System.out.println("refresh_token : " + refresh_Token);

            br.close();
            bw.close();
        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return access_Token;
    }

    public HashMap<String, Object> getUserInfo (String access_Token) {

        //    요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
        HashMap<String, Object> userInfo = new HashMap<>();
        String reqURL = "https://kapi.kakao.com/v2/user/me";
        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection) url.openConnection();
            conn.setRequestMethod("POST");

            //    요청에 필요한 Header에 포함될 내용
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

            String line;
            String result = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println("response body : " + result);

            JsonParser parser = new JsonParser();
            JsonElement element = parser.parse(result.toString());

            //JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
            JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

            //String nickname = properties.getAsJsonObject().get("nickname").getAsString();
            String email = kakao_account.getAsJsonObject().get("email").getAsString();

            //userInfo.put("nickname", nickname);
            userInfo.put("email", email);

        } catch (IOException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return userInfo;
    }

    public void logOut(String access_Token) {
        String reqURL = "https://kapi.kakao.com/v1/user/unlink";

        try {
            URL url = new URL(reqURL);
            HttpURLConnection conn = (HttpURLConnection)url.openConnection();
            conn.setRequestMethod("POST");
            conn.setRequestProperty("Authorization", "Bearer " + access_Token);

            int responseCode = conn.getResponseCode();
            System.out.println("responseCode : " + responseCode);

            BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
            String result = "";
            String line = "";

            while ((line = br.readLine()) != null) {
                result += line;
            }
            System.out.println(result);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /*public static JsonNode getAccessToken(String autorize_code) throws IOException {
        final String requestUrl = "https://kauth.kakao.com/oauth.token";
        final List<NameValuePair> postParams = new ArrayList<NameValuePair>();
        postParams.add(new BasicNameValuePair("grant_type", "authorization_code"));
        postParams.add(new BasicNameValuePair("client_id", "27455cf079b38009ee0184c422408895"));
        postParams.add(new BasicNameValuePair("redirect_uri", "http://localhost:8080/kakao/kakaoLogin.do"));
        postParams.add(new BasicNameValuePair("code", autorize_code));
        final HttpClient client = HttpClientBuilder.create().build();
        final HttpPost post = new HttpPost(requestUrl);
        JsonNode returnNode = null;

        try {
            post.setEntity(new UrlEncodedFormEntity(postParams));
            final HttpResponse response = client.execute(post);
            ObjectMapper mapper = new ObjectMapper();
            returnNode = mapper.readTree(response.getEntity().getContent());
        } catch (UnsupportedEncodingException | ClientProtocolException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }

        return returnNode;
    }*/
}
