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

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
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
        <form class="form-horizontal forgottenform"  >
            <div class="form-group" style="position: relative;left: 53px;">
                <label class="col-sm-2 control-label" style="position: relative;top: 23px;left: 100px;color:#996666;font-size: 18px">手机号码</label>
                <div class="col-sm-4">
                    <input type="text" class="forgotteninput"  id="tel" placeholder="请输入手机号码">
                    <span style="position: absolute;left: 200px;top: 80px;" id="teltip"></span>
                </div>
            </div>

            <div class="form-group" style="position: relative;left: 53px;">
                <input type="button"style="position: relative;left: -215px;top: 5px;" id="btn" class="btn_my_login" value="发送短信验证码" onclick="sendMessage()" disabled />
            </div>

            <div class="form-group" style="position: relative;left: 53px;">
                <label class="col-sm-2 control-label" style="position: relative;top: 23px;left: 100px;color:#996666;font-size: 18px">短信验证码</label>
                <div class="col-sm-4">
                    <input type="text"  class="forgotteninput" id="code" placeholder="请输入短信验证码入" />
                    <span style="position: absolute;left: 200px;top: 80px;" id="codetip"></span>
                </div>
            </div>

            <div class="form-group"style="position: relative;left: 53px;">
                <div class="col-sm-offset-2 col-sm-1">
                    <button class="btn_my_login"  id="lo" style="width: 200px;position:relative;top: 4px;left:130px;background-color: #f44336;color: #fff;" disabled>确定</button>
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
    $("#code").blur(function () {
        var telnum = $("#code").val();
        if(telnum.length <5){
            $("#codetip").html("")
            $("#codetip").removeClass()
            $("#codetip").addClass("wrong")
            $("#codetip").html("请输入正确格式")
            $("#lo").attr("disabled","true")
        }else{
            $("#codetip").removeClass()
            $("#codetip").addClass("right")
            $("#codetip").html("ok")
            $("#lo").attr("disabled",false) ;
        }
    })
</script>
<script>
    $("#tel").blur(function () {
        var telnum = $("#tel").val();
        var reg = /^1[345789]\d{9}$/;
        if(!reg.test(telnum)){
            $("#teltip").html("")
            $("#teltip").removeClass()
            $("#teltip").addClass("wrong")
            $("#teltip").html("请输入正确格式")
            $("#btn").attr("disabled","true")
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
                        $("#btn").attr("disabled","true")
                    }else {
                        $("#teltip").html("ok")
                        $("#teltip").removeClass()
                        $("#teltip").addClass("right")
                        $("#btn").attr("disabled",false) ;
                        $("#tel").attr("disabled",true);
                    }
                }
            })
        }
    })
</script>

<script type="text/javascript">
    var InterValObj; //timer变量，控制时间
    var count = 30; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    function sendMessage(){curCount = count;
        $("#btn").attr("disabled", "true");
        $("#btn").val(curCount + "秒后可重新发送");
        InterValObj = window.setInterval(SetRemainTime, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
    }
    //timer处理函数
    function SetRemainTime() {
        if (curCount == 0) {
            window.clearInterval(InterValObj);//停止计时器
            $("#btn").removeAttr("disabled");//启用按钮
            $("#btn").val("重新发送验证码");
        }
        else {
            curCount--;
            $("#btn").val(curCount + "秒后可重新发送");
        }
    }
</script>
<script>
    var sms="";
    $("#btn").click(function(){
        var tel=$("#tel").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/resetSend.action",
            type:"get",
            data:{"tel":tel},
            success:function(result){
                sms=result;
                alert(sms)
            }
        });
    });

    $("#lo").click(function(){
        var code=$("#code").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/sendCodes.action",
            type:"get",
            data:{"trueCode":sms,"userCode":code},
            success:function(result){
                if(result=="wrong"){
                    alert("验证码错误");
                }else {
                    $(location).attr("href","localhost:8080"+result);
                }
            }
        })
    });

</script>
</body>
</html>


