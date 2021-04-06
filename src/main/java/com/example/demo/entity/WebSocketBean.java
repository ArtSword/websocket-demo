package com.example.demo.entity;

import javax.websocket.Session;
import java.util.concurrent.atomic.AtomicInteger;


public class WebSocketBean {

    private Session session;

    /**
     * 连接错误次数
     */
    private AtomicInteger errorConnectCount = new AtomicInteger(0);

    public int getErrorConnectCount() {
        return errorConnectCount.getAndIncrement();
    }

    public void cleanErrorConnectCount() {
        errorConnectCount = new AtomicInteger(0);
    }

    // ================== setter and getter ===========================

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }
}
