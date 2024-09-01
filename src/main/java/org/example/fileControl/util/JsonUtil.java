package org.example.fileControl.util;


import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonUtil {

    // 创建一个全局的 ObjectMapper 实例
    private static final ObjectMapper objectMapper = new ObjectMapper();

    // 私有化构造器，防止实例化
    private JsonUtil() {}

    // 提供一个静态方法来获取 ObjectMapper 实例
    public static ObjectMapper getObjectMapper() {
        return objectMapper;
    }

    // 添加其他静态方法，用于封装常用的 JSON 操作
    public static <T> T fromJson(String json, Class<T> clazz) throws Exception {
        return objectMapper.readValue(json, clazz);
    }

    public static String toJson(Object object) throws Exception {
        return objectMapper.writeValueAsString(object);
    }
}
