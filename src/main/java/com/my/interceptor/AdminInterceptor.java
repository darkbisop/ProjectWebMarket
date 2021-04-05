package com.my.interceptor;

import org.springframework.web.servlet.HandlerInterceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.my.model.MemberVO;

public class AdminInterceptor implements HandlerInterceptor {

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
        System.out.println("AdminInterceptor");
        HttpSession session = request.getSession();
        MemberVO memberVO = (MemberVO) session.getAttribute("member");

        if (memberVO == null || memberVO.getAdminCk() == 0) {
            response.sendRedirect("/ProjectWebMarket/index");
            return false;
        }

        return true;
    }
}
