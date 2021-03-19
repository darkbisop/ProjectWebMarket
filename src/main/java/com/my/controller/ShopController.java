package com.my.controller;

import com.my.model.ProductVO;
import com.my.service.ShopService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

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
    public void viewGET(@RequestParam("n") int num, Model model) throws Exception {
        logger.info("product View");
        ProductVO view = shopService.productView(num);
        model.addAttribute("view", view);
    }
}
