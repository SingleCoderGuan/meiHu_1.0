<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美乎忘记密码</title>
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/stylelogin.css">
    <link rel="stylesheet" href="<%=basePath%>css/style_inner.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
</head>
<body>

<div class="cotn_principal container">
    <div class="cont_centrar">
        <img id="logo" src="../images/logo.png" >
        <span class="slogan">中国最专业化妆品交流平台</span>
        <form class="form-horizontal forgottenform">
            <div class="form-group">
                <label class="col-sm-2 control-label">手机号码</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="tel" placeholder="请输入手机号码">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">验证码</label>
                <div class="col-sm-2">
                    <input type="text" class="form-control" id="verificationCode" placeholder="请输入验证码">
                </div>
            </div>

            <div class="form-group">
                <label class="col-sm-2 control-label">短信验证码</label>
                <div class="col-sm-4">
                    <input type="text" class="form-control" id="mbtext" placeholder="请输入短信验证码入"><img src="" alt="">
                </div>
            </div>

            <div class="form-group">
                <div class="col-sm-offset-2 col-sm-1">
                    <button type="submit" class="btn btn-default" style="width: 200px;position:relative;top: -20px;left:126px;background-color: #f44336;color: #fff;">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="<%=basePath%>js/index.js"></script>
<script src='<%=basePath%>js/jquery.min.js'></script>
<script src="<%=basePath%>js/index_inner.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

</body>
</html>


