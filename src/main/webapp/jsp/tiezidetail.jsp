<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/5/31/031
  Time: 16:43
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>帖子详情</title>

    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>

    <link rel="stylesheet" href="../css/bootstrap.min.css"/>
    <link rel="stylesheet" href="../css/font-awesome.min.css"/>
    <link rel="stylesheet" href="../css/aw-font.css"/>

    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <link href="../css/link.css" rel="stylesheet" type="text/css"/>
    <link href="../css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="../css/classblack.css" rel="stylesheet" type="text/css"/>
    <script src="../js/bootstrap.js"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108"
            type="text/javascript"></script>

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/common.js?v=20171108" type="text/javascript"></script>

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
               <a href="http://localhost:8080/meiHu/"> <img src="../images/LOGO.png" style="width: 72px; height: 41px;"/></a>
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="<%=basePath%>search/searchReasult.action" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text"
                               placeholder="搜索问题、话题" autocomplete="off" name="searchcontent" id="aw-search-query"
                               class="search-query"/>
                        <span class="input-group-addon" title="搜索" id="global_search_btns"
                              onClick="$('#global_search_form').submit();">搜索</span>
                        <div id="context1" style="background-color:white; border: 1px solid deepskyblue;width:167px;
                                position: absolute;top: 36px;left:0px;display:none" ></div>
                        <script>
                            $("#aw-search-query").keyup(function(){
                                var content=$(this).val();
                                //如果当前搜索内容为空，无须进行查询
                                if(content==""){
                                    $("#context1").css("display","none");
                                    return ;
                                }
                                //由于浏览器的缓存机制 所以我们每次传入一个时间
                                var time=new Date().getTime();
                                $.ajax({
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    type:"post",
                                    url:"${pageContext.request.contextPath}/search/automatch.action",
                                    data:{name:content,time:time},
                                    success:function(data){
                                        //拼接html
                                        var res=data.split(",");
                                        var html="";
                                        for(var i=0;i<res.length;i++){
                                            //每一个div还有鼠标移出、移入点击事件
                                            html+="<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>"+res[i]+"</div>";
                                        }
                                        $("#context1").html(html);
                                        //显示为块级元素
                                        $("#context1").css("display","block");
                                    }
                                });
                            });

                            //鼠标移动到内容上
                            function changeBackColor_over(div){
                                $(div).css("background-color","#CCCCCC");
                            }
                            //鼠标离开内容
                            function changeBackColor_out(div){
                                $(div).css("background-color","");
                            }
                            //将点击的内容放到搜索框
                            function setSearch_onclick(div){
                                $("#aw-search-query").val(div.innerText);
                                $("#context1").css("display","none");
                            }
                        </script>
                    </div>
                </form>
            </div>
            <!-- end 搜索框 -->
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
                            <a href="<%=basePath%>jsp/article.jsp">美文</a>
                        </li>

                        <li>
                            <a href="#">美淘</a>
                        </li>
                        <li>
                            <a href="#">精彩活动</a>
                        </li>

                        <li>
                            <a href="#">发帖</a>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <c:if test="${!empty user}">
                    <a href="<%=basePath%>userCenter.action"><img src="<%=basePath%>images/${user.headpic}"/>欢迎您：${user.uname}</a>
                    <a href="<%=basePath%>signOut.action" style="position: relative;left: 60px;top: -53px">注销</a>
                </c:if>
                <c:if test="${empty user}">
                    <a href="<%=basePath %>jsp/loginregister.jsp">注册</a>
                    <a href="<%=basePath %>jsp/loginregister.jsp">登录</a>
                </c:if>

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
    </div>
</div>

<div class="aw-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="container">
            <div class="row category">
                <div class="col-sm-12">
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=1">
                        <dl>
                            <dt><img src="../images/bankuai1.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">口红</a>
                                </p>

                            </dd>
                        </dl>
                    </a>
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=2">
                        <dl>
                            <dt><img src="../images/bankuai6.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">眼霜</a>
                                </p>

                            </dd>
                        </dl>
                    </a>
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=3">
                        <dl>
                            <dt><img src="../images/bankuai3.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">香水</a>
                                </p>

                            </dd>
                        </dl>
                    </a>
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=4">
                        <dl>
                            <dt><img src="../images/bankuai4.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">水乳</a>
                                </p>

                            </dd>
                        </dl>
                    </a>
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=5">
                        <dl>
                            <dt><img src="../images/bankuai2.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">防晒</a>
                                </p>

                            </dd>
                        </dl>
                    </a>
                    <a href="<%=basePath%>luntan/luntanshouye.action?tid=6">
                        <dl>
                            <dt><img src="../images/bankuai5.png"/></dt>
                            <dd>
                                <p class="title">
                                    <a href="#">洗面奶</a>
                                </p>

                            </dd>
                        </dl>
                    </a>

                </div>
            </div>
        </div>
        <style type="text/css">
            .aw-user-img.aw-border-radius-5 .sponsor-level {
                width: 16px;
                height: 16px;
                position: absolute;
                left: 23px;
                top: -5px;
            }

            .aw-user-img.aw-border-radius-5 .sponsor-count {
                width: 9px;
                height: 9px;
                position: absolute;
                left: 27px;
                top: -2px;
            }

            .pull-left.aw-border-radius-5 {
                position: relative;
            }

            .pull-left.aw-border-radius-5 .sponsor-level {
                width: 16px;
                height: 16px;
                position: absolute;
                left: 23px;
                top: -5px;
            }

            .pull-left.aw-border-radius-5 .sponsor-count {
                width: 9px;
                height: 9px;
                position: absolute;
                left: 27px;
                top: -2px;
            }
        </style>

        <div class="aw-container-wrap">
            <div class="aw-container aw-wecenter">
                <div class="container">
                    <div class="row">
                        <div class="col-sm-12 aw-global-tips">
                        </div>
                    </div>
                </div>
                <div class="container">
                    <div class="row aw-content-wrap">
                        <div class="col-sm-12 col-md-9 aw-main-content">
                            <div class="aw-mod aw-item aw-question-detail-title">
                                <div class="aw-mod-head">
                                    <h1>
                                        ${forumPost.ptitle}</h1>

                                    <div class="aw-topic-editor" id="question_topic_editor" data-type="question"
                                         data-id="55229">

                                    </div>

                                </div>
                                <div class="aw-mod-body">
                                    <div class="aw-question-detail-txt markitup-box" id="markdownbody">
                                        ${forumPost.pcontent}
                                        <br/><br/>

                                        <div class="aw-comment-upload-img-list">

                                        </div>

                                    </div>

                                    <script>
                                        function shoucang(uidd, pidd) {
                                            <c:if test="${empty uid}">
                                                alert("亲，请先登录");
                                            </c:if>
                                            <c:if test="${not empty uid}">
                                            if ($("#shoucang").attr("src") == ("../images/shoucang.png")) {
                                                $("#shoucang").attr("src", "../images/shoucanghou.png");
                                                $.ajax(
                                                    {
                                                        type: "post",
                                                        url: "${pageContext.request.contextPath}/luntan/shoucang.action",
                                                        data: "uid=" + uidd + "&pid=" + pidd,
                                                    }
                                                );


                                            } else {
                                                $("#shoucang").attr("src", "../images/shoucang.png");
                                                $.ajax(
                                                    {
                                                        type: "post",
                                                        url: "${pageContext.request.contextPath}/luntan/quxiaoshoucang.action",
                                                        data: "uid=" + uidd + "&pid=" + pidd,
                                                    }
                                                );

                                            }
                                            </c:if>

                                        }

                                        function dianzan(uidd, pidd) {
                                            <c:if test="${empty uid}">
                                                alert("亲，请先登录");
                                            </c:if>
                                            <c:if test="${not empty uid}">
                                            if ($("#dianzan").attr("src") == ("../images/dianzan.png")) {
                                                $("#dianzan").attr("src", "../images/dianzanhou.png");
                                                $.ajax(
                                                    {
                                                        type: "post",
                                                        url: "${pageContext.request.contextPath}/luntan/dianzan.action",
                                                        data: "uid=" + uidd + "&pid=" + pidd,

                                                    }
                                                );


                                            } else {
                                                $("#dianzan").attr("src", "../images/dianzan.png");
                                                $.ajax(
                                                    {
                                                        type: "post",
                                                        url: "${pageContext.request.contextPath}/luntan/quxiaodianzan.action",
                                                        data: "uid=" + uidd + "&pid=" + pidd,

                                                    }
                                                );

                                            }
                                            </c:if>
                                        }


                                    </script>

                                    <script>
                                        window._bd_share_config = {
                                            "common": {
                                                "bdSnsKey": {},
                                                "bdText": "",
                                                "bdMini": "2",
                                                "bdMiniList": false,
                                                "bdPic": "",
                                                "bdStyle": "0",
                                                "bdSize": "24"
                                            }, "share": {}
                                        };
                                        with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
                                    </script>
                                    <div class="aw-question-detail-meta">

                                        <span class="aw-text-color-999">分享</span>
                                        <div class="bdsharebuttonbox share-icons">
                                            <a href="#" class="bds_more" data-cmd="more"></a>

                                            <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                                            <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                                            <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                                        </div>
                                        <span class="aw-text-color-999">点赞
                                            <a href="#" onclick="dianzan(${uid},${forumPost.pid})"><img id="dianzan"
                                                                                                        src="../images/dianzan.png"/></a></span>
                                        <span class="aw-text-color-999">收藏
                                            <a href="#" onclick="shoucang(${uid},${forumPost.pid})"><img id="shoucang"
                                                                                                         src="../images/shoucang.png"/></a></span>

                                        <a class="aw-text-color-999" data-toggle="collapse" href="#jubao"
                                           aria-expanded="false" aria-controls="collapseExample">
                                            举报</a>

                                        <a class="aw-text-color-999" data-toggle="collapse" href="#collapseExample"
                                           aria-expanded="false" aria-controls="collapseExample">
                                            发表评论</a>
                                        <div class="collapse" id="collapseExample">
                                            <div class="well">

                                                <input type="text" class="form-control" id="postcomment"/>
                                                <br/>
                                                <input type="button" class="btn btn-info"
                                                       style="width: 300px" value="发表评论"
                                                       onclick="pinglun(${uid},${forumPost.pid},$('#postcomment').val())"></input>
                                                <script>
                                                    function pinglun(uidd, pidd, text) {
                                                    <c:if test="${empty uid}">
                                                        alert("亲，请先登录");
                                                    </c:if>
                                                    <c:if test="${not empty uid}">
                                                        $.ajax({
                                                            type: "post",
                                                            url: "${pageContext.request.contextPath}/luntan/postcomment.action",
                                                            data: "uid=" + uidd + "&pid=" + pidd + "&postcomment=" + text,
                                                            success: function (result) {
                                                                if (result == 1) {
                                                                    alert("评论成功！！");
                                                                    window.location.reload();
                                                                }
                                                            }
                                                        });
                                                        </c:if>
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                        <div class="collapse" id="jubao">
                                            <div class="well">
                                                <%--<form action="luntan/postreport.action?uid=${uid}&pid=${forumPost.pid}&reportseason=${"#postreport"}.val()" method="post">--%>
                                                <select id="postreport" class="form-control">
                                                    <option selected>请选择举报类型</option>
                                                    <option value="色情">色情</option>
                                                    <option value="暴力">暴力</option>
                                                    <option value="违反国家政治">违反国家政治</option>
                                                </select>

                                                <br/>
                                                <input type="button" class="btn btn-info" value="举报"
                                                       onclick="jubao(${uid},${forumPost.pid},$('#postreport').val())"
                                                       style="width: 300px"></input>

                                                <script>
                                                    function jubao(uidd, pidd, reason) {
                                                        <c:if test="${empty uid}">
                                                            alert("亲，请先登录");
                                                        </c:if>
                                                        <c:if test="${not empty uid}">
                                                        $.ajax({
                                                            type: "post",
                                                            url: "${pageContext.request.contextPath}/luntan/postreport.action",
                                                            data: "uid=" + uidd + "&pid=" + pidd + "&reportreason=" + reason,
                                                            success: function (result) {
                                                                if (result == 1) {
                                                                    alert("举报成功,我们会尽快处理。净化网络感谢有你");
                                                                }
                                                            }
                                                        });
                                                        </c:if>
                                                    }
                                                </script>

                                            </div>
                                        </div>
                                        <!--模态框 评论-->

                                        <!--结束-->
                                    </div>
                                </div>

                            </div>
                            <!-- 问题详情和回答中间广告 -->

                            <!-- end 问题详情和回答中间广告 -->

                            <div class="aw-mod aw-question-comment-box" id="questionreply">
                                <div class="aw-mod-head">
                                    <ul class="nav nav-tabs aw-reset-nav-tabs">

                                        <h2 class="hidden-xs">${postCommentNum}个回复</h2>
                                    </ul>
                                </div>
                                <div class="aw-mod-body aw-dynamic-topic">
                                    <c:forEach items="${forumCommentList}" var="forumCommentList">
                                    <div class="aw-item" uninterested_count="0" force_fold="0" id="answer_list_63059">
                                        <a class="anchor" name="answer_63059"></a>
                                        <!-- 用户头像 -->
                                        <a class="aw-user-img aw-border-radius-5 pull-right" href="#" data-id="46">
                                            <img src="${forumCommentList.user.headpic}" alt=""/>
                                        </a>
                                        <!-- end 用户头像 -->
                                        <div class="aw-mod-body clearfix">

                                            <div class="pull-left aw-dynamic-topic-content">
                                                <div class="mod-head">
                                                    <p>
                                                        <a class="aw-user-name" href="#" data-id="46">
                                                            ${forumCommentList.user.uname} </a>
                                                        <span>头衔:<button
                                                                class="btn btn-primary btn-xs">${forumCommentList.user.title.title}</button></span>
                                                    </p>

                                                </div>
                                                <div class="mod-body">
                                                    <!-- 评论内容 -->

                                                    <div class="markitup-box">
                                                        ${forumCommentList.commenttext}
                                                    </div>


                                                    <!-- end 评论内容 -->

                                                </div>
                                                <!-- 社交操作 -->
                                                <div class="mod-footer aw-dynamic-topic-meta">
                                                    <span class="aw-text-color-999">
                                                    <fmt:formatDate value='${forumCommentList.commenttime}'
                                                                    pattern='yyyy-MM-dd hh:mm:ss'/> </span>
                                                    <c:forEach var="mapnum" items="${mapnum}">
                                                        <c:if test="${mapnum.key==forumCommentList.cid}">
                                                            <c:forEach items="${mapnum.value}" var="mapnumlist">
                                                        <a class="aw-add-comment aw-text-color-999" data-toggle="collapse"
                                                       href="#chakanpinglun${forumCommentList.cid}" aria-expanded="false"
                                                       aria-controls="collapseExample"> ${mapnumlist} 条评论 </a>
                                                            </c:forEach>
                                                        </c:if>
                                                    </c:forEach>
                                                    <input type="hidden" id="tagEweb" name="tagEweb" value="${forumCommentList.cid}" />
                                                    <div class="collapse" id="chakanpinglun${forumCommentList.cid}">
                                                       <c:forEach items="${map}" var="map">
                                                           <c:if test="${map.key==forumCommentList.cid}">
                                                        <c:forEach items="${map.value}" var="cclist">
                                                        <div class="well">
                                                            <a href="#">${cclist.user.uname} </a>:${cclist.commenttext}
                                                        </div>
                                                        </c:forEach>
                                                           </c:if>

                                                        </c:forEach>


                                                    </div>

                                                    <a class="aw-add-comment aw-text-color-999"  data-toggle="modal" data-target=".bs-example-modal-sm${forumCommentList.cid}">举报</a>

                                                    <div class="modal fade bs-example-modal-sm${forumCommentList.cid}" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
                                                        <div class="modal-dialog modal-sm" role="document">
                                                            <div class="modal-content">
                                                                <select id="postcommentreport${forumCommentList.cid}" class="form-control">
                                                                    <option selected>请选择举报类型</option>
                                                                    <option value="色情">色情</option>
                                                                    <option value="暴力">暴力</option>
                                                                    <option value="违反国家政治">违反国家政治</option>
                                                                </select>
                                                                <script>

                                                                    function pinglunjubao(uidd, cidd, commentreportreason) {
                                                                        <c:if test="${empty uid}">
                                                                        alert("亲，请先登录");
                                                                        </c:if>
                                                                        <c:if test="${not empty uid}">
                                                                        $.ajax({
                                                                            type: "post",
                                                                            url: "${pageContext.request.contextPath}/luntan/commentreport.action",
                                                                            data: "uid=" + uidd + "&cid=" + cidd + "&reason=" + commentreportreason,
                                                                            success: function (result) {
                                                                                if (result == 1) {
                                                                                    alert("举报成功！！");
                                                                                    window.load();
                                                                                }
                                                                            }
                                                                        });
                                                                        </c:if>
                                                                    }


                                                                </script>
                                                                <br/>
                                                                <input type="button" class="btn btn-info" value="举报"
                                                                       onclick="pinglunjubao(${uid},${forumCommentList.cid},$('#postcommentreport${forumCommentList.cid}').val())"
                                                                       style="width: 200px;margin-left: 50px"></input>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <a class="aw-add-comment aw-text-color-999" data-toggle="modal" data-target="#exampleModal${forumCommentList.cid}" >发表评论</a>
                                                    <div class="modal fade" id="exampleModal${forumCommentList.cid}" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                                        <div class="modal-dialog" role="document">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true"></span></button>
                                                                    <h4 class="modal-title" id="exampleModalLabel">新评论</h4>
                                                                </div>
                                                                <div class="modal-body">

                                                                        <div class="form-group">

                                                                            <textarea class="form-control" id="message-text${forumCommentList.cid}" placeholder="请输入您的评论"></textarea>
                                                                        </div>

                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" id="guanbi" class="btn btn-default" data-dismiss="modal">关闭</button>
                                                                    <button type="button" class="btn btn-primary" onclick="pinglunpinglun(${uid},${forumCommentList.cid},$('#message-text${forumCommentList.cid}').val(),${forumPost.pid})">发表评论</button>
                                                                </div>
                                                               
                                                                <script>
                                                                    function pinglunpinglun(uidd, cidd, text,pidd) {
                                                                        <c:if test="${empty uid}">
                                                                        alert("亲，请先登录");
                                                                        </c:if>
                                                                        <c:if test="${not empty uid}">
                                                                        $.ajax({
                                                                            type: "post",
                                                                            url: "${pageContext.request.contextPath}/luntan/commentcomment.action",
                                                                            data: "uid=" + uidd + "&ciddd=" + cidd + "&commentcomment=" + text +"&pid=" + pidd,
                                                                            success: function (result) {
                                                                                if (result == 1) {
                                                                                    alert("评论成功！！");

                                                                                    $("#guanbi").click();
                                                                                    window.location.reload();
                                                                                }
                                                                            }
                                                                        });
                                                                        </c:if>
                                                                    }


                                                                </script>
                                                            </div>
                                                        </div>
                                                    </div>

                                                    <!-- end 可显示/隐藏的操作box -->

                                                </div>
                                                <!-- end 社交操作 -->
                                            </div>
                                        </div>
                                    </div>



                                </c:forEach>
                            </div>
                        </div>
                    </div>

                        <!-- 侧边栏 -->
                        <div class="col-md-3 aw-side-bar hidden-xs hidden-sm">
                            <!-- 发起人 -->
                            <div class="aw-side-bar-mod">
                                <div class="aw-mod-head">
                                    <h3>发帖人</h3>
                                </div>
                                <div class="aw-mod-body">
                                    <dl style="padding-top: 5px;">
                                        <dt class="pull-left aw-border-radius-5">
                                            <a href="#">
                                                <img src="${forumPost.user.headpic}"/>
                                            </a>
                                        </dt>
                                        <dd class="pull-left">
                                            <a class="aw-user-name" href="#" data-id="523760">
                                                用户名:${forumPost.user.uname} </a>
                                            <p>
                                                关注：${focusnum}人
                                            </p>
                                            <p>
                                                粉丝：${focusednum}人
                                            </p>
                                            <button class="btn btn-primary btn-xs" onclick="guanzhu(${uid},${forumPost.user.uid})">
                                                关注他（她）
                                            </button>
                                            <script>
                                                function guanzhu(uid,postuid) {
                                                    <c:if test="${empty uid}">
                                                    alert("亲，请先登录");
                                                    </c:if>
                                                    <c:if test="${not empty uid}">
                                                    $.ajax({
                                                        type:"post",
                                                        url: "${pageContext.request.contextPath}/luntan/focus.action",
                                                        data:"focusuid="+uid+"&focusduid="+postuid,
                                                        success:function (result) {
                                                            if(result==1){
                                                                alert("关注成功");
                                                                window.location.reload();
                                                            }else if (result==0){
                                                                alert("关注失败");
                                                                window.location.reload();
                                                            }else if (result==2){
                                                                alert("亲，您已经关注过此用户");

                                                            }
                                                        }
                                                    });
                                                    </c:if>
                                                }
                                            </script>
                                        </dd>

                                    </dl>
                                </div>
                            </div>
                            <!-- end 发起人 -->

                            <!-- 问题状态 -->
                            <div class="aw-side-bar-mod aw-side-bar-mod-question-status">
                                <div class="aw-mod-head">
                                    <h3>问题状态</h3>
                                </div>
                                <div class="aw-mod-body">
                                    <ul>

                                        浏览: <span class="aw-text-color-blue">${forumPost.visitcount}</span></li>
                                        点赞: <span class="aw-text-color-blue">${forumPost.likecount}</span></li>
                                        关注: <span class="aw-text-color-blue">${collectionnum}</span></li>


                                        <li class="aw-side-bar-user-list aw-border-radius-5" id="focus_users"></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- end 问题状态 -->

                            <!-- 付费技术服务 -->
                            <style>
                                .aw-side-bar-mod .paid_service_btn {
                                    /*background-color: #fd7420;//橘色 */
                                    background-color: #41a863;
                                    border-radius: 5px;
                                    color: #fff;
                                    text-align: center;
                                    padding: 8px 0px;
                                    margin: 0 5px;
                                    display: block;
                                }

                                .paid_service_btn img {
                                    width: 22px;
                                    height: auto;
                                    margin-right: 1px;
                                }
                            </style>
                            <div class="aw-side-bar-mod">

                                <a class="sponsor_btn btn top-btn" href="#">
                                    <img src="../images/zhichi.png"/>
                                    <span style="font-size:13px;">逛逛商城</span>
                                </a>
                                <a class="sponsor_btn btn top-btn" href="<%=basePath%>luntan/luntanshouye.action?tid=7">
                                    <img src="../images/daigou.png"/>
                                    <span style="font-size:13px;">看看代购</span>
                                </a>
                            </div>

                            <!--公告文章-->
                            <div class="aw-side-bar-mod aw-text-align-justify question_related_list">
                                <div class="aw-mod-head">
                                    <h3>公告</h3>
                                </div>
                                <div class="aw-mod-body">
                                    <style>
                                        .notice-list {
                                            list-style: disc;
                                            color: #f00;
                                        }

                                        .notice-list li a {
                                            color: inherit;
                                        }
                                    </style>
                                    <ul class="notice-list">
                                        <li>
                                            <a target="_blank" href="#">美论美换活动开始了</a>
                                        </li>
                                    </ul>

                                </div>
                            </div>
                            <!--end 公告文章-->

                            <!-- 相关问题 -->
                            <div class="aw-side-bar-mod question_related_list">
                                <div class="aw-mod-head">
                                    <h3>相关帖子</h3>
                                </div>
                                <div class="aw-mod-body">
                                    <ul class="aw-li-border-bottom">
                                        <li>
                                            <a href="#">
                                                我的洗面奶该怎么用 </a>
                                        </li>

                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
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


</body>

</html>
