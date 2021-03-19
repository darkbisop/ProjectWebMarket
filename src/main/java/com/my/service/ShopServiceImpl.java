package com.my.service;

import com.my.mapper.ShopMapper;
import com.my.model.ProductVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("ShopService")
public class ShopServiceImpl implements ShopService{

    @Autowired
    ShopMapper shopMapper;

    /*public List<ProductVO> list(int categoryCode, int categoryCodeRef) throws Exception {
        HashMap<String, Object> map = new HashMap<String, Object>();
        map.put("categoryCode", categoryCode);
        map.put("categoryCodeRef", categoryCodeRef);

        return shopMapper.list(categoryCode, categoryCodeRef);
    }*/

    public List<ProductVO> list(int categoryCode) throws Exception {
        return shopMapper.list(categoryCode);
    }

    public ProductVO productView(int productNum) throws Exception {
        return shopMapper.productView(productNum);
    }
}
