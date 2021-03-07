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

    @Override
    public List<CategoryVO> category() throws Exception {
        return adminMapper.category();
    }

    @Override
    public void register(ProductVO productVO) throws Exception {
        adminMapper.register(productVO);
    }
}
