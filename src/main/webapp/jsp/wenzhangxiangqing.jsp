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
<!DOCTYPE html>
<head>
    <meta  http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/styleadmin.css">
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>

    <script src="<%=basePath%>js/html5.js"></script>
    <script src="<%=basePath%>js/jquery.mCustomScrollbar.concat.min.js"></script>
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
                <dd><a href="" >查看商品</a></dd>
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
                <dd><a href="">举报信息</a></dd>

            </dl>
        </li>
        <li>
            <dl>
                <dt>文章管理</dt>
                <dd><a href="<%=basePath%>admin/newArticle.action">文章发表</a></dd>
                <dd><a href="<%=basePath%>admin/articleList.action">文章查看</a></dd>
            </dl>
        </li>

    </ul>
</aside>

<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <h2 class="fl">官方文章发表</h2>
        </div>
        <section style="height: 700px;">
            <div style="width: 1600px;height: 700px;" id="content">
                <div style="position: relative;top: 20px;height: 50px;">
                    <span style="position: relative;left: 150px;">标题</span><span style="position: relative;left:500px;">预标题</span><span style="position: relative;left:900px;">发布时间</span><span style="position: absolute;left:1188px;">操作</span>
                </div>
                <c:forEach items="${articleList}" var="article" varStatus="status">
                    <div style="position: relative;left: 100px;padding-top: 20px" id="${status.index}">
                        <a href="javascript:void(0);" onclick="showDetail(${article.oaid})" >${article.oatitle}</a>
                        <a href="javascript:void(0);"><span style="position: absolute;left:350px;">${article.oaprecontent}</span></a>
                        <a href="javascript:void(0);" disabled="disabled"><span style="position: absolute;left:800px;">${article.publishtime}</span></a>
                        <a href="javascript:void(0);" onclick="deleteArticle(${article.oaid},${status.index})"><span style="position: absolute;left:1090px;">删除</span></a>
                    </div>
                </c:forEach>
            </div>
        </section>
    </div>
</section>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
    <div class="modal-dialog" role="document">
        <div class="modal-content" style="position: relative;left: -300px;width: 1300px;">
            <div class="modal-header" >
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                <h4 class="modal-title" id="myModalLabel"><span id="oatitle"></span></h4>
            </div>
            <div class="modal-body" id="oacontent">
            </div>
        </div>
    </div>
</div>
<script>
    function showDetail(oaid) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/getArticle.action",
            data:"oaid="+oaid,
            success:function (officalArticle){
                $("#oatitle").html(officalArticle.oatitle);
                $("#oacontent").html(officalArticle.oacontent);
                $('#myModal').modal({
                })
            }
        })

    }
    function deleteArticle(oaid,index) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/admin/deleteArticle.action",
            data:"oaid="+oaid,
            success:function (message) {
                if(message=="1"){
                    alert("删除成功")
                    document.getElementById("content").removeChild(document.getElementById(index))
                }
                if(message=="0"){
                    alert("删除失败")
                }
            }
        })
    }
</script>
</body>
</html>

