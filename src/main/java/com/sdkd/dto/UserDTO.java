package com.sdkd.dto;

import com.sdkd.model.User;

import javax.persistence.criteria.CriteriaBuilder;

/**
 * @author Young
 * @date 2020/4/11 13:50
 * @see com.sdkd.dto
 */
public class UserDTO extends User {
    private String isExpert;//汉字专家信息

    private String status;//汉字状态信息

    private Integer count;//发布blog的数量

    public Integer getCount() {
        return count;
    }

    public void setCount(Integer count) {
        this.count = count;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getIsExpert() {
        return isExpert;
    }

    public void setIsExpert(String isExpert) {
        this.isExpert = isExpert;
    }
}
