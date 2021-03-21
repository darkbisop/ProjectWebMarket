package com.my.controller;

import com.my.model.MemberVO;
import com.my.model.ProductVO;
import com.my.model.ReplyVO;
import com.my.service.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.List;

@Controller
@RequestMapping("/shop")
public class ShopController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    ShopService shopService;

    @RequestMapping(value = "/list", method = RequestMethod.GET)
    public void listGET(@RequestParam("c") int cateCode, @RequestParam("l") int level, Model model) throws Exception {
        logger.info("get list");
        List<ProductVO> list = null;
        list = shopService.list(cateCode);

        model.addAttribute("list", list);
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public void viewGET(@RequestParam("n") int productNum, Model model) throws Exception {
        logger.info("product View");
        ProductVO view = shopService.productView(productNum);
        model.addAttribute("view", view);

        List<ReplyVO> replyList = shopService.replyList(productNum);
        model.addAttribute("replyList", replyList);
    }

    @RequestMapping(value = "/view", method = RequestMethod.POST)
    public String registReplyPOST(ReplyVO replyVO, HttpSession session) throws Exception {
        logger.info("reply Regist");
        if (session.getAttribute("member") != null) {
            MemberVO memberVO = (MemberVO) session.getAttribute("member");
            replyVO.setMemberId(memberVO.getMemberId());

        } else if (session.getAttribute("googleMember") != null) {
            String member = (String)session.getAttribute("googleMember");
            replyVO.setMemberId(member);

        } else if (session.getAttribute("kakaoMember") != null) {
            String member = (String)session.getAttribute("kakaoMember");
            replyVO.setMemberId(member);
        }

        shopService.registReply(replyVO);

        return "redirect:/shop/view?n=" + replyVO.getProductNum();
    }
}
