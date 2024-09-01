package org.example.fileControl.service;

import org.example.fileControl.dao.entity.Chathistory;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
public interface ChathistoryService extends IService<Chathistory> {

    String  sendMessage(Chathistory chathistory);
}
