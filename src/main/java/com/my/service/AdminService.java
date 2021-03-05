package com.my.service;

import com.my.model.CategoryVO;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface AdminService {

    List<CategoryVO> category() throws Exception;
}
