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
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="../css/styleadmin.css">
    <%--<link rel="stylesheet" type="text/css" href="../css/bootstrap.css">--%>
</head>

<body>
<!--header-->
<header style="height: 71px">
    <h1><img src="<%=basePath%>images/LOGO.png"/></h1>
    <ul class="rt_nav">
        <li><a href="#" class="website_icon">站点首页</a></li>
        <li><a href="adminlogin.jsp" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<!--aside nav-->
<!--aside nav-->

<aside class="lt_aside_nav content mCustomScrollbar">

    <h2><a >管理区</a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <!--当前链接则添加class:active-->
                <dd><a href="" >查看商品</a></dd>
                <dd><a href="">商品详情</a></dd>
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
                <dd><a href="">举报信息</a></dd>
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
<section style="overflow: scroll">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">订单列表</h2>

        </div>
        <section class="mtb">
            <select class="select">
                <option>订单状态</option>
                <option>待付款</option>
                <option>待发货</option>

            </select>
            <input type="text" class="textbox textbox_225" style="height:30px;" placeholder="输入订单编号或收件人姓名/电话..."/>
            <input type="button" value="查询" class="group_btn"/>
        </section>
        <table class="table">
            <tr>
                <th>订单编号</th>
                <th>收件人</th>
                <th>联系电话</th>
                <th>收件人地址</th>
                <th>订单金额</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center">201602011207</td>
                <td>DeathGhost</td>
                <td>18300000000</td>
                <td>
                    <address>陕西省西安市未央区幸福路222号</address>
                </td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>

                <td class="center">
                    <a href="#" >查看订单</a>

                </td>
            </tr>

        </table>
        <aside class="paging">
            <a>第一页</a>
            <a>1</a>
            <a>2</a>
            <a>3</a>
            <a>…</a>
            <a>1004</a>
            <a>最后一页</a>
        </aside>
    </div>
</section>



</body>
</html>

