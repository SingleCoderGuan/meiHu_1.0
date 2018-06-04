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
    <link rel='stlesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
</head>
<body>

<div class="cotn_principal container">
    <div class="cont_centrar">
        <img id="logo" src="<%=basePath%>images/LOGO.png" >
        <span class="slogan">中国最专业化妆品交流平台</span>
        <form class="form-horizontal forgottenform" >
            <div class="form-group" style="position: relative;left: 53px;">
                <label class="col-sm-2 control-label" style="position: relative;top: 23px;left: 167px;color:#996666;font-size: 18px">手机号码</label>
                <div class="col-sm-4">
                    <input type="text" class="forgotteninput"  id="tel" placeholder="请输入手机号码">
                    <span style="position: absolute;left: 200px;top: 80px;" id="teltip"></span>
                </div>
            </div>

            <div class="form-group" style="position: relative;left: 53px;">
                <input type="button"style="position: relative;left: -314px;top: 5px;" id="sendtext" class="btn_my_login" value="发送短信验证码" disabled/>
            </div>

            <div class="form-group"style="position: relative;left: 53px;">
                <label class="col-sm-2 control-label" style="position: relative;top: 23px;left: 167px;color:#996666;font-size: 18px">短信验证码</label>
                <div class="col-sm-4">
                    <input type="text"  class="forgotteninput" id="mbtext" placeholder="请输入短信验证码入"><img src="" alt="">
                </div>
            </div>

            <div class="form-group"style="position: relative;left: 53px;">
                <div class="col-sm-offset-2 col-sm-1">
                    <button type="submit" class="btn_my_login" style="width: 200px;position:relative;top: 4px;left:212px;background-color: #f44336;color: #fff;">确定</button>
                </div>
            </div>
        </form>
    </div>
</div>

<script src="<%=basePath%>js/index.js"></script>
<script src='<%=basePath%>js/jquery.min.js'></script>
<script src="<%=basePath%>js/index_inner.js"></script>
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<script>
    $("#tel").blur(function () {
        var telnum = $("#tel").val();
        var reg = /^1[345789]\d{9}$/;
        if(!reg.test(telnum)){
            $("#teltip").html("")
            $("#teltip").removeClass()
            $("#teltip").addClass("wrong")
            $("#teltip").html("请输入正确格式")
            $("#sendtext").attr("disabled","disabled")
        }else{
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/checktel.action",
                data:"tel="+telnum,
                success:function (message) {
                    if(message=="0"){
                        $("#teltip").html("电话号码未注册")
                        $("#teltip").removeClass()
                        $("#teltip").addClass("wrong")
                        $("#sendtext").attr("disabled","disabled")
                    }else {
                        $("#teltip").html("ok")
                        $("#teltip").removeClass()
                        $("#teltip").addClass("right")
                        $("#sendtext").removeAttr("disabled") ;
                    }
                }
            })
        }
    })
</script>
</body>
</html>


