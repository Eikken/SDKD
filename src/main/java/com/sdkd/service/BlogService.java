package com.sdkd.service;

import com.sdkd.dto.BlogDTO;
import com.sdkd.model.Blog;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 13:54
 * @see com.sdkd.service
 */
public interface BlogService {
    List<BlogDTO> findAll();
    List<BlogDTO> findUserBlog(Integer user_id);
    Blog findById(Integer blog_id);
    void saveBlog(BlogDTO blogDTO);
    int findByUser(Integer user_id);
    boolean deleteBlog(Integer blog_id);

}
