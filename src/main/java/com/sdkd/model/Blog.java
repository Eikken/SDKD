package com.sdkd.model;

import com.fasterxml.jackson.annotation.JsonFormat;
import org.springframework.format.annotation.DateTimeFormat;

import java.io.Serializable;
import java.util.Date;

/**
 * @author Young
 * @date 2020/4/11 12:14
 * @see com.sdkd.model
 */

public class Blog implements Serializable {

    private Integer blog_id;

    private String blog_text;

    private String blog_title;

    private Integer user_id;

    private Date blog_date;

    private Integer is_hot;

    private Integer is_expert;

    private Integer praise_count;

    public Integer getBlog_id() {
        return blog_id;
    }

    public void setBlog_id(Integer blog_id) {
        this.blog_id = blog_id;
    }

    public String getBlog_text() {
        return blog_text;
    }

    public void setBlog_text(String blog_text) {
        this.blog_text = blog_text;
    }

    public Integer getUser_id() {
        return user_id;
    }

    public void setUser_id(Integer user_id) {
        this.user_id = user_id;
    }

    @DateTimeFormat(pattern="yyyy-MM-dd HH:mm:ss")
    @JsonFormat(pattern="yyyy-MM-dd HH:mm:ss",timezone = "GMT+8")
    public Date getBlog_date() {
        return blog_date;
    }

    public void setBlog_date(Date blog_date) {
        this.blog_date = blog_date;
    }

    public Integer getPraise_count() {
        return praise_count;
    }

    public void setPraise_count(Integer praise_count) {
        this.praise_count = praise_count;
    }

    public Integer getIs_hot() {
        return is_hot;
    }

    public void setIs_hot(Integer is_hot) {
        this.is_hot = is_hot;
    }

    public Integer getIs_expert() {
        return is_expert;
    }

    public void setIs_expert(Integer is_expert) {
        this.is_expert = is_expert;
    }

    public String getBlog_title() {
        return blog_title;
    }

    public void setBlog_title(String blog_title) {
        this.blog_title = blog_title;
    }

    @Override
    public String toString() {
        return "Blog{" +
                "blog_id=" + blog_id +
                ", blog_text='" + blog_text + '\'' +
                ", blog_title='" + blog_title + '\'' +
                ", user_id=" + user_id +
                ", blog_date=" + blog_date +
                ", is_hot=" + is_hot +
                ", is_expert=" + is_expert +
                ", praise_count=" + praise_count +
                '}';
    }
}
