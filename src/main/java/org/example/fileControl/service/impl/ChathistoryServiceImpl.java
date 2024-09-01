package org.example.fileControl.service.impl;

import cn.hutool.core.date.LocalDateTimeUtil;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.Factory.AIChatFactory.AIClient;
import org.example.fileControl.Factory.AIChatFactory.AIClientFactory;
import org.example.fileControl.common.WebContext;
import org.example.fileControl.dao.entity.Chathistory;
import org.example.fileControl.dao.mapper.ChathistoryMapper;
import org.example.fileControl.service.ChathistoryService;
import com.baomidou.mybatisplus.extension.service.impl.ServiceImpl;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * <p>
 * 服务实现类
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@Service
@Slf4j
public class ChathistoryServiceImpl extends ServiceImpl<ChathistoryMapper, Chathistory> implements ChathistoryService {
    @Autowired
    private ChathistoryMapper chathistoryMapper;
    @Autowired
    private WebContext webContext;

    @Override
    public String sendMessage(Chathistory chathistory) {
        String response="";

        AIClient aiClient = AIClientFactory.getAIClient(chathistory.getPlatform());
        //先保存用户的信息
        Chathistory userChat = Chathistory.of().setContent(chathistory.getContent())
                .setUserid(webContext.getCurrentUser().getId())
                .setType(1)
                .setPlatform(chathistory.getPlatform())
                .setCreateTime(LocalDateTimeUtil.now());

        chathistoryMapper.insert(userChat);
        try {
             response = aiClient.getResponse(chathistory.getContent());
            //保存AI的信息
            Chathistory aiChat = Chathistory.of().setContent(response)
                    .setUserid(webContext.getCurrentUser().getId())
                    .setType(0)
                    .setPlatform(chathistory.getPlatform())
                    .setCreateTime(LocalDateTimeUtil.now());
            chathistoryMapper.insert(aiChat);

        } catch (Exception e){
            log.error("AI返回错误",e);
        }
        return response;
    }
}
