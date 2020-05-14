package com.sdkd.dao;


import com.sdkd.model.Blog;
import com.sdkd.model.User;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

/**
 * @author Young
 * @date 2020/3/25 21:00
 * @see com.sdkd.dao
 * 这里是要实现的接口
 */
@Repository
public interface UserDao {

    //按id查找user
    User findById(Integer id);
    User checkUser(@Param("id") Integer id, @Param("password") String password);
    List<User> findAll();
    //添加
    boolean insertUser(@Param("user")User user);
    //delete
    boolean deleteUser(@Param("id")Integer id);
    //update
    boolean updateUser(@Param("user")User user);
    //插入
    boolean save(@Param("user")User user);
    //改密码
    boolean updatePassword(@Param("user")User user);

    List<User> findByString(@Param("dom")String dom,@Param("value")String value);

    List<User> findByInteger(@Param("dom")String dom,@Param("value")Integer value);
}
