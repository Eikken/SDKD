package com.sdkd.dao;

import com.sdkd.model.Comment;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author Young
 * @date 2020/5/2 8:19
 * @see com.sdkd.dao
 */
@Repository
public interface CommentDao {
    Comment findComment(Integer comment_id);
    List<Comment> getSonComment(Integer id);//获取当前帖子的所有评论
    void replyComment(
//            @Param("comment_id") Integer comment_id,
            @Param("user_id") Integer user_id,
            @Param("blog_id") Integer blog_id,
            @Param("comment_text") String comment_text,
            @Param("comment_date") Date comment_date,
            @Param("parent_id") Integer parent_id
            );

    boolean likeComment(@Param("comment_id") Integer comment_id,@Param("praise_count") Integer praise_count);
//    void replyComment();
    boolean deleteComment(Integer comment_id);

    boolean deleteCommentCascadeBlog(Integer blog_id);
}
