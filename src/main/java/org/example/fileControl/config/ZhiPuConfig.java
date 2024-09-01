package org.example.fileControl.config;

import com.zhipu.oapi.ClientV4;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;


@Configuration
public class ZhiPuConfig {

    @Value("${zhiPu.key}")
    private String ApiSecretKey;

    @Bean
    public ClientV4 getClient(){
        return new ClientV4.Builder(ApiSecretKey).build();
    }

}
