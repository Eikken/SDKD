package com.sdkd.controller;

import com.alibaba.fastjson.JSON;
import com.sdkd.bean.JsonBean;
import com.sdkd.dto.BlogDTO;
import com.sdkd.model.Blog;
import com.sdkd.model.Like;
import com.sdkd.model.User;
import com.sdkd.service.BlogService;
import com.sdkd.service.CommentService;
import com.sdkd.service.LikeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.*;

/**
 * @author Young
 * @date 2020/4/11 22:55
 * @see com.sdkd.controller
 */
@Controller
@RequestMapping("/user/blog")
public class BlogController {
    @Resource
    private BlogService blogService;

    @Resource
    private LikeService likeService;

    @Resource
    private CommentService commentService;

    @RequestMapping("/findAll")
    public String findAll(Model model, HttpServletResponse response){
        List<BlogDTO> blogDTOList = blogService.findAll();
        model.addAttribute("blogs",blogDTOList);
//        System.err.println(jsonString);

        if (blogDTOList.isEmpty()){
            System.err.println("blogDTO为空");
        }else{
            System.err.println("blogDTO非空！");
        }
        System.err.println("now enter blog page");
        return "blog";
    }

    @RequestMapping("/showBlog/{page}")
    public String showBlog(Model model, @PathVariable("page") String page){
        List<BlogDTO> blogDTOList = blogService.findAll();
        model.addAttribute("blogs",blogDTOList);
//        System.err.println(jsonString);

        if (blogDTOList.isEmpty()){
            System.err.println("blogDTO为空");
        }else{
            System.err.println("blogDTO非空！");
        }
        System.err.println("now enter blog page");
        return null;
    }

    @RequestMapping(value = "/load")
    public @ResponseBody ModelMap load(HttpServletRequest request){
        ModelMap mm = new ModelMap();
        System.err.println("now enter BlogController page");
        List<BlogDTO> blogDTOList =  blogService.findAll();
        List<Like> likeList = likeService.findAllRelation();
//        JSONArray json = JSONArray.parseArray(JSON.toJSONString(blogDTOList));
        mm.addAttribute("str",JSON.toJSONString(blogDTOList));
        mm.addAttribute("likeList",JSON.toJSONString(likeList));
        return mm;
    }

    @RequestMapping(value = "/save")
    public @ResponseBody ModelMap save(HttpServletRequest request, @RequestParam(value = "content", required = false) String content) {
        ModelMap mm = new ModelMap();
        BlogDTO blogDTO = new BlogDTO();
//        System.err.println("content:"+content);
        try{

            blogDTO.setBlog_text(content);
            blogDTO.setBlog_date(new Date());

            HttpSession session = request.getSession();
            User user = (User)session.getAttribute("USER");
            if(user == null){
                JsonBean jsonBean = new JsonBean();
                jsonBean.setCode(-1);
                jsonBean.setMsg("没有用户登录无法发布帖子！");
                mm.addAttribute("str", JSON.toJSONString(jsonBean));
                return mm;
            }
//            System.err.println(user.toString());
            blogDTO.setUser_id(user.getId());
            blogDTO.setUserName(user.getName());
            blogDTO.setIs_expert(0);
            if(user.getIs_expert()==1){
                blogDTO.setIs_expert(1);
            }
            blogDTO.setIs_hot(0);
            blogDTO.setPraise_count(0);
//           is_expert? blogDTO.setIs_expert(1):blogDTO.setIs_expert(0);
            blogService.saveBlog(blogDTO);
            mm.addAttribute("str",JSON.toJSONString(blogDTO));
        }catch (Exception e){
            e.printStackTrace();
        }
        return mm;
    }

    @RequestMapping(value = "/deleteBlog")
    public @ResponseBody ModelMap deleteBlog(HttpServletRequest request, @RequestParam(value = "blogId", required = false) Integer blogId){
        ModelMap mm = new ModelMap();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");
        Blog blog = blogService.findById(blogId);
        String pid = (String)session.getAttribute("pid");
        JsonBean jsonBean = new JsonBean();
        if(user==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("user=null,无法删除帖子！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(Integer.parseInt(pid)==2){
            blogService.deleteBlog(blogId);
            commentService.deleteCommentCascadeBlog(blogId);
            jsonBean.setCode(1);
            jsonBean.setMsg("管理员删除操作成功！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(!user.getId().equals(blog.getUser_id())){
            jsonBean.setCode(-1);
            jsonBean.setMsg("不是自己的帖子无法删除！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(blogService.deleteBlog(blogId)){
            commentService.deleteCommentCascadeBlog(blogId);
            jsonBean.setCode(1);
            jsonBean.setMsg("帖子已删除！评论级联删除");
        }else {
            jsonBean.setCode(-1);
            jsonBean.setMsg("后台删除帖子错误！删除失败！");
        }
        mm.addAttribute("str",JSON.toJSONString(jsonBean));
        return mm;
    }
}
