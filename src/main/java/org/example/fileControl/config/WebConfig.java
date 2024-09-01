package org.example.fileControl.config;

import org.example.fileControl.Interceptor.AuthInterceptor;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebConfig implements WebMvcConfigurer {

    @Autowired
    private AuthInterceptor authInterceptor;

    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        registry.addInterceptor(authInterceptor)
                .addPathPatterns("/**") // 匹配所有请求路径
                .excludePathPatterns(
                        "/user/login",
                        "/css/**",
                        "/videos/**",
                        "/templates/**",
                        "/user/register",
                        "/js/**",
                        "/images/**",
                        "/home/chat",
                        "/home/index",
                        "/home/picture"); // 根据需求排除不需要验证的路径
    }
}
