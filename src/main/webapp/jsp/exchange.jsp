<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/7/007
  Time: 9:07
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
    <title>兑换专区</title>
    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/defaultheadpic.png" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css"/>

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/link.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="<%=basePath%>css/project.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/hb.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/xcConfirm.css"/>
    <script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/hb.js" type="text/javascript"></script>
    <script src="<%=basePath%>js/jquery.js" type="text/javascript"></script>


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

<body onload="hongbao()">
<div id="petalbox"></div>
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
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off"
                               name="searchcontent" id="aw-search-query" class="search-query"/>
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


                        <li>
                            <a href="<%=basePath%>luntan/luntanshouye.action?tid=1">美论</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美淘</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>article/article.action">美文</a>
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
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <span>
                     <c:if test="${not empty sessionScope.user}">
                          <a style="position: relative;left: -40px;top: -0.5px;" href="<%=basePath%>user/userCenter.action" >
                        <img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/>欢迎您：${user.uname}
                    </a>
                         <img id="message" hidden style="position: absolute;left: 30px;top: 40px;width: 30px" src="<%=basePath%>images/comment.png"/>

                         <a href="<%=basePath%>user/signOut.action" style="position: relative;left: 250px;">注销</a>
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


<div class="aw-container-wrap aw-project-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="aw-nav-filter">
                        <div class="mod-head clearfix">
                            <h2 class="pull-left"><i class="icon icon-users"></i>美论美换兑换专区(以下券均为全场通用)</h2>
                            <c:if test="${empty sessionScope.user.uid}">
                                <h1 class="pull-right">登录即可查看积分</h1>

                            </c:if>
                            <c:if test="${not empty sessionScope.user.uid}">
                                <h1 class="pull-right">您当前剩余积分<strong id="point">${point}</strong>分</h1>
                                <%--<input type="hidden" id="point" value="${point}">--%>

                            </c:if>

                        </div>

                    </div>
                </div>
                <div class="col-sm-12 col-md-12">
                    <div class="aw-project-list clearfix">
                        <ul>

                            <c:forEach items="${levelList}" var="levelList" varStatus="status">
                                <li class="col-sm-4 col-md-4">
                                    <div class="mod-head">
                                        <a href="#" class="img"><img src="<%=basePath%>images/${levelList.picname}" alt=""
                                                                     title=""/></a>

                                    </div>
                                    <div class="mod-body">
                                        <div class="progress">
                                            <div class="progress-bar progress-bar-success progress-bar-green"
                                                 role="progressbar" aria-valuenow="142" aria-valuemin="0"
                                                 aria-valuemax="142" style="width: 142%">
                                                <span class="sr-only"></span>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="mod-footer">
                                        <div class="status clearfix">

                                             <span>
                                                 <b id="shengyu${levelList.offid}">${levelList.offnum}</b>
                                                            剩余数量
                                             </span>
                                            <span class="pull-right">
                                               <%

                                               %>
												<b><fmt:formatDate value="${levelList.endtime}"  pattern="yyyy年MM月dd日"  /></b>
                                                截止兑换日期
											</span>
                                        </div>

                                        <button id="button${levelList.offid}" class="btn btn-danger" style="width: 310px;"
                                                onclick="duihuan(${levelList.offid},document.getElementById('point').innerHTML
                                                        ,${levelList.offnum})">
                                            ${levelList.needpoint}积分兑换
                                        </button>
                                    </div>
                                    <script>


                                        function duihuan(offidd,point,num) {
                                            <c:choose>
                                            <c:when test="${empty sessionScope.user.uid}">

                                            var txt=  "亲，请先登录！！";
                                            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                                            </c:when>
                                            <c:otherwise>
                                            $.ajax({
                                                type: "post",
                                                url: "${pageContext.request.contextPath}/duihuan.action",
                                                data: "uidd=" + ${sessionScope.user.uid} + "&offidd=" + offidd+"&pointt="+point,
                                                success: function (result) {
                                                    if (result !=0) {

                                                        var txt=  "兑换成功！！";
                                                        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.success);
                                                        var a = document.getElementById('point').innerHTML;
                                                        $('#point').html(a-result);
                                                        <%--var b = document.getElementById('shengyu${levelList.offid}').innerHTML;--%>
                                                        <%--alert(b);--%>
                                                        <%--$('#shengyu${levelList.offid}').html(num-1);--%>
                                                        window.location.reload();

                                                    }else if(result==0) {
                                                        var txt=  "您的积分不足，快去活跃吧！！";
                                                        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);

                                                    }

                                                }

                                            });

                                            </c:otherwise>
                                            </c:choose>




                                        }


                                    </script>
                                </li>
                            </c:forEach>
                        </ul>
                    </div>
                </div>

                <div class="square-page">
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    var uid = ${user.uid}

        $(function () {
            <c:if test="${not empty sessionScope.user.uid}">
            getMessage(uid);
            setInterval("getMessage(uid)",10000);
            </c:if>
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

<div class="aw-footer aw-wecenter">
    <p>© 2018 美乎. All rights reserved | Design by
        <a href="#">第六组</a>
    </p>
    </span>

    <!--<span class="hidden-xs"><a href="//ask.dcloud.net.cn/feed/" target="blank"><i class="fa fa-rss-square"></i> RSS Feed</a></span>-->

</div>
</body>

</html>
