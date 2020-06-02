package com.sdkd.dao;

import com.sdkd.model.Blog;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.Date;
import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 12:51
 * @see com.sdkd.dao
 */
@Repository
public interface BlogDao {
    List<Blog> findAll();//获取所有帖子
    //查找user_id 的所有blog
    List<Blog> findUserBlog(Integer user_id);
    void saveBlog(@Param("user_id") Integer user_id,
                  @Param("blog_text") String blog_text,
                  @Param("blog_date") Date blog_date,
                  @Param("is_expert") Integer is_expert);
    //没有@Param 会报错：
    // org.mybatis.spring.MyBatisSystemException: nested exception is org.apache.ibatis.binding.BindingException:
    // Parameter 'id' not found. Available parameters are [arg2, arg1, arg0, param3, param1, param2]
    boolean deleteBlog(@Param("blog_id") Integer blog_id);
    boolean updateBlog(@Param("blog") Blog blog);
    Blog findById(Integer blog_id);
    int findByUser(Integer user_id);
}
