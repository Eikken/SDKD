package com.sdkd.dao;

import com.sdkd.model.Blog;
import com.sdkd.model.Comment;
import com.sdkd.model.Like;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 13:16
 * @see com.sdkd.dao
 */
@Repository
public interface UserLikeRelDao {
    List<Like> findAllRelation();
    boolean saveRelation(@Param("userLike")Like userLike);
    boolean updateBlogLike(@Param("blog") Blog blog);
    boolean updateCommentLike(@Param("comment")Comment comment);
}
