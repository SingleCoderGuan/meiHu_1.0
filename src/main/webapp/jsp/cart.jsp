<%@ page import="javax.swing.plaf.basic.BasicSpinnerUI" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>购物车</title>
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
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>
    <style>

        #zi {
            text-align: center;
        }
        .icon-text{
            font-family: 华文楷体;

        }

        .icon-text li a{
            color: #ffffff;
        }
        .uc-header-bg{
            background-color: #dbd2db;
        }
        .logo1{
            position: relative;
            margin-top:-210px;
            left:-450px;
        }
        nav{
            display: inline-block;
            margin-top:-40px;
            left:330px;
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
            padding: 0 40px;
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



    </style>
</head>

<body class="size-1140">

<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <div class="logo1"> <a class="logo" href="<%=basePath%>jsp/index.jsp">
            <img src="<%=basePath%>images/u8.png" style="height: 90px;width: 180px;" alt="" /></a></div>

    </div>
    <nav>
        <a href="">
            <span data-hover="香水">香水</span>
        </a>
        <a href="">
            <span data-hover="眼霜">眼霜</span>
        </a>
        <a href="">
            <span data-hover="洁面乳">洁面乳</span>
        </a>
        <a href="">
            <span data-hover="防晒霜">防晒霜</span>
        </a>
        <a href="">
            <span data-hover="口红">口红</span>
        </a>
        <a href="<%=basePath%>jsp/mh-address.jsp">
            <span data-hover="个人中心">个人中心</span>
        </a>
        <a href="<%=basePath%>jsp/cart.jsp">
            <span data-hover="购物车">购物车</span>
        </a>
    </nav>
</div>
<!-- PAGE CONTENT START -->
<div class="section">

    <!-- heading and description -->
    <div class="line">
        <div class="fullwidth margin-bottom-20">
            <h1 class="text-center">我的购物车</h1>
            <p class="text-center">随心所欲，享受购物</p>
            <hr class="break-small break-center">
        </div>
    </div>

    <c:if test="${empty cart||empty cart.cartItems}">

        <div class="fullwidth cart-item">

            <div class="s-12 m-8 l-9 cart-item-detail">
                <div id="zi" style="text-align: center"><h6>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    购物车里空空如也，快快逛逛吧！！！！</h6></div>
            </div>
        </div>
    </c:if>
    <c:if test="${not empty cart.cartItems}">
    <!-- cart left and right -->
    <div class="line">
        <div class="s-12 m-12 l-8">
            <c:forEach items="${cart.cartItems}" var="cart">
                <!-- item 1 -->
                <div class="fullwidth cart-item">
                    <div class="s-12 m-4 l-3 cart-item-image">
                        <img src="<%= basePath%>${cart.good.goodpic}"  alt="">
                    </div>
                    <div class="s-12 m-8 l-9 cart-item-detail">
                        <h4>${cart.good.goodname}</h4>
                        <p>
                            价格: <span class="strike">Was $150</span> Now ${cart.good.goodprice}<br />
                            数量: ${cart.count}<br />
                            总价: <span class="text-primary">${cart.subtotal}</span>
                        </p>
                        <p><a href="javascript:void(0);" onclick="removeFromCart('${cart.good.goodid}')" class="remove-item">移除</a></p>
                    </div>
                </div>
            </c:forEach>

        </div>
        <div id="right">
            <div class="s-12 m-12 l-4 margin-m-top-60 padding border-1">
                <p class="margin-bottom text-size-16">配送费: <span class="right">免费</span></p>
                <p class="margin-bottom text-size-16">总价: <span class="right">${cart.totalprice}</span></p>
                <a href="<%=basePath %>goods/removeAllCart.action?method=removeAll" class="button">清空购物车</a>&nbsp;&nbsp;
                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                <a href="<%=basePath %>goods/order.action?method=save" class="button">提交订单</a>
            </div>
        </div>
        </c:if>
        <script type="text/javascript">
            function removeFromCart(gid){
                if(confirm("您确定要删除吗？")){
                    location.href="<%=basePath %>goods/removecart.action?method=remove&gid="+gid;
                }
            }

        </script>

        <!-- cart right -->

    </div>
</div>
<!-- PAGE CONTENT END -->


<!-- RELATED PRODUCTS START -->
<div class="section padding-top-0">
    <div class="line">
        <div class="margin">
            <div class="fullwidth margin-bottom-20">
                <h2 class="text-center">热卖产品</h2>
                <hr class="break-small break-center">
            </div>

            <!-- product 1 -->
            <div class="s-12 m-4 l-3 margin-bottom-30">
                <div class="margin">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/products/1.png">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看更多</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5>Lorem Ipsum Elit Dolor</h5>
                        <p class="text-center"><span class="strike">$149.00</span> &nbsp;&nbsp; <span class="text-primary">$130.00</span></p>
                    </div>
                </div>
            </div>

            <!-- product 2 -->
            <div class="s-12 m-4 l-3 margin-bottom-30">
                <div class="margin">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/products/2.png">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看更多</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5>Lorem Ipsum Elit Dolor</h5>
                        <p class="text-center"><span class="strike">$149.00</span> &nbsp;&nbsp; <span class="text-primary">$130.00</span></p>
                    </div>
                </div>
            </div>

            <!-- product 3 -->
            <div class="s-12 m-4 l-3 margin-bottom-30">
                <div class="margin">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/products/3.png">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看更多</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5>Lorem Ipsum Elit Dolor</h5>
                        <p class="text-center"><span class="strike">$149.00</span> &nbsp;&nbsp; <span class="text-primary">$130.00</span></p>
                    </div>
                </div>
            </div>

            <!-- product 4 -->
            <div class="s-12 m-4 l-3 margin-bottom-30">
                <div class="margin">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/products/4.png">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看更多</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5>Lorem Ipsum Elit Dolor</h5>
                        <p class="text-center"><span class="strike">$149.00</span> &nbsp;&nbsp; <span class="text-primary">$130.00</span></p>
                    </div>
                </div>
            </div>

        </div>
    </div>
</div>
<!-- RELATED PRODUCTS END -->

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
            <p class="sub" >百雀羚 「至臻皙白」晶亮焕肤乳液（补水保湿 美白焕肤）</p>
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
</div>
</div>

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


