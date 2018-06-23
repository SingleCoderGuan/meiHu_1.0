<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/6/4
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Stict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-
strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" lang = "zh-CN">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>个人中心</title>
    <meta name="keywords" content="美论" />
    <meta name="description" content="美论" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css" />

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css" />
    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css" />
    <link rel="stylesheet" href="<%=basePath%>css/user.css" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/xcConfirm.css"/>
    <script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/functions.js?v=20171108" type="text/javascript"></script>
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/common.js?v=20171108" type="text/javascript"></script>

    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/compatibility.js"></script>

</head>
<style type="text/css">
    .sponsor .sponsor-level {
        width: 13px;
        height: 13px;
        position: absolute;
        left: 45px;
        top: 9px;
        margin-left: 0;
    }

    .sponsor .sponsor-count {
        width: 8px;
        height: 8px;
        position: absolute;
        left: 48px;
        top: 11px;
        margin-left: 0;
    }
</style>
<style>
    .ad-item {
        position: relative;
    }

    .ad-item .close {
        position: absolute;
        width: 18px;
        height: 18px;
        background-color: 000000;
        opacity: 0.5;
        text-align: center;
        right: 0px;
        top: 0px;
        line-height: 18px;
        display: none;
    }

    .ad-item .close a {
        font-size: 14px;
        color: #FFFFFF;
        text-decoration: none;
    }

    .ad-item .guide {
        display: none;
    }

    .ad-item:hover .close {
        display: block;
    }
</style>

<body >
<img src="<%=basePath%>images/bg-halfmei.png" style="position: absolute;top: 150px;left: 28px"/>
<img src="<%=basePath%>images/bg-hu.png" style="position: absolute;top: 450px;left:1004px"/>
<div class="aw-top-menu-wrap" style="height: 55px">
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;" />
            </div>
            <!-- end logo -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="#" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off" name="q" id="aw-search-query" class="search-query" />
                        <span class="input-group-addon" title="搜索" id="global_search_btns" onClick="$('#global_search_form').submit();"><i class="fa fa-search"></i></span>
                        <div class="clearfix"></div>

                    </div>
                </form>
            </div>
            <!-- 导航 -->
            <div class="aw-top-nav navbar">
                <div class="navbar-header">
                    <button class="navbar-toggle pull-left">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
                    <ul class="nav navbar-nav">

                        <li class="nav-current" role="presentation">
                            <a href="<%=basePath%>luntan/luntanshouye.action?tid=1">美论首页</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>article/article.action">美文</a>
                        </li>

                        <li>
                            <a href="#">美淘</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>jsp/activity.jsp">精彩活动</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>user/fatie.action">发帖</a>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav" style="width: 259px">
                <!-- 登陆&注册栏 -->
                <span>
                    <a style="position: relative;left: -100px;top: -0.5px;" href="<%=basePath%>user/userCenter.action" >
                        <img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/>${user.uname}
                    </a>

                    <img id="message" hidden style="position: absolute;left: 60px;top: -3px;width: 30px" src="<%=basePath%>images/comment.png"/>

                    <a href="<%=basePath%>user/signOut.action" style="position: absolute;left: 200px;">注销</a>
                </span>

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
    </div>
</div>

<!--主体-->

<div class="aw-container-wrap">
    <div class="container" >
        <div class="row" >
            <div class="aw-content-wrap clearfix" style="height: 840px;">
                <div class="col-sm-12 col-md-9 aw-main-content">
                    <!-- 用户数据内容 -->
                    <div class="aw-mod aw-user-detail-box">
                        <div class="mod-head">
                            <img style="width: 100px" src="<%=basePath%>${user.headpic}" />
                            <span class="pull-right operate">
                                <a href="<%=basePath%>jsp/userInfo.jsp" class="btn btn-mini btn-success">编辑</a>
                            </span>
                            <h1>${user.uname}</h1>
                            <!--用户名-->
                            <p class="text-color-999">${user.title.title}</p>
                            <!--称号-->
                            <p class="aw-user-flag">
                            </p>
                        </div>
                        <div class="mod-body">
                            <div class="meta">
                                <span><i class="icon icon-score"></i> 积分 :<em class="aw-text-color-orange">${personalpoint}</em></span>
                                <span><i class="icon icon-agree"></i> 赞同 : <em class="aw-text-color-orange">${userlikenum}</em></span>
                            </div>

                        </div>
                        <div class="mod-footer">
                            <ul class="nav nav-tabs aw-nav-tabs">
                                <li style="width: 233px;text-align: center">
                                    <a href="#questions" id="page_questions" data-toggle="tab" style="font-size: 20px">我的帖子<span class="badge" style="font-size: 18px">${postsNum}</span></a>
                                </li>
                                <li style="width: 233px;text-align: center">
                                    <a href="#answers" id="page_answers" data-toggle="tab" style="font-size: 20px">我的提醒<span id="messageNum" class="badge" style="font-size: 18px">${commentsNum}</span></a>
                                </li>

                                <li style="width: 233px;text-align: center">
                                    <a href="#focus" id="page_focus" data-toggle="tab" style="font-size: 20px">我的收藏</a>
                                </li>
                            </ul>
                        </div>
                    </div>
                    <!-- end 用户数据内容 -->

                    <div class="aw-user-center-tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="questions">
                                <div class="aw-mod">
                                    <div class="mod-body">
                                        <div class="aw-profile-publish-list" id="contents_user_actions_questions">
                                            <div style="background-color: #FFCCCC;height: 30px ;width: 100%"><span style="position: relative;left: 30px;top: 5px;">标题</span><span style="position: relative;left: 380px;top: 5px">板块</span><span style="position: relative;left: 500px;top: 5px;">操作</span></div>
                                            <c:forEach items="${postList}" var="post">
                                                <div style="position:relative ;left: 20px;margin-top: 15px">
                                                    <a href="<%=basePath%>luntan/tiezidetail.action?pid=${post.pid}"><span>${post.ptitle}</span></a>
                                                    <div style="position: absolute;left: 369px;top: -1px;width: 70px;height:20px ;text-align:center;"><a href="<%=basePath%>luntan/luntanshouye.action?tid=${post.topic.tid}" style="margin:0 auto;"><span>${post.topic.tname}</span></a></div>
                                                    <div style="position: absolute;left: 478px;top: -1px;width: 145px;text-align:center ;"><a href="<%=basePath%>user/modifyPost.action?pid=${post.pid}"><span>编辑</span></a>|<a onclick="show_confirm(${post.pid})"><span>删除</span></a></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="answers">
                                <div class="aw-mod">
                                    <div class="mod-body">
                                        <div class="aw-profile-publish-list" id="contents_user_actions_reply">
                                            <div>
                                                <div style="background-color: #FFCCCC;;height: 30px ;width: 100%"><span style="position: relative;left: 313px;top: 3px;">新消息</span></div>
                                                <c:if test="${empty newComments}">
                                                    <div style="position: relative;top: 40px;text-align: center">
                                                        <span style="font-size: 25px;">还没有新消息</span>
                                                    </div>
                                                </c:if>
                                            <c:forEach items="${newComments}" var="newComment">
                                                <div style="position: relative;left: 20px;margin-top: 20px;">
                                                    <div>回复人：<span>${newComment.user.uname}</span><span style="position: absolute;left: 150px;">内容：<a href="<%=basePath%>user/readReply.action?pid=${newComment.post.pid}&cid=${newComment.cid}#${newComment.cid}">${newComment.commenttext}</a></span></div>
                                                    <div style="margin-top: 20px"><span>回复我的帖子：<a href="<%=basePath%>luntan/tiezidetail.action?pid=${newComment.post.pid}">${newComment.post.ptitle}</a></span><span style="position: absolute;left: 500px;"><fmt:formatDate value='${newComment.commenttime}'
                                                                                                                                                                                                                                                                                pattern='yyyy-MM-dd hh:mm:ss'/></span></div>
                                                    <hr />
                                                </div>
                                            </c:forEach>
                                            </div>
                                            <div style="position: relative;top: 90px;">
                                                <div style="background-color: #FFCCCC;height: 30px ;width: 100%">
                                                    <span style="position: relative;left: 313px;top: 3px;">已查看</span></div>
                                            <c:if test="${empty oldComments}">
                                                <div style="position: relative;top: 40px;text-align: center">
                                                    <span style="font-size: 25px;">还没有新消息</span>
                                                </div>
                                            </c:if>
                                            <c:forEach items="${oldComments}" var="oldComment">
                                                <div style="position: relative;left: 20px;margin-top: 20px;">
                                                    <div >回复人：<span>${oldComment.user.uname}</span><span style="position: absolute;left: 150px;">内容：<a href="<%=basePath%>luntan/tiezidetail.action?pid=${oldComment.post.pid}#${oldComment.cid}">${oldComment.commenttext}</a></span></div>
                                                    <div style="margin-top: 20px"><span>回复我的帖子：<a href="<%=basePath%>luntan/tiezidetail.action?pid=${oldComment.post.pid}">${oldComment.post.ptitle}</a></span><span style="position: absolute;left: 500px;"><fmt:formatDate value='${oldComment.commenttime}'
                                                                                                                                                                                                                                                                             pattern='yyyy-MM-dd hh:mm:ss'/></span></div>
                                                    <hr />
                                                </div>
                                            </c:forEach>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="articles">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>文章</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-publish-list" id="contents_user_actions_articles"></div>
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="focus">
                                <!-- 自定义切换 -->
                                <div class="aw-mod">

                                    <div class="mod-body">
                                        <div class="aw-tab-content">
                                            <div class="aw-mod aw-user-center-follow-mod">
                                                <div class="mod-body">
                                                    <div style="background-color: #FFCCCC;height: 30px"><span style="position: relative;left: 30px;top: 5px;">标题</span><span style="position: relative;left: 380px;top: 5px">板块</span><span style="position: relative;left: 500px;top: 5px;">作者</span></div>
                                                    <c:if test="${empty collectionList}">
                                                        <div style="text-align: center">
                                                            <span style="position: relative;top: 50px;font-size: 30px">您还没有收藏过帖子</span>
                                                        </div>
                                                    </c:if>
                                                    <c:forEach items="${collectionList}" var="collection">
                                                        <div style="position:relative ;left: 20px;margin-top: 15px">
                                                            <a href="<%=basePath%>luntan/tiezidetail.action?pid=${collection.pid}"><span>${collection.ptitle}</span></a>
                                                            <div style="position: absolute;left: 369px;top: -1px;width: 70px;height:20px ;text-align:center;"><a href="<%=basePath%>luntan/luntanshouye.action?tid=${collection.topic.tid}" style="margin:0 auto;"><span>${collection.topic.tname}</span></a></div>
                                                            <div style="position: absolute;left: 478px;top: -1px;width: 145px;text-align:center ;"><a href="<%=basePath%>luntan/userdetail.action?uid=${collection.user.uid}"><span>${collection.user.uname}</span></a></div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod collapse">
                                                <div class="mod-body">
                                                    <ul class="clearfix" id="contents_user_fans"></ul>
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod collapse">
                                                <div class="mod-body">
                                                    <ul id="contents_user_topics" class="clearfix"></ul>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end 自定义切换 -->
                            </div>

                            <div class="tab-pane" id="integral">
                                <div class="aw-mod">
                                    <div style="background-color: #FFCCCC;height: 30px"><span style="position: relative;left: 30px;top: 5px;">标题</span><span style="position: relative;left: 380px;top: 5px">板块</span><span style="position: relative;left: 500px;top: 5px;">操作</span></div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

                <!-- 侧边栏 -->
                <div class="aw-side-bar-mod top-articles">
                    <!--<div class="aw-mod-head">-->
                    <!--<h3>置顶</h3>-->
                    <!--</div>-->

                    <div class="aw-side-bar-mod">
                        <div class="aw-mod-head">
                            <p style="font-size: 20px;">个人中心</p>
                        </div>
                        <br />
                        <div class="aw-mod-body">
                            <ul>
                                <li>关注我的：
                                     <ul>
                                         <c:forEach items="${followers}" var="user">
                                             <a href="<%=basePath%>luntan/userdetail.action?uid=${user.uid}"><img style="width: 60px;height: 60px" src="<%=basePath%>${user.headpic}" alt=""></a>
                                         </c:forEach>
                                     </ul>
                                </li>
                            </ul>
                        </div>
                        <br />
                        <br />
                        <div class="aw-mod-body">
                            <ul>
                                <li>我关注的：
                                    <ul>
                                        <c:forEach items="${focusUsers}" var="user">
                                            <a href="<%=basePath%>luntan/userdetail.action?uid=${user.uid}"><img style="width: 60px;height: 60px" src="<%=basePath%>${user.headpic}" alt=""></a>
                                        </c:forEach>
                                    </ul>
                                </li>
                            </ul>
                        </div>
                        <br /><br />

                    </div>

                </div>
            </div>
            <!-- end 侧边栏 -->
        </div>
    </div>
</div>
</div>

<div style="position:fixed; left:0px;
bottom:0px; width:100%; height:30px;font-weight: bold;
background-color: #ce8483; z-index:9999;text-align: center">
    © 2018 美乎. All rights reserved | Design by
    <a href="#">第六组</a>
</div>
</div>
<script type="text/javascript">
    function show_confirm(pid)
    {
        if (confirm("确认删除吗？"))
        {
            $.ajax({
                type:"get",
                data:"pid="+pid,
                url:"${pageContext.request.contextPath}/user/deletePost.action",
                success:function (message) {
                    if(message=="1"){
                        $(function () {
                            var txt=  "删除成功！！";
                            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                        })
                        window.location.href = "${pageContext.request.contextPath}/user/userCenter.action" ;
                    }else{
                        $(function () {
                            var txt=  "删除失败！！";
                            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                        })
                    }
                }
            })
        }
    }
</script>
<script>
    var uid = ${sessionScope.user.uid}

        $(function () {
            if(uid!=null){
                getMessage(uid);
                setInterval("getMessage(uid)",10000);
            }
        })

    function getMessage(uid) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/user/getMessage.action",
            data:"uid="+uid,
            success:function (data) {
                if(data!="0"){
                    $("#message").removeAttr("hidden")
                    $("#messageNum").html(data)
                }else {
                    $("#message").attr("hidden","true")
                    $("#messageNum").html(0)
                }
            }
        })
    }

</script>
</body>

</html>
