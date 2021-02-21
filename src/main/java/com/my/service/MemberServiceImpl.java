package com.my.service;

import com.my.mapper.MemberMapper;
import com.my.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service("MemberService")
public class MemberServiceImpl implements MemberService {

    @Autowired
    MemberMapper memberMapper;

    // 회원가입
    @Override
    public void memberSignUp(MemberVO memberVO) {
        memberMapper.memberSignUp(memberVO);
    }

    // 아이디 중복 검사
    @Override
    public int idCheck(String memberId) {
        return memberMapper.idCheck(memberId);
    }
}
