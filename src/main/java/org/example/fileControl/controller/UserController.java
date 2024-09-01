package org.example.fileControl.controller;

import cn.hutool.core.util.ObjectUtil;
import com.baomidou.mybatisplus.core.toolkit.StringUtils;
import jakarta.servlet.http.HttpServletRequest;
import org.example.fileControl.dao.entity.User;
import org.example.fileControl.service.UserService;
import org.example.fileControl.util.RedisUtils;
import org.example.fileControl.util.Result;
import org.example.fileControl.util.TokenUtil;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;



/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author ${author}
 * @since 2024/08/29
 */
@Controller
@RequestMapping("/user")
public class UserController {

   @Autowired
    private UserService userService;
    @Autowired
    private TokenUtil tokenUtil;
    @Autowired
    private RedisUtils redisUtils;

    @GetMapping("/login")
    public String showLoginPage() {
        return "login";  // 返回 login.ftl 模板
    }

    @PostMapping("/login")
    @ResponseBody
    public Result login(@RequestBody User user) {
        String token = "";
        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {
            return new Result(400, "用户名或者密码为空");
        }
        user = userService.getUser(user);
        if (ObjectUtil.isNotEmpty(user)) {
            token = tokenUtil.generateToken(user.getUsername(),user.getId());
            redisUtils.set(user.getUsername(),token);
            return new Result(200, token);
        }
        return new Result(400, "用户不存在");

    }

    // 显示注册页面
    @GetMapping("/register")
    public String showRegisterPage() {
        return "register";  // 返回 register.ftl 模板
    }

    // 处理注册请求
    @PostMapping("/register")
    @ResponseBody
    public Result Register(@RequestBody User user) {

        if (StringUtils.isBlank(user.getUsername()) || StringUtils.isBlank(user.getPassword())) {

            return new Result(400, "用户名或者密码为空");
        }

        if (ObjectUtil.isNotEmpty(userService.getUserByName(user))) {
            return new Result(400, "用户名已存在");
        }

        userService.add(user);

        return new Result(200, "注册成功");
    }

    @GetMapping("/loginOut")
    @ResponseBody
    public Result LoginOut(HttpServletRequest request) {

        String token = request.getHeader("Authorization");
        if (token != null && token.startsWith("Bearer")) {
            token = token.substring(7); // 去掉"Bearer "前缀
            // 验证token是否有效
            if (tokenUtil.validateToken(token)) {
                String username = tokenUtil.getUsernameFromToken(token);
                redisUtils.delete(username);
                return new Result(200, "退出成功");
            }
        }
        return new Result(400, "退出失败");
    }
}
