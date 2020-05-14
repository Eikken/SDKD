package com.sdkd.model;

import javax.validation.constraints.NotBlank;
import java.io.Serializable;

/**
 * @author Young
 * @date 2020/3/25 16:56
 * @see com.sdkd.model
 */
public class c_User implements Serializable {
    private int id;
    @NotBlank(message = "name不为空")
    private String name;
    private String password;

    public int getId() {
        return id;
    }

    public String getName() {
        return name;
    }

    public String getPassword() {
        return password;
    }

    public void setId(int id) {
        this.id = id;
    }

    public void setName(String name) {
        this.name = name;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
