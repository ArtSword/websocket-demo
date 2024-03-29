package com.example.demo.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class MainController {

    @GetMapping("/")
    public String index() {
        return "index";
    }

    @GetMapping("/1")
    public String page01() {
        return "page01";
    }

    @GetMapping("/2")
    public String page02() {
        return "page02";
    }
}
