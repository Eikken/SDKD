package com.sdkd.controller;

import com.sdkd.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.UnsupportedEncodingException;

/**
 * @author Young
 * @date 2020/4/11 22:53
 * @see com.sdkd.controller
 */
@Controller
@RequestMapping(value = "/user")
public class UserTestController {
    //bean name
    @Resource
    private UserService us;

    @GetMapping("/loginform")
    public String loginform(){
        System.out.println("now enter loginform page");
        return "loginform";
    }

    @GetMapping("/register")
    public String register() {
        System.out.println("now enter register page");
        return "register";
    }

    @GetMapping("/testquestion")
    public String testquestion() {
        System.out.println("now enter testquestion page");
        return "testquestion";
    }


    @GetMapping("/chaxun")
    public String chaxun(){
        System.out.println("now enter chaxun page");
        return "chaxun";
    }

    @GetMapping("/login")
    public String login(){
        System.out.println("now enter login.jsp page");
        return "login";
    }

//    @GetMapping("/findAll")
//    public String findAll(Model model){
//        List<c_User> userList = us.findAll();
//        for(c_User user:userList){
//            System.out.print("\tID: "+user.getId());
//            System.out.println("\tName: "+user.getName());
//        }
//        int userCounter = us.countByName("");
//        return "hello";
//    }

    @RequestMapping(value = "/countByName",method = RequestMethod.POST)
    public String countByName(HttpServletRequest req, Model model, @RequestParam String username) throws UnsupportedEncodingException {
        String name = req.getParameter("username");
        System.err.println(name);
        int userCounter = us.countByName(name);
        if(userCounter!=0){
            System.out.println("叫 "+name+" 的有"+userCounter+"个人。"+username);
        }else {
            System.err.println("没有 "+name+" 这个人。"+username);
        }
        return "chaxun";
    }

}
