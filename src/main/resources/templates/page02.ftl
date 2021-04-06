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
        <label for="uid" class="col-form-label">uid</label>
        <div class="col-sm-3">
            <input type="text" class="form-control" id="uid">
        </div>
        <div class="col-sm-3">
            <button type="button" class="btn btn-primary" id="okBtn">确定</button>
        </div>
    </div>
    <div class="form-group row">
        <label for="textArea">响应</label>
        <textarea class="form-control" id="textArea" rows="3"></textarea>
    </div>
</div>
</body>


<script src="lib/stomp-2.3.3.js"></script>
<script src="lib/sockjs-client-1.5.0.js"></script>
<script src="page02.js"></script>
</html>