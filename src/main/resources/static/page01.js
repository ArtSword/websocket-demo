$(document).ready(() => {
    var ws;

    let uidInput = $("#uid");
    let connectBtn = $("#connectBtn");
    let messageInput = $("#messageInput");
    let sendBtn = $("#sendBtn");
    let textArea = $("#textArea");

    let path = "ws://" + window.location.host + "/ws/";

    connectBtn.click(function () {
        let uid = uidInput.val().trim();
        let url = path + uid;
        console.log(url);
        ws = wsConnect(url);
    });
    sendBtn.click(function () {
        ws.send(messageInput.val());
    });


    function wsConnect(url) {
        let ws = new WebSocket(url);
        ws.onopen = function () {
            console.log("ws onopen");
        };
        ws.onmessage = function (data) {
            textAreaAppend(data);
        };
        ws.onclose = function () {
            console.info("close");
        };
        return ws;
    }

    function textAreaAppend(data) {
        textArea.append(data.data).append("\n");
        textArea.scrollTop(textArea[0].scrollHeight);
    }

});