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
    <!--[if lt IE 9]>
    <script src="../js/html5.js"></script>
    <![endif]-->
    <script src="<%= basePath%>js/jquery.js"></script>
    <script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script src="<%= basePath%>js/jquery.min.js"></script>
    <script>

        (function ($) {
            $(window).load(function () {

                $("a[rel='load-content']").click(function (e) {
                    e.preventDefault();
                    var url = $(this).attr("href");
                    $.get(url, function (data) {
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo", "h2:last");
                    });
                });

                $(".content").delegate("a[href='top']", "click", function (e) {
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo", $(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
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
                <dd><a href="<%=basePath%>admin/showallpostreport.action">举报信息</a></dd>

            </dl>
        </li>
        <li>
            <dl>
                <dt>文章管理</dt>
                <dd><a href="<%=basePath%>admin/wenzhangfabiao.jsp">文章发表</a></dd>
                <dd><a href="<%=basePath%>admin/articleList.action">文章查看</a></dd>
            </dl>
        </li>

    </ul>
</aside>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">订单详情</h2>
        </div>

        <script type="text/javascript">
            function shanChu(orderid){
                var orderid=orderid;
                $.ajax({
                    type:"get",
                    url:"<%=basePath%>shopAdminManage/quxiao.action",
                    data:"orderid="+orderid,
                    success:function(msg){
                        if(msg==1){
                            alert("已取消此订单哦！");
                            window.location.reload();
                        }else{
                            alert("取消订单失败！");
                        }
                    }
                });
            }
            function faHuo(orderid){
                var orderid=orderid;
                $.ajax({
                    type:"post",
                    url:"<%=basePath%>shopAdminManage/fahuo.action",
                    data:"orderid="+orderid,
                    success:function(result){
                        alert("已安排发货哦！");
                        window.location.reload();
                    }
                });
            }
            function wanCheng(orderid){
                var orderid=orderid;
                $.ajax({
                    type:"post",
                    url:"<%=basePath%>shopAdminManage/wancheng.action",
                    data:"orderid="+orderid,
                    success:function(result){
                        alert("已设置订单状态为完成哦！");
                        window.location.reload();
                    }
                });
            }
            function quXiaoOrder(orderid){
                var orderid=orderid;
                $.ajax({
                    type:"get",
                    url:"<%=basePath%>shopAdminManage/quxiao.action",
                    data:"orderid="+orderid,
                    success:function(msg){
                        if(msg==1){
                            alert("已取消此订单！");
                            window.location.reload();
                        }else{
                            alert("取消订单失败！");
                        }
                    }
                });
            }
        </script>

        <table class="table">
            <tr>
                <td>收货人姓名：${YiFuKuanOrderItemLists.receivename}</td>
                <td>联系电话：${YiFuKuanOrderItemLists.receivetel}</td>
                <td>收件地址：${YiFuKuanOrderItemLists.addressdetail}</td>
                <td colspan="2">付款日期：<fmt:formatDate pattern="yyyy-MM-dd" value="${YiFuKuanOrderItemLists.ordertime}" /></td>
            </tr>
            <tr>
                <td colspan="2">订单状态：
                <a>
                    <c:choose>
                        <c:when test="${YiFuKuanOrderItemLists.state== 0}">待付款</c:when>
                        <c:when test="${YiFuKuanOrderItemLists.state== 1}">待发货</c:when>
                        <c:when test="${YiFuKuanOrderItemLists.state== 2}">待收货</c:when>
                        <c:when test="${YiFuKuanOrderItemLists.state== 3}">已完成</c:when>
                    </c:choose>
                </a>
                </td>
                <td colspan="3">订单号:${YiFuKuanOrderItemLists.orderid}</td>
            </tr>
        </table>
        <table class="table">
            <tr>
                <th>商品图片</th>
                <th>商品名称</th>
                <th>商品产地</th>
                <th>商品单价</th>
                <th>购买数量</th>
            </tr>
            <c:forEach items="${YiFuKuanOrderItemLists.items}" var="YiFuKuanOrderItemListsInfo">
                <tr>
                    <td class="center"><img src="<%=basePath%>${YiFuKuanOrderItemListsInfo.good.goodpic}" width="80px" height="80px"/></td>
                    <td>${YiFuKuanOrderItemListsInfo.good.goodname}</td>
                    <td class="center">${YiFuKuanOrderItemListsInfo.good.goodaddress}</td>
                    <td class="center"><strong class="rmb_icon">${YiFuKuanOrderItemListsInfo.good.goodprice}</strong></td>
                    <td class="center"><strong>${YiFuKuanOrderItemListsInfo.count}</strong></td>
                </tr>
            </c:forEach>
        </table>
        <aside class="mtb" style="text-align:right;">
            <label>操作：</label>
            <c:choose>

                <c:when test="${YiFuKuanOrderItemLists.state== 0}"><a href="javascript:void(0)" onclick="shanChu('${YiFuKuanOrderItemLists.orderid}')">删除</a></c:when>
                <c:when test="${YiFuKuanOrderItemLists.state== 1}"><a href="javascript:void(0)" onclick="faHuo('${YiFuKuanOrderItemLists.orderid}')">发货</a></c:when>
                <c:when test="${YiFuKuanOrderItemLists.state== 2}"><a href="javascript:void(0)" onclick="wanCheng('${YiFuKuanOrderItemLists.orderid}')">已完成</a></c:when>

            </c:choose>
            <a href="javascript:void(0)" onclick="quXiaoOrder('${YiFuKuanOrderItemLists.orderid}')">取消订单</a>
        </aside>
    </div>
</section>

</body>
</html>

