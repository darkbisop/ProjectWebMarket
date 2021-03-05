package com.my.controller;

import com.my.model.CategoryVO;
import com.my.service.AdminService;
import com.mysql.cj.xdevapi.JsonArray;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception {
        logger.info("관리자 페이지 이동");
    }

    // 상품등록
    @RequestMapping(value = "/product/resister", method = RequestMethod.GET)
    public void productResisterGET(Model model) throws Exception {
        logger.info("Product Resister");

        List<CategoryVO> category;
        category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));
    }
}
