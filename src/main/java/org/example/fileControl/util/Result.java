package org.example.fileControl.util;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.example.fileControl.dao.entity.Chatconfig;

import java.util.List;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Result {

    private Integer status;
    // 响应业务状态
    // 响应中的数据
    private Object data;

    // 响应消息
    private String message;

    public Result(String message) {
        this.message = message;
    }

    public Result(int status, String message) {
        this.status = status;
        this.message = message;
    }
}
