package com.my.service;

import com.my.mapper.AdminMapper;
import com.my.model.CategoryVO;
import com.my.model.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("AdminService")
public class AdminServiceImpl implements AdminService {

    @Autowired
    AdminMapper adminMapper;

    /* 상품 카테고리 */
    @Override
    public List<CategoryVO> category() throws Exception {
        return adminMapper.category();
    }

    /* 상품 등록 */
    @Override
    public void register(ProductVO productVO) throws Exception {
        adminMapper.register(productVO);
    }

    /* 상품 목록 */
    @Override
    public List<ProductVO> productList() throws Exception {
        return adminMapper.productList();
    }

    /* 상품 조회 */
    @Override
    public ProductVO productView(int num) throws Exception {
        return adminMapper.productView(num);
    }
}
