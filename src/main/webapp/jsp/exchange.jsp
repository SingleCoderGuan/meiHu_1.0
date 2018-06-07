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
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>兑换专区</title>
    <meta name="keywords" content="美论" />
    <meta name="description" content="美论" />

    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css" />
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css" />
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css" />

    <link href="../css/common.css" rel="stylesheet" type="text/css" />
    <link href="../css/link.css" rel="stylesheet" type="text/css" />
    <link href="../css/stylebankuai.css" rel="stylesheet" type="text/css" />

    <link href="../css/classblack.css" rel="stylesheet" type="text/css" />

    <link rel="stylesheet" href="../css/project.css" />
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
                <img src="../images/LOGO.png" style="width: 72px; height: 41px;" />
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="#" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off" name="q" id="aw-search-query" class="search-query" />
                        <span class="input-group-addon" title="搜索" id="global_search_btns" onClick="$('#global_search_form').submit();"><i class="fa fa-search"></i></span>
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

                        <li class="nav-current" role="presentation">
                            <a href="luntanshouyetest.html">美论首页</a>
                        </li>
                        <li>
                            <a href="index.html">美乎</a>
                        </li>
                        <li>
                            <a href="#">美购</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美商城</a>
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
							<a href="#" ><img src="../images/touxiang1.png"/>欢迎您：美乎小编 </a>

                    <!--<a href="#">注册</a>
                    <a href="#">登录</a>-->
						</span>

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
    </div>
</div>

<script>



    function bt5(){
        alert("兑换成功");
    }


</script>
<div class="aw-container-wrap aw-project-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="aw-nav-filter">
                        <div class="mod-head clearfix">
                            <h2 class="pull-left"><i class="icon icon-users"></i>美论美换兑换专区(以下券均为全场通用)</h2>
                            <h1 class="pull-right">您当前剩余积分<strong>1000</strong>分</h1>

                        </div>

                    </div>
                </div>
                <div class="col-sm-12 col-md-12">
                    <div class="aw-project-list clearfix">
                        <ul>
                            <li class="col-sm-4 col-md-4">
                                <div class="mod-head">
                                    <a href="#" class="img"><img src="../images/wuzhequan.jpg" alt="" title="" /></a>

                                </div>
                                <div class="mod-body">
                                    <h3><a href="http://wenda.wecenter.com/project/4" >五折券火爆兑换</a></h3>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-green" role="progressbar" aria-valuenow="142" aria-valuemin="0" aria-valuemax="142" style="width: 142%">
                                            <span class="sr-only"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mod-footer">
                                    <div class="status clearfix">
											<span>
												<b>20%</b>
												已剩余
											</span>
                                        <span>
																								<b>50张</b>
												总共
																							</span>
                                        <span class="pull-right">
												<b>50天</b>
												剩余时间
											</span>
                                    </div>

                                    <button id="button5" class="btn btn-danger"style="width: 310px;" onclick="bt5()" >1000积分兑换</button>


                                </div>
                            </li>



                            <li class="col-sm-4 col-md-4">
                                <div class="mod-head">
                                    <a href="#" class="img"><img src="../images/liuzhequan.jpg" alt="" title="" /></a>

                                </div>
                                <div class="mod-body">
                                    <h3><a href="http://wenda.wecenter.com/project/4" >六折券火爆兑换</a></h3>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-green" role="progressbar" aria-valuenow="142" aria-valuemin="0" aria-valuemax="142" style="width: 142%">
                                            <span class="sr-only"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mod-footer">
                                    <div class="status clearfix">
											<span>
												<b>20%</b>
												已剩余
											</span>
                                        <span>
																								<b>50张</b>
												总共
																							</span>
                                        <span class="pull-right">
												<b>50天</b>
												剩余时间
											</span>
                                    </div>

                                    <button type="button" class="btn btn-danger"style="width: 310px;" >800积分兑换</button>


                                </div>
                            </li>




                            <li class="col-sm-4 col-md-4">
                                <div class="mod-head">
                                    <a href="#" class="img"><img src="../images/qizhequan.jpg" alt="" title="" /></a>

                                </div>
                                <div class="mod-body">
                                    <h3><a href="http://wenda.wecenter.com/project/4" >七折券火爆兑换</a></h3>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-green" role="progressbar" aria-valuenow="142" aria-valuemin="0" aria-valuemax="142" style="width: 142%">
                                            <span class="sr-only"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mod-footer">
                                    <div class="status clearfix">
											<span>
												<b>20%</b>
												已剩余
											</span>
                                        <span>
																								<b>50张</b>
												总共
																							</span>
                                        <span class="pull-right">
												<b>50天</b>
												剩余时间
											</span>
                                    </div>

                                    <button type="button" class="btn btn-danger"style="width: 310px;" >600积分兑换</button>


                                </div>
                            </li>



                            <li class="col-sm-4 col-md-4">
                                <div class="mod-head">
                                    <a href="#" class="img"><img src="../images/bazhequan.jpg"  /></a>

                                </div>
                                <div class="mod-body">
                                    <h3><a href="http://wenda.wecenter.com/project/4" >八折券火爆兑换</a></h3>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-green" role="progressbar" aria-valuenow="142" aria-valuemin="0" aria-valuemax="142" style="width: 142%">
                                            <span class="sr-only"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mod-footer">
                                    <div class="status clearfix">
											<span>
												<b>20%</b>
												已剩余
											</span>
                                        <span>
																								<b>50张</b>
												总共
																							</span>
                                        <span class="pull-right">
												<b>50天</b>
												剩余时间
											</span>
                                    </div>

                                    <button type="button" class="btn btn-danger"style="width: 310px;" >500积分兑换</button>


                                </div>
                            </li>

                            <li class="col-sm-4 col-md-4">
                                <div class="mod-head">
                                    <a href="#" class="img"><img src="../images/jiuzhequan.jpg" alt="" title="" /></a>

                                </div>
                                <div class="mod-body">
                                    <h3><a href="http://wenda.wecenter.com/project/4" >九折券火爆兑换</a></h3>
                                    <div class="progress">
                                        <div class="progress-bar progress-bar-success progress-bar-green" role="progressbar" aria-valuenow="142" aria-valuemin="0" aria-valuemax="142" style="width: 142%">
                                            <span class="sr-only"></span>
                                        </div>
                                    </div>
                                </div>
                                <div class="mod-footer">
                                    <div class="status clearfix">
											<span>
												<b>20%</b>
												已剩余
											</span>
                                        <span>
																								<b>50张</b>
												总共
																							</span>
                                        <span class="pull-right">
												<b>50天</b>
												剩余时间
											</span>
                                    </div>

                                    <button type="button" class="btn btn-danger"style="width: 310px;" >300积分兑换</button>


                                </div>
                            </li>



                        </ul>
                    </div>
                </div>
                <div class="square-page">
                </div>

            </div>
        </div>
    </div>
</div>
<div class="aw-footer aw-wecenter">
    <p>© 2018 美乎. All rights reserved | Design by
        <a href="#">第六组</a>
    </p>
    </span>

    <!--<span class="hidden-xs"><a href="//ask.dcloud.net.cn/feed/" target="blank"><i class="fa fa-rss-square"></i> RSS Feed</a></span>-->

</div>
</body>

</html>
