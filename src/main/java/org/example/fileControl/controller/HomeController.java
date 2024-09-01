package org.example.fileControl.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("home")
public class HomeController {

    @GetMapping("/index")
    public String index() {
        return  "index";
    }

    @GetMapping("/chat")
    public String project1() {
        return "chat";  // 返回 register.ftl 模板
    }

    @GetMapping("/picture")
    public String project2() {
        return "picture";  // 返回 register.ftl 模板
    }

}
