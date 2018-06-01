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
    <title>美乎登录&注册</title>

    <link rel="stylesheet" href="<%=basePath%>css/stylelogin.css" type="text/css">
    <link rel="stylesheet" href="<%=basePath%>css/style_inner.css" type="text/css">

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
                            <li><a class="active" href="#/one">用户名密码登录</a></li>
                            <li><a href="#/two">手机短信登录</a></li>
                        </ul>

                        <div id="content">
                            <form class="demoform" id="accountlogin" action="${pageContext.request.contextPath}/loginWithAccount.action" method="post">
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

                            <form id="textlogin" class="demoform" action="/loginWithTel.acion" method="post">
                                <p class="ex" id="two" hidden>
                                    <input style="position:relative;top: 20px;"  type="text" placeholder="请输入手机号码" />
                                    <button class="btn_my_send" onClick="sendtext()">发送验证码</button>
                                    <input style="position:relative;top: 20px;" type="password" placeholder="请输入验证码" />
                                    <button class="btn_my_login" type="submit" onClick="cambiar_sign_up()">登录</button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="cont_form_sign_up">
                    <h2>注册</h2>
                    <form class="registerform" >
                        <li style="position: relative;top: 30px;">
                            <label class="label"><span class="need">*</span> 密码：</label>
                            <input type="password" value="" name="userpassword" class="inputxt" />
                        </li>
                        <li style="position: relative;top: -10px;">
                            <label class="label"><span class="need">*</span> 确认密码：</label>
                            <input type="password" datatype="m|e                                                                                                                                                                                        " errormsg="账号可以是手机或邮箱地址！" value="" name="userpassword2" class="inputxt" />
                        </li>
                        <div class="action">
                            <input type="submit" value="提 交" /> <input type="reset" value="重 置" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>



<script src="<%=basePath%>js/indexlogin.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/index_inner.js"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2.js"></script>

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

        demo.addRule([{
            ele:".inputxt:eq(0)",
            datatype:"zh2-4"
        },
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
                ele:"select",
                datatype:"*"
            },
            {
                ele:":radio:first",
                datatype:"*"
            },
            {
                ele:":checkbox:first",
                datatype:"*"
            }]);

    })
</script>
</body>
</html>


