package com.sdkd.model;

import com.sdkd.dto.CommentDTO;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;


/**
 * @author Young
 * @date 2020/4/11 12:13
 * @see com.sdkd.model
 */
public class Comment implements Serializable {
    private Integer comment_id;

    private Integer user_id;

    private Integer blog_id;

    private String comment_text;

    private Date comment_date;

    private Integer parent_id;

    private Integer praise_count;

    public Integer getPraise_count() { return praise_count; }

    public void setPraise_count(Integer praise_count) { this.praise_count = praise_count; }

    public Integer getComment_id() {
        return comment_id;
    }

    public void setComment_id(Integer comment_id) {
        this.comment_id = comment_id;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    public Integer getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(Integer blog_id) {
        this.blog_id = blog_id;
    }

    public String getComment_text() {
        return comment_text;
    }

    public void setComment_text(String comment_text) {
        this.comment_text = comment_text;
    }

    public Date getComment_date() {
        return comment_date;
    }

    public void setComment_date(Date comment_date) {
        this.comment_date = comment_date;
    }

    public Integer getParent_id() {
        return parent_id;
    }

    public void setParent_id(Integer parent_id) {
        this.parent_id = parent_id;
    }

    @Override
    public String toString() {
        return "Comment{" +
                "comment_id=" + comment_id +
                ", user_id=" + user_id +
                ", blog_id=" + blog_id +
                ", comment_text='" + comment_text + '\'' +
                ", comment_date=" + comment_date +
                ", parent_id=" + parent_id +
                ", praise_count=" + praise_count +
                '}';
    }

}
