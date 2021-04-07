$(document).ready(() => {

    let connectBtn = $("#connectBtn");
    let disconnectBtn = $("#disconnectBtn");

    let input1 = $("#input1");
    let btnSend1 = $("#send1");
    let ta1 = $("#ta1");

    let input2 = $("#input2");
    let btnSend2 = $("#send2");
    let ta2 = $("#ta2");

    let input3 = $("#input3");
    let btnSend3 = $("#send3");
    let ta3 = $("#ta3");

    let input4 = $("#input4");
    let btnSend4 = $("#send4");
    let ta4 = $("#ta4");

    let path = "http://" + window.location.host + "/stomp/websocketJS";

    let stompClient;

    connectBtn.click(function () {
        let socket = new SockJS(path);
        stompClient = Stomp.over(socket);
        stompClient.connect({}, connectCallback, errorCallback);
    });

    disconnectBtn.click(function () {
        if (stompClient != null) {
            stompClient.disconnect();
        }
    });

    // 发送广播消息
    btnSend1.click(function () {
        let val = input1.val();
        stompClient.send("/app/broadcast", {}, JSON.stringify({"body": val}))
    });

    // 发送订阅形式消息
    btnSend2.click(function () {
        let val = input2.val();
        stompClient.send("/app/one", {}, JSON.stringify({"body": val}))
    });

    // 发送用户消息
    btnSend3.click(function () {
        let val = input3.val();
        stompClient.send("/topic/one", {}, JSON.stringify({"body": val}))
    });

    // 发送无APP形式消息
    btnSend4.click(function () {
        let val = input4.val();
        stompClient.send("/app/broadcast", {}, JSON.stringify({"body": val}))
    });


    function connectCallback(frame) {
        console.log(frame);
        // 订阅广播
        stompClient.subscribe("/topic/broadcast", function (res) {
            console.log(res);
            textAreaAppend(ta1, res.body);
        });
        //订阅，一般只有订阅的时候在返回
        stompClient.subscribe("/app/subscribe/1", function (res) {
            console.log(res);
            textAreaAppend(ta2, res.body);
        });
        //用户模式
        stompClient.subscribe("/user/queue/one", function (res) {
            console.log(res);
            textAreaAppend(ta3, res.body);
        });
        //无APP
        stompClient.subscribe("/topic/app", function (res) {
            console.log(res);
            textAreaAppend(ta4, res.body);
        });
    }

    function errorCallback(error) {
        console.log(error);
    }

    function textAreaAppend(e, data) {
        e.append(data).append("\n");
        e.scrollTop(e[0].scrollHeight);
    }

});