package com.my.mapper;

import com.my.model.MemberVO;
import org.springframework.stereotype.Repository;

@Repository
public interface MemberMapper {

    // 회원가입
    void memberSignUp(MemberVO memberVO);

    // 아이디 중복 검사
    int idCheck(String memberId);

    // 로그인
    MemberVO memberLogin(MemberVO memberVO);
}
