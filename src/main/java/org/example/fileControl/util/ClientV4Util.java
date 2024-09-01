package org.example.fileControl.util;

import com.zhipu.oapi.ClientV4;


import lombok.extern.slf4j.Slf4j;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Slf4j
public class ClientV4Util {

    private ClientV4Util() {
        // 私有构造函数以防止实例化工具类
    }

    public static ClientV4 getClient(String apiKey) {
        // 输入参数验证
        if (apiKey == null || apiKey.trim().isEmpty()) {
            throw new IllegalArgumentException("API key cannot be null or empty");
        }

        try {
            // 创建 ClientV4 实例
            ClientV4 client = new ClientV4.Builder(apiKey).build();
            log.info("Successfully created ClientV4 instance.");
            return client;
        } catch (Exception e) {
            log.error("Failed to create ClientV4 instance: {}", e.getMessage(), e);
            throw new RuntimeException("Error creating ClientV4 instance", e);
        }
    }
}

