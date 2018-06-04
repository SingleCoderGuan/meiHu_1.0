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

    <link rel="stylesheet" href="<%=basePath%>css/stylelogin.css">

    <script type="text/javascript" src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
    <script type="text/javascript" src="<%=basePath%>js/Validform_v5.3.2.js"></script>
    <script>
        $(".demoform").Validform();
    </script>
</head>
<body>

<form class="demoform">
    <input type="text" value="" name="name" datatype="s5-16" errormsg="昵称至少5个字符,最多16个字符！" />
</form>
<script src="<%=basePath%>js/indexlogin.js"></script>
<script src="<%=basePath%>js/jquery.min.js"></script>
<script src="<%=basePath%>js/index_inner.js"></script>


</body>
</html>


