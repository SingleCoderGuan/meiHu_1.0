<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/9/009
  Time: 14:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>后台登录</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="../css/styleadmin.css" />
    <style>
        body{height:100%;background:#16a085;overflow:hidden;}
        canvas{z-index:-1;position:absolute;}
    </style>
    <script src="../js/jquery.js"></script>
    <script src="../js/verificationNumbers.js"></script>
    <script src="../js/Particleground.js"></script>
    <script>
        $(document).ready(function() {
            //粒子背景特效
            $('body').particleground({
                dotColor: '#5cbdaa',
                lineColor: '#5cbdaa'
            });
            //验证码
            createCode();
            //测试提交，对接程序删除即可
            $(".submit_btn").click(function(){
                location.href="index.html";
            });
        });
    </script>
</head>
<body>
<img src="<%=basePath%>images/LOGO.png" style="width: 300px;height: 170px;
margin-left: 530px;margin-top: 50px"/>
<form class="admin_login" action="adminlogin.action" method="post">
    <dt>
        <strong>美乎后台管理系统</strong>
        <em>MeiHu  Management System</em>
    </dt>

    <dd>
        <input type="text" placeholder="账号" class="login_txtbx" name="uname"style="height: 50px;"/>
    </dd>
    <dd >
        <input type="password" placeholder="密码" class="login_txtbx" name="upass"style="height: 50px;"/>
    </dd>

    <dd>
        <input type="submit" value="立即登录" style="width:270px"  class="submit_btn"/>
    </dd>

    <dd>
        <p>第六组 版权所有</p>
        <p>2018-06-23</p>
    </dd>
</dl>
</form>
</body>
</html>
