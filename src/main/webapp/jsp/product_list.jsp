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
    <title>分类浏览商品</title>
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
    <!--[if lt IE 9]><script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script><![endif]-->
    <!--[if lt IE 9]><script src="<%= basePath%>js/respond.js"></script><![endif]-->

    <style>
        .h1{
            color:white;
        }
        .p{
            color:white;
        }
        #imgs{
            width:220px;
            hight:180px;
        }
        .icon-text{
            font-family: 华文楷体;
        }
        .icon-text li a{
            color: white;
        }
        .section{
            position: relative;
            margin-bottom:-52px;
        }
        .image{
            position: relative;
            width: 1680px;
            height: 836px;
        }
        .footer-section{
            position: relative;
            width:1310px;
            left:20px;
        }
        .copyright{
            position: relative;
            width:1310px;
            left:20px;
        }
    </style>
</head>

<body class="size-1140">

<!-- SLIDESHOW START -->
<div class="carousel-fade-transition owl-carousel carousel-main">
    <!-- slide 1 -->
    <div class="item">
        <!-- slideshow photo -->
        <div class="image-box">
            <div class="image">
                <img src="<%= basePath%>img/slideshow/banner40.jpg" alt="">
            </div>
        </div>
        <!-- slideshow content -->
        <div class="carousel-content">
            <div class="content-center-vertical line">
                <div class="s-12 m-8 l-7">
                    <h1 class="h1">化妆的神奇魔力</h1>
                    <p class="p">The magic power of make-up.Do not miss every wonderful moment, love him, love yourself.</p>
                    <div class="animated-carousel-element">
                        <a href="" class="slideshow-btn">立即购物</a><a href="" class="slideshow-btn2">查看更多</a>
                        &nbsp;  &nbsp;<a href="<%=basePath%>jsp/index.jsp" class="slideshow-btn">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- slide 2 -->
    <div class="item">
        <!-- slideshow photo -->
        <div class="image-box">
            <div class="image">
                <img src="<%= basePath%>images/f31.jpg" alt="">
            </div>
        </div>


        <!-- slideshow content -->
        <div class="carousel-content">
            <div class="content-center-vertical line">
                <div class="s-12 m-8 l-7">
                    <h1 class="h1">肌肤水润嫩白，精致每一天</h1>
                    <p class="p">Skin water and whitening, delicate every day.Every day I have to be wonderful.</p>
                    <div class="animated-carousel-element">
                        <a href="" class="slideshow-btn">立即购物</a><a href="" class="slideshow-btn2">查看更多</a>
                        &nbsp; &nbsp;<a href="<%=basePath%>jsp/index.jsp" class="slideshow-btn">返回首页</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- SLIDESHOW END -->




<!-- PRODUCTS TAB START -->

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

                        <c:forEach items="${glist}" var="goods">
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

    <!-- ABOUT US START -->
    <div class="section">
        <div class="line">
            <!-- heading -->
            <h1 class="text-center">关于我们</h1>
            <hr class="break-small break-center">
            <div class="margin">
                <!-- block 1 -->
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="fa fa-paper-plane-o fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Water milk</h3>
                        <p>Whitening moisturizing nourishing moisturizing whitening cream pearl white pure smooth rich and moist curd.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
                <!-- block 2 -->
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="fa fa-eye fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Eye Cream</h3>
                        <p>Fine lines, dark circles,pouch lifting,tight and light eye (compact repair) instant eye care,eye care desalination.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
                <!-- block 3 -->
                <div class="s-12 m-6 l-4 margin-bottom-60">
                    <div class="float-left">
                        <i class="fa fa-diamond fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Fragrance</h3>
                        <p>The fragrance is strong, the lady is persistent fragrant pink tender fragrant fragrant and sweet and the lady likes it.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
                <!-- block 4 -->
                <div class="s-12 m-6 l-4 margin-m-bottom-60">
                    <div class="float-left">
                        <i class="fa fa-calendar fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Mildy Wash</h3>
                        <p>Face moistening foam cleanser oil control charcoal anti black face cleansing cream mild transparent and transparent mining.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
                <!-- block 5 -->
                <div class="s-12 m-6 l-4 margin-m-bottom-60">
                    <div class="float-left">
                        <i class="fa fa-heart-o fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Sunscreen Cream</h3>
                        <p>Snow moisturizing cream, sunscreen cream, fresh water, light, refreshing, sunscreen, light and double Nude blemish.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
                <!-- block 6 -->
                <div class="s-12 m-6 l-4">
                    <div class="float-left">
                        <i class="fa fa-question-circle-o fa-3x text-primary"></i>
                    </div>
                    <div class="margin-left-60">
                        <h3>Lipstick</h3>
                        <p>Pure Olive Lip Gloss colorful core,lip balm vitality scarlet sugar nourishing moisturizing, moisturizing, moisturizing and moisturizing.</p>
                        <a class="text-more-info text-primary-hover" href="">Read more</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ABOUT US END -->

    <!-- BRAND OVERVIEW START -->
    <div class="background-dark section">
        <div class="line">
            <!-- heading -->
            <h1 class="text-white text-center">精致服务</h1>
            <hr class="break-small break-center">
            <!-- slideshow start -->
            <div class="carousel-blocks">
                <!-- slideshow item 1 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/1.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">按摩护理</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 2 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/8.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">美甲护理</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 3 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/4.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">精修美瞳</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 4 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/3.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">面部护理</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 5 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/2.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">轻松减肥</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 6 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/5.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">时尚美发</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 7 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/6.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">时尚前沿</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
                <!-- slideshow item 8 -->
                <div class="item">
                    <div class="fullwidth">
                        <figure class="imghvr-reveal-down">
                            <img src="<%= basePath%>img/services/7.jpg">
                            <figcaption>
                                <div class="product-hover-content">
                                    <div class="btn-box">
                                        <a href="" class="btn">查看详情</a>
                                    </div>
                                </div>
                            </figcaption>
                        </figure>
                    </div>
                    <div class="fullwidth">
                        <h5 class="text-white text-center">无痛剃毛</h5>
                        <p class="text-center"><span class="text-dark-light">Starting from</span> - <span class="text-primary">$299</span></p>
                    </div>
                </div>
            </div>
            <!-- slideshow end -->
        </div>
    </div>



    <!-- TESTIMONIALS START -->
    <div class="section background-dark">
        <div class="line">
            <!-- heading -->
            <h1 class="text-white text-center"><span class="text-primary">客户</span> 体验</h1>
            <hr class="break-small break-center">
            <!-- slideshow start -->
            <div class="carousel-default owl-carousel carousel-wide-arrows margin-top-20">
                <!-- slideshow item 1 -->
                <div class="item">
                    <div class="s-12 m-12 l-7 center text-center">
                        <img class="image-testimonial-small" src="<%= basePath%>img/testimonials/testimonials-01.png" alt="">
                        <p class="text-white margin-bottom testimonial">
                            风格是我们每个人已有的特质，我们需要做的就是找到它。
                            任何人都可以打扮得光鲜亮丽，但个人品味流露于日常穿着。</p>
                        <p class="text-dark-light">赛琳娜</p>
                    </div>
                </div>
                <!-- slideshow item 2 -->
                <div class="item">
                    <div class="s-12 m-12 l-7 center text-center">
                        <img class="image-testimonial-small" src="<%= basePath%>img/testimonials/testimonials-02.png" alt="">
                        <p class="text-white margin-bottom testimonial">如果你为了生活中自己想要的东西而着装打扮，你会得到你想要的一切。</p>
                        <p class="text-dark-light">江语嫣</p>
                    </div>
                </div>
                <!-- slideshow item 3 -->
                <div class="item">
                    <div class="s-12 m-12 l-7 center text-center">
                        <img class="image-testimonial-small" src="<%= basePath%>img/testimonials/testimonials-01.png" alt="">
                        <p class="text-white margin-bottom testimonial">你的穿着是你向世界展示自己的方式，特别是在当下，人与人之间的接触那么短暂，而时尚却是瞬间实现的沟通。</p>
                        <p class="text-dark-light">王纤纤</p>
                    </div>
                </div>
                <!-- slideshow item 4 -->
                <div class="item">
                    <div class="s-12 m-12 l-7 center text-center">
                        <img class="image-testimonial-small" src="<%= basePath%>img/testimonials/testimonials-02.png" alt="">
                        <p class="text-white margin-bottom testimonial">她的眉毛用墨描过，胳膊、肘子、肩膀、下巴、鼻孔底下、上眼皮、耳朵、手掌、手指尖都涂过油脂，发出一种惹人注意的难以形容的红光。</p>
                        <p class="text-dark-light">邱颖颖</p>
                    </div>
                </div>
            </div>
            <!-- slideshow end -->
        </div>
    </div>
    <!-- TESTIMONIALS END -->

    <!--/start-footer-section-->
</div>
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
<%--</div>--%>
   <!-- jQuery Files -->
    <script type="text/javascript" src="<%= basePath%>js/jquery-3.1.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>js/jquery-ui.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>owl-carousel/owl.carousel.js"></script>
    <script type="text/javascript" src="<%= basePath%>js/custom.js"></script>

</body>
</html>
