<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%
    String path =request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE html>
<meta  http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>美乎登录&注册</title>
<link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

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

    <script>
        function getUrlParms(name){
            var reg = new RegExp("(^|&)"+ name +"=([^&]*)(&|$)");
            var r = window.location.search.substr(1).match(reg);
            if(r!=null)
                return unescape(r[2]);
            return null;
        }
        var id = getUrlParms("rslt");
        if(id=="1"){
            alert("用户名或密码错误")
        }
        if(id=="2"){
            alert("用户名或密码错误")
        }
        if(id=="3"){
            alert("注册成功")
        }
        if(id=="4"){
            alert("密码重置成功")
        }
    </script>
</head>
<body style="width: 100%;">

<div class="cotn_principal">
    <div class="cont_centrar">
        <c:set var="userCookie" value="${cookie.userInfo.value }"></c:set>
        <c:set var="userArr" value='${fn:split(userCookie,"-") }'></c:set>
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
                            <form id="accountlogin" action="${pageContext.request.contextPath}/user/loginWithAccount.action" method="post">
                            <p id="one">

                                <input style="position:relative;top: 20px;"  type="text" name="uname" value="${userArr[0] }" placeholder="请输入用户名"/>
                                <input style="position:relative;top: 20px;" type="password" name="password" value="${userArr[1] }"  placeholder="请输入密码" />
                                <c:if test="${empty cookie.userInfo.value }">
                                    <input style="position: absolute;left: -100px;top: 152px;" type="checkbox" name="flag" value="1"/>
                                </c:if>
                                <c:if test="${not empty cookie.userInfo.value }">
                                <input style="position: absolute;left: -100px;top: 152px;" type="checkbox" checked="checked" name="flag" value="1"/>
                                </c:if>
                                <span style="position: absolute;left: 50px;top: 170px;">记住密码</span>
                                <a href="<%=basePath%>jsp/forgottenpass.jsp"><span style="position: absolute;left: 220px;top: 170px;">忘记密码</span></a>


                                <button class="btn_my_login" style="position: absolute;top:200px;left: 60px" type="submit">登录</button>
                                <span disabled="disabled" style="position: absolute;top: 260px;left: 36px;" >第三方登录</span>
                                <div id="elentrance">
                                    <img class="extralogin" style="position: absolute;top: 95px;left: 60px;" src="<%=basePath%>images/qqlogin.png" alt="">
                                    <img class="extralogin" style="position: absolute;top: 95px;left: 140px;" src="<%=basePath%>images/wechatlogin.png" alt="">
                                    <img class="extralogin" style="position: absolute;top: 95px;left: 220px;" src="<%=basePath%>images/weibologin.png" alt="">
                                </div>
                            </p>
                            </form>

                            <form id="textlogin" class="demoform">
                                <p class="ex" id="two" hidden>
                                    <input style="position:relative;top: 85px;" id="tel" type="text" placeholder="请输入手机号码" />
                                    <input class="btn_my_login"  id="vcode" style="position: relative;top: 98px;color: #eeeeee;text-align: center;width: 200px" onClick="sendText()" value="发送验证码" />
                                    <input style="position:relative;top: 100px;" id="userCode" type="password" placeholder="请输入验证码" />
                                    <button class="btn_my_login" style="position: relative;top: 120px;" id="tellogin">登录</button>
                                </p>
                            </form>
                        </div>
                    </div>
                </div>
                <div class="cont_form_sign_up">
                    <h2>注册</h2>
                    <form class="registerform" action="<%=basePath%>user/register.action" method="post" >
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;font-size: 14px;top: 10px;color:#996666;">用户名：</label>
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
                            <label class="label" style="position: relative;left: 7px;top: 10px;font-size: 14px;color:#996666;">密  码：</label>
                            <input style="position: relative;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password"  value="" name="password" class="inputxt" />
                        </li>
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;left: -6px;top: 10px;font-size: 14px;color:#996666;width: 80px;">确认密码：</label>
                            <input style="position: relative;left: -5px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password" value="" name="verificationpsw" class="inputxt"/>
                        </li>
                        <li style="position: relative;top: 20px;left:-65px;list-style-type:none; ">
                            <label class="label" style="position: relative;left: -6px;top: 10px;color:#996666;font-size: 14px;width: 80px;">手机号码：</label>
                            <input style="position: relative;left: -5px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" id="regtel" type="text" value="" name="phone" class="inputxt"/>
                            <span id="teltip" style="position: absolute;top: 75px;left: 212px;"></span>
                        </li>

                        <li style="position: relative;top: 20px;left:-45px;list-style-type:none; ">
                            <input class="btn_my_login" id="btn" style="position: relative;top: -7px;" type="button" onclick="sendMessage()" value="发送手机短信验证码"/>
                        </li>
                        <li style="position: relative;top: -5px;left:-65px;list-style-type:none; ">
                            <label class="label" style="font-size: 14px;position: relative;top: 10px;color:#996666;">验证码：</label>
                            <input style="position: relative;padding: 15px 5px;
                                margin-left: 10px;
                                margin-top: 20px;
                                  width: 180px;
                                border: none;
                                text-align: left;
                                  color: #757575;background-color: #fff" id="code" type="text" value="" name="text" class="inputxt"/>
                        </li>
                        <div class="action" style="position: relative;top: 20px;left:-90px ">
                            <input type="submit" style="position: relative;top: -28px;" id="lo" disabled class="btn_my_login" value="提 交" />
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content" style="width: 460px;">
                    <div class="modal-header" style="background-color: #F0DAD2">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                        <h4 class="modal-title" id="myModalLabel">请完善您的信息</h4>
                    </div>
                    <div class="modal-body" style="background-color: #F0DAD2">
                        <form class="registerform" action="<%=basePath%>user/perferUser.action" method="post">
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -23px;font-size: 15px;color:#996666;top: 10px;">用户名：</label>

                                <input style="position: relative;left: -45px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="text" id="perfectuname" name="uname" class="inputxt" />
                                <span style="position: absolute;left: 200px;top: 80px;" id="perunametip"></span>
                            </li>
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -12px;top: 10px;color:#996666;font-size: 14px">密  码：</label>
                                <input style="position: relative;left: -45px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password"  value="" name="password" class="inputxt" />
                            </li>
                            <li style="position: relative;margin: 0 auto ;list-style-type:none; ">
                                <label class="label" style="position: relative;left: -28px;top: 10px;color:#996666;font-size: 14px;width: 80px;">确认密码：</label>
                                <input style="position: relative;left: -50px;padding: 15px 5px;
margin-left: 10px;
margin-top: 20px;
  width: 180px;
border: none;
text-align: left;
  color: #757575;background-color: #fff" type="password" value="" name="verificationpsw" class="inputxt"/>
                            </li>
                            <input hidden id="hiddenTel" name="tel" />
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
            showAllError:false,
            ajaxPost:false,
        });

        demo.addRule([
            {
                ele:".inputxt:eq(1)",
                datatype:"*6-20"
            },
            {
                ele:".inputxt:eq(2)",
                datatype:"*6-20",
                recheck:"password"
            }
            ]);

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
            $("#lo").attr("disabled",true)
        }else{
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/user/namecheck.action",
                data:"uname="+content,
                success:function (message) {
                    if(message=="0"){
                        $("#unametip").html("用户名已被占用")
                        $("#unametip").removeClass()
                        $("#unametip").addClass("wrong")
                        $("#lo").attr("disabled",true)
                    }else {
                        $("#unametip").html("ok")
                        $("#unametip").removeClass()
                        $("#unametip").addClass("right")
                        $("#lo").attr("disabled",false)
                    }
                }
            })
        }
    })
</script>
<script>
    $("#perfectuname").blur(function () {
        var content = $("#perfectuname").val();
        if(content.length < 5||content.length>20){
            $("#perunametip").html("")
            $("#perunametip").removeClass()
            $("#perunametip").addClass("wrong")
            $("#perunametip").html("用户名必须是5到20位字符")
        }else{
            $.ajax({
                type:"get",
                url:"${pageContext.request.contextPath}/user/namecheck.action",
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

<script type="text/javascript">
    var InterValObj; //timer变量，控制时间
    var count = 60; //间隔函数，1秒执行
    var curCount;//当前剩余秒数
    function sendMessage(){
        curCount = count;
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
        var tel=$("#regtel").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/user/resetSend.action",
            type:"get",
            data:{"tel":tel},
            success:function(result){
                sms=result;

            }
        });
    });

    $("#lo").click(function(){
        var code=$("#code").val();
        if(code==""){
            alert("请输入验证码");
        }else{
            if(sms==code){
                alert("验证码正确")

            }else{
                alert("验证码错误");

            };
        };

    });

</script>

<script>
    $("#regtel").blur(function () {
        var telnum = $("#regtel").val();
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
                url:"${pageContext.request.contextPath}/user/checktel.action",
                data:"tel="+telnum,
                success:function (message) {
                    if(message=="0"){
                        $("#teltip").html("ok")
                        $("#teltip").removeClass()
                        $("#teltip").addClass("right")
                        $("#btn").attr("disabled",false) ;
                        $("#tel").attr("disabled",true);

                    }else {

                        $("#teltip").html("电话号码已注册")
                        $("#teltip").removeClass()
                        $("#teltip").addClass("wrong")
                        $("#btn").attr("disabled","true")
                    }
                }
            })
        }
    })
</script>
<script type="text/javascript">
    var InterValObj1; //timer变量，控制时间
    var lcount = 60; //间隔函数，1秒执行
    var lcurCount;//当前剩余秒数
    function sendText(){
        lcurCount = lcount;
        $("#vcode").attr("disabled", "true");
        $("#vcode").val(lcurCount + "秒后可重新发送");
        InterValObj1 = window.setInterval(SetRemainTime1, 1000); //启动计时器，1秒执行一次请求后台发送验证码 TODO
    }
    //timer处理函数
    function SetRemainTime1() {
        if (lcurCount == 0) {
            window.clearInterval(InterValObj1);//停止计时器
            $("#vcode").removeAttr("disabled");//启用按钮
            $("#vcode").val("重新发送验证码");
        }
        else {
            lcurCount--;
            $("#vcode").val(lcurCount + "秒后可重新发送");
        }
    }
</script>
<script>
    var sms="";
    $("#vcode").click(function(){
        var tel=$("#tel").val();
        $.ajax({
            url:"${pageContext.request.contextPath}/user/resetSend.action",
            type:"get",
            data:{"tel":tel},
            success:function(result){
                sms=result;

            }
        });
    });

    $("#tellogin").click(function(){
        var tel=$("#tel").val() ;
        var code=$("#userCode").val();
        if(code==""){
            alert("请输入验证码");
        }else{
            if(sms==code){
                alert("验证码正确")
                $.ajax({
                    type:"get",
                    url:"${pageContext.request.contextPath}/user/loginWithTel.action",
                    data:"tel="+tel,
                    success:function (message) {
                        if(message=="1"){
                            window.location.href = "${pageContext.request.contextPath}/luntan/luntanshouye.action?tid=1";
                        }
                        if(message=="0"){
                            $("#hiddenTel").val(tel) ;
                            $('#myModal').modal({
                            })
                        }
                    }
                })
            }else{
                alert("验证码错误");

            };
        };
    });
</script>
</body>
</html>


