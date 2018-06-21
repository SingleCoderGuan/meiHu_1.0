<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/8/008
  Time: 9:58
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
    <title>查看某用户信息</title>
    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.min.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="<%=basePath%>css/user.css"/>

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108"
            type="text/javascript"></script>
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
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;"/>
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="<%=basePath%>search/searchReasult.action" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text"
                               placeholder="搜索问题、话题" autocomplete="off" name="q" id="aw-search-query"
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
                            <a href="<%=basePath%>article/article.action">美文</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美淘</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>jsp/activity.jsp">精彩活动</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>fatie.action">发帖</a>
                        </li>


                    </ul>
                </nav>
            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <span>
                    <c:if test="${not empty sessionScope.user}">
                        <a href="<%=basePath%>userCenter.action"><img style="width: 50px" src="<%=basePath%>${user.headpic}"/>欢迎您：${user.uname}</a>
                        <a href="<%=basePath%>signOut.action" style="position: relative;left: 250px;">注销</a>
                    </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <a href="<%=basePath %>jsp/loginregister.jsp">注册</a>
                        <a href="<%=basePath %>jsp/loginregister.jsp">登录</a>
                    </c:if>

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
                            <img src="<%=basePath%>${forumUser.headpic}" style="width:100px;height:
                            100px;"/>

                            <button type="button" class="btn btn-warning">${forumUser.uname} </button>
                            <!--用户名-->
                            </br>
                            <p><strong>${forumUser.title.title}</strong></p>
                                <p><span>积分 : <em
                                class="aw-text-color-orange">${point}</em></span></p>
                                <p><span> 赞同 : <em
                                        class="aw-text-color-orange">${userlikenum}</em></span></p>

                            <!--称号-->

                        </div>

                        <div class="mod-footer">
                            <ul class="nav nav-tabs aw-nav-tabs">
                                <li class="active">
                                    <a href="#" id="page_overview" data-toggle="tab">发过的帖子</a>
                                </li>

                            </ul>
                        </div>
                    </div>
                    <br/>
                    <!-- end 用户数据内容 -->
                    <div class="aw-user-center-tab">
                        <div class="tab-content">
                            <div class="tab-pane active" id="overview">
                                <!-- 回复 -->
                                <div class="aw-mod">

                                    <div class="mod-body">
                                        <div class="aw-profile-answer-list">

                                           <%-- <table class="table table-striped">
                                                <tr>
                                                    <td>序号</td>
                                                    <td>帖子标题</td>
                                                    <td>发布时间</td>
                                                </tr>
                                                <c:forEach var="postList" items="${postList}" varStatus="status">
                                                    <tr>
                                                        <td class="warning">${status.index+1}</td>
                                                        <td class="warning">${postList.ptitle}</td>
                                                        <td class="warning"><fmt:formatDate
                                                                value='${postList.createtime}'
                                                                pattern='yyyy-MM-dd hh:mm:ss'/></td>
                                                    </tr>
                                                </c:forEach>

                                            </table>--%>
                                               <c:forEach var="postList" items="${postList}"  varStatus="status">
                                                   <div class="aw-item ">


                                                       <div class="aw-question-content">
                                                           <h4>
                                                               <a href="<%=basePath%>luntan/tiezidetail.action?pid=${postList.pid}">${postList.ptitle}</a>
                                                           </h4>



                                                           <p>
							<span class="aw-question-tags">
					<i class="fa fa-caret-left"></i>
					<a href="#" style="font-size: 14px">${postList.topic.tname}</a><%--标签--%>
				</span> •

                                                               <span class="aw-text-color-999" style="font-size: 14px">${postList.likecount}次点赞  •
                                                    ${postList.visitcount} 次浏览 •<fmt:formatDate value='${postList.createtime}'
                                                                                                pattern='yyyy-MM-dd hh:mm:ss'/>   </span>
                                                           </p>

                                                       </div>
                                                   </div>
                                               </c:forEach>
                                        </div>
                                    </div>
                                </div>

                                <!-- 最新动态 -->

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
                            <p style="font-size: 20px;"><strong>关注详情</strong></p>
                        </div>
                        <br/>
                        <table class="table table-striped" style="width:230px; text-align: center">
                            <tr>
                                <td>关注</td>
                                <td>粉丝</td>
                                <td>关注帖子</td>
                            </tr>
                            <tr class="warning">
                                <td ><strong>${focusnum}</strong></td>
                                <td ><strong>${focusednum}</strong></td>
                                <td ><strong>${collectionnum}</strong></td>
                            </tr>
                        </table>


                        <br/><br/>
                        <div class="aw-mod-body">

                            <button type="button" class="btn btn-danger" style="width: 230px"
                                    onclick="guanzhu()">关注他（她）
                            </button>
                            <script>
                                function guanzhu() {
                                    <c:if test="${empty sessionScope.user}">
                                    alert("亲，请先登录");

                                    </c:if>
                                    <c:if test="${not empty sessionScope.user}">
                                    $.ajax({
                                        type: "post",
                                        url: "${pageContext.request.contextPath}/luntan/focus.action",
                                        data: "focusuid=" + ${user.uid} + "&focusduid=" + <%=request.getParameter("uid")%>,
                                        success: function (result) {
                                            if (result == 1) {
                                                alert("关注成功");
                                                window.location.reload();
                                            } else if (result == 0) {
                                                alert("关注失败");
                                                window.location.reload();
                                            } else if (result == 2) {
                                                alert("亲，您已经关注过此用户");

                                            }
                                        }
                                    });
                                    </c:if>
                                }
                            </script>

                        </div>
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

</body>

</html>
