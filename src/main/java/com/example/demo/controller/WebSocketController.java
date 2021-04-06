package com.example.demo.controller;

import cn.hutool.core.date.DateUtil;
import cn.hutool.core.util.StrUtil;
import com.example.demo.common.WebSocketServer;
import com.example.demo.entity.WebSocketBean;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Component;

import javax.websocket.*;
import javax.websocket.server.ServerEndpoint;
import java.io.IOException;
import java.util.Map;
import java.util.Set;
import java.util.concurrent.ConcurrentHashMap;
import java.util.concurrent.atomic.AtomicInteger;

@Slf4j
@Component
@ServerEndpoint(value = "/ws/{uid}")
public class WebSocketController implements WebSocketServer {
    /**
     * 错误最大重试次数
     */
    private static final int MAX_ERROR_NUM = 10;

    private static final AtomicInteger OnlineCount = new AtomicInteger(0);

    private static ConcurrentHashMap<String, WebSocketBean> sessionPools = new ConcurrentHashMap<>();

    @OnOpen
    @Override
    public void onOpen(Session session, EndpointConfig config) {
        WebSocketBean bean = new WebSocketBean();
        bean.setSession(session);
        sessionPools.put(session.getId(), bean);
        int currentOnlineCount = OnlineCount.incrementAndGet();
        log.info("onOpen:[{}],currentOnlineCount:{}", session.getId(), currentOnlineCount);
    }

    @OnClose
    @Override
    public void onClose(Session session) {
        sessionPools.remove(session.getId());
        int currentOnlineCount = OnlineCount.decrementAndGet();
        log.info("onClose:[{}],currentOnlineCount:{}", session.getId(), currentOnlineCount);
    }

    @OnMessage
    @Override
    public void onMessage(Session session, String message) {
        String now = DateUtil.now();
        log.info("onMessage:{}", message);
        sendMessage(session, StrUtil.format("[{}] 服务器收到消息:{}", now, message));
    }

    @OnError
    @Override
    public void onError(Session session, Throwable throwable) {
        log.info("onError");
    }

    @Override
    public void sendMessage(Session session, String message) {
        try {
            session.getBasicRemote().sendText(message);
            // 清空错误计数
            sessionPools.get(session.getId()).cleanErrorConnectCount();
        } catch (IOException e) {
            log.error("发送消息失败" + e.getMessage(), e);
            int errorNum = sessionPools.get(session.getId()).getErrorConnectCount();
            // 小于最大重试次数重发
            if (errorNum <= MAX_ERROR_NUM) {
                sendMessage(session, message);
            } else {
                log.error("发送消息失败超过最大次数");
                // 清空错误计数
                sessionPools.get(session.getId()).cleanErrorConnectCount();
            }
        }
    }

    @Override
    public void batchSendMessage(String message) {
        Set<Map.Entry<String, WebSocketBean>> set = sessionPools.entrySet();
        for (Map.Entry<String, WebSocketBean> map : set) {
            sendMessage(map.getValue().getSession(), message);
        }
    }
}
