<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/5/005
  Time: 8:44
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    // String tid = request.getParameter("tid");
%>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>文章首页</title>
    <meta name="description" content="最专业的女性交流时尚平台" />
    <meta name="keywords" content="最专业的女性交流时尚平台">

    <meta name="HandheldFriendly" content="True" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />



    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="../css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/monokai_sublime.min.css">
    <link href="../css/magnific-popup.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/screen.css" />
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <script type="text/javascript" src="<%=basePath%>/js/zzsc.js"></script>



    <meta name="generator" content="Ghost 0.7" />
    <link rel="alternate" type="application/rss+xml" title="美乎" href="http://www.ghostchina.com/rss/" />

</head>
<body class="home-template">

<!-- start header -->
<header class="main-header"  style="background:url(../images/pinkbg.jpg)   ;height: 300px;">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">

                <!-- start logo -->
                <a class="branding" href="<%=basePath%>jsp/zhuye.jsp"" title="美乎"><img src="../images/LOGO.png" style="height: 90px;width: 230px;"/></a>
                <!-- end logo -->
                <h2 style="color: black; font-family: '本墨锵黑';">姐妹们，争做时尚最前沿</h2>

                <img src="http://static.ghostchina.com/image/6/d1/fcb3879e14429d75833a461572e64.jpg" alt="Ghost 博客系统" class="hide">
            </div>
        </div>
    </div>
</header>
<!-- end header -->

<!-- start navigation -->
<nav class="main-navigation">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="navbar-header">
                        <span class="nav-toggle-button collapsed" data-toggle="collapse" data-target="#main-menu">

                        <i class="fa fa-bars"></i>
                        </span>
                </div>
                <div class="collapse navbar-collapse" id="main-menu">
                    <ul class="menu">
                        <li class="nav-current" role="presentation"><a href="#">美文首页</a></li>
                        <li  role="presentation"><a href="<%=basePath%>luntan/luntanshouye.action?tid=1">美乎</a></li>

                        <li  role="presentation"><a href="#">美淘</a></li>
                        <li  role="presentation"><a href="<%=basePath%>jsp/activity.jsp">活动</a></li>

                        <li  role="presentation"><a href="#">关于我们</a></li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
<!-- end navigation -->


<!-- start site's main content area -->
<section class="content-wrap">
    <div class="container">
        <div class="row">

            <main class="col-md-8 main-content">


         <c:forEach var="forumOfficalarticleList" items="${forumOfficalarticleList}">


                <article id=111 class="post">

                    <div class="post-head">
                        <h1 class="post-title"><a href="<%=basePath%>article/articledetail.action?oaid=${forumOfficalarticleList.oaid}">${forumOfficalarticleList.oatitle}</a></h1>
                        <div class="post-meta">
                            <span class="author">作者：<a href="#">美乎小编</a></span> &bull;
                            <%--<time class="post-date" datetime="${forumOfficalarticleList.publishDate}" title="2018年5月17日星期四凌晨3点41分"></time>--%>
                            <fmt:formatDate value="${forumOfficalarticleList.publishtime}"  pattern="yyyy年MM月dd日" />
                        </div>
                    </div>
                    <div class="post-content">
                        <p>${forumOfficalarticleList.oaprecontent}</p>
                    </div>
                    <div class="post-permalink">
                        <a href="<%=basePath%>article/articledetail.action?oaid=${forumOfficalarticleList.oaid}" class="btn btn-default">阅读全文</a>
                    </div>


                </article>
         </c:forEach>


            </main>

            <aside class="col-md-4 sidebar">
                <!-- start widget -->
                <!-- end widget -->

                <!-- start tag cloud widget -->
                <div class="widget">
                    <h4 class="title">社区</h4>
                    <div class="content community">
                        <p>QQ群：123456789</p>
                        <p><a href="<%=basePath%>luntan/luntanshouye.action?tid=1" title="问答社区"  ><i class="fa fa-comments"></i> 问答社区</a></p>
                        <p><a href="#" title="官方微博"  ><i class="fa fa-weibo"></i> 官方微博</a></p>
                    </div>
                </div>
                <!-- end tag cloud widget -->

                <!-- start widget -->
                <div class="widget">
                    <h4 class="title">每日签到</h4>
                    <div class="content download">
                        <a href="#" class="btn btn-default btn-block" onclick="sign()">点我签到</a>
                    </div>
                </div>

                <script>

                    function sign(){
                        <c:if test="${empty sessionScope.user.uid}">
                        alert("亲，请先登录");
                        window.location.href="<%=basePath%>jsp/loginregister.jsp";
                        </c:if>
                        <c:if test="${not empty sessionScope.user.uid}">
                        $.ajax({
                            type:"post",
                            url: "${pageContext.request.contextPath}/article/sign.action",
                            data: "uid=" + ${ sessionScope.user.uid},
                            success: function (result) {
                                if (result == 1) {
                                    alert("签到成功！！");
                                    window.load();
                                }
                                else if (result == 0) {
                                    alert("您今日已经签到了亲！！");
                                }
                            }
                        });
                        </c:if>
                    }
                </script>
                <!-- end widget -->
                <style>
                    #div1{height:400px;width:200px; position:relative; margin:10px auto;}
                    #div1 a{position:absolute;top:0px;left:0px;color:black;font-weight:bold;padding:3px 6px;}
                    #div1 a:hover{border:1px solid #eee;background:pink;border-radius:5px;}
                </style>
                <!-- start tag cloud widget -->
                <div class="widget">
                    <h4 class="title">最热搜</h4>
                    <div class="content tag-cloud">
                        <div id="div1">
                            <a href="#" target="_blank">水乳</a>
                            <a href="#" target="_blank">美肤宝</a>
                            <a href="#" target="_blank">口红</a>
                            <a href="#" target="_blank">香奈儿</a>
                            <a href="#" target="_blank">Mac</a>
                            <a href="#" target="_blank">杨树林</a>
                            <a href="#" target="_blank">防晒霜</a>
                            <a href="#" target="_blank">香水</a>
                            <a href="#" target="_blank">迪奥</a>
                            <a href="#" target="_blank">阿玛尼</a>
                            <a href="#" target="_blank">兰蔻</a>
                            <a href="#" target="_blank">小黑瓶</a>
                            <a href="#" target="_blank">水乳</a>
                            <a href="#" target="_blank">美肤宝</a>
                            <a href="#" target="_blank">口红</a>
                            <a href="#" target="_blank">香奈儿</a>
                            <a href="#" target="_blank">Mac</a>
                            <a href="#" target="_blank">杨树林</a>
                            <a href="#" target="_blank">防晒霜</a>
                            <a href="#" target="_blank">香水</a>
                            <a href="#" target="_blank">迪奥</a>
                            <a href="#" target="_blank">阿玛尼</a>
                            <a href="#" target="_blank">兰蔻</a>
                            <a href="#" target="_blank">小黑瓶</a>



                        </div>



                    </div>
                </div>
                <!-- end tag cloud widget -->

                <!-- start widget -->
                <!-- end widget -->

                <!-- start widget -->
                <!-- end widget -->                </aside>

        </div>
    </div>
</section>

<footer class="main-footer">
    <div class="container">
        <div class="row">
            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">友链</h4>
                    <div class="content tag-cloud friend-links">
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>

                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">标签云</h4>
                    <div class="content tag-cloud">
                        <a href="#">水乳</a>
                        <a href="#">防晒</a>
                        <a href="#">口红</a>
                        <a href="#">香奈儿</a>
                        <a href="#">兰蔻</a>
                        <a href="#">小黑瓶</a>
                        <a href="#">美肤宝</a>

                        <a href="/tag-cloud/">...</a>
                    </div>
                </div>
            </div>

            <div class="col-sm-4">
                <div class="widget">
                    <h4 class="title">合作伙伴</h4>
                    <div class="content tag-cloud friend-links">
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                        <a>中国美妆网</a>
                    </div>
                </div></div>
        </div>
    </div>
</footer>
<div class="copyright">
    <div class="container">
        <div class="row">
            <div class="col-sm-12">
                <div class="container">
                    <p>© 2018 美乎. All rights reserved | Design by
                        <a href="http://w3layouts.com">第六组</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<a href="#" id="back-to-top"><i class="fa fa-angle-up"></i></a>

<script>
    window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>



</body>
</html>
