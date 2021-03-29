package com.my.controller;

import com.my.model.CartVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

@Controller
public class BookController {

    private static final Logger logger = LoggerFactory.getLogger(BookController.class);

    // 메인화면
    @RequestMapping(value = "/main", method = RequestMethod.GET)
    public void mainPageGET() {
        logger.info("MainPage Moving");
    }

    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public void indexGET() {
        logger.info("MainPage Moving");
    }
}
