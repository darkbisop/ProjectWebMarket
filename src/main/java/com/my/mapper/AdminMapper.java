package com.my.mapper;

import com.my.model.CategoryVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminMapper {

    List<CategoryVO> category() throws Exception;
}
