package org.example.fileControl.controller;

import cn.hutool.json.JSONArray;
import cn.hutool.json.JSONObject;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import freemarker.core.JSONOutputFormat;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.dao.entity.Chatconfig;
import org.example.fileControl.service.ChatconfigService;
import org.example.fileControl.util.Result;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2024/08/31
 */
@RestController
@RequestMapping("/chatconfig")
@Slf4j
public class ChatconfigController {

    @Autowired
    private ChatconfigService chatconfigService;

    @GetMapping("/list")
    public Result list() {
        List<Chatconfig> list = chatconfigService.list();
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // 将 List 转换为 JSON 字符串
            String jsonString = objectMapper.writeValueAsString(list);

            System.out.println(jsonString);

            return new Result(200, jsonString);
        } catch (JsonProcessingException e) {
         log.error(e.getMessage());
        }
        return new Result(500,"获取配置列表失败");
    }
}
