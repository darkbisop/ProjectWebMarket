package com.my.controller;

import com.my.model.CartVO;
import com.my.model.MemberVO;
import com.my.model.ProductVO;
import com.my.model.ReplyVO;
import com.my.service.ShopService;
import com.mysql.cj.PreparedQuery;
import org.apache.http.HttpRequest;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpSession;
import java.io.Console;
import java.util.ArrayList;
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
        List<ProductVO> list;
        list = shopService.list(cateCode);

        model.addAttribute("list", list);
    }

    @RequestMapping(value = "/view", method = RequestMethod.GET)
    public void viewGET(@RequestParam("n") int productNum, Model model) throws Exception {
        logger.info("product View");
        ProductVO view = shopService.productView(productNum);
        model.addAttribute("view", view);
    }

    @ResponseBody
    @RequestMapping(value = "/view/replyList", method = RequestMethod.GET)
    public List<ReplyVO> replyListGET(@RequestParam("n") int productNum) throws Exception {
        logger.info("replyListGET");

        List<ReplyVO> replyList = shopService.replyList(productNum);

        return replyList;
    }

    @ResponseBody
    @RequestMapping(value = "/view/registReply", method = RequestMethod.POST)
    public void registReplyPOST(ReplyVO replyVO, HttpSession session) throws Exception {
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
    }

    @ResponseBody
    @RequestMapping(value = "/view/updateReply", method = RequestMethod.POST)
    public int updateReplyPOST (ReplyVO replyVO, HttpSession session) throws Exception {
        logger.info("update reply");
        int result = 0;
        String userId = shopService.idCheck(replyVO.getReplyNum());

        if (session.getAttribute("member") != null) {
            MemberVO memberVO = (MemberVO) session.getAttribute("member");

            if (memberVO.getMemberId().equals(userId)) {
                replyVO.setMemberId(memberVO.getMemberId());
                shopService.updateReply(replyVO);
                result = 1;
            }


        } else if (session.getAttribute("googleMember") != null) {
            String member = (String)session.getAttribute("googleMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                shopService.updateReply(replyVO);
                result = 1;
            }

        } else if (session.getAttribute("kakaoMember") != null) {
            String member = (String)session.getAttribute("kakaoMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                shopService.updateReply(replyVO);
                result = 1;
            }
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/view/deleteReply", method = RequestMethod.POST)
    public int deleteReplyPOST(ReplyVO replyVO, HttpSession session) throws Exception {
        logger.info("post delete reply");
        int result = 0;
        String userId = shopService.idCheck(replyVO.getReplyNum());

        if (session.getAttribute("member") != null) {
            MemberVO memberVO = (MemberVO) session.getAttribute("member");

            if (memberVO.getMemberId().equals(userId)) {
                replyVO.setMemberId(memberVO.getMemberId());
                shopService.deleteReply(replyVO);
                result = 1;
            }

        } else if (session.getAttribute("googleMember") != null) {
            String member = (String)session.getAttribute("googleMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                shopService.deleteReply(replyVO);
                result = 1;
            }

        } else if (session.getAttribute("kakaoMember") != null) {
            String member = (String)session.getAttribute("kakaoMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                shopService.deleteReply(replyVO);
                result = 1;
            }
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/view/idCheck", method = RequestMethod.POST)
    public int idCheckPOST(ReplyVO replyVO, HttpSession session) throws Exception {
        logger.info("post delete reply");
        int result = 0;
        String userId = shopService.idCheck(replyVO.getReplyNum());

        if (session.getAttribute("member") != null) {
            MemberVO memberVO = (MemberVO) session.getAttribute("member");

            if (memberVO.getMemberId().equals(userId)) {
                replyVO.setMemberId(memberVO.getMemberId());
                result = 1;
            }

        } else if (session.getAttribute("googleMember") != null) {
            String member = (String)session.getAttribute("googleMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                result = 1;
            }

        } else if (session.getAttribute("kakaoMember") != null) {
            String member = (String)session.getAttribute("kakaoMember");

            if (member.equals(userId)) {
                replyVO.setMemberId(member);
                result = 1;
            }
        }

        return result;
    }

    @ResponseBody
    @RequestMapping(value = "/view/addCart", method = RequestMethod.POST)
    public int addCartPOST(@RequestParam("pN") String pN, CartVO cartVO, HttpSession session, ProductVO productVO) throws Exception {
        logger.info("add Cart");
        int result = 0;

        if (session.getAttribute("member") != null || session.getAttribute("googleMember") != null
            || session.getAttribute("kakaoMember") != null) {
            result = 1;
        }

        ArrayList<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
            session.setAttribute("cartList", cartList);
            session.setMaxInactiveInterval(60 * 5);
        }

        if (pN.equals(cartVO.getProductName())) {
            cartList.add(cartVO);
        }

        return result;
    }

    @RequestMapping(value = "/cartList", method = RequestMethod.GET)
    public void cartListGET(HttpSession session, Model model) throws Exception {
        logger.info("cartList");
        int sum = 0;
        int total = 0;
        ArrayList<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");
        if (cartList == null) {
            cartList = new ArrayList<>();
        }

        for (int i = 0; i < cartList.size(); i++) {
            sum = cartList.get(i).getProductPrice() * cartList.get(i).getCartStock();
            total = total + sum;
        }

        model.addAttribute("cartList", cartList);
        session.setAttribute("total", total);
    }

    @ResponseBody
    @RequestMapping(value = "/view/deleteCart", method = RequestMethod.POST)
    public int deleteCart(@RequestParam("pN") String pN, HttpSession session) throws Exception {
        logger.info("delete Cart");
        int result = 0;
        ArrayList<CartVO> cartList = (ArrayList<CartVO>) session.getAttribute("cartList");

        if (cartList != null) {
            for (int i = 0; i < cartList.size(); i++) {
                CartVO product = cartList.get(i);

                if (pN.equals(product.getProductName())) {
                    cartList.remove(cartList.get(i));
                    result = 1;
                }
            }
        }

        return result;
    }
}
