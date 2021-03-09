package com.my.service;

import com.my.model.CategoryVO;
import com.my.model.ProductVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminService {

    /* 상품 카테고리 */
    List<CategoryVO> category() throws Exception;

    /* 상품 등록 */
    void register(ProductVO productVO) throws Exception;

    /* 상품 목록 */
    List<ProductVO> productList() throws Exception;

    /* 상품 조회 */
    ProductVO productView(int num) throws Exception;
}
