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
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>美论首页</title>

    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>


    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css"/>

    <link href="../css/common.css" rel="stylesheet" type="text/css"/>
    <link href="../css/link.css" rel="stylesheet" type="text/css"/>
    <link href="../css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="../css/classblack.css" rel="stylesheet" type="text/css"/>
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
                <img src="../images/LOGO.png" style="width: 72px; height: 41px;"/>
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="#" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text"
                               placeholder="搜索问题、话题" autocomplete="off" name="q" id="aw-search-query"
                               class="search-query"/>
                        <span class="input-group-addon" title="搜索" id="global_search_btns"
                              onClick="$('#global_search_form').submit();"><i class="fa fa-search"></i></span>
                        <div class="clearfix"></div>

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

                        <li class="nav-current" role="presentation"><a href="luntanshouyetest.html">美论首页</a></li>
                        <li><a href="index.html">美乎</a></li>
                        <li><a href="#">美购</a></li>
                        <li><a href="#">美商城</a></li>
                        <li><a href="#">活动</a></li>

                        <li><a href="#">关于</a></li>

                    </ul>
                </nav>
            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <span>
							<a href="#">注册</a>
							<a href="#">登录</a>
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
                    <c:forEach items="${topicList}" var="topicList">
                        <a href="<%=basePath%>luntan/bankuai.action?">
                            <dl>
                                <dt><img src="../images/${topicList.tpicname}"/></dt>
                                <dd>
                                    <p class="title"><a href="#">${topicList.tname}</a></p>

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

                        <li><a href="#">推荐</a></li>
                        <li><a href="#">最新</a></li>

                        <h2 class="hidden-xs">${topicList[0].tname}区……菇凉请留步</h2>
                    </ul>
                    <!-- end tab切换 -->
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
                <%--一条帖子开始--%>
                    <c:forEach var="postList" items="${postList}">
                    <div class="aw-mod aw-question-box-mod">
                        <div class="aw-mod-body">
                            <div class="aw-question-list">

                                <div class="aw-item ">
                                    <a class="aw-user-name hidden-xs" data-id="804712"
                                       href="#" rel="nofollow">
                                        <img src="../images/touxiang1.png" alt=""/> <%--用户头像--%>
                                    </a>

                                    <div class="aw-question-content">
                                        <h4>
                                            <%--帖子标题--%>
                                            <a href="<%=basePath%>/luntan/tiezidetail.action?pid=${postList.pid}">${postList.ptitle}</a>
                                        </h4>
                                        <p class="pull-right hidden-xs">
                                            <span>收藏:</span>

                                            <a class="aw-user-name" href="" rel="nofollow"><img
                                                    src="../images/shoucang.png" alt=""/></a>
                                            <span>举报:</span>
                                            <a class="aw-user-name" href="" rel="nofollow"><img
                                                    src="../images/jubao.png" alt=""/></a>
                                            <span>点赞:</span>
                                            <a class="aw-user-name" href="" rel="nofollow"><img
                                                    src="../images/dianzan.png" alt=""/></a>
                                        </p>


                                        <p>
							<span class="aw-question-tags">
					<i class="fa fa-caret-left"></i>
					<a href="#">${postList.topic.tname}</a><%--标签--%>
				</span> •
                                            <a href="#" class="aw-user-name" data-id="788923">${postList.user.uname}</a>
                                            <span class="aw-text-color-999" >${postList.likecount}次点赞 • 7 人关注 •
                                                    ${postList.visitcount} 次浏览 •<fmt:formatDate value='${postList.createtime}'
                                                                                                pattern='yyyy-MM-dd hh:mm:ss'/>"	</span>
                                        </p>
                                    </div>
                                </div>
                            </div>
                        </div>
                        </c:forEach>
                        <%--一条帖子结束--%>
                    </div>
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

                            <a class="sponsor_btn btn top-btn" href="#">
                                <img src="../images/zhichi.png"/>
                                <span style="font-size:13px;">逛逛商城</span>
                            </a>
                            <a class="sponsor_btn btn top-btn" href="#">
                                <img src="../images/daigou.png"/>
                                <span style="font-size:13px;">看看代购</span>
                            </a>
                        </div>
                    </div>
                    <div class="aw-side-bar-mod">
                        <div class="aw-mod-head">
                            <h3>板块</h3>
                        </div>
                        <div class="aw-mod-body">
                            <ul>
                                <li><i class="feature_icon"><img src="../images/bankuai1.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">口红</a></li>
                                <li><i class="feature_icon"><img src="../images/bankuai6.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">眼霜</a></li>
                                <li><i class="feature_icon"><img src="../images/bankuai4.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">水乳</a></li>
                                <li><i class="feature_icon"><img src="../images/bankuai5.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">防晒</a></li>
                                <li><i class="feature_icon"><img src="../images/bankuai2.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">洗面奶</a></li>
                                <li><i class="feature_icon"><img src="../images/bankuai3.png"
                                                                 style="width: 50px;height: 50px;"/></i><a
                                        href="#">香水</a></li>

                            </ul>
                        </div>
                    </div>
                    <div class="aw-side-bar-mod">
                        <div class="aw-mod-head">
                            <h3>热门帖子</h3>
                        </div>
                        <div class="aw-mod-body">
                            <ul>
                                <li><i class="feature_icon"><img style="width: 40px;height: 40px;"
                                                                 src="../images/remen.png" alt=""></i><a
                                        href="#">香水评测大全</a></li>

                                <li><i class="feature_icon"><img style="width: 40px;height: 40px;"
                                                                 src="../images/remen.png" alt=""></i><a
                                        href="#">香水评测大全</a></li>
                                <li><i class="feature_icon"><img style="width: 40px;height: 40px;"
                                                                 src="../images/remen.png" alt=""></i><a
                                        href="#">兰蔻新款试用</a></li>
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
                                    <a href=""><img alt="" src="../images/touxiang1.png"/></a>
                                </dt>
                                <dd class="pull-left">
                                    <a href="" data-id="15" class="aw-user-name">小姐姐<i class="aw-icon i-v i-ve"></i>
                                    </a>
                                    <p>回复了 <b>754</b> 个问题, 获得 <b>763</b> 次赞同</p>
                                </dd>
                            </dl>
                            <dl>
                                <dt class="pull-left aw-border-radius-5">
                                    <a href=""><img alt="" src="../images/touxiang2.png"/></a>
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
    <!--底部广告-->
    <div class="aw-footer aw-wecenter">
        <div class="ad-item">
            <div class="close" data-type="ad_bottom" data-level="">
                <a href="javascript:;" title="停止推广广告">X</a>
            </div>
            <p class="guide">赞助DCloud可免广告，<a href="//dev.dcloud.net.cn/sponsor/">点此前往赞助页面</a></p>

            <!-- 底部广告位 -->
            <script>
                (function () {
                    var s = "_" + Math.random().toString(36).slice(2);
                    document.write('<div id="' + s + '"></div>');
                    (window.slotbydup = window.slotbydup || []).push({
                        id: '5513626',
                        container: s,
                        size: '960,90',
                        display: 'inlay-fix'
                    });
                })();
            </script>
            <script src="http://dup.baidustatic.com/js/os.js"></script>
        </div>
    </div>
    <!--end 底部广告-->

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

