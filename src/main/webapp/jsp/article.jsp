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

    <link rel="shortcut icon" href="/favicon.ico">

    <link rel="stylesheet" href="../css/bootstrap.min.css">
    <%--<link rel="stylesheet" href="../css/font-awesome.min.css">--%>
    <link rel="stylesheet" href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css">
    <link rel="stylesheet" href="../css/monokai_sublime.min.css">
    <link href="../css/magnific-popup.min.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="../css/screen.css" />




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
                <a class="branding" href="http://localhost:8080/meiHu/" title="美乎"><img src="../images/LOGO.png" style="height: 90px;width: 230px;"/></a>
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
                        <li  role="presentation"><a href="#">美购</a></li>
                        <li  role="presentation"><a href="#">美淘</a></li>
                        <li  role="presentation"><a href="#">活动</a></li>

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
                        <a href="#" class="btn btn-default btn-block" onclick="sign(${uid})">点我签到</a>
                    </div>
                </div>

                <script>

                    function sign(uidd){
                        <c:if test="${empty sessionScope.uid}">
                        alert("亲，请先登录");
                        window.location.href="loginregister.jsp";
                        </c:if>
                        <c:if test="${not empty sessionScope.uid}">
                        $.ajax({
                            type:"post",
                            url: "${pageContext.request.contextPath}/article/sign.action",
                            data: "uid=" + uidd,
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

                <!-- start tag cloud widget -->
                <div class="widget">
                    <h4 class="title">最热搜</h4>
                    <div class="content tag-cloud">
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>
                        <a href="#">水乳</a>



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
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>
                        <a>水乳</a>

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

<script src="https://cdn.bootcss.com/jquery/1.11.3/jquery.min.js"></script>
<script src="https://cdn.bootcss.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
<script src="https://cdn.bootcss.com/fitvids/1.1.0/jquery.fitvids.min.js"></script>
<script src="https://cdn.bootcss.com/highlight.js/8.5/highlight.min.js"></script>
<script src="https://cdn.bootcss.com/magnific-popup.js/1.0.0/jquery.magnific-popup.min.js"></script>

<script>
    $(function(){
        $('.post-content img').each(function(item){
            var src = $(this).attr('src');

            $(this).wrap('<a href="' + src + '" class="mfp-zoom" style="display:block;"></a>');
        });

        /*$('.post-content').magnificPopup({
          delegate: 'a',
          type: 'image'
        });*/
    });
</script>

<script>
    window._bd_share_config={"common":{"bdSnsKey":{},"bdText":"","bdMini":"2","bdMiniList":false,"bdPic":"","bdStyle":"0","bdSize":"24"},"share":{}};with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion='+~(-new Date()/36e5)];
</script>



</body>
</html>
