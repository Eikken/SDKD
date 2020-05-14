package com.sdkd.service;

import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;
import org.apache.ibatis.annotations.Param;

import java.util.List;

/**
 * @author Young
 * @date 2020/3/25 20:57
 * @see com.sdkd.service
 * 用户服务接口
 *
 */

public interface UserService {
    User checkLogin(Integer userName, String password);
    List<UserDTO> findAll();
    int countByName(String name);

    User findById(Integer id);
    List<UserDTO> searchUser(Integer id);
    //添加
    boolean insertUser(@Param("user")User user);
    //delete
    boolean deleteUser(@Param("user")User user);
    //update
    boolean updateUser(@Param("user")User user);
    //插入
    boolean save(@Param("user")User user);

    //改密码
    boolean updatePassword(@Param("user")User user);
}
