package com.sdkd.controller;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.ServletContext;

/**
 * @author Young
 * @date 2020/3/22 1:48
 * @see com.sdkd.controller
 */

@Controller
@RequestMapping("/test")
public class TestController {
    @GetMapping("/sayHello")
    public String sayHello() {
        System.out.println("now enter hello.jsp");
        return "hello";
    }

    @GetMapping("/backIndex")
    public String backIndex() {
        System.out.println("now enter index.html");
        return "index";
    }


}
