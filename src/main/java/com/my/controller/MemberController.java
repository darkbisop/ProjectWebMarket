package com.my.controller;

import java.util.Random;
import javax.mail.internet.MimeMessage;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailSender;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.my.model.MemberVO;
import com.my.service.MemberService;

@Controller
@RequestMapping(value = "/member")
public class MemberController {

    private static final Logger logger = LoggerFactory.getLogger(MemberController.class);

    @Autowired
    private MemberService memberService;

    @Autowired
    private JavaMailSender mailSender;

    // 회원가입 페이지 이동
    @RequestMapping(value = "/signUp", method = RequestMethod.GET)
    public void signUpGET() {
        logger.info("This is SignUp Page");
    }

    // 회원가입
    @RequestMapping(value = "/signUp", method = RequestMethod.POST)
    public String signUpPOST(MemberVO memberVO) throws Exception {
        logger.info("signUp진입");

        memberService.memberSignUp(memberVO);

        logger.info("signUp service success");

        return "redirect:/main";
    }

    // 로그인 페이지 이동
    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public void loginGET() {
        logger.info("This is Login Page");
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

        String setFrom = "darkbisop@naver.com";
        String toMail = email;
        String title = " 회원가입 인증 이메일 입니다";
        String content = "홈페이지를 방문해주셔서 감사합니다." + "<br<br>"
                + "인증번호는 " + checkNum + "입니다." + "<br>";

        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper helper = new MimeMessageHelper(message, true, "utf-8");
            helper.setFrom(setFrom);
            helper.setTo(toMail);
            helper.setSubject(title);
            helper.setText(content, true);
            mailSender.send(message);
        } catch (Exception e) {
            // TODO: handle exception
            e.printStackTrace();
        }

        String num = Integer.toString(checkNum);

        return num;
    }
}
