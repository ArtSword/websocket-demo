<!DOCTYPE html>
<html lang="zh-CN">
<head>
    <meta charset="UTF-8">
    <link rel="stylesheet" href="bootstrap-4.6.0-dist/css/bootstrap.min.css">
    <script src="lib/jquery.js"></script>
    <script src="bootstrap-4.6.0-dist/js/bootstrap.bundle.min.js"></script>
    <title>Page-02</title>
</head>
<body>
<div class="container">
    <div class="row">
        <nav aria-label="breadcrumb">
            <ol class="breadcrumb">
                <li class="breadcrumb-item"><a href="/">Index</a></li>
                <li class="breadcrumb-item"><a href="/1">Page01</a></li>
                <li class="breadcrumb-item active" aria-current="page">Page02</li>
            </ol>
        </nav>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <button type="button" class="btn btn-primary" id="connectBtn">连接</button>
            <button type="button" class="btn btn-danger" id="disconnectBtn">断开</button>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-12">
            <h4>广播形式</h4>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="input1" class="col-form-label">message</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="input1">
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-primary" id="send1">发送</button>
        </div>
        <div class="col-sm-6">
            <textarea class="form-control" id="ta1" rows="6"></textarea>
        </div>
    </div>
    <hr/>
    <div class="form-group row">
        <div class="col-sm-12">
            <h4>订阅形式</h4>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="input2" class="col-form-label">message</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="input2">
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-primary" id="send2">发送</button>
        </div>
        <div class="col-sm-6">
            <textarea class="form-control" id="ta2" rows="6"></textarea>
        </div>
    </div>
    <hr/>
    <div class="form-group row">
        <div class="col-sm-12">
            <h4>角色形式</h4>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="input3" class="col-form-label">message</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="input3">
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-primary" id="send3">发送</button>
        </div>
        <div class="col-sm-6">
            <textarea class="form-control" id="ta3" rows="6"></textarea>
        </div>
    </div>
    <hr/>
    <div class="form-group row">
        <div class="col-sm-12">
            <h4>无APP</h4>
        </div>
    </div>
    <div class="form-group row">
        <div class="col-sm-1">
            <label for="input4" class="col-form-label">message</label>
        </div>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="input4">
        </div>
        <div class="col-sm-1">
            <button type="button" class="btn btn-primary" id="send4">发送</button>
        </div>
        <div class="col-sm-6">
            <textarea class="form-control" id="ta6" rows="6"></textarea>
        </div>
    </div>
</div>
</body>


<script src="lib/stomp-2.3.3.js"></script>
<script src="lib/sockjs-client-1.5.0.js"></script>
<script src="page02.js"></script>
</html>