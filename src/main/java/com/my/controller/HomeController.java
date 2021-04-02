package com.my.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {
    private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
    // 메인화면
    @RequestMapping(value = "/index", method = RequestMethod.GET)
    public void indexGET() {
        logger.info("MainPage Moving");
    }

    @RequestMapping(value = "/mainPage", method = RequestMethod.GET)
    public void mainPageGET() {
        logger.info("MainPage Moving");
    }
}
