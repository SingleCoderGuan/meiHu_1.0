<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/6/4
  Time: 20:59
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/functions.js?v=20171108" type="text/javascript"></script>

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
        background-color: #000000;
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

<body>
<div class="aw-top-menu-wrap">
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;" />
            </div>
            <!-- end logo -->
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
                            <a href="index.html">美乎</a>
                        </li>
                        <li>
                            <a href="#">美购</a>
                        </li>
                        <li>
                            <a href="#">美商城</a>
                        </li>
                        <li>
                            <a href="#">活动</a>
                        </li>

                        <li>
                            <a href="#">关于</a>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <span>
                    <a href="#" ><img style="width: 50px;" src="<%=basePath%>${user.headpic}"/>欢迎您：${user.uname}</a>
                    <a href="<%=basePath%>signOut.action" style="position: relative;left: 250px;">注销</a>
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
    <div class="container">
        <div class="row">
            <div class="aw-content-wrap clearfix">
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
                                <span><i class="icon icon-score"></i> 积分 : ${user.point}<em class="aw-text-color-orange"></em></span>
                                <span><i class="icon icon-agree"></i> 赞同 : <em class="aw-text-color-orange">0</em></span>
                            </div>

                        </div>
                        <div class="mod-footer">
                            <ul class="nav nav-tabs aw-nav-tabs">
                                <li style="width: 175px;text-align: center">
                                    <a href="#questions" id="page_questions" data-toggle="tab" style="font-size: 20px">发问<span class="badge">0</span></a>
                                </li>
                                <li style="width: 175px;text-align: center">
                                    <a href="#answers" id="page_answers" data-toggle="tab" style="font-size: 20px">回复<span class="badge">0</span></a>
                                </li>

                                <li style="width: 175px;text-align: center">
                                    <a href="#focus" id="page_focus" data-toggle="tab" style="font-size: 20px">关注话题</a>
                                </li>
                                <li style="width: 175px;text-align: center">
                                    <a href="#integral" id="page_integral" data-toggle="tab" style="font-size: 20px">我的积分</a>
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
                                            <div style="background-color: #FFCCCC;height: 30px"><span style="position: relative;left: 30px;top: 5px;">标题</span><span style="position: relative;left: 380px;top: 5px">板块</span><span style="position: relative;left: 500px;top: 5px;">操作</span></div>
                                            <c:forEach items="${postList}" var="post">
                                                <div style="position:relative ;left: 20px;margin-top: 15px">
                                                    <a href="#"><span>${post.ptitle}</span></a>
                                                    <div style="position: absolute;left: 369px;top: -1px;width: 70px;height:20px ;text-align:center;"><a href="#" style="margin:0 auto;"><span>${post.topic.tname}</span></a></div>
                                                    <div style="position: absolute;left: 478px;top: -1px;width: 145px;text-align:center ;"><a href="<%=basePath%>modifyPost.action?pid=${post.pid}"><span>编辑</span></a>|<a onclick="show_confirm(${post.pid})"><span>删除</span></a></div>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_actions_questions_more">
                                            <span>展开全部</span>
                                        </a>
                                        <!-- end 加载展开全部内容 -->
                                    </div>
                                </div>
                            </div>
                            <div class="tab-pane" id="answers">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3>回复</h3>
                                    </div>
                                    <div class="mod-body">
                                        <div class="aw-profile-answer-list" id="contents_user_actions_answers"></div>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_actions_answers_more">
                                            <span>展开全部</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
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
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_actions_articles_more">
                                            <span>展开全部</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
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
                                                    <c:forEach items="${collectionList}" var="collection">
                                                        <div style="position:relative ;left: 20px;margin-top: 15px">
                                                            <a href="#"><span>${collection.ptitle}</span></a>
                                                            <div style="position: absolute;left: 369px;top: -1px;width: 70px;height:20px ;text-align:center;"><a href="#" style="margin:0 auto;"><span>${collection.topic.tname}</span></a></div>
                                                            <div style="position: absolute;left: 478px;top: -1px;width: 145px;text-align:center ;"><a href="#"><span>${collection.user.uname}</span></a></div>
                                                        </div>
                                                    </c:forEach>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content" id="bp_user_follows_more">
                                                        <span>展开全部</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod collapse">
                                                <div class="mod-body">
                                                    <ul class="clearfix" id="contents_user_fans"></ul>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content" id="bp_user_fans_more">
                                                        <span>展开全部</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                            <div class="aw-mod aw-user-center-follow-mod collapse">
                                                <div class="mod-body">
                                                    <ul id="contents_user_topics" class="clearfix"></ul>
                                                </div>
                                                <div class="mod-footer">
                                                    <!-- 加载更多内容 -->
                                                    <a class="aw-load-more-content" id="bp_user_topics_more">
                                                        <span>展开全部</span>
                                                    </a>
                                                    <!-- end 加载更多内容 -->
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!-- end 自定义切换 -->
                            </div>

                            <div class="tab-pane" id="integral">
                                <div class="aw-mod">
                                    <div class="mod-head">
                                        <h3><i class="icon icon-point"></i>我的积分</h3>
                                    </div>
                                    <div class="mod-body">
                                        <table class="table table-hover aw-table">
                                            <thead>
                                            <tr class="info">
                                                <th width="14%">时间</th>
                                                <th width="8%">数额</th>
                                                <th width="17%">描述</th>
                                            </tr>
                                            </thead>
                                            <tbody id="contents_user_integral">
                                            </tbody>
                                        </table>
                                    </div>
                                    <div class="mod-footer">
                                        <!-- 加载更多内容 -->
                                        <a class="aw-load-more-content" id="bp_user_integral">
                                            <span>展开全部</span>
                                        </a>
                                        <!-- end 加载更多内容 -->
                                    </div>
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
                            <p style="font-size: 20px;">关注详情</p>
                        </div>
                        <br />
                        <div class="aw-mod-body">
                            <ul>
                                <li>关注我的：
                                     <ul>
                                         <c:forEach items="${followers}" var="user">
                                             <a href=""><img style="width: 60px;height: 60px" src="<%=basePath%>${user.headpic}" alt=""></a>
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
                                            <a href="#"><img style="width: 60px;height: 60px" src="<%=basePath%>${user.headpic}" alt=""></a>
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

<div class="aw-footer aw-wecenter">
    <p>© 2018 美乎. All rights reserved | Design by
        <a href="#">第六组</a>
    </p>
    </span>

</div>
</div>
<script type="text/javascript">
    function show_confirm(pid)
    {
        var r=confirm("确认删除吗？");
        if (r==true)
        {
            $.ajax({
                type:" get",
                data:{"pid":pid},
                url:"${pageContext.request.contextPath}deletePost.action",
                success:function (messsage) {
                    if(messsage=="1"){
                        alert("删除成功")
                        location.reload();
                    }else{
                        alert("删除失败")
                    }
                }
            })
        }
        else
        {
            alert("You pressed Cancel!");
        }
    }
</script>
</body>

</html>
