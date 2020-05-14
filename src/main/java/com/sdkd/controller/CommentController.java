package com.sdkd.controller;

import com.alibaba.fastjson.JSON;
import com.sdkd.bean.JsonBean;
import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.User;
import com.sdkd.service.CommentService;
import net.sf.json.JSONObject;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @author Young
 * @date 2020/5/2 0:34
 * @see com.sdkd.controller
 */

@Controller
@RequestMapping("/user/comment")
public class CommentController {
    @Resource
    private CommentService commentService;

    @RequestMapping("/answer")
    public String answer(){
        return "answer";
    }

    @RequestMapping(value = "/replyComment")
    public @ResponseBody ModelMap replyComment(HttpServletRequest request,  @RequestParam(value = "fatherId", required = false) String fatherId, @RequestParam(value = "content", required = false) String content){
        ModelMap mm = new ModelMap();
        Comment comment = commentService.findComment(Integer.parseInt(fatherId));
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");
        //回复的comment
        if(user==null){
            JsonBean jsonBean = new JsonBean();
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录无法回复信息！");
            mm.addAttribute("str", JSON.toJSONString(jsonBean));
            return mm;
        }
        Comment reply = new Comment();
        reply.setBlog_id(comment.getBlog_id());
        reply.setUser_id(user.getId());
        reply.setComment_text(content);
        reply.setComment_date(new Date());
        reply.setParent_id(Integer.parseInt(fatherId));
        reply.setPraise_count(0);
        commentService.replyComment(reply);
        mm.addAttribute("str", JSON.toJSONString(reply));
        return mm;
    }

    @RequestMapping(value = "/replyBlog")
    public @ResponseBody ModelMap replyBlog(HttpServletRequest request,  @RequestParam(value = "blogId", required = false) String blogId, @RequestParam(value = "content", required = false) String content){
        ModelMap mm = new ModelMap();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");
        if(user==null){
            JsonBean jsonBean = new JsonBean();
            jsonBean.setCode(-1);
            jsonBean.setMsg("没有用户登录无法回复评论！");
            mm.addAttribute("str", JSON.toJSONString(jsonBean));
            return mm;
        }
        //回复的comment
        Comment reply = new Comment();
        reply.setBlog_id(Integer.parseInt(blogId));
        reply.setUser_id(user.getId());
        reply.setComment_text(content);
        reply.setComment_date(new Date());
        reply.setParent_id(null);
        reply.setPraise_count(0);
        commentService.replyComment(reply);
        mm.addAttribute("str",JSON.toJSONString(reply));
        return mm;
    }

    @RequestMapping(value = "/deleteComment")
    public @ResponseBody ModelMap deleteBlog(HttpServletRequest request, @RequestParam(value = "commentId", required = false) Integer commentId){
        ModelMap mm = new ModelMap();
        HttpSession session = request.getSession();
        Integer uid = (Integer) session.getAttribute("uid");
        Comment comment = commentService.findComment(commentId);
        JsonBean jsonBean = new JsonBean();
        if(uid==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("user=null,无法删除评论！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(!uid.equals(comment.getUser_id())){
            jsonBean.setCode(-1);
            jsonBean.setMsg("不是自己的评论无法删除！");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        if(commentService.deleteComment(commentId)){
            jsonBean.setCode(1);
            jsonBean.setMsg("评论已删除！");
        }else {
            jsonBean.setCode(-1);
            jsonBean.setMsg("后台错误，评论删除失败！");
        }
        mm.addAttribute("str",JSON.toJSONString(jsonBean));
        return mm;
    }
}
