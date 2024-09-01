package org.example.fileControl.controller;

import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.example.fileControl.dao.entity.Chathistory;
import org.example.fileControl.dao.entity.Picture;
import org.example.fileControl.service.PictureService;
import org.example.fileControl.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@RestController
@RequestMapping("/picture")
public class PictureController {

    @Autowired
    private PictureService pictureService;
    @PostMapping("/sendMessage")
    @ResponseBody
    public Result sendMessage(@RequestBody Picture picture) {

        String message = pictureService.sendMessage(picture);

        if(StringUtils.isBlank(message)){
            return new Result(500, "发送失败");
        }
        return new Result(200, message);
    }

}
