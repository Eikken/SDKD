package com.sdkd.service;

import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.Like;

import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 22:45
 * @see com.sdkd.service
 */
public interface LikeService {
    boolean saveRelation(Like userLike);
    boolean updateBlogLike(Blog blog);
    boolean updateCommentLike(Comment comment);
    List<Like> findAllRelation();
}
