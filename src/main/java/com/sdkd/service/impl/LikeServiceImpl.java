package com.sdkd.service.impl;

import com.sdkd.dao.UserLikeRelDao;
import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.Like;
import com.sdkd.service.LikeService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Young
 * @date 2020/5/3 19:02
 * @see com.sdkd.service.impl
 */
@Service
public class LikeServiceImpl implements LikeService {
    @Resource
    private UserLikeRelDao userLikeRel;

    @Override
    public boolean saveRelation(Like userLike) {
        return userLikeRel.saveRelation(userLike);
    }

    @Override
    public boolean updateBlogLike(Blog blog) {
        return userLikeRel.updateBlogLike(blog);
    }

    @Override
    public boolean updateCommentLike(Comment comment) {
        return userLikeRel.updateCommentLike(comment);
    }

    @Override
    public List<Like> findAllRelation() {
        return userLikeRel.findAllRelation();
    }
}
