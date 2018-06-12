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
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <!--[if lt IE 9]>
    <script src="../js/html5.js"></script>
    <![endif]-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>

        (function($){
            $(window).load(function(){

                $("a[rel='load-content']").click(function(e){
                    e.preventDefault();
                    var url=$(this).attr("href");
                    $.get(url,function(data){
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo","h2:last");
                    });
                });

                $(".content").delegate("a[href='top']","click",function(e){
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo",$(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
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

    <h2><a href="index.html">管理区</a></h2>
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
                <dd><a href="">帖子信息</a></dd>
                <dd><a href="">举报信息</a></dd>
                <dd><a href="">评论信息</a></dd>
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
            <h2 class="fl">商品列表：当前香水区</h2>
            <a href="#" class="fr top_rt_btn "><strong>+   </strong>添加商品</a>
        </div>
        <section class="mtb">
            <select class="form-control" style="width: 200px;">
                <option>下拉菜单</option>
                <option>菜单1</option>
            </select>
        </br>
          <input type="text" class="form-control-static" style="width: 200px;"placeholder="输入商品名关键词查询"/>

            <input type="button" value="查询" class="group_btn"/>
        </section>
        <table class="table">
            <tr>
                <th>缩略图</th>
                <th>产品名称</th>
                <th>货号</th>
                <th>单价</th>
                <th>单位</th>
                <th>精品</th>
                <th>新品</th>
                <th>热销</th>
                <th>库存</th>
                <th>操作</th>
            </tr>
            <tr>
                <td class="center"><img src="upload/goods01.jpg" width="50" height="50"/></td>
                <td>这里是产品名称</td>
                <td class="center">A15902</td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>
                <td class="center">包</td>
                <td class="center"><a title="是" class="link_icon">&#89;</a></td>
                <td class="center"><a title="否" class="link_icon">&#88;</a></td>
                <td class="center"><a title="是" class="link_icon">&#89;</td>
                <td class="center">5559</td>
                <td class="center">
                    <a href="http://www.mycodes.net" title="预览" class="link_icon" target="_blank">&#118;</a>
                    <a href="product_detail.html" title="编辑" class="link_icon">&#101;</a>
                    <a href="#" title="删除" class="link_icon">&#100;</a>
                </td>
            </tr>
            <tr>
                <td class="center"><img src="upload/goods02.jpg" width="50" height="50"/></td>
                <td>这里是产品名称</td>
                <td class="center">A15902</td>
                <td class="center"><strong class="rmb_icon">59.00</strong></td>
                <td class="center">包</td>
                <td class="center"><a title="是" class="link_icon">&#89;</a></td>
                <td class="center"><a title="否" class="link_icon">&#88;</a></td>
                <td class="center"><a title="是" class="link_icon">&#89;</a></td>
                <td class="center">5559</td>
                <td class="center">
                    <a href="http://www.mycodes.net" title="预览" class="link_icon" target="_blank">&#118;</a>
                    <a href="product_detail.html" title="编辑" class="link_icon">&#101;</a>
                    <a href="#" title="删除" class="link_icon">&#100;</a>
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

