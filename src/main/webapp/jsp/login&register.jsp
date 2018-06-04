<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path =request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美乎登录&注册</title>

    <link rel="stylesheet" href="<%=basePath%>css/stylelogin.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>css/style_inner.css" type="text/css">
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link href="<%=basePath%>css/demo.css" type="text/css" rel="stylesheet" />
    <style>
        .registerform li{padding-bottom:20px;}
        .Validform_checktip{margin-left:10px;}
        .registerform .label{display:inline-block; width:70px;}
        .action{padding-left:92px;}
    </style>

</head>
<body>

<div class="cotn_principal">
    <div class="cont_centrar">

        <img id="logo" src="<%=basePath%>images/LOGO.png" >
        <span class="slogan">中国最专业化妆品交流平台</span>
        <div class="cont_login">
            <div class="cont_info_log_sign_up">
                <div class="col_md_login">
                    <div class="cont_ba_opcitiy">
                        <h2>登录</h2>
                        <p>说尽向来无限事</p>
                        <button class="btn_login" onClick="cambiar_login()">LOGIN</button>
                    </div>
                </div>
                <div class="col_md_sign_up">
                    <div class="cont_ba_opcitiy">
                        <h2>注册</h2>
                        <p>高山流水觅知音</p>
                        <button class="btn_sign_up" onClick="cambiar_sign_up()">REGISTER</button>
                    </div>
                </div>
            </div>
            <div class="cont_back_info">
            </div>
            <div class="cont_forms" >

                <div class="cont_form_login">

                    <div class="wrap">
                        <ul class="tabs group">
                            <li><a style="height: 60px;" class="active" href="#/one">用户名密码登录</a></li>
                            <li><a style="height: 60px;" href="#/two">手机短信登录</a></li>
                        </ul>

                        <div id="content">
                            <form id="accountlogin" action="${pageContext.request.contextPath}/loginWithAccount.action" method="post">
                            <p id="one">

                                <input style="position:relative;top: 20px;" type="text" name="uname" placeholder="请输入用户名"  <c:if test="${param.rslt}=='1'"><span style="color: red;">用户名不存在</span></c:if> />
                                <input style="position:relative;top: 20px;" type="password" name="password" placeholder="请输入密码" <c:if test="${param.rslt}=='2'"><span style="color: red;">密码错误</span></c:if> />

                                <button class="btn_my_login" type="submit">登录</button>
                                <div><a style="text-decoration:none;" href="#"><span id="forgotten">忘记密码？</span></a></div>
                                <a id="extralogin" >第三方登录</a>
                                <div id="elentrance">
                                    <img class="extralogin" src="<%=basePath%>images/qqlogin.png" alt="">
                                    <img class="extralogin" src="<%=basePath%>images/wechatlogin.png" alt="">
                                    <img class="extralogin" src="<%=basePath%>images/weibologin.png" alt="">
                                </div>
                            </p>
                            </form>

                            <form id="textlogin" class="demoform" >
                                <p class="ex" id="two" hidden>
                                    <input style="position:relative;top: 20px;" id="tel" type="text" placeholder="请输入手机号码" />
                                    <button class="btn_my_send" id="vcode" onClick="sendtext()">发送验证码</button>
                                    <input style="position:relative;top: 20px;" type="password" placeholder="请输入验证码" />
                                    <button class="btn_my_login" type="submit" id="tellogin">登录</button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="cont_form_sign_up">
                    <h2>注册</h2>
                    <form class="registerform" >
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;font-size: 14px;top: 10px;">用户名：</label>
                            <input style="position: relative;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="text" id="reguname"  name="username" class="inputxt"/>
                            <span style="position: absolute;left: 200px;top: 80px;" id="unametip"></span>
                        </li>
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;left: 7px;top: 10px;font-size: 14px">密  码：</label>
                            <input style="position: relative;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password"  value="" name="userpassword" class="inputxt" />
                        </li>
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;left: -6px;top: 10px;font-size: 14px;width: 80px;">确认密码：</label>
                            <input style="position: relative;left: -5px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password" value="" name="verificationpsw" class="inputxt"/>
                        </li>
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;left: -6px;top: 10px;font-size: 14px;width: 80px;">手机号码：</label>
                            <input style="position: relative;left: -5px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="text" value="" name="phone" class="inputxt"/>
                        </li>
                        <li style="position: relative;top: 20px;left:-45px;list-style-type:none; ">
                            <input class="btn_my_login" style="position: relative;top: -7px;" type="button" value="发送手机短信验证码"/>
                        </li>
                        <li style="position: relative;top: -5px;left:-65px;list-style-type:none; ">
                            <label class="label" style="font-size: 14px;position: relative;top: 10px;">验证码：</label>
                            <input style="position: relative;padding: 15px 5px;
                                margin-left: 10px;
                                margin-top: 20px;
                                  width: 180px;
                                border: none;
                                text-align: left;
                                  color: #757575;background-color: #fff" type="text" value="" name="text" class="inputxt"/>
                        </li>
                        <div class="action" style="position: relative;top: 20px;left:-90px ">
                            <input type="submit" style="position: relative;top: -28px;" class="btn_my_login" value="提 交" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 460px;">
                    <div class="modal-header" style="background-color: #F0DAD2">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="myModalLabel">请完善您的信息</h4>
                    </div>
                    <div class="modal-body" style="background-color: #F0DAD2">
                        <form class="registerform" >
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -23px;font-size: 15px;top: 10px;">用户名：</label>
                                <input style="position: relative;left: -45px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="text" id="perfectuname" name="username" class="inputxt" />
                                <span style="position: absolute;left: 200px;top: 80px;" id="perunametip"></span>
                            </li>
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -12px;top: 10px;font-size: 14px">密  码：</label>
                                <input style="position: relative;left: -45px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password"  value="" name="userpassword" class="inputxt" />
                            </li>
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -28px;top: 10px;font-size: 14px;width: 80px;">确认密码：</label>
                                <input style="position: relative;left: -50px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password" value="" name="verificationpsw" class="inputxt"/>
                            </li>
                            <img src="<%=basePath%>images/LOGO.png"    style="position: relative; left: -20px;top: 20px;width: 190px;height: 50px;"/>
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="font-size: 14px;position: relative;left: -20px;top: 10px;">验证码：</label>
                                <input style="position: relative;left: -45px;padding: 15px 5px;
                                margin-left: 10px;
                                margin-top: 20px;
                                  width: 180px;
                                border: none;
                                text-align: left;
                                  color: #757575;background-color: #fff" type="text" value="" name="text" class="inputxt"/>
                            </li>
                            <div class="action" style="position: relative;top: 20px;left:-20px">
                                <input type="submit" style="position: relative;top: -20px;width: 90px;left: -72px;" class="btn_my_login" value="提 交" />
                                <input type="reset" style="position: relative;top: -20px;width: 90px; left: 40px;" class="btn_my_login" value="重 置" />
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>

<script type="text/javascript" src="<%=basePath%>js/indexlogin.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/index_inner.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

<script type="text/javascript">

    $(function(){
        //$(".registerform").Validform();  //就这一行代码！;

        var demo=$(".registerform").Validform({
            tiptype:3,
            label:".label",
            showAllError:true,
            datatype:{
                "zh1-6":/^[\u4E00-\u9FA5\uf900-\ufa2d]{1,6}$/
            },
            ajaxPost:true
        });

        //通过$.Tipmsg扩展默认提示信息;
        //$.Tipmsg.w["zh1-6"]="请输入1到6个中文字符！";
        demo.tipmsg.w["zh1-6"]="请输入1到6个中文字符！";

        demo.addRule([
            {
                ele:".inputxt:eq(1)",
                datatype:"*6-20"
            },
            {
                ele:".inputxt:eq(2)",
                datatype:"*6-20",
                recheck:"userpassword"
            },
            {
                ele:".inputxt:eq(3)",
                datatype:"m",
            }
            ]);

    })
</script>
<script>
    $("#tellogin").click(function () {
        $.ajax({
            type:"get",
            url:"${pageContext.request.contextPath}/loginWithTel.action",
            data:"tel="+$("#tel").val()+"&vcode="+$("#vcode").val(),
            success:function (message) {
                if(message=="1"){
                    $('#myModal').modal({
                    })
                }
            }
        })
    })
</script>
<script>
    $("#reguname").blur(function () {
        var content = $("#reguname").val();
        if(content.length<5||content.length>20){
            $("#unametip").html("")
            $("#unametip").removeClass()
            $("#unametip").addClass("wrong")
            $("#unametip").html("用户名必须是5到20位字符")
        }else{
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/namecheck.action",
                data:"uname="+content,
                success:function (message) {
                    if(message=="0"){
                        $("#unametip").html("用户名已被占用")
                        $("#unametip").removeClass()
                        $("#unametip").addClass("wrong")
                    }else {
                        $("#unametip").html("ok")
                        $("#unametip").removeClass()
                        $("#unametip").addClass("right")
                    }
                }
            })
        }
    })
</script>
<script>
    $("#perfectuname").blur(function () {
        var content = $("#perfectuname").val();
        if(content.length<5||content.length>20){
            $("#perunametip").html("")
            $("#perunametip").removeClass()
            $("#perunametip").addClass("wrong")
            $("#perunametip").html("用户名必须是5到20位字符")
        }else{
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/namecheck.action",
                data:"uname="+content,
                success:function (message) {
                    if(message=="0"){
                        $("#perunametip").html("用户名已被占用")
                        $("#perunametip").removeClass()
                        $("#perunametip").addClass("wrong")
                    }else {
                        $("#perunametip").html("ok")
                        $("#perunametip").removeClass()
                        $("#perunametip").addClass("right")
                    }
                }
            })
        }
    })
</script>
</body>
</html>


