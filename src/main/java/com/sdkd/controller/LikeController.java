package com.sdkd.controller;

import com.alibaba.fastjson.JSON;
import com.sdkd.bean.JsonBean;
import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.Like;
import com.sdkd.model.User;
import com.sdkd.service.BlogService;
import com.sdkd.service.CommentService;
import com.sdkd.service.LikeService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Young
 * @date 2020/5/3 18:37
 * @see com.sdkd.controller
 */
@Controller
@RequestMapping("/user/like")
public class LikeController {
    @Resource
    private LikeService likeService;

    @Resource
    private BlogService blogService;

    @Resource
    private CommentService commentService;

    @RequestMapping(value = "/likeBlog")
    public @ResponseBody ModelMap likeBlog(HttpServletRequest request, @RequestParam(value = "blogId", required = false) Integer blogId){
        ModelMap mm = new ModelMap();
        HttpSession session = request.getSession();
        User user = (User)session.getAttribute("USER");
        JsonBean jsonBean = new JsonBean();
        if(user==null){
            jsonBean.setCode(-1);
            jsonBean.setMsg("当前无用户登录，点赞无效，是否跳转登录页面？");
            return mm.addAttribute("str",JSON.toJSONString(jsonBean));
        }
        Blog blog = blogService.findById(blogId);
        blog.setPraise_count(blog.getPraise_count()+1);
        Like userLike = new Like();
        userLike.setBlog_id(blogId);
        userLike.setUser_id(user.getId());
        likeService.saveRelation(userLike);
        likeService.updateBlogLike(blog);
        List<Blog> blogList = new ArrayList<>();
        blogList.add(blog);
        jsonBean.setCode(1);
        jsonBean.setMsg("点赞成功！");
        jsonBean.setData(blogList);
        mm.addAttribute("str",JSON.toJSONString(jsonBean));
        return mm;
    }

    @RequestMapping(value = "/likeComment")
    public @ResponseBody ModelMap likeComment(HttpServletRequest request, @RequestParam(value = "commentId", required = false) Integer commentId){
        ModelMap mm = new ModelMap();
        Comment comment = commentService.findComment(commentId);
        List<Comment> commentList = new ArrayList<>();
        comment.setPraise_count(comment.getPraise_count()+1);
        likeService.updateCommentLike(comment);
        commentList.add(comment);
        mm.addAttribute("str", JSON.toJSONString(commentList));
        return mm;
    }
}
