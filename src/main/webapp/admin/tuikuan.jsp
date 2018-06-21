<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/9/009
  Time: 15:22
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
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost"/>
    <link rel="stylesheet" type="text/css" href="../css/styleadmin.css">
    <%--<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">--%>


</head>
<body>
<!--header-->
<header>
    <h1><img src="<%=basePath%>images/LOGO.png"/></h1>
    <ul class="rt_nav">
        <li><a href="#" class="website_icon">站点首页</a></li>
        <li><a href="adminlogin.jsp" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <h2><a href="index.html">起始页</a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="">查看商品</a></dd>
                <dd><a href="">商品上架</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="">订单列表</a></dd>
                <dd><a href="">订单详情</a></dd>
                <dd><a href="">退货信息</a></dd>

            </dl>
        </li>

        <li>
            <dl>
                <dt>论坛信息</dt>
                <dd><a href="">举报处理</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>文章管理</dt>
                <dd><a href="">文章发表</a></dd>
                <dd><a href="">文章查看</a></dd>
            </dl>
        </li>

    </ul>
</aside>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">商品退款</h2>
        </div>
        <section class="mtb">

        <table class="table">
            <tr>
                <th>订单号</th>
                <th>商品名</th>
                <th>数量</th>
                <th>单价</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center">订单号77777</td>
                <td>这里是产品名称</td>
                <td class="center">2</td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>


                <td class="center">
                    <a href="#" >接收退款</a>
                    <a href="#" >拒绝退款</a>

                </td>
            </tr>

        </table>
        </section>

    </div>
</section>


</body>
</html>

