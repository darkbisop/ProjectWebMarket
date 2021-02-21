package com.my.service;

import com.my.model.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberService {

    // 회원가입
    void memberSignUp(MemberVO memberVO) throws Exception;

    // 아이디 중복 검사
    int idCheck(String memberId) throws Exception;
}
