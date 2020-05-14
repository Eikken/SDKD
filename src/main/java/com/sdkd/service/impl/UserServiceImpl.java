package com.sdkd.service.impl;

import com.sdkd.dao.BlogDao;
import com.sdkd.dao.UserDao;
import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;
import com.sdkd.service.BlogService;
import com.sdkd.service.UserService;
import org.springframework.stereotype.Service;
import org.springframework.util.CollectionUtils;

import javax.annotation.Resource;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

/**
 * @author Young
 * @date 2020/4/11 13:56
 * @see com.sdkd.service.impl
 */
@Service
public class UserServiceImpl implements UserService {
    @Resource
    private UserDao userDao;
    @Resource
    private BlogService blogService;

    @Override
    public User checkLogin(Integer userName, String password) {
        User user = userDao.checkUser(userName,password);
        return user;
    }

    @Override
    public List<UserDTO> findAll() {
        List<User> userList = userDao.findAll();
        return converModel2DTO(userList);
    }

    private List<UserDTO> converModel2DTO(List<User> userList) {
        if(CollectionUtils.isEmpty(userList)){
            System.err.println("CollectionUtils.isEmpty(userList)");
            return Collections.EMPTY_LIST;
        }
        List<UserDTO> userDTOS = new ArrayList<UserDTO>();
        for (User user:userList){
            UserDTO userDTO = new UserDTO();
            userDTO.setId(user.getId());
            userDTO.setName(user.getName());
            userDTO.setNumber(user.getNumber());
            userDTO.setCount(blogService.findByUser(user.getId()));
            userDTO.setSex(user.getSex());
            userDTO.setProfile(user.getProfile());
            userDTO.setAddress(user.getAddress());
            userDTO.setState(user.getState());

            userDTO.setBirthday(user.getBirthday());
            userDTO.setPhone(user.getPhone());
            userDTO.setEmail(user.getEmail());
            userDTO.setIs_expert(user.getIs_expert());
//            userDTO.setQq(user.getQq());
//            userDTO.setCreatTime(user.getCreatTime());
//            userDTO.setWechat(user.getWechat());
            switch(user.getIs_expert()){
                case 0:
                    userDTO.setIsExpert("普通用户");break;
                case 1:
                    userDTO.setIsExpert("专家用户");break;
                case 2:
                    userDTO.setIsExpert("管理员");break;
                default:
                    break;
            }
            switch(user.getState()){
                case 0:
                    userDTO.setStatus("潜水");break;
                case 1:
                    userDTO.setStatus("冒泡");break;
                case 2:
                    userDTO.setStatus("活跃");break;
                case 3:
                    userDTO.setStatus("传说");break;
                default:
                    userDTO.setStatus("已封禁");break;
            }
        userDTOS.add(userDTO);
        }
        return userDTOS;
    }

    @Override
    public int countByName(String name) {
        return 0;
    }

    @Override
    public User findById(Integer id) {
        return userDao.findById(id);
    }

    @Override
    public List<UserDTO> searchUser(Integer id) {
        List<User> userList = new ArrayList<>();
        userList.add(userDao.findById(id));
        return converModel2DTO(userList);
    }

    @Override
    public boolean insertUser(User user) {
        return userDao.insertUser(user);
    }

    @Override
    public boolean deleteUser(Integer id) {
        return userDao.deleteUser(id);
    }

    @Override
    public boolean updateUser(User user) {
        return userDao.updateUser(user);
    }

    @Override
    public boolean save(User user) {
        return userDao.save(user);
    }

    @Override
    public boolean updatePassword(User user) {
        return userDao.updatePassword(user);
    }

    @Override
    public List<UserDTO> findByInteger(String dom, Integer value) {
        return converModel2DTO(userDao.findByInteger(dom,value));
    }

    @Override
    public List<UserDTO> findByString(String dom, String value) {
        return converModel2DTO(userDao.findByString(dom,value));
    }


}
