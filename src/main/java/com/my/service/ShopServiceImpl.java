package com.my.service;

import com.my.mapper.ShopMapper;
import com.my.model.ProductVO;
import com.my.model.ReplyVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.HashMap;
import java.util.List;

@Service("ShopService")
public class ShopServiceImpl implements ShopService{

    @Autowired
    ShopMapper shopMapper;

    public List<ProductVO> list(int categoryCode) throws Exception {
        return shopMapper.list(categoryCode);
    }

    public ProductVO productView(int productNum) throws Exception {
        return shopMapper.productView(productNum);
    }

    public void registReply(ReplyVO replyVO) throws Exception {
        shopMapper.registReply(replyVO);
    }

    public List<ReplyVO> replyList(int productNum) throws Exception {
        return shopMapper.replyList(productNum);
    }
}
