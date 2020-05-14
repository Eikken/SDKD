package com.sdkd.service.impl;

import com.sdkd.dao.CommentDao;
import com.sdkd.model.Comment;
import com.sdkd.service.CommentService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

/**
 * @author Young
 * @date 2020/5/2 8:33
 * @see com.sdkd.service.impl
 */
@Service
public class CommentServiceImpl implements CommentService {
    @Resource
    CommentDao commentDao;


    @Override
    public Comment findComment(Integer comment_id) {
        return commentDao.findComment(comment_id);
    }

    @Override
    public void replyComment(Comment comment) {
        commentDao.replyComment(comment.getUser_id(),comment.getBlog_id(),comment.getComment_text(),comment.getComment_date(),comment.getParent_id());
    }

//    @Override
//    public void replyBlog(Comment comment) {
//
//    }

    @Override
    public boolean likeComment(Comment comment) {
        return commentDao.likeComment(comment.getComment_id(),comment.getPraise_count());
    }

    @Override
    public boolean deleteComment(Integer comment_id) {
        return commentDao.deleteComment(comment_id);
    }


}
