package com.my.mapper;

import com.my.model.ProductVO;
import com.my.model.ReplyVO;
import org.springframework.stereotype.Repository;
import java.util.List;

@Repository
public interface ShopMapper {

    /*List<ProductVO> list(int cateCode, int cateCodeRef) throws Exception;*/
    List<ProductVO> list(int cateCode) throws Exception;

    ProductVO productView(int productNum) throws Exception;

    void registReply(ReplyVO replyVO) throws Exception;

    List<ReplyVO> replyList(int productNum) throws Exception;
}
