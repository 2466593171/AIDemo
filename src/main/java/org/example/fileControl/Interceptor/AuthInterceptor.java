package org.example.fileControl.Interceptor;

import jakarta.annotation.Resource;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.common.WebContext;
import org.example.fileControl.dao.entity.User;
import org.example.fileControl.util.RedisUtils;
import org.example.fileControl.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerInterceptor;

@Component
@Slf4j
public class AuthInterceptor implements HandlerInterceptor {

    @Autowired
    private TokenUtil tokenUtil;
    @Resource
    private WebContext webContext;

    @Autowired
    private RedisUtils redisUtils;

    @Override
    public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler) throws Exception {
       log.info("进入拦截器.............");
        String requestUri = request.getRequestURI(); // 获取请求的 URI
        log.info("请求的地址"+requestUri);

        // 排除不需要验证的路径
        if (requestUri.equals("/user/register") || requestUri.equals("/user/login")) {
            return true;
        }

        // 从请求头中获取token
        String token = request.getHeader("Authorization");

        if (token != null && token.startsWith("Bearer")) {
            token = token.substring(7); // 去掉"Bearer "前缀
            // 验证token是否有效
            if (tokenUtil.validateToken(token)) {
                String username = tokenUtil.getUsernameFromToken(token);
                String id = tokenUtil.getIdFromToken(token);
                // 将用户信息存储在上下文中，供后续使用
                webContext.setCurrentUser(User.of().setUsername(username).setId(Long.valueOf(id)));

                // 验证用户是否存在于 Redis 中
                if (redisUtils.exists(username)) {
                    return true;
                } else {
                    log.warn("用户未在 Redis 中找到: {}", username);
                }
            } else {
                log.warn("无效的 Token: {}", token);
            }
        } else {
            log.warn("未提供 Token");
        }

        // 将返回状态码改为 401，表示未授权
        response.setStatus(HttpServletResponse.SC_UNAUTHORIZED); // 返回 401 未授权状态码
        return false;
    }
}

