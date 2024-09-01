package org.example.fileControl.controller;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.dao.entity.Chatconfig;
import org.example.fileControl.dao.entity.Pictureconfig;
import org.example.fileControl.service.PictureconfigService;
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
@RequestMapping("/pictureconfig")
@Slf4j
public class PictureconfigController {

    @Autowired
    private PictureconfigService pictureconfigService;
    @GetMapping("/list")
    public Result list() {
        List<Pictureconfig> list = pictureconfigService.list();
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // 将 List 转换为 JSON 字符串
            String jsonString = objectMapper.writeValueAsString(list);

            System.out.println(jsonString);

            return new Result(200, jsonString);
        } catch (JsonProcessingException e) {
            log.error(e.getMessage());
        }
        return new Result(500,"获取ai图片配置列表失败");
    }
}
