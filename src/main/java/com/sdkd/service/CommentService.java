package com.sdkd.service;

import com.sdkd.model.Comment;

/**
 * @author Young
 * @date 2020/5/2 0:35
 * @see com.sdkd.service
 */
public interface CommentService {
//    void replyBlog(Comment comment);
    Comment findComment(Integer comment_id);

    void replyComment(Comment comment);

    boolean likeComment(Comment comment);

    boolean deleteComment(Integer comment_id);
}
