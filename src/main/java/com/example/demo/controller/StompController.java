package com.example.demo.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import cn.hutool.json.JSONObject;
import lombok.extern.slf4j.Slf4j;
import org.springframework.messaging.handler.annotation.DestinationVariable;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.annotation.SubscribeMapping;
import org.springframework.web.bind.annotation.RestController;

@Slf4j
@RestController
public class StompController {

    //spring提供的推送方式
    /*@Autowired
    private SimpMessagingTemplate messagingTemplate;*/

    /**
     * 广播模式
     */
    @MessageMapping("/broadcast")
    @SendTo("/topic/broadcast")
    public String stompHandle(JSONObject requestBody) {
        requestBody.putIfAbsent("serverTime",DateUtil.now());
        log.info(requestBody.toStringPretty());
        return StrUtil.format("server:{}", requestBody.toString());
    }

    /**
     * 订阅模式，只是在订阅的时候触发，可以理解为：访问——>返回数据
     */
    @SubscribeMapping("/subscribe/{id}")
    public String subscribe(@DestinationVariable Long id) {
        log.info("subscribe.id:{}", id);
        return "success";
    }

    /**
     * 用户模式
     */
    /*@MessageMapping("/one")
    //@SendToUser("/queue/one") 如果存在return,可以使用这种方式
    public void one(JSON requestBody, Principal principal) {
        //这里使用的是spring的security的认证体系，所以直接使用Principal获取用户信息即可。
        //注意为什么使用queue，主要目的是为了区分广播和队列的方式。实际采用topic，也没有关系。但是为了好理解
        messagingTemplate.convertAndSendToUser(principal.getName(), "/queue/one", requestBody);
    }*/
}
