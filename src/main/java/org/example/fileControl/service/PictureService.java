package org.example.fileControl.service;

import org.example.fileControl.dao.entity.Chathistory;
import org.example.fileControl.dao.entity.Picture;
import com.baomidou.mybatisplus.extension.service.IService;

/**
 * <p>
 *  服务类
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
public interface PictureService extends IService<Picture> {

    String sendMessage(Picture picture);
}
