<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/21/021
  Time: 19:38
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" isErrorPage="true" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>美到出错</title>
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false);
    function hideURLbar(){ window.scrollTo(0,1); } </script>
    <!-- //for-mobile-apps -->
    <link href="../css/style404.css" rel="stylesheet" type="text/css" media="all" />
    <%--<link href='http://fonts.useso.com/css?family=Raleway:400,100,100italic,200,200italic,300,400italic,500,500italic,600,600italic,700,700italic,800,800italic,900italic,900' rel='stylesheet' type='text/css'>--%>
</head>
<body>
<div class="main">
    <div class="agileits_main_grid">
        <div class="agileits_main_grid_left">
            <h1>404 嘿嘿嘿</h1>
        </div>
        <div class="agileits_main_grid_right">
            <a href="<%=basePath%>jsp/zhuye.jsp">返回主页</a>
        </div>
        <div class="clear"> </div>
    </div>
    <div class="w3l_main_grid">
        <img src="<%=basePath%>images/404.png" alt=" " class="img-responsive" />
    </div>
    <div class="w3ls_main_grid_bottom">
        <div class="w3ls_main_grid_bottom_left">

        </div>
        <div class="w3ls_main_grid_bottom_right">
            <ul>
                <li>美论</li>
                <li>美乎</li>
            </ul>
            <ul>
                <li>美淘</li>
                <li>美美美</li>
            </ul>

        </div>
        <div class="clear"> </div>
    </div>
    <div class="agile_copy_right">
        <p>Copyright &copy; 2018.第六组版权所有.</p>
    </div>
</div>

</body>
</html>
