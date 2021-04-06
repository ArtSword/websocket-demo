<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <script src="lib/jquery.js"></script>
    <script src="bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
    <title>Page-01</title>
</head>
<body>
<div class="container">
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Index</a></li>
                <li class="breadcrumb-item active" aria-current="page">Page01</li>
                <li class="breadcrumb-item"><a href="/2">Page02</a></li>
            </ol>
        </nav>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="uid" class="col-form-label">uid</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="uid">
        </div>
        <div class="col-sm-3">
            <button type="button" class="btn btn-primary" id="connectBtn">连接</button>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="messageInput" class="col-form-label">message</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="messageInput">
        </div>
        <div class="col-sm-3">
            <button type="button" class="btn btn-primary" id="sendBtn">发送</button>
        </div>
    </div>
    <div class="form-group row">
        <label for="textArea">响应</label>
        <textarea class="form-control" id="textArea" rows="10"></textarea>
    </div>
</div>
</body>


<#--<script src="lib/stomp-2.3.3.js"></script>
<script src="lib/sockjs-client-1.5.0.js"></script>-->
<script src="page01.js"></script>
</html>