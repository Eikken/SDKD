package com.sdkd.dto;

import com.sdkd.model.Blog;
import com.sdkd.model.Comment;

import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 13:45
 * @see com.sdkd.dto
 */
public class BlogDTO extends Blog {
    private String userName;

    private List<CommentDTO> commentDTOS;

    private String picPath;

    public String getPicPath() {
        return picPath;
    }

    public void setPicPath(String picPath) {
        this.picPath = picPath;
    }

    public List<CommentDTO> getCommentDTOS() {
        return commentDTOS;
    }

    public void setCommentDTOS(List<CommentDTO> commentDTOS) {
        this.commentDTOS = commentDTOS;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    @Override
    public String toString() {
        BlogDTO blogDTO = new BlogDTO();
        return "BlogDTO{" +
                "userName='" + userName + '\'' +
                '}';
    }
}
