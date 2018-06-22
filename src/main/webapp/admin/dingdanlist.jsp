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
            <h2 class="fl">订单列表</h2>

        </div>
        <section class="mtb">
            <form action="<%=basePath%>shopAdminManage/selectOrderByState.action" method="post">
                <select class="select" name="orderstate">
                    <option value="">请选择订单状态进行查询</option>
                    <option value="0">待付款</option>
                    <option value="1">待发货</option>
                    <option value="2">待收货</option>
                    <option value="3">已完成</option>
                </select>
                <input type="submit" value="进行查询" class="group_btn"/>
            </form>
        </section>
        <table class="table">
            <tr>
                <th>订单编号</th>
                <th>收件人</th>
                <th>联系电话</th>
                <th>收件人地址</th>
                <th>订单金额</th>
                <th>状态</th>
                <th>操作</th>
            </tr>
            <c:forEach items="${pageInfo.list}" var="YiFuKuanOrderLists">
                <tr>
                    <td class="center">${YiFuKuanOrderLists.orderid}</td>
                    <td>${YiFuKuanOrderLists.user.uname}</td>
                    <td>${YiFuKuanOrderLists.receivetel}</td>
                    <td>
                        <address>${YiFuKuanOrderLists.addressdetail}</address>
                    </td>
                    <td class="center"><strong class="rmb_icon">${YiFuKuanOrderLists.total}</strong></td>
                    <td>
                        <c:choose>
                            <c:when test="${YiFuKuanOrderLists.state== 0}">待付款</c:when>
                            <c:when test="${YiFuKuanOrderLists.state== 1}">待发货</c:when>
                            <c:when test="${YiFuKuanOrderLists.state== 2}">待收货</c:when>
                            <c:when test="${YiFuKuanOrderLists.state== 3}">已完成</c:when>
                        </c:choose>
                    </td>
                    <td class="center">
                        <a href="<%=basePath%>shopAdminManage/selectYiFuKuanOrderItem.action?orderid=${YiFuKuanOrderLists.orderid}" >查看订单详情</a>

                    </td>
                </tr>
            </c:forEach>
        </table>
        <form id="mainForm"
              action="<%=basePath%>shopAdminManage/selectYiFuKuanOrder.action"
              method="post">
            <input hidden name="curPage" id="curPage"/>
        </form>
        <aside class="paging">
            <c:if test="${!pageInfo.isFirstPage}">

                <a href="javascript:getPage(${pageInfo.firstPage})">首页</a>
            </c:if>

            <c:if test="${!pageInfo.isFirstPage}">
                <a href="javascript:getPage(${pageInfo.prePage})">上一页</a>
            </c:if>
            <a> 共 ${pageInfo.total}条
                当前第<span>${pageInfo.pageNum}</span>页</a>
            <c:if test="${!pageInfo.isLastPage}">
                <a href="javascript:getPage(${pageInfo.nextPage})">下一页</a>
            </c:if>
            <c:if test="${!pageInfo.isLastPage}">
                <a href="javascript:getPage(${pageInfo.lastPage})">末页</a>
            </c:if>

        </aside>


    </div>
    <script>
        function getPage(curPage) {
            //将隐藏域的值变成curPage
            document.getElementById("curPage").value = curPage;
            //触发表单的提交事件
            document.getElementById("mainForm").submit();
        }
    </script>
    </div>
</section>



</body>
</html>

