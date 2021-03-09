package com.my.controller;

import com.my.model.CategoryVO;
import com.my.model.ProductVO;
import com.my.service.AdminService;
import net.sf.json.JSONArray;
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
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    AdminService adminService;

    @RequestMapping(value = "main", method = RequestMethod.GET)
    public void adminMainGET() throws Exception {
        logger.info("관리자 페이지 이동");
    }

    /* 상품 등록 */
    @RequestMapping(value = "/product/register", method = RequestMethod.GET)
    public void productRegisterGET(Model model) throws Exception {
        logger.info("Product Register");

        List<CategoryVO> category;
        category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));
    }

    @RequestMapping(value = "/product/register.do", method = RequestMethod.POST)
    public String productRegisterPOST(ProductVO productVO) throws Exception {
        adminService.register(productVO);

        return "redirect:/admin/main";
    }

    /* 상품 목록 */
    @RequestMapping(value = "/product/list", method = RequestMethod.GET)
    public void productListGET(Model model) throws Exception {
        logger.info("Product List");

        List<ProductVO> list = adminService.productList();
        model.addAttribute("list", list);
    }

    /* 상품 조회 */
    @RequestMapping(value = "/product/view", method = RequestMethod.GET)
    public void productViewGET(@RequestParam("n") int Num, Model model) throws Exception {
        logger.info("product view");

        ProductVO productVO = adminService.productView(Num);
        model.addAttribute("product", productVO);

        List<CategoryVO> category;
        category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));
    }
}
