<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="zxx">
<head>
    <meta charset="UTF-8">
    <title>商品详情页面</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="<%= basePath%>css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%= basePath%>css/style.css" rel='stylesheet' type='text/css' />
    <script src="<%= basePath%>js/jquery.min.js"> </script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700|Cinzel+Decorative:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<%= basePath%>css/myresponsee.css">
    <link rel="stylesheet" href="<%= basePath%>css/style1.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= basePath%>css/responsive.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <script src="<%= basePath%>js/respond.js"></script>
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>
    <style>

        #imgs{
            width:220px;
            hight:220px;
        }
        .icon-text{
            font-family: 华文楷体;

        }
        .icon-text li a{
            color: #ffffff;
        }
        .uc-header-bg{
            background-color: #c0c0bf;
        }
        .logo1{
            position: relative;
            margin-top:-220px;
            left:-450px;
        }
        nav{
            display: inline-block;
            margin-top:-40px;
            left:340px;
            font-family: 华文楷体;
            font-size: 20px;
            font-weight: bolder;
        }
        nav a{
            display: inline-block;
            color: white;
            text-decoration: none;
            perspective:200px;
        }
        nav a span{
            line-height: 50px;
            background-color: #f8fff9;
            display: inline-block;
            padding: 0 30px;
            position: relative;
            transform-origin:top;
            transition:all 1s;
            transform-style:preserve-3d;

        }
        nav a span::after{
            content: attr(data-hover);
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #1f2d3d;
            text-align: center;
            color: #ffffff;
            width: 100%;
            height: 100%;
            transform:rotateX(-90deg);
            transform-origin:top;
        }

        nav a:hover span{
            transform:rotateX(90deg) translateY(-20px);
        }
        #jia {
            position: absolute;
            float: left;
            margin-left: 100px;
            width: 50px;
            height: 50px;
        }
        #jian{
            width:50px;
            height:50px;
        }

    </style>


</head>

<body class="size-1140">


<!-- SLIDESHOW START -->
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <div class="logo1"> <a class="logo" href="<%=basePath%>jsp/index.jsp">
            <img src="<%=basePath%>images/LOGOMeiTao.png" style="width: 180px;height:120px;" alt="" /></a></div>

    </div>
    <nav>
        <a href="<%= basePath %>goods/glist.action?categoryid=2">
            <span data-hover="香水">香水</span>
        </a>
        <a href="<%= basePath %>goods/glist.action?categoryid=5">
            <span data-hover="眼霜">眼霜</span>
        </a>
        <a href="<%= basePath %>goods/glist.action?categoryid=3">
            <span data-hover="洁面乳">洁面乳</span>
        </a>
        <a href="<%= basePath %>goods/glist.action?categoryid=4">
            <span data-hover="防晒霜">防晒霜</span>
        </a>
        <a href="<%= basePath %>goods/glist.action?categoryid=1">
            <span data-hover="口红">口红</span>
        </a>
        <a href="<%= basePath %>goods/glist.action?categoryid=6">
            <span data-hover="水乳">水乳</span>
        </a>
        <a href="<%=basePath%>jsp/mh-orders.jsp">
            <span data-hover="个人中心">个人中心</span>
        </a>
        <a href="<%=basePath%>jsp/cart.jsp">
            <span data-hover="购物车">购物车</span>
        </a>
    </nav>
</div>
<!-- SLIDESHOW END -->






<div class="section">
    <div class="line">
        <!-- heading -->

        <h1 class="text-center"><span class="text-primary">精选</span>商品</h1>
        <hr class="break-small break-center">
        <!-- products tabs start -->
        <div class="tabs">
            <!-- tab 1 start -->
            <div class="tab-item tab-active">
                <%-- <a class="tab-label active-btn">Skin Care</a>--%>
                <div class="tab-content">
                    <div class="margin">

                        <c:forEach items="${glists}" var="goods">
                            <div class="s-12 m-4 l-3 margin-bottom-30">
                                <div class="fullwidth">
                                    <figure class="imghvr-reveal-down">

                                        <div id="imgs"><img src='<%=basePath %>${goods.goodpic}'/></div>

                                        <figcaption>
                                            <div class="product-hover-content">
                                                <div class="btn-box">
                                                    <a href="<%= basePath%>goods/list.action?goodid=${goods.goodid}" class="btn">查看详情</a>
                                                </div>
                                            </div>
                                        </figcaption>
                                    </figure>
                                </div>
                                <div class="fullwidth">
                                    <h5>${goods.goodname}</h5>
                                    <p class="text-center"><span class="strike">$600.00</span> &nbsp;&nbsp;现价<span class="text-primary">${goods.goodprice}</span></p>
                                </div>
                            </div>
                        </c:forEach>


                    </div>
                </div>
            </div>
            <!-- tab 1 end -->

        </div>
    </div>
</div>
<!--/start-footer-section-->
<div class="footer-section">
    <div class="footer-grids">
        <div class="col-md-3 footer-grid">
            <h4>最受欢迎</h4>
            <div class="border2"></div>
            <p>清透润白系列 「淡斑小瓷瓶」清透润白淡斑亮肤精华乳</p>
            <p class="sub">焕颜紧致系列 「全明星眼霜」焕颜紧致眼霜.</p>
            <p class="sub">恒润奇肌保湿系列 「小蓝瓶」恒润奇肌保湿精华液</p>
            <p class="sub" >相宜本草 「红景天莹」透彻幼白精华乳（亮白乳液护肤）</p>
        </div>
        <div class="col-md-3 footer-grid tags">
            <h4>类别</h4>
            <div class="border2"></div>
            <ul class="tag">
                <li><a href="#">面 部 洁 白</a></li>
                <li><a href="#">防 晒 护 理</a></li>
                <li><a href="#">美 妆 护 理</a></li>
                <li><a href="#">眼 部 护 理</a></li>
                <li><a href="#">保 湿 护 肤</a></li>
                <li><a href="#">香 气 怡 人</a></li>
                <li><a href="#">全 面 呵 护</a></li>
                <li><a href="#">特 别 活 动</a></li>
                <li><a href="#">礼品及超值套餐</a></li>


            </ul>
        </div>
        <div class="col-md-3 footer-grid tweet">
            <h4>关于我们</h4>
            <div class="border2"></div>
            <div class="icon-3-square">
                <a href="#"><i class="square-3"></i></a>
            </div>
            <div class="icon-text">
                <ul>
                    <li><a href="#">选 择 美 乎</a></li>
                    <li><a href="#">美 乎 妆 品</a></li>
                    <li><a href="#">美 乎 中 心</a></li>
                    <li><a href="#">品 类 选 择</a></li>
                    <li><a href="#">美 妆 护 理</a></li>

                </ul>
            </div>

            <div class="clearfix"></div>
            <div class="icon-3-square">
                <a href="#"><i class="square-3"></i></a>
            </div>
            <div class="icon-text">
                <ul>
                    <li><a href="#">服 务 中 心</a></li>
                    <li><a href="#">常 见 问 题</a></li>
                    <li><a href="#">联 系 我 们</a></li>
                    <li><a href="#">tel:135-2551-6040</a></li>
                    <li><a href="#">email:920758051@qq.com</a></li>
                </ul>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="col-md-3 footer-grid flickr">
            <h4>flickr feed</h4>
            <div class="border2"></div>
            <div class="flickr-grids">
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/1_06.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/4_15.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/6_03.jpg" alt=""/></a>
                </div>
                <div class="clearfix"> </div>

                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/3_05.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/2_04.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/5_09.jpg" alt=""/></a>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//end-footer-section-->
<!--/start-copyright-section-->
<div class="copyright">
    <p class="write">Copyright &copy; 2018 All rights  Reserved | Design by <a href="#">美乎网</a></p>
</div>


<!--//end-footer-section-->
<!--/start-copyright-section-->

<!-- jQuery Files -->
<script type="text/javascript" src="<%= basePath%>js/jquery-3.1.1.min.js"></script>
<script type="text/javascript" src="<%= basePath%>js/jquery-ui.min.js"></script>
<script type="text/javascript" src="<%= basePath%>owl-carousel/owl.carousel.js"></script>
<script type="text/javascript" src="<%= basePath%>js/custom.js"></script>
<script src="<%=basePath%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/style2.css"/>
<script src="<%=basePath%>js/icheck.min.js"></script>
<script src="<%=basePath%>js/laydate.js"></script>
<script src="<%=basePath%>js/global.js"></script>



</body>
</html>

