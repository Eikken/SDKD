package com.sdkd.service.impl;

import com.sdkd.dao.UserDao;
import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;
import com.sdkd.service.UserRoleService;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;
import java.util.List;

/**
 * @author Young
 * @date 2020/4/23 23:20
 * @see com.sdkd.service.impl
 */
@Service
public class UserRoleServiceImpl implements UserRoleService {

    @Override
    public UserDTO findByUser(User user) {
        UserDTO userDTO = new UserDTO();
        userDTO.setId(user.getId());
        userDTO.setName(user.getName());
        userDTO.setNumber(user.getNumber());

        userDTO.setSex(user.getSex());
        userDTO.setProfile(user.getProfile());
        userDTO.setAddress(user.getAddress());

        userDTO.setBirthday(user.getBirthday());
        userDTO.setPhone(user.getPhone());
        userDTO.setEmail(user.getEmail());

        userDTO.setIs_expert(user.getIs_expert());
        userDTO.setState(user.getState());
        userDTO.setQq(user.getQq());
        userDTO.setCreatTime(user.getCreatTime());
        switch(user.getIs_expert()){
            case 0:
                userDTO.setIsExpert("普通用户");break;
            case 1:
                userDTO.setIsExpert("专家用户");break;
            case 2:
                userDTO.setIsExpert("管理员");break;
            default:
                userDTO.setIsExpert(null);break;
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
//        if(user.getIs_expert()==0){
//            userDTO.setIsExpert("普通用户");
//        }else if(user.getIs_expert()==1){
//            userDTO.setIsExpert("专家用户");
//        }else if(user.getIs_expert()==-1){
//            userDTO.setIsExpert("管理员");
//        }
        return userDTO;
    }

}
