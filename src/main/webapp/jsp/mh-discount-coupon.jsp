<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>我的优惠券</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%= basePath%>css/bootstrap1.css" rel='stylesheet' type='text/css' />
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>

    <style>
        .uc-header-bg{
            background-color: #cdc6d7;
        }

    </style>
</head>
<body>
<!--头部-->
<div class="topper">
    <div class="wrapper">
        <div class="left-bar">
            <div class="back-home divider">
                <em></em><a href="<%=basePath%>jsp/index.jsp">美淘商城</a>
            </div>

        </div>
        <div class="right-bar">
            <div class="login-user sub-menu">
                <a class="menu-hd" href="">欢迎您：${user.uname}<em></em></a>

            </div>
            <div class="item"><a href="#">消息</a></div>
            <div class="logout divider"><a href="<%=basePath%>jsp/index.jsp">退出</a></div>
            <span class=""></span>
            <div class="cart"><em></em><a href="<%=basePath%>jsp/cart.jsp">购物车</a></div>
            <div class="order"><em></em><a href="<%=basePath%>jsp/mh-orders.jsp">我的订单</a></div>
            <div class="fav"><em></em><a href="#">我的收藏</a></div>
            <div class="help"><em></em><a href="#">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <a class="logo" href="<%=basePath%>jsp/index.jsp"><img src="<%=basePath%>images/u8.png" alt="" /></a>
        <div class="back-home"><a href="<%=basePath%>jsp/index.jsp">返回商城首页</a></div>
        <ul class="uc-nav">
            <li><a href="<%=basePath%>jsp/index.jsp">首页</a></li>
            <li>
                <a href="#" >账户设置</a>

            </li>
            <li><a href="#">系统消息</a></li>
        </ul>
        <div class="schbox">
            <form action="" method="post">
                <input class="search-txt" type="text" placeholder="请输入搜索内容"/>
                <button class="search-btn">搜索</button>

            </form>
        </div>
    </div>
</div>

<div class="wrapper uc-router">
    <ul>
        <li><a href="<%=basePath%>jsp/index.jsp">首页</a></li>
        <li><span class="divider"></span></li>
        <li><span>个人中心</span></li>
    </ul>
</div>

<div class="wrapper">
    <div class="uc-main clearfix">
        <div class="uc-aside">
            <div class="uc-menu">
                <div class="tit">订单中心</div>
                <ul class="sublist">
                    <li><a  href="<%=basePath%>jsp/mh-orders.jsp">我的订单</a></li>

                </ul>
                <div class="tit">客户服务</div>
                <ul class="sublist">

                    <li><a href="<%=basePath%>goods/doneOrder.action">退款/退货</a></li>
                </ul>


                <div class="tit">消息中心</div>
                <ul class="sublist">

                    <li><a  class="item active" href="<%=basePath%>goods/selectDiscount.action">我的优惠券</a></li>

                </ul>
                <div class="tit">服务中心</div>
                <ul class="sublist">
                    <li><a href="#">美淘服务</a></li>
                </ul>
            </div>
        </div>
        <div class="uc-content">
            <div class="uc-panel">
                <div class="uc-bigtit">我的优惠券</div>


                <div class="uc-panel-bd">

                    <table class="uc-table table table-hover">
                        <thead>

                        <th width="120px"style="text-align: center;font-size: 20px;color: rgba(240,62,62,0.81)">优惠券id</th>
                        <th width="200px"style="text-align: center;font-size: 20px;color: rgba(240,62,62,0.81)">优惠券类别</th>
                        <th width="120px"style="text-align: center;font-size: 20px;color: rgba(240,62,62,0.81)">数量</th>


                        </thead>
                        <c:forEach items="${userOffList}" var="useroff">

                            <tr >
                                <td>${useroff.offLevel.offid}</td>

                                <td>

                                    <c:choose>
                                        <c:when test="${useroff.offLevel.offname==0.5}">五折优惠券</c:when>
                                        <c:when test="${useroff.offLevel.offname==0.6}">六折优惠券</c:when>
                                        <c:when test="${useroff.offLevel.offname==0.7}">七折优惠券</c:when>
                                        <c:when test="${useroff.offLevel.offname==0.8}">八折优惠券</c:when>
                                        <c:when test="${useroff.offLevel.offname==0.9}">九折优惠券</c:when>
                                    </c:choose>

                                </td>


                                <td>${useroff.remainnum}张</td>

                            </tr>

                        </c:forEach>

                    </table>




                </div>
            </div>
        </div>
    </div>
</div>

<!--脚部-->
<div class="fatfooter">

</div>
<!--脚部-->
</body>
<script src="<%=basePath%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/style2.css"/>
<script src="<%=basePath%>js/icheck.min.js"></script>
<script src="<%=basePath%>js/global.js"></script>
<script>


</script>
</html>