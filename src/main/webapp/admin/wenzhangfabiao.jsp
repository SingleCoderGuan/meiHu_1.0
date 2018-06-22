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
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
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
            <h2 class="fl">官方文章发表</h2>
        </div>
        <section>
            <ul class="ulColumn2">
                <li>
                    <span class="item_name" style="width:120px;">文章名：</span>
                    <input type="text" class="textbox textbox_295" />

                </li>
                <li>
                    <span class="item_name" style="width:120px;">导读部分：</span>
                    <input type="text" class="textbox" />

                </li>
                <li>
                    <span class="item_name" style="width:120px;">内容：</span>

                </li>

            </ul>
            <a href="#" class="fr top_rt_btn ">发表文章</a>

        </section>
    </div>
</section>


</body>
</html>

