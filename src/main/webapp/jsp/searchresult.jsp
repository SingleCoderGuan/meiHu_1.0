<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/6/006
  Time: 15:49
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";

%>
<html>
<head>
    <title>搜索结果</title>
    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>


    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/aw-font.css"/>

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/link.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript">
        var _F873F04AAB426252F46A5A8E6352AA6A = '';
        var G_POST_HASH = _F873F04AAB426252F46A5A8E6352AA6A;
        var G_INDEX_SCRIPT = '';
        var G_SITE_NAME = '美论';
        var G_BASE_URL = '//ask.dcloud.net.cn';
        var G_STATIC_URL = '//img-cdn-qiniu.dcloud.net.cn/static';
        var G_UPLOAD_URL = '//img-cdn-qiniu.dcloud.net.cn/uploads';
        var G_USER_ID = 0;
        var G_USER_NAME = '';
        var G_UPLOAD_ENABLE = 'N';
        var G_UNREAD_NOTIFICATION = 0;
        var G_NOTIFICATION_INTERVAL = 300000;
        var G_CAN_CREATE_TOPIC = '';

    </script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <%--<script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108"
            type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/functions.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/aw_template.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/common.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/app.js?v=20171108" type="text/javascript"></script>
    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/compatibility.js"></script>--%>
    <!--[if lte IE 8]>
    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/respond.js"></script>
    <![endif]-->
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
<div class="aw-top-menu-wrap"
>
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <a href="http://localhost:8080/meiHu/"> <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;"/></a>
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
                        <a href="<%=basePath%>userCenter.action"><img src="<%=basePath%>images/${user.headpic}"/>欢迎您：${user.uname}</a>
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


        <br />
        <div class="container">
            <div class="row aw-content-wrap">
                <div class="col-sm-12 col-md-9 aw-main-content aw-all-question">
                    <!-- tab切换 -->
                    <ul class="nav nav-tabs aw-reset-nav-tabs hidden-xs">

                        <li>
                            <a href="<%=basePath%>luntan/tiaojian.action?tiaojian=tuijian&tid=<%=request.getParameter("tid")%>" >推荐</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>luntan/tiaojian.action?tiaojian=zuixin&tid=<%=request.getParameter("tid")%>" >最新</a>
                        </li>

                        <h2 class="hidden-xs"> ……姑娘清留步,这是您需要的</h2>
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
                                <c:if test="${empty postList}">
                                    姑娘，小美没有找到呀！
                                </c:if>
                                <c:if test="${not empty postList}">
                                <c:forEach var="postList" items="${postList}"  varStatus="status">
                                    <div class="aw-item ">
                                        <a class="aw-user-name hidden-xs" data-id="804712" href="#" rel="nofollow">
                                                <%-- <img src="<%=basePath%>images/touxiang1.png" alt="" />--%>
                                            <span style="font-size: 40px "><strong>${status.index+1}</strong></span>
                                        </a>

                                        <div class="aw-question-content">
                                            <h4>
                                                <a href="<%=basePath%>luntan/tiezidetail.action?pid=${postList.pid}">${postList.ptitle}</a>
                                            </h4>



                                            <p>
							<span class="aw-question-tags">
					<i class="fa fa-caret-left"></i>
					<a href="#">${postList.topic.tname}</a><%--标签--%>
				</span> •
                                                <a href="#" class="aw-user-name" >${postList.user.uname}</a>
                                                <span class="aw-text-color-999" >${postList.likecount}次点赞  •
                                                    ${postList.visitcount} 次浏览 •<fmt:formatDate value='${postList.createtime}'
                                                                                                pattern='yyyy-MM-dd hh:mm:ss'/>   </span>
                                            </p>

                                        </div>
                                    </div>
                                </c:forEach>
                                </c:if>



                                <!--底部Google 信息流广告-->

                            </div>
                        </div>
                    </div>

                    <div class="page-control clearfix">
                        <ul class="pagination pull-right">
                            <li>
                                <a href="#">&lt;&lt;</a>
                            </li>
                            <li>
                                <a href="#">&lt;</a>
                            </li>
                            <li><a>当前第1页，共10页</a></li>
                            <li>
                                <a href="#">&gt;</a>
                            </li>
                            <li>
                                <a href="#">&gt;&gt;</a>
                            </li>
                        </ul>
                    </div>
                </div>















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
                        <!--<div class="aw-mod-head">-->
                        <!--<h3>置顶</h3>-->
                        <!--</div>-->
                        <div class="aw-mod-body">


                            <a class="sponsor_btn btn top-btn"
                               href="<%=basePath%>luntan/luntanshouye.action?tid=7">
                                <img src="../images/daigou.png" style="width:28px;"/>
                                <span style="font-size:30px;">看看代购</span>
                            </a>
                        </div>
                    </div>
                    <div class="aw-side-bar-mod">
                        <div class="aw-mod-head">
                            <h3>板块</h3>
                        </div>
                        <div class="aw-mod-body">
                            <ul>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai1.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=1">口红</a></li>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai6.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=6">眼霜</a></li>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai4.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=2">水乳</a></li>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai5.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=4">防晒</a></li>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai2.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=5">洗面奶</a></li>
                                <li><i class="feature_icon"><img src="<%=basePath%>images/bankuai3.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="<%=basePath%>luntan/luntanshouye.action?tid=3">香水</a></li>

                            </ul>
                        </div>
                    </div>

                    <div class="aw-side-bar-mod">
                        <div class="ad-item">


                            <!--<script type="text/javascript">-->
                            <!--/*右侧矩形*/-->
                            <!--var cpro_id = "u3178381";-->
                            <!--</script>-->
                            <!--<script type="text/javascript" src="//cpro.baidustatic.com/cpro/ui/c.js"></script>-->

                            <script>
                                (function () {
                                    var s = "_" + Math.random().toString(36).slice(2);
                                    document.write('<div id="' + s + '"></div>');
                                    (window.slotbydup = window.slotbydup || []).push({
                                        id: '5551298',
                                        container: s,
                                        size: '200,200',
                                        display: 'inlay-fix'
                                    });
                                })();
                            </script>
                            <script src="http://dup.baidustatic.com/js/os.js"></script>
                        </div>
                    </div>
                    <div class="aw-side-bar-mod aw-text-align-justify aw-no-border-bottom">
                        <div class="aw-mod-head">
                            <h3>明星用户</h3>
                        </div>
                        <div class="aw-mod-body">

                            <dl>
                                <dt class="pull-left aw-border-radius-5">
                                    <a href=""><img alt="" src="<%=basePath%>images/touxiang1.png"/></a>
                                </dt>
                                <dd class="pull-left">
                                    <a href="" data-id="15" class="aw-user-name">小姐姐<i class="aw-icon i-v i-ve"></i>
                                    </a>
                                    <p>回复了 <b>754</b> 个问题, 获得 <b>763</b> 次赞同</p>
                                </dd>
                            </dl>
                            <dl>
                                <dt class="pull-left aw-border-radius-5">
                                    <a href=""><img alt="" src="<%=basePath%>images/touxiang2.png"/></a>
                                </dt>
                                <dd class="pull-left">
                                    <a href="" data-id="15" class="aw-user-name">小姐姐<i class="aw-icon i-v i-ve"></i>
                                    </a>
                                    <p>回复了 <b>754</b> 个问题, 获得 <b>763</b> 次赞同</p>
                                </dd>
                            </dl>


                            <dl>
                                <dt class="pull-left aw-border-radius-5">

                                </dt>

                            </dl>
                        </div>
                    </div>

                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
    </div>
</div>

<div class="aw-footer-wrap">


    <div class="aw-footer aw-wecenter">

        <p>© 2018 美乎. All rights reserved | Design by
            <a href="#">第六组</a>
        </p>

        <!--<span class="hidden-xs"><a href="//ask.dcloud.net.cn/feed/" target="blank"><i class="fa fa-rss-square"></i> RSS Feed</a></span>-->


    </div>
</div>


<a class="aw-back-top hidden-xs" href="javascript:;" onclick="$.scrollTo(1, 600, {queue:true});"><i
        class="fa fa-arrow-up"></i></a>


<!-- DO NOT REMOVE -->
<div id="aw-ajax-box" class="aw-ajax-box"></div>

<div style="display:none;" id="__crond">
    <script type="text/javascript">
        $(document).ready(function () {
            $('#__crond').html(unescape('%3Cimg%20src%3D%22' + G_BASE_URL + '/crond/run/1527305624%22%20width%3D%221%22%20height%3D%221%22%20/%3E'));
        });

    </script>
</div>

<!-- Escape time: 0.19415783882141 -->
<script type="text/javascript" id="bdshare_js" data="type=tools"></script>
<!-- / DO NOT REMOVE -->
<script>
    var _hmt = _hmt || [];
    (function () {
        var hm = document.createElement("script");
        hm.src = "//hm.baidu.com/hm.js?1aa4e79e9d9a938cfe5605a1d0269239";
        var s = document.getElementsByTagName("script")[0];
        s.parentNode.insertBefore(hm, s);
    })();
</script>

<script>
    (function ($) {
        $('.ad-item').on('click', '.close', function () {
            var self = this;
            var level = $(self).data('level');
            if (level && (level > 0)) {
                $.ajax({
                    url: '//' + location.host + '/account/ajax/set_ad_sign/' + '?ad_type=' + $(self).data('type'),
                    success: function (data) {
                        var result = JSON.parse(data);
                        if (result.code === 200) {
                            $(self).parent().parent().css('display', 'none');
                        }
                    }
                });
            } else {
                $(self).css('display', 'none');
                $(self).next().css('display', 'inline-block');
            }
        });
    }(window.jQuery));
</script>
</body>
</html>
