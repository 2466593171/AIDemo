package org.example.fileControl.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import org.example.fileControl.dao.entity.Chathistory;
import org.example.fileControl.dao.entity.User;
import org.example.fileControl.service.ChathistoryService;
import org.example.fileControl.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

/**
 * <p>
 *  ai聊天聊天记录表
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@RestController
@RequestMapping("/chathistory")
public class ChathistoryController {


    @Autowired
    private ChathistoryService chathistoryService;

    @PostMapping("/sendMessage")
    @ResponseBody
    public Result sendMessage(@RequestBody Chathistory chathistory) {

        String message = chathistoryService.sendMessage(chathistory);

        return new Result(200, message);
    }

}
