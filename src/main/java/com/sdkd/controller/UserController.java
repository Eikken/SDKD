package com.sdkd.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
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
import org.springframework.web.bind.annotation.*;

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

    @RequestMapping("/add")
    public String add(){
        System.err.println("login editProfile------->");
        return "add";
    }
    @RequestMapping("/addUser")
    public String addUser(HttpServletRequest request,
                             @RequestParam(value = "name",required = false) String name,
                             @RequestParam(value = "id",required = false) String id,
                             @RequestParam(value = "password",required = false) String password,
                             @RequestParam(value = "role",required = false) String role) {
        HttpSession session = request.getSession();
        Integer pid = (Integer) session.getAttribute("pid");

        if(pid==null) return "redirect:login.action";
        if(id==null) return "redirect:adminManage.action";
        if(pid==2){
            User user1 = userService.findById(Integer.parseInt(id));
            if(user1!=null){
                return "redirect:add.action?error="+"Can_Not_Insert_Existed_User.id";
            }
            User user = new User();
            user.setId(Integer.parseInt(id));
            user.setName(name);
            user.setPassword(password);
            user.setIs_expert(Integer.parseInt(role));
            user.setCreatTime(new Date());
            userService.insertUser(user);
            return "adminManage";
        }
        return "redirect:SendBlog.action";
    }

    @RequestMapping("/adminManage")
    public String adminManage(){
        System.err.println("进入后台管理页面e------->");
        return "adminManage";
    }
    @RequestMapping("/admin")
    public String admin(HttpServletRequest request, HttpServletResponse response){
//        String uid = request.getParameter("uid");
        HttpSession session = request.getSession();
        Integer pid = (Integer)session.getAttribute("pid");
        if(pid==null){
            return "redirect:login.action";
        }
//        User user = userService.findById(pid);
        if(pid==2){
            return "redirect:adminManage.action";
        }
        return "redirect:SendBlog.action";
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
//    @RequestMapping(value = "/layLoad")
    @RequestMapping(value = "/layLoad",method = RequestMethod.POST,produces ={"text/html;charset=UTF-8;", "application/json;"})
    public JsonBean layLoad() {
        System.err.println("layLoad==>>");
        JsonBean jsonBean = new JsonBean();
        try{
            List<UserDTO> userDTOList = userService.findAll();
            jsonBean.setCode(0);
            jsonBean.setMsg("success");
            jsonBean.setData(userDTOList);
            jsonBean.setCount(userDTOList.size());
            return jsonBean;
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setCode(0);
            jsonBean.setMsg("failed");
            jsonBean.setCount(0);
            return jsonBean;
        }
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
        System.err.println(user.toString());
        if(user.getName()=="") user.setName(null);
        if(user.getProfile()=="") user.setProfile(null);
        if(user.getAddress()=="") user.setAddress(null);
        if(uid==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录，无法修改信息！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        user.setId(uid);
//        System.err.println(user.toString());
//        User{id=1601020727, name='123', password='123123', is_expert=null, phone='1787878', wechat='wxid111111', profile='123123哈哈哈', state=null, userPic='null', sex='女', number=null, birthday=Mon May 04 08:00:00 CST 2020, address='中国香港特别行政区', email='122', qq=111111, creatTime=null}
        if(userService.updateUser(user)){
            jsonBean.setMsg("修改信息成功！");
            jsonBean.setCode(1);
            request.getSession().removeAttribute("currentName");
            session.setAttribute("currentName", user.getName());//角色
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
            request.getSession().removeAttribute("USER");
            request.getSession().removeAttribute("currentRole");
            request.getSession().removeAttribute("currentName");
            request.getSession().removeAttribute("uid");
            request.getSession().removeAttribute("pid");
        }else {
            jsonBean.setMsg("修改密码失败！500错误！");
            jsonBean.setCode(-1);
        }
        return mm.addAttribute("str",JSON.toJSONString(jsonBean));
    }

    @RequestMapping(value = "/user/delete", method = RequestMethod.POST)
    @ResponseBody
    public JsonBean deleteUser(@RequestBody UserDTO userDTO){
        JsonBean jsonBean = new JsonBean();
        try{
            userService.deleteUser(userDTO.getId());
            jsonBean.setMsg("delete user success");
            jsonBean.setCode(1);
            return jsonBean;
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("delete user fail");
            jsonBean.setCode(-1);
            return jsonBean;
        }
    }

    @RequestMapping(value = "/user/editName")
    @ResponseBody
    public JsonBean editName(@RequestParam(value = "uid", required = false) String uid,@RequestParam(value = "value", required = false) String value){
        JsonBean jsonBean = new JsonBean();
        try{
            User user = userService.findById(Integer.parseInt(uid));
            user.setName(value);
            userService.updateUser(user);
            jsonBean.setMsg("update user name success");
            jsonBean.setCode(1);
            return jsonBean;
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("update user name fail");
            jsonBean.setCode(-1);
            return jsonBean;
        }
    }

    @RequestMapping(value = "/user/editState")
    @ResponseBody
    public JsonBean editState(@RequestParam(value = "uid", required = false) String uid,@RequestParam(value = "value", required = false) String value){
        JsonBean jsonBean = new JsonBean();
        try{
            User user = userService.findById(Integer.parseInt(uid));
            System.err.println(value);
            switch (value){
                case "潜水":
                    user.setState(0);break;
                case "冒泡":
                    user.setState(1);break;
                case "活跃":
                    user.setState(2);break;
                case "传说":
                    user.setState(3);break;
                default:
                    user.setState(4);break;
            }
            userService.updateUser(user);
            jsonBean.setMsg("update user state success");
            jsonBean.setCode(1);
            return jsonBean;
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("update user state fail");
            jsonBean.setCode(-1);
            return jsonBean;
        }
    }

    @RequestMapping(value = "/user/editRole")
    @ResponseBody
    public JsonBean editRole(@RequestParam(value = "uid", required = false) String uid,@RequestParam(value = "value", required = false) String value){
        JsonBean jsonBean = new JsonBean();
        try{
            User user = userService.findById(Integer.parseInt(uid));
//            System.err.println(user.toString());
            switch (value){
                case "普通用户":
                    user.setIs_expert(0);break;
                case "专家用户":
                    user.setIs_expert(1);break;
                case "管理员":
                    user.setIs_expert(2);break;
            }
            userService.updateUser(user);
            jsonBean.setMsg("update user role success");
            jsonBean.setCode(1);
            return jsonBean;
        } catch (Exception e) {
            e.printStackTrace();
            jsonBean.setMsg("update user role fail");
            jsonBean.setCode(-1);
            return jsonBean;
        }
    }

    @RequestMapping(value = "/user/findBy", method = RequestMethod.POST)
    @ResponseBody
    public Map<String, Object> findBy(@RequestParam("domain") String dom,@RequestParam("valu") String value,int page,int limit){
//        System.out.println(dom+" "+value+" "+page+" "+limit);
//        int before = limit * (page - 1) + 1;
//        int after = page * limit;
        Integer val = 0;
        if(dom.equals("0")){ dom = "id";val = Integer.parseInt(value);}
        if(dom.equals("1")){
            dom = "sex";
            List<UserDTO> userDTOList = userService.findByString(dom,value);
            int count = userDTOList.size();
            Map<String, Object> map = new HashMap<String, Object>();
            map.put("msg","");
            map.put("code",0);
            map.put("count",count);
            map.put("data",userDTOList);
            System.out.println(map);
            return map;
        }
        if(dom.equals("2")){ dom = "state";val = Integer.parseInt(value);}

        List<UserDTO> userDTOList = userService.findByInteger(dom,val);
        int count = userDTOList.size();
        Map<String, Object> map = new HashMap<String, Object>();
        map.put("msg","");
        map.put("code",0);
        map.put("count",count);
        map.put("data",userDTOList);
        System.out.println(map);
        return map;
    }
}

