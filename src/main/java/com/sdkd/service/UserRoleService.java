package com.sdkd.service;

import com.sdkd.dto.UserDTO;
import com.sdkd.model.User;

/**
 * @author Young
 * @date 2020/4/23 23:01
 * @see com.sdkd.service
 */
public interface UserRoleService {
    UserDTO findByUser(User user);
}
