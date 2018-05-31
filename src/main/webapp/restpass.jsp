<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:05
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美乎重置密码</title>
    <link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="css/style.css">
    <link rel="stylesheet" href="css/style_inner.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
</head>
<body>

<div class="cotn_principal container">
    <div class="cont_centrar">
        <img id="logo" src="image/logo.png" >
        <span class="slogan">中国最专业化妆品交流平台</span>
        <form class="form-horizontal resetpswform"action="#" method="post">
            <div class="form-group">
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="psw" placeholder="请输入密码">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-4">
                    <input type="password" class="form-control" id="confirmpsw" placeholder="请再次输入密码">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-2">
                    <input type="password" class="form-control" id="verificationCode" placeholder="验证码"><img src="" alt="">
                </div>
            </div>
            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1">
                    <button type="submit" class="btn btn-default" style="width: 200px;position:relative;top: -20px;left:-120px;background-color: #f44336;color: #fff;">确认修改</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="js/index.js"></script>
<script src='js/jquery.min.js'></script>
<script src="js/index_inner.js"></script>
<script src="bootstrap/js/bootstrap.min.js"></script>

</body>
</html>


