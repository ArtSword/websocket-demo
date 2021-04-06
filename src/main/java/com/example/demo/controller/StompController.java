package com.example.demo.controller;

import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.stereotype.Component;

@Slf4j
@Component
public class StompController {
    @MessageMapping("/marco")
    @SendTo("/topic/marco")
    public void stompHandle() {
    }
}
