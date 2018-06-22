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
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/styleadmin.css">
    <script src="<%= basePath%>js/jquery.min.js"> </script>
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
                <dd><a href="<%=basePath%>shopAdmin/getAllProducts.action" >查看商品</a></dd>
                <dd><a href="<%=basePath%>shopAdmin/showCategoryLists.action">商品上架</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="<%=basePath%>shopAdminManage/selectYiFuKuanOrder.action">订单管理</a></dd>
                <dd><a href="<%=basePath%>shopAdminManage/selectDrawbackInfo.action">退货信息</a></dd>
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
            <c:forEach items="${refundLists}" var="refundLists">
                <tr>
                <th>退款编号：${refundLists.drawbackid}</th>
                <th>订单编号：${refundLists.order.orderid}</th>
                    <th>用户名称：${refundLists.user.uname}</th>
                <th colspan="3">提交退款日期：<fmt:formatDate value="${refundLists.drawbacktime}" pattern="yyyy-MM-dd"/></th>
                </tr>
                <tr>
                    <th>商品</th>
                    <th>商品名</th>
                    <th>数量</th>
                    <th>单价</th>
                    <th>状态</th>
                    <th>操作</th>
                </tr>
                <c:forEach items="${refundLists.order.items}" var="refundInfo">
                    <tr>
                        <td class="center"><img src="<%=basePath%>${refundInfo.good.goodpic}" width="80px" height="80px"/></td>
                        <td>${refundInfo.good.goodname}</td>
                        <td class="center">${refundInfo.count}</td>
                        <td class="center"><strong class="rmb_icon">${refundInfo.good.goodprice}</strong></td>
                        <td class="center">
                            <c:choose>
                                <c:when test="${refundLists.processstate== 0}">未处理退款</c:when>
                                <c:when test="${refundLists.processstate== 1}">已处理退款</c:when>
                            </c:choose>
                        </td>
                        <td class="center">
                            <a href="javascript:void(0)" onclick="acceptDrawback(${refundLists.drawbackid},${refundInfo.itemid})" >接受退款</a>
                           <%-- <a href="javascript:void(0)" onclick="reject()" >拒绝退款</a>--%>
                        </td>
                    </tr>
                </c:forEach>
            </c:forEach>
        </table>
        </section>

        <script>
            function acceptDrawback(drawbackid,itemid){
                var drawbackid=drawbackid;
                var itemid=itemid;
                $.ajax({
                    type:"get",
                    url:" <%=basePath%>shopAdminManage/updateDrawbackState.action",
                    data:"drawbackid="+drawbackid+"&itemid="+itemid,
                    success:function(result){
                        if(result==1){
                            alert("接受退款成功！");
                            window.location.reload();
                        }
                    }
                })
            }
        </script>
    </div>
</section>


</body>
</html>

