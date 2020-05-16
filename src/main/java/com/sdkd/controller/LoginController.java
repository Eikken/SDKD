
/**
 * @author Young
 * @date 2020/4/11 11:24
 * @see com.sdkd.controller
 */
package com.sdkd.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import com.sdkd.common.EncoderHandler;
import com.sdkd.service.UserRoleService;
import com.sdkd.service.UserService;

import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Controller
@RequestMapping("/user")
public class LoginController {
    @Resource
    private UserService userService;
    @Resource
    private UserRoleService userRoleService;

    @RequestMapping(value = "/login")
    public String login(){
        System.err.println("login page------->");
        return "login";
    }

    @GetMapping("/SendBlog")
    public String endBlog() {
        System.out.println("now enter GetMapping SendBlog page");
        return "SendBlog";
    }
    @RequestMapping("/SendBlog")
    public String sendBlog() {
        System.out.println("now enter RequestMapping SendBlog page");
        return "SendBlog";
    }
    @RequestMapping(value = "/loginCheck")
//    @ResponseBody
//    @PathVariable是获取url上数据的。
//    @RequestParam获取请求参数的（包括post表单提交）
    public String loginCheck(HttpServletRequest request, @RequestParam(value = "userName",required = false) String username, @RequestParam(value = "password",required = false) String password) {
//        String uname = request.getParameter("userName");
//        String upwd = request.getParameter("password");
//        System.err.println("uname="+uname+"&upwd="+upwd);
//        System.err.println("userName="+userName+"&password="+password);
//        uname=1231&upwd=123
//        userName=1231&password=123
//        以上都能娶到前端值
        Integer userName = null;
        if(isDigit(username)){
            userName = Integer.parseInt(username);
            //或者Integer.valueOf("520");
        }else {
            String tips ="用户名 " + username + " 不合法！不是数字类型！";
            HttpSession session = request.getSession();
            session.setAttribute("tips", tips);
            return "500";
        }
        try {

            User user = userService.checkLogin(userName, password);
            if (user != null) {
                // 获取当前登录用户的角色
                UserDTO userDTO = userRoleService.findByUser(user);
                String currentRole = userDTO.getIsExpert();//专家或用户
                String currentName = userDTO.getName();
                HttpSession session = request.getSession();
                session.setAttribute("USER", user);
                session.setAttribute("currentRole", currentRole);//角色
                session.setAttribute("currentName", currentName);//用户名
                session.setAttribute("uid", userDTO.getId());//用户账号
                session.setAttribute("pid", userDTO.getIs_expert());//权限信息
                return "redirect:SendBlog.action";
            }else{

                System.err.println("No user "+userName);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        HttpSession session = request.getSession();
        session.setAttribute("user",userName);
        return "redirect:login.action?msg=UserInformationCheckError";
    }

    @ResponseBody
    @RequestMapping(value = "/loginout")
    public ModelMap loginout(HttpServletRequest request) {
        ModelMap mm = new ModelMap();
        try {
            request.getSession().removeAttribute("USER");
            request.getSession().removeAttribute("currentRole");
            request.getSession().removeAttribute("currentName");
            request.getSession().removeAttribute("uid");
            request.getSession().removeAttribute("pid");
        } catch (Exception e) {
            e.printStackTrace();
        }
        return mm;
    }


    public boolean HasDigit(String content) {
        boolean flag = false;
        Pattern p = Pattern.compile(".*\\d+.*");
        Matcher m = p.matcher(content);
        if (m.matches()) {
            flag = true;
        }
        return flag;
    }

    public boolean isDigit(String strNum) {
        return strNum.matches("[0-9]{1,}");
    }
}
