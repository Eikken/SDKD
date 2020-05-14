package com.sdkd.model;

import java.io.Serializable;

/**
 * @author Young
 * @date 2020/4/11 12:14
 * @see com.sdkd.model
 */
public class Like implements Serializable {

    private Integer like_id;

    private Integer blog_id;

    private Integer user_id;

    public Integer getLike_id() {
        return like_id;
    }

    public void setLike_id(Integer like_id) {
        this.like_id = like_id;
    }

    public Integer getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(Integer blog_id) {
        this.blog_id = blog_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }
}
