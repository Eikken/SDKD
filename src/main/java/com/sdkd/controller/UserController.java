package com.sdkd.controller;

import com.alibaba.fastjson.JSON;
import com.sdkd.bean.JsonBean;
import com.sdkd.common.JsonReader;
import com.sdkd.dto.BlogDTO;
import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;
import com.sdkd.service.BlogService;
import com.sdkd.service.UserService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.util.CollectionUtils;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.persistence.criteria.CriteriaBuilder;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.*;

/**
 * @author Young
 * @date 2020/4/12 0:17
 * @see com.sdkd.controller
 */
@Controller
@RequestMapping("/user")
public class UserController {
    //bean name
    @Resource
    private UserService userService;

    @Resource
    private BlogService blogService;

    @RequestMapping("/userManagement")
    public String userManagement(){
        System.err.println("login userManagement------->");
        return "userManagement";
    }

    @RequestMapping("/profile")
    public String profile(){
        System.err.println("login profile------->");
        return "profile";
    }

    @RequestMapping("/editProfile")
    public String editProfile(){

        System.err.println("login editProfile------->");
        return "editProfile";
    }


    @ResponseBody
    @RequestMapping(value = "/getProfile")
    public ModelMap getProfile(HttpServletRequest request, @RequestParam(value = "uid", required = false) String uid) {
        ModelMap mm = new ModelMap();
        if (uid=="false"){
            return mm.addAttribute("str",null);
        }
        List<UserDTO> userDTOList = userService.searchUser(Integer.parseInt(uid));
        if(CollectionUtils.isEmpty(userDTOList)){
            System.err.println("CollectionUtils.isEmpty(userDTOList)");
            return mm.addAttribute("str",null);
        }
        JsonBean jsonBean = new JsonBean();

        try{
            jsonBean.setCode(1);
            jsonBean.setMsg("success");
            jsonBean.setData(userDTOList);
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("failed");
            jsonBean.setCode(-1);
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }

    }

    @ResponseBody
    @RequestMapping(value = "/getBlog")
    public ModelMap getBlog(@RequestParam(value = "uid", required = false) String uid) {
        ModelMap mm = new ModelMap();
        if (uid.equals("false")){
            JsonBean jsonBean = new JsonBean();
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录，无法获取blog");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        List<BlogDTO> blogDTOList = blogService.findUserBlog(Integer.parseInt(uid));
        if(CollectionUtils.isEmpty(blogDTOList)){
            System.err.println("CollectionUtils.isEmpty(userDTOList)");
            JsonBean jsonBean = new JsonBean();
            jsonBean.setCode(-1);
            jsonBean.setMsg("failed");
            jsonBean.setData(blogDTOList);//blogDTOList == null
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        JsonBean jsonBean = new JsonBean();
        try{
            jsonBean.setCode(1);
            jsonBean.setMsg("success");
            jsonBean.setData(blogDTOList);
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("failed");
            jsonBean.setCode(-1);
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }

    }

    @RequestMapping("/load")
    protected void doPost(HttpServletResponse response) throws IOException {
        List<UserDTO> userDTOList = userService.findAll();
        JsonReader jsonReader = new JsonReader();
        jsonReader.setID(0);
        jsonReader.setPage(1);
        jsonReader.setTotal(1);
        jsonReader.setRecords(userDTOList.size());
        jsonReader.setRows(userDTOList);
        String jsonData = JSON.toJSONString(jsonReader);
        response.setCharacterEncoding("UTF-8");
        response.getWriter().write(jsonData);
    }

    @ResponseBody
    @RequestMapping(value = "/edit")
    public ModelMap edit() {
        ModelMap mm = new ModelMap();
        System.err.println("editing==>>");
        return mm;
    }

    @ResponseBody
    @RequestMapping(value = "/updateUser")
    public ModelMap updateUser(@RequestBody User user,HttpServletRequest request) {
        ModelMap mm = new ModelMap();
        JsonBean jsonBean = new JsonBean();
        HttpSession session = request.getSession();
        Integer uid = (Integer) session.getAttribute("uid");
//        User sessionUser = userService.findById(uid);
        user.setId(uid);
        if(uid==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录，无法修改信息！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
//        System.err.println(user.toString());
//        User{id=1601020727, name='123', password='123123', is_expert=null, phone='1787878', wechat='wxid111111', profile='123123哈哈哈', state=null, userPic='null', sex='女', number=null, birthday=Mon May 04 08:00:00 CST 2020, address='中国香港特别行政区', email='122', qq=111111, creatTime=null}
        if(userService.updateUser(user)){
            jsonBean.setMsg("修改信息成功！");
            jsonBean.setCode(1);
        }else {
            jsonBean.setMsg("修改信息失败！500错误！");
            jsonBean.setCode(-1);
        }
        return mm.addAttribute("str",JSON.toJSONString(jsonBean));
    }

    @ResponseBody
    @RequestMapping(value = "/updatePassword")
    public ModelMap updatePassword(@RequestBody User user,HttpServletRequest request) {
        ModelMap mm = new ModelMap();
        JsonBean jsonBean = new JsonBean();
        HttpSession session = request.getSession();
        Integer uid = (Integer) session.getAttribute("uid");
        user.setId(uid);
        if(uid==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录，无法修改密码！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(userService.updatePassword(user)){
            jsonBean.setMsg("修改密码成功！");
            jsonBean.setCode(1);
        }else {
            jsonBean.setMsg("修改密码失败！500错误！");
            jsonBean.setCode(-1);
        }
        return mm.addAttribute("str",JSON.toJSONString(jsonBean));
    }
}

