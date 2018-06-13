<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/7/007
  Time: 11:26
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // String tid = request.getParameter("tid");
%>
<html>

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>MEIHU</title>
    <base href="<%=basePath%>">
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

</head>
<body>
<div class="headeline"></div>
<!--演示内容开始-->
<style type="text/css">
    *{margin:0;padding:0;list-style-type:none;}
    a,img{border:0;}
    body{font:12px/180% Arial, Helvetica, sans-serif ,"新宋体";}
    /* pageLoad */
    #pageLoad{background:#0f1923;position:fixed;_position:absolute;left:0;right:0;top:350px;bottom:0;z-index:999;}
    #pageLoad div{text-align:center;height:150px;width:350px;padding-left:30px;position:absolute;}
    #pageLoad a,#pageLoad samp{display:block;background:url(<%=basePath%>images/loadbf.jpg) no-repeat center 0;height:80px;width:390px;position:absolute;z-index:0;left:0;top:0;}
    #pageLoad p{background:#0f1923;width:2px;position:absolute;left:0;top:0;height:60px;z-index:5;}
    #pageLoad samp{z-index:1;overflow:hidden;width:0;}
    #pageLoad samp em{display:block;background:url(<%=basePath%>images/loadaf.jpg) no-repeat center 0;height:80px;width:390px;}
    #pageLoad span{display:block;text-align:center;color:#fff;font-weight:bold;font-family:Arial;height:24px;font-size:24px;width:340px;padding-right:10px;position:relative;top:80px;}
</style>
<script src="<%=basePath%>js/jquery.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/load.js" type="text/javascript"></script>
<!--演示内容结束-->


</body>
</html>


</body>
</html>

