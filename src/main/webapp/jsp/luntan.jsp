<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/5/31/031
  Time: 10:37
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
    <title>美论首页</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>

    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/aw-font.css"/>

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/link.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>

    <script type="text/javascript" src="<%=basePath%>/js/zzsc.js"></script>
    <script type="text/javascript" src="<%=basePath%>/js/jquery-3.2.1.min.js"></script>


    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/respond.js"></script>
    <![endif]-->
</head>
<style>
    #div1 {
        height: 400px;
        width: 200px;
        position: relative;
        margin: 10px auto;
    }

    #div1 a {
        position: absolute;
        top: 0px;
        left: 0px;
        color: #fff;
        font-weight: bold;
        padding: 3px 6px;
    }

    #div1 a:hover {
        border: 1px solid #eee;
        background: #000;
        border-radius: 5px;
    }
</style>
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
<body  style="background: #aac4bc; /* Old browsers */
	background: -moz-linear-gradient(-45deg,  #aac4bc 0%, #eca8a8 100%, #eed5a9 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg,  #aac4bc 0%,#eca8a8 100%,#eed5a9 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #aac4bc 0%,#eca8a8 100%,#eed5a9 100%);">


<div class="aw-top-menu-wrap" style="height: 55px">
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <a href="<%=basePath%>jsp/zhuye.jsp"> <img src="<%=basePath%>images/LOGO.png"
                                                             style="width: 72px; height: 41px;"/></a>
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
                            <a href="<%=basePath%>article/article.action">美文</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美淘</a>
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


            <DIV id=img1 style="Z-INDEX: 100; LEFT: 2px; WIDTH: 59px; POSITION: absolute; TOP: 43px; HEIGHT: 61px;
 visibility: visible;"><a href="<%=basePath%>quchoujiang.action" target="_blank"><img src="../images/huodong.png" width="150" height="200" border="0"></a></DIV>
            <SCRIPT src="<%=basePath%>js/guanggaopiaofu.js"></SCRIPT>

            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav" style="width: 250px">
                <!-- 登陆&注册栏 -->
                <span>
                     <c:if test="${not empty sessionScope.user}">
                          <a style="position: relative;left: -40px;top: -0.5px;" href="<%=basePath%>user/userCenter.action" >
                              <img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/>欢迎<em>${user.uname}</em>
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


<div class="aw-container-wrap " style="background: #aac4bc; /* Old browsers */
	background: -moz-linear-gradient(-45deg,  #aac4bc 0%, #eca8a8 100%, #eed5a9 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg,  #aac4bc 0%,#eca8a8 100%,#eed5a9 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #aac4bc 0%,#eca8a8 100%,#eed5a9 100%);">
    <div class="aw-container aw-wecenter" style="background: #aac4bc; /* Old browsers */
	background: -moz-linear-gradient(-45deg,  #aac4bc 0%, #eca8a8 100%, #eed5a9 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg,  #aac4bc 0%,#eca8a8 100%,#eed5a9 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #aac4bc 0%,#eca8a8 100%,#eed5a9 100%);">
        <div class="container">
            <div class="row category">
                <div class="col-sm-12">
                    <c:forEach items="${topicList1}" var="topicList1">
                        <a href="<%=basePath%>luntan/luntanshouye.action?tid=${topicList1.tid}">
                            <dl style="text-align: center">
                                <dt><img src="<%=basePath%>images/${topicList1.tpicname}"
                                         style="position: relative;left: 30px;"/></dt>
                                <dd>
                                    <p class="title"><a href="#">${topicList1.tname}</a></p>
                                </dd>
                            </dl>
                        </a>
                    </c:forEach>

                </div>
            </div>
        </div>
        <style>
            .notice {
                width: 100%;
                font-size: 17px;
            }

            /*首页*/
            .container ~ .notice {
                padding: 10px 15px;
            }

            /*动态*/
            .aw-main-content .notice {
                margin-bottom: 10px;
            }

            /*侧边栏*/
            .aw-mod-body .notice {
                font-size: 14px;
            }

            .aw-mod-body .notice img {
                display: none;
            }

            .notice img {
                margin-top: -2px;
                margin-right: 8px;
            }

            .notice a {
                color: #f00;
                font-size: inherit;
            }
        </style>
        <!--可能需要父级套一个div来调整在不同容器下的整体宽度-->


        <br/>
        <div class="container">
            <div class="row aw-content-wrap">
                <div class="col-sm-12 col-md-9 aw-main-content aw-all-question">
                    <!-- tab切换 -->
                    <ul class="nav nav-tabs aw-reset-nav-tabs hidden-xs">

                        <li>
                            <a href="<%=basePath%>luntan/tiaojian.action?tiaojian=tuijian&tid=<%=request.getParameter("tid")%>">推荐</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>luntan/tiaojian.action?tiaojian=zuixin&tid=<%=request.getParameter("tid")%>">最新</a>
                        </li>

                        <h2 class="hidden-xs"> ……姑娘清留步 这是${tname}区</h2>
                    </ul>
                    <!-- end tab切换 -->

                    <div class="aw-mod aw-question-box-mod">
                        <div class="aw-mod-body">
                            <div class="aw-question-list">

                                <style type="text/css">
                                    .aw-user-name .sponsor-level {
                                        width: 25px;
                                        height: 25px;
                                        position: absolute;
                                        left: 38px;
                                        top: -5px;
                                    }

                                    .aw-question-box-mod .aw-item {
                                        padding-left: 80px;
                                    }

                                    .aw-user-name .sponsor-count {
                                        width: 16px;
                                        height: 14px;
                                        position: absolute;
                                        left: 43px;
                                        top: 0px;
                                    }
                                </style>
                                <c:forEach var="postList" items="${pageInfo.list}" varStatus="status">

                                    <div class="aw-item ">
                                        <a class="aw-user-name hidden-xs" data-id="804712" href="#" rel="nofollow">
                                                <%-- <img src="<%=basePath%>images/touxiang1.png" alt="" />--%>
                                                <%--<span style="font-size: 40px "><strong>${status.index+1}</strong></span>--%>
                                            <img style="width: 50px" src="<%=basePath%>${postList.user.headpic}"/>
                                        </a>

                                        <div class="aw-question-content">
                                            <h4>
                                                <a href="<%=basePath%>luntan/tiezidetail.action?pid=${postList.pid}">${postList.ptitle}</a>
                                            </h4>
                                            <p>
							<span class="aw-question-tags">
					<i class="fa fa-caret-left"></i>
					<a href="#">${postList.topic.tname}</a><%--标签--%>
                                <input name="curTid" id="curTid" value="${postList.topic.tid}" hidden/>
				</span> •
                                                <a href="#" class="aw-user-name">${postList.user.uname}</a>
                                                <span class="aw-text-color-999">${postList.likecount}次点赞  •
                                                    ${postList.visitcount} 次浏览 •<fmt:formatDate
                                                            value='${postList.createtime}'
                                                            pattern='yyyy-MM-dd hh:mm:ss'/>   </span>
                                            </p>

                                        </div>
                                    </div>

                                </c:forEach>
                                <!--底部Google 信息流广告-->
                            </div>
                        </div>
                    </div>
                    <form id="mainForm"
                          action="<%=basePath%>luntan/luntanshouye.action?tid=<%=request.getParameter("tid")%>"
                          method="post">
                        <input hidden name="curPage" id="curPage"/>
                        <input hidden name="tid" id="tid"/>
                    </form>
                    <div class="page-control clearfix">
                        <ul class="pagination pull-right">
                            <li>
                                <c:if test="${!pageInfo.isFirstPage}">

                                    <a href="javascript:getPage(${pageInfo.firstPage})">首页</a>
                                </c:if>

                                <c:if test="${!pageInfo.isFirstPage}">
                                    <a href="javascript:getPage(${pageInfo.prePage})">上一页</a>
                                </c:if>
                                <a> 共 ${pageInfo.total}条
                                    当前第<span>${pageInfo.pageNum}</span>页</a>
                                <c:if test="${!pageInfo.isLastPage}">
                                    <a href="javascript:getPage(${pageInfo.nextPage})">下一页</a>
                                </c:if>
                                <c:if test="${!pageInfo.isLastPage}">
                                    <a href="javascript:getPage(${pageInfo.lastPage})">末页</a>
                                </c:if>

                            </li>
                        </ul>
                    </div>
                </div>
                <script>
                    function getPage(curPage) {
                        document.getElementById("tid").value = document.getElementById("curTid").value;
                        //将隐藏域的值变成curPage
                        document.getElementById("curPage").value = curPage;
                        //触发表单的提交事件
                        document.getElementById("mainForm").submit();
                    }
                </script>

                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar aw-index-side-bar hidden-xs hidden-sm">
                    <style>
                        /*这个其实是common.css的内容*/
                        .aw-index-side-bar {
                            padding-top: 0;
                        }

                        /*防止影响其它部分的按钮*/
                        .top-articles.aw-side-bar-mod .btn {
                            border-radius: 5px;
                            text-align: center;
                            padding: 8px 0px;
                            margin: 0 5px;
                            display: block;
                        }

                        .aw-side-bar-mod .paid_service_btn {
                            color: #fff;
                            /*background-color: #fd7420;//橘色*/
                            background-color: #41a863;
                        }

                        .sponsor_btn {
                            color: #fd7420;
                            border: 1px solid #fd7420;
                        }

                        .paid_service_btn img {
                            width: 22px;
                            height: auto;
                            margin-right: 1px;
                        }

                        .sponsor_btn img {
                            width: 18px;
                            height: auto;
                            margin-right: 1px;
                        }

                        .aw-side-bar .aw-side-bar-mod {
                            padding: 10px 0;
                        }

                        .aw-side-bar-mod .btn.top-btn {
                            margin: 10px 5px;
                        }

                    </style>
                    <div class="aw-side-bar-mod top-articles">
                        <div class="aw-mod-head">
                        <h3>置顶</h3>
                        </div>
                        <div class="aw-mod-body">
                            <a class="sponsor_btn btn top-btn" href="<%=basePath%>luntan/luntanshouye.action?tid=7">
                                <img src="<%=basePath%>images/daigou.png"/>
                                <span style="font-size:13px;">看看代购</span>
                            </a>
                        </div>
                    </div>

                    <div class="aw-side-bar-mod top-articles">
                        <div class="aw-mod-head">
                            <h3>签到</h3>
                        </div>
                        <div class="aw-mod-body">
                            <a class="sponsor_btn btn top-btn" href="#" onclick="sign()">
                                <span style="font-size:13px;">点我签到</span>
                            </a>
                            <script>
                                function sign(){
                                    <c:if test="${empty sessionScope.user.uid}">
                                    alert("亲，请先登录");


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
                        </div>
                    </div>

                    <div class="aw-side-bar-mod">
                        <div class="aw-mod-head">
                            <h3>热门</h3>
                        </div>
                        <div class="aw-mod-body" style="background-color: pink">


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


                    <div class="aw-side-bar-mod aw-text-align-justify aw-no-border-bottom">
                        <div class="aw-mod-head">
                            <h3>明星用户</h3>
                        </div>
                        <div class="aw-mod-body">
                            <c:forEach items="${userlist}" var="userlist" begin="0" end="4" step="1">
                                <dl>
                                    <dt class="pull-left aw-border-radius-5">
                                        <a href="<%=basePath%>luntan/userdetail.action?uid=${userlist.uid}"><img  src="<%=basePath%>${userlist.headpic}"/></a>
                                    </dt>
                                    <dd class="pull-left">
                                        <a href="" data-id="15" class="aw-user-name">${userlist.uname}<i
                                                class="aw-icon i-v i-ve"></i>
                                        </a>
                                        <p>${userlist.title.title}</p>
                                    </dd>
                                </dl>
                            </c:forEach>


                        </div>
                    </div>

                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
    </div>
</div>
<script>
    var uid = ${user.uid}

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

        <script src="https://qiyukf.com/script/8461da5aef2206ef029adb41eea97bfb.js"></script>



<div class="aw-footer-wrap" style="background: #aac4bc; /* Old browsers */
	background: -moz-linear-gradient(-45deg,  #aac4bc 0%, #eca8a8 100%, #eed5a9 100%); /* FF3.6-15 */
	background: -webkit-linear-gradient(-45deg,  #aac4bc 0%,#eca8a8 100%,#eed5a9 100%); /* Chrome10-25,Safari5.1-6 */
	background: linear-gradient(135deg, #aac4bc 0%,#eca8a8 100%,#eed5a9 100%);">


    <div class="aw-footer aw-wecenter">

        <p>© 2018 美乎. All rights reserved | Design by
            <a href="#">第六组</a>
        </p>

        <!--<span class="hidden-xs"><a href="//ask.dcloud.net.cn/feed/" target="blank"><i class="fa fa-rss-square"></i> RSS Feed</a></span>-->


    </div>
</div>



<!-- Escape time: 0.19415783882141 -->
<script type="text/javascript" id="bdshare_js" data="type=tools"></script>
</body>
</html>

