<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html >
<head>
    <meta charset="UTF-8">
    <title>美乎登录&注册</title>

    <link rel="stylesheet" href="../css/stylelogin.css">
    <link rel="stylesheet" href="../css/style_inner.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stylesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <script>
        $(".demoform").Validform();
    </script>
</head>
<body>

<div class="cotn_principal">
    <div class="cont_centrar">
        <img id="logo" src="../images/LOGO.png" >
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
                            <form class="demoform">
                                <input type="text" value="" name="name" datatype="s5-16" errormsg="昵称至少5个字符,最多16个字符！" />
                            </form>
                            <form class="demoform" action="/loginWithAccount.action" method="post">
                                <p id="one">
                                    <input style="position:relative;top: 20px;" type="text" placeholder="请输入用户名" />
                                    <input style="position:relative;top: 20px;" type="password" name="password" datatype="*6-15" errormsg="密码范围在6~15位之间！" placeholder="请输入密码" />
                                    <button class="btn_my_login" type="submit">登录</button>
                                    <div><a style="text-decoration:none;" href="#"><span id="forgotten">忘记密码？</span></a></div>
                                    <a id="extralogin" >第三方登录</a>
                                    <div id="elentrance">
                                        <img class="extralogin" src="../images/qqlogin.png" alt="">
                                        <img class="extralogin" src="../images/wechatlogin.png" alt="">
                                        <img class="extralogin" src="../images/weibologin.png" alt="">
                                    </div>
                                </p>
                            </form>
                            <form class="demoform" action="/loginWithTel.acion" method="post">
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
                    <form class="demoform" id="register" action="/register.action" method="post">
                        <input type="text" placeholder="请输入用户名" />
                        <input type="text" placeholder="请输入密码" />
                        <input type="password" placeholder="确认密码" />
                        <input type="password" placeholder="请输入手机号码" />
                        <button class="btn_sign_up" type="submit">注册</button>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="../js/indexlogin.js"></script>
<script src="../js/jquery.min.js"></script>
<script src="../js/index_inner.js"></script>
<script type="text/javascript" src="../js/Validform_v5.3.2.js"></script>
<script type="text/javascript" src="../js/jquery-1.9.1.min.js"></script>
</body>
</html>


