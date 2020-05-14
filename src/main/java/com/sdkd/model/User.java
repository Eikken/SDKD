package com.sdkd.model;

import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.Date;

/**
 * @author Young
 * @date 2020/4/11 11:36
 * @see com.sdkd.model
 * 检测变量名没啥问题
 */
public class User implements Serializable {

    private Integer id;

//    @Size(min = 2,max = 10,message = "username.length.err")
    private String name;

    private String password;

    private Integer is_expert;

    private String phone;

    private String wechat;

    private String profile;

    private Integer state;

    private String userPic;

    private String sex;

    private Integer number;

    private Date birthday;

    private String address;

    private String email;

    private Integer qq;

    private Date creatTime;

    public Integer getIs_expert() {
        return is_expert;
    }

    public void setIs_expert(Integer is_expert) {
        this.is_expert = is_expert;
    }
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

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getWechat() {
        return wechat;
    }

    public void setWechat(String wechat) {
        this.wechat = wechat;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getUserPic() {
        return userPic;
    }

    public void setUserPic(String userPic) {
        this.userPic = userPic;
    }

    public String getSex() {
        return sex;
    }

    public void setSex(String sex) {
        this.sex = sex;
    }

    public Integer getNumber() {
        return number;
    }

    public void setNumber(Integer number) {
        this.number = number;
    }

    public Date getBirthday() {
        return birthday;
    }

    public void setBirthday(Date birthday) {
        this.birthday = birthday;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getQq() {
        return qq;
    }

    public void setQq(Integer qq) {
        this.qq = qq;
    }

    public Date getCreatTime() {
        return creatTime;
    }

    public void setCreatTime(Date creatTime) {
        this.creatTime = creatTime;
    }

    @Override
    public String toString() {
        return "User{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", password='" + password + '\'' +
                ", is_expert=" + is_expert +
                ", phone='" + phone + '\'' +
                ", wechat='" + wechat + '\'' +
                ", profile='" + profile + '\'' +
                ", state=" + state +
                ", userPic='" + userPic + '\'' +
                ", sex='" + sex + '\'' +
                ", number=" + number +
                ", birthday=" + birthday +
                ", address='" + address + '\'' +
                ", email='" + email + '\'' +
                ", qq=" + qq +
                ", creatTime=" + creatTime +
                '}';
    }
}
