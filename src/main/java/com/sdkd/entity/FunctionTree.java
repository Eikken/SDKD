package com.sdkd.entity;

/**
 * @author Young
 * @date 2020/5/1 0:46
 * @see com.sdkd.entity
 */

import java.util.List;

public class FunctionTree {
    private Integer id;
    private String name;
    private String code;
    private String url;
    private List<FunctionTree> sonTree;
    private Boolean ischecked = false;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<FunctionTree> getSonTree() {
        return sonTree;
    }

    public void setSonTree(List<FunctionTree> sonTree) {
        this.sonTree = sonTree;
    }

    public Boolean getIschecked() {
        return ischecked;
    }

    public void setIschecked(Boolean ischecked) {
        this.ischecked = ischecked;
    }

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }
}
