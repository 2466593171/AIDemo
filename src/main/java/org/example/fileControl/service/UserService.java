package org.example.fileControl.service;

import org.example.fileControl.dao.entity.User;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2024/08/29
 */
public interface UserService extends IService<User> {

    User getUser(User user);

    Object getUserByName(User user);

    void add(User user);
}
