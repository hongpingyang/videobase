package com.hong.py.main.page.controller;


import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

/**
 * 主页
 */
@Controller
public class Mainpage {

    @RequestMapping("/")
    public String Welcome()
    {
        return "index";
    }

}
