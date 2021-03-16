package com.my.controller;

import com.my.model.CategoryVO;
import com.my.model.ProductVO;
import com.my.service.AdminService;
import com.my.util.UploadFileUtil;
import net.sf.json.JSONArray;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.annotation.Resource;
import java.io.File;
import java.util.List;

@Controller
@RequestMapping("/admin")
public class AdminController {

    private static final Logger logger = LoggerFactory.getLogger(AdminController.class);

    @Autowired
    AdminService adminService;

    @Resource(name = "uploadPath")
    private String uploadPath;

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
    public String productRegisterPOST(ProductVO productVO, MultipartFile file) throws Exception {
        String imgUploadPath = uploadPath + File.separator + "img";
        String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
        String fileName;

        if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
            fileName = UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            productVO.setProductImage(File.separator + "img" + ymdPath + File.separator + fileName);
            productVO.setProductThumbnail(File.separator + "img" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

        } else {
            fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
            productVO.setProductImage(fileName);
            productVO.setProductThumbnail(fileName);
        }

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
    public void productViewGET(@RequestParam("n") int num, Model model) throws Exception {
        logger.info("product view");

        ProductVO productVO = adminService.productView(num);
        model.addAttribute("product", productVO);

        List<CategoryVO> category;
        category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));
    }

    /* 상품 수정 */
    @RequestMapping(value = "/product/update", method = RequestMethod.GET)
    public void productUpdateGET(@RequestParam("n") int num, Model model) throws Exception {
        logger.info("product Update");

        ProductVO productVO = adminService.productView(num);
        model.addAttribute("product", productVO);

        List<CategoryVO> category;
        category = adminService.category();
        model.addAttribute("category", JSONArray.fromObject(category));
    }

    @RequestMapping(value = "/product/update.do", method = RequestMethod.POST)
    public String productUpdatePOST(ProductVO productVO, MultipartFile file) throws Exception {

        String imgUploadPath = uploadPath + File.separator + "img";
        String ymdPath = UploadFileUtil.calcPath(imgUploadPath);
        String fileName;

        if (file.getOriginalFilename() != null && !file.getOriginalFilename().equals("")) {
            fileName = UploadFileUtil.fileUpload(imgUploadPath, file.getOriginalFilename(), file.getBytes(), ymdPath);
            productVO.setProductImage(File.separator + "img" + ymdPath + File.separator + fileName);
            productVO.setProductThumbnail(File.separator + "img" + ymdPath + File.separator + "s" + File.separator + "s_" + fileName);

        } else {
            fileName = uploadPath + File.separator + "images" + File.separator + "none.png";
            productVO.setProductImage(fileName);
            productVO.setProductThumbnail(fileName);
        }

        adminService.productUpdate(productVO);

        return "redirect:/admin/product/list";
    }

    /* 상품 삭제 */
    @RequestMapping(value = "/product/delete", method = RequestMethod.POST)
    public String productDelete(@RequestParam("n") int num) throws Exception {
        logger.info("product Delete");
        adminService.productDelete(num);

        return "redirect:/admin/product/list";
    }
}
