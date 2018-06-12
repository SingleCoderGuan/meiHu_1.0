<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML>
<html>
<head>
    <title>商城首页</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="New Trendz Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="<%= basePath%>css/bootstrap.css" rel='stylesheet' type='text/css' />
    <link href="<%= basePath%>css/style.css" rel='stylesheet' type='text/css' />
    <script src="<%= basePath%>js/jquery.min.js"> </script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700|Cinzel+Decorative:400,700' rel='stylesheet' type='text/css'>
    <style>
        #img{
            position:absolute;
            left:100px;
        }
        .icon-text{
            font-family: 华文楷体;
        }
    </style>

</head>
<body>
<!--start-home-->
<div class="full">
    <span class="menu"></span>
    <div class="navbar">
        <a class="menu" href="#"><i class="icon-align-justify"></i></a>
        <a class="link hme" href="#">
            <span class="active"><span class="valign"><span class="vertical">首页</span></span></span>
            <span class="hover"><span class="valign"><span class="vertical">首页</span></span></span>
        </a>
        <a class="link abt" href="<%= basePath %>goods/glists.action?categoryid=1">
            <span class="active"><span class="valign"><span class="vertical">商品浏览</span></span></span>
            <span class="hover"><span class="valign"><span class="vertical">商品浏览</span></span></span>
        </a>
        <a class="link abt" href="<%=basePath %>jsp/cart.jsp">
            <span class="active"><span class="valign"><span class="vertical">购物车</span></span></span>
            <span class="hover"><span class="valign"><span class="vertical">购物车</span></span></span>
        </a>
        <a class="link abt" href="<%=basePath %>jsp/mh-orders.jsp">
            <span class="active"><span class="valign"><span class="vertical">我的订单</span></span></span>
            <span class="hover"><span class="valign"><span class="vertical">我的订单</span></span></span>
        </a>
        <a class="link abt" href="#">
            <span class="active"><span class="valign"><span class="vertical">关于我们</span></span></span>
            <span class="hover"><span class="valign"><span class="vertical">关于我们</span></span></span>
        </a>
    </div>
    <!-- script for menu -->
    <script>
        $( "span.menu" ).click(function() {
            $( ".navbar" ).slideToggle( "slow", function() {
                // Animation complete.
            });
        });
    </script>
    <!--main-->
    <div class="main">
        <div id="home" class="header">
            <div class="header-top">
                <div class="container">
                    <div class="logo">
                        <a href="index.html"><h1>美 <br>
                            <span>淘</span></h1></a>
                    </div>
                </div>
            </div>
        </div>
        <!--about-->


        <!----trends--->
        <div class="trends">
            <div class="second-head">
                <h3>肤世界</h3>
                <p>  她肌肤胜雪，双目犹似一泓清水，顾盼之际，自有一番清雅高华的气质，让人为之所摄、自惭形秽、不敢亵渎。但那冷傲灵动中颇有勾魂摄魄之态，又让人不能不魂牵蒙绕.</p><p>为你的美丽开一扇窗</p>
            </div>
            <div class="grid">
                <figure class="effect-terry">
                    <img src="<%= basePath%>images/p5.jpg" alt="img16"/>
                    <figcaption>
                        <h2 style="font-family:Tahoma, Geneva, sans-serif"><a href="<%= basePath %>goods/glist.action?categoryid=5">奢华&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;  <span> 眼霜</span></a></h2>
                        <p>
                            <a href="#"><i class="download"></i></a>
                            <a href="#"><i class="heart"></i></a>
                            <a href="#"><i class="share"></i></a>
                            <a href="#"><i class="tag"></i></a>
                        </p>
                    </figcaption>
                </figure>
                <figure class="effect-terry">
                    <img src="<%= basePath%>images/p1.jpg" alt="img26"/>

                    <figcaption>
                        <h2><a href="<%= basePath %>goods/glist.action?categoryid=1">烈焰&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>蓝金</span></a></h2>
                        <p>
                            <a href="#"><i class="download"></i></a>
                            <a href="#"><i class="heart"></i></a>
                            <a href="#"><i class="share"></i></a>
                            <a href="#"><i class="tag"></i></a>
                        </p>
                    </figcaption>
                </figure>
                <figure class="effect-terry">
                    <img src="<%= basePath%>images/p2.jpg" alt="img26"/>
                    <figcaption>
                        <h2><a href="<%= basePath %>goods/glist.action?categoryid=4">莱斯璧&nbsp;&nbsp;&nbsp; &nbsp;&nbsp;&nbsp;<span> 防晒</span></a></h2>
                        <p>
                            <a href="#"><i class="download"></i></a>
                            <a href="#"><i class="heart"></i></a>
                            <a href="#"><i class="share"></i></a>
                            <a href="#"><i class="tag"></i></a>
                        </p>
                    </figcaption>
                </figure>
                <figure class="effect-terry">
                    <img src="<%= basePath%>images/p3.jpg" alt="img26"/>
                    <figcaption>
                        <h2><a href="<%= basePath %>goods/glist.action?categoryid=2">花漾&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>甜香</span></a></h2>
                        <p>
                            <a href="#"><i class="download"></i></a>
                            <a href="#"><i class="heart"></i></a>
                            <a href="#"><i class="share"></i></a>
                            <a href="#"><i class="tag"></i></a>
                        </p>
                    </figcaption>
                </figure>
                <figure class="effect-terry">
                    <img src="<%= basePath%>images/p4.jpg" alt="img26"/>
                    <figcaption>
                        <h2><a href="<%= basePath %>goods/glist.action?categoryid=3"> 锐度&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <span>梦希蓝</span></a></h2>
                        <p>
                            <a href="#"><i class="download"></i></a>
                            <a href="#"><i class="heart"></i></a>
                            <a href="#"><i class="share"></i></a>
                            <a href="#"><i class="tag"></i></a>
                        </p>
                    </figcaption>
                </figure>
            </div>
            <div class="clearfix"> </div>
        </div>
        <!--/start-featured-->
        <div class="featured-section">
            <div class="second-head">
                <h3>The Mysteries Of Fashion</h3>
                <p>We are fashion vanguards. We are the protagonist of fashion. Do not say we are innocent. quis nostrud.They are varied in style, taste and presentation.</p>
            </div>
            <div id="img"><img src="<%=basePath %>img/18.jpg" width="600px" height="500px"/></div>
            <div class="featured-video">
                <div class="col-md-6 video">
                </div>
                <div class="col-md-6 video-text">
                    <h4>时尚的奥秘</h4>
                    <p>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;时尚是跟随潮流，风格则是成为你自己。
                        时尚是平庸生活的避难所。
                        风格是我们每个人已有的特质，我们需要做的就是找到它。
                        任何人都可以打扮得光鲜亮丽，但个人品味流露于日常穿着。
                        你的穿着是你向世界展示自己的方式，特别是在当下，人与人之间的接触那么短暂，而时尚却是瞬间实现的沟通。
                        如果你为了生活中自己想要的东西而着装打扮，你会得到你想要的一切。<br/>
                    </p>
                    <p class="second">Fashion is the refuge of mediocrity.
                        Style is something we all have, and what we need to do is find it.
                        Anyone can be dressed up to the nines, but personal taste is revealed in everyday wear.
                        What you wear is the way you present yourself to the world, especially in the present, where human contact is so brief, and fashion is instant communication.
                        If you dress for what you want in life, you'll get everything you want.</p>
                    <a class="read" href="#">阅读更多....</a>

                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <!--/start-bottom-->
        <div class="bottom-section">
            <div class="second-head two">


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
<!--start-smoth-scrolling-->
<script type="text/javascript">
    jQuery(document).ready(function($) {
        $(".scroll").click(function(event){
            event.preventDefault();
            $('html,body').animate({scrollTop:$(this.hash).offset().top},1000);
        });
    });
</script>
<!--start-smoth-scrolling-->
<script type="text/javascript">
    $(document).ready(function() {
        /*
        var defaults = {
              containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
         };
        */

        $().UItoTop({ easingType: 'easeOutQuart' });

    });
</script>
<a href="#home" id="toTop" class="scroll" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>

</body>
</html>