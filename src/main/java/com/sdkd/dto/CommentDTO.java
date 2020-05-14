package com.sdkd.dto;

import com.sdkd.model.Comment;

import java.util.List;

/**
 * @author Young
 * @date 2020/4/26 0:33
 * @see com.sdkd.dto
 */
public class CommentDTO extends Comment {
    private String userName;

    List<CommentDTO> child;

    public List<CommentDTO> getChild() {
        return child;
    }

    public void setChild(List<CommentDTO> child) {
        this.child = child;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

}
