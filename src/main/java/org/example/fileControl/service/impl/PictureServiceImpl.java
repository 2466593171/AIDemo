package org.example.fileControl.service.impl;
import org.example.fileControl.Factory.AIPictureFactory.AIPictureFactory;
import org.example.fileControl.Factory.AIPictureFactory.PictureCilent;
import org.example.fileControl.dao.entity.Picture;
import org.example.fileControl.dao.mapper.PictureMapper;
import org.example.fileControl.service.PictureService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.stereotype.Service;

/**
 * <p>
 *  服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@Service
public class PictureServiceImpl extends ServiceImpl<PictureMapper, Picture> implements PictureService {

    @Override
    public String sendMessage(Picture picture) {

        PictureCilent pictureCilent = AIPictureFactory.getPictureCilent(picture.getPlatform());
        try {
            return  pictureCilent.getResponse(picture.getDescribe());
        } catch (Exception e) {
            log.error("生成图片异常"+e.getMessage());
        }
        return null;
    }
}
