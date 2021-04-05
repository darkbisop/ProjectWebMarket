package com.my.controller;

import java.security.*;
import java.util.Random;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.model.MemberVO;
import com.my.service.MemberService;
import com.my.model.RSA;
import com.my.util.RSAUtil;

import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService memberService;

    @Autowired
    private JavaMailSender mailSender;

    @Autowired
    private BCryptPasswordEncoder passwordEncoder;

    @Autowired
    private RSAUtil rsaUtil;

    // 회원가입 페이지 이동
    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public void signUpGET() {
        logger.info("This is SignUp Page");
    }

    // 회원가입
    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String signUpPOST(MemberVO memberVO, HttpServletRequest request) throws Exception {
        logger.info("signUp진입");

      /*  String pw;
        String encodePw;

        pw = memberVO.getMemberPw();
        encodePw = passwordEncoder.encode(pw);
        memberVO.setMemberPw(encodePw);*/

        memberService.memberSignUp(memberVO);

        logger.info("signUp service success");

        HttpSession session = request.getSession();
        MemberVO member = memberService.memberLogin(memberVO);
        session.setAttribute("member", member);
        return "redirect:/index";
    }

    // 로그인 페이지 이동
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String loginGET(HttpSession session, Model model) throws Exception {
        logger.info("RSA Processing");
        PrivateKey key = (PrivateKey)session.getAttribute("__RSAPrivateKey__");

        if (key != null) {
            session.removeAttribute("__RSAPrivateKey__");
        }

        RSA rsa = rsaUtil.createRSA();
        model.addAttribute("modulus", rsa.getModulus());
        model.addAttribute("exponent", rsa.getExponent());
        session.setAttribute("__RSAPrivateKey__", rsa.getPrivateKey());

        return "member/login";
    }

    /* 로그인 */
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String loginPOST(HttpServletRequest request, MemberVO memberVO, HttpSession session, RedirectAttributes rttr) throws Exception {
        logger.info("Login Processing");

        // 세션에 저장된 개인키를 불러온다
        PrivateKey privateKey = (PrivateKey)session.getAttribute("__RSAPrivateKey__");
        if (privateKey == null) {
            rttr.addFlashAttribute("resultMsg", "비정상적인 접근");
            return "redirect:/member/login";
        }

        session.removeAttribute("__RSAPrivateKey__");

       try {
           String email = rsaUtil.getDecryptTest(privateKey, memberVO.getMemberId());
           String password = rsaUtil.getDecryptTest(privateKey, memberVO.getMemberPw());
           System.out.println("email : " + email);
           System.out.println("password : " + password);
           memberVO.setMemberId(email);
           memberVO.setMemberPw(password);
       } catch (Exception e) {
           rttr.addFlashAttribute("resultMsg", "비정상적인 접근");
           return "redirect:/member/login";
       }
        MemberVO member = memberService.memberLogin(memberVO);

       if (memberVO.getMemberPw().equals(member.getMemberPw())) {
           session.setAttribute("member", member);
           session.setMaxInactiveInterval(60 * 5);
           return "redirect:/index";
       } else {
           return "redirect:/member/login";
       }

        /*HttpSession session = request.getSession();
        String pw;
        String encodePw;

        MemberVO member = memberService.memberLogin(memberVO);

        if (member == null) {
            rttr.addFlashAttribute("result", 0);
            return "redirect:/member/login";
        }

        pw = memberVO.getMemberPw();
        encodePw = member.getMemberPw();

        if (passwordEncoder.matches(pw, encodePw)) {
            member.setMemberPw("");
            session.setAttribute("member", member);
            return "redirect:/main";
        } else {
            rttr.addFlashAttribute("result", 0);
            return "redirect:/member/login";
        }*/
    }

    @RequestMapping(value = "/logout", method = RequestMethod.GET)
    public String logoutMainGET(HttpServletRequest request) throws Exception {
        logger.info("logout Method 진입");

        HttpSession session = request.getSession();
        session.removeAttribute("member");

        return "redirect:/index";
    }

    @RequestMapping(value = "/logout.do", method = RequestMethod.POST)
    @ResponseBody
    public void logoutPOST(HttpServletRequest request) throws  Exception {
        logger.info("비동기 로그아웃 메서드 진입");
        HttpSession session = request.getSession();
        session.removeAttribute("member");
    }

    // 아이디 중복 검사
    @RequestMapping(value = "/memberIdCheck", method = RequestMethod.POST)
    @ResponseBody
    public String memberIdCheckPOST(String memberId) throws Exception {
        //logger.info("memberIdCheck insert");

        int result = memberService.idCheck(memberId);
        //logger.info("result : " + result);

        if (result != 0) {
            return "fail";
        } else {
            return "success";
        }
    }

    // 이메일 인증
    @RequestMapping(value = "/mailCheck", method = RequestMethod.GET)
    @ResponseBody
    public String mailCheckGET(String email) throws Exception {
        logger.info("이메일 데이터 전송 확인");
        logger.info("인증번호 : " + email);

        Random random = new Random();
        int checkNum = random.nextInt(888888) + 111111;
        logger.info("인증번호 : " + checkNum);

        String setFrom = "flyingwitch87@gmail.com";
        String title = " 회원가입 인증 이메일 입니다";
        String content = "홈페이지를 방문해주셔서 감사합니다." + "<br<br>"
                + "인증번호는 " + checkNum + "입니다." + "<br>";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(email);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        return Integer.toString(checkNum);
    }

    @RequestMapping(value = "/aside", method = RequestMethod.GET)
    public void listGET() throws Exception {
        logger.info("list");

    }
}
