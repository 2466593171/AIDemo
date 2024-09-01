package org.example.fileControl.common;

import jakarta.servlet.http.HttpServletRequest;
import lombok.extern.slf4j.Slf4j;
import org.example.fileControl.dao.entity.User;
import org.example.fileControl.util.RedisUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Component;
import org.springframework.web.context.request.RequestAttributes;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.server.ResponseStatusException;

import javax.security.auth.login.LoginException;

@Component
@Slf4j
public class WebContext {
    private static final String USER_ATTRIBUTES = "USER_ATTRIBUTES";


    @Autowired
    private RedisUtils redisUtil;

    /**
     * Sets current user.
     *
     * @param user the user
     */
    public void setCurrentUser(User user) {
        RequestContextHolder.currentRequestAttributes().setAttribute(USER_ATTRIBUTES, user, RequestAttributes.SCOPE_REQUEST);
    }

    /**
     * Gets current user.
     *
     * @return the current user
     * RequestContextHolder：这是Spring提供的一个工具类，它允许我们在任何地方（不仅仅是控制器方法内部）访问到当前HTTP请求的上下文信息。
     * currentRequestAttributes()：这是一个静态方法，用于获取当前线程绑定的请求属性对象，
     * 通常是一个实现了RequestAttributes接口的对象，比如在Servlet环境下，它可能是ServletRequestAttributes实例，
     * 该实例封装了当前HTTP请求的所有属性。
     * .getAttribute(USER_ATTRIBUTES, RequestAttributes.SCOPE_REQUEST)：
     * 调用请求属性对象的getAttribute方法来获取指定名称的请求属性。这里USER_ATTRIBUTES是一个字符串常量，
     * 代表要获取的属性名；RequestAttributes.SCOPE_REQUEST定义了属性的作用域为请求范围，这意味着这个属性仅存在于当前HTTP请求的生命周期内。
     * (User) 是类型转换操作符，表示期望获取到的对象是一个User类型的实例。
     * 这表明在之前的某个环节（例如登录验证成功后），已经将用户对象放入了请求的属性中，现在从请求上下文中取出并转换为User类型以供后续使用。
     */
    public User getCurrentUser() {
        User user = (User) RequestContextHolder.currentRequestAttributes().getAttribute(USER_ATTRIBUTES, RequestAttributes.SCOPE_REQUEST);
        try {
            if (user != null) {
                return user;
            } else {
                ServletRequestAttributes requestAttributes = (ServletRequestAttributes) RequestContextHolder.getRequestAttributes();
                if (requestAttributes == null) {
                    throw new LoginException("Request attributes not found");
                }
                HttpServletRequest request = requestAttributes.getRequest();
                String token = request.getHeader("token");
                user = (User) redisUtil.get(token);
                if (user == null) {
                    throw new LoginException("Token validation failed");
                }
                setCurrentUser(user);
                return user;
            }
        } catch (LoginException e) {
            // 记录详细的错误日志
            log.error("Error fetching current user: {}", e.getMessage(), e);
            // 返回一个 HTTP 状态码和详细的错误信息
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Token validation failed", e);
        }
    }
}