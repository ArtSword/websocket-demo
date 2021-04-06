$(document).ready(() => {
    let uidInput = $("#uid");
    let okBtn = $("#okBtn");
    let textArea = $("#textArea");


    let socket = new SockJS("/ws/sockjs");
    let stompClient = Stomp.over(socket);
    stompClient.connect({},
        function connectCallback(frame) {
            console.log(frame);
        },
        function errorCallback(error) {
            console.log(error);
        }
    )


});