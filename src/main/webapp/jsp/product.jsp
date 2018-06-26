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

        #tu{
            width:300px;
            hight:300px;
            /*border-image: solid 2px ;*/


        }
        .icon-text{
            font-family: 华文楷体;

        }
        .icon-text li a{
            color: #ffffff;
        }

        .logo1{
            position: relative;
            margin-top:-230px;
            left:-450px;

        }
        nav{
            display: inline-block;
            top:-60px;
            left:460px;
            font-family: 本墨锵黑;
            font-size: 16px;


        }
        nav a{
            display: inline-block;
            color: white;
            text-decoration: none;
            perspective:200px;
        }
        nav a span{
            line-height: 40px;
            background-color: #fdf0ef;
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
            background-color: #000000;
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
            position: relative;
            margin-top: -30px;
            margin-left: 200px;
            width: 30px;
            height: 30px;
            cursor:pointer;
        }
        #jian{
            position: relative;
            margin-top: -30px;
            margin-left: 60px;
            width: 30px;
            height: 30px;
            cursor:pointer;
        }
        .uc-header-bg{
            /*background-color: #f39894;*/
            background-color: #ffded9;

            height:90px;
        }
        #shoucang{
            position: relative;
            top:-23px;
            left: 80px;
            height:20px;
            width:20px;
        }
        .section{
            background-color: #fdf0ef;
        }



    </style>



</head>

<body class="size-1140">


<!-- SLIDESHOW START -->
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <div class="logo1"> <a class="logo" href="<%=basePath%>jsp/index.jsp">
            <img src="<%=basePath%>images/LOGOMeiTao.png" style="width:100px;height:70px;" alt="" /></a></div>

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
        <a href="<%=basePath%>goods/myOrder.action">
            <span data-hover="个人中心">个人中心</span>
        </a>
        <a href="<%=basePath%>jsp/cart.jsp">
            <span data-hover="购物车">购物车</span>
        </a>
    </nav>
</div>
<!-- SLIDESHOW END -->
<!-- PRODUCT DETAIL START -->
<div class="section">
    <div class="line">
        <div class="margin">
            <!-- product image -->
            <div class="s-12 m-4 l-5 margin-bottom">
                <div id="tu"><img src='<%=basePath %>${product.goodpic}'style="border-radius:90%"/></div>
            </div>
            <!-- product detail -->
            <div class="s-12 m-8 l-7 padding-l-left">
                <h2 class="text-primary">${product.goodname}</h2>
                <p>${product.gooddetail}</p>
                <p>抢购价：${product.goodprice}</p>
                <p>生产地：${product.goodaddress}</p>
                <p>月销量：${product.goodsales}件</p>
                <ul class="speciality margin-bottom">
                    <li>不一样的体验</li>
                    <li>重回二十岁,enjoy yourself</li>
                    <li>青春永驻，靓丽人生</li>
                </ul>
                <div class="fullwidth margin-bottom-40">
                    <div>
                        <form class="form-inline" action="<%= basePath%>goods/cart.action" id="form1" method="post">
                            <input type="hidden" name="method" value="addCart">
                            <input type="hidden" name="gid" value="${product.goodid }" >


                            <div class="form-group">
                                <label for="countvalue">购买数量</label>
                                <input type="text" class="form-control" name="count" id="countvalue" style="text-align: center" value="1">
                            </div>
                            <%--<input id="countvalue" type="text" name="count" value="1">--%>
                            <div id="jia"><img  id="jiacount" src="<%=basePath%>images/+.png"/></div>
                            <div id="jian"><img  id="jiancount"src="<%=basePath%>images/-.png"/></div>
                        </form>

                    </div>
                </div>
                <script>
                    $("#jiacount").click(function(){
                        var count=parseInt($("#countvalue").val());
                        $("#countvalue").val(count+1);
                    });
                    $("#jiancount").click(function(){
                        var count=parseInt($("#countvalue").val());
                        var newcount=count-1;
                        if(newcount<=1) {
                            $("#countvalue").val(1);
                        }else{
                            $("#countvalue").val(newcount);
                        }
                    });
                </script>
                <div class="s-12 m-6 l-4">
                    <a href="javascript:void(0)" class="button" onclick="subForm()">加入购物车</a>
                </div>
                <div class="s-12 m-6 l-4">
                    <a href="javascript:void(0)" class="button" onclick="favorGood(${product.goodid})">
                        添加收藏 &nbsp;&nbsp;&nbsp;</a><img id="shoucang"
                                     src="../images/shoucang.png"/>
                </div>
                <div class="bdsharebuttonbox share-icons">
                    <a href="#" class="bds_more" data-cmd="more"></a>

                    <a href="#" class="bds_qzone" data-cmd="qzone" title="分享到QQ空间"></a>
                    <a href="#" class="bds_tsina" data-cmd="tsina" title="分享到新浪微博"></a>
                    <a href="#" class="bds_weixin" data-cmd="weixin" title="分享到微信"></a>
                </div>

            </div>
        </div>
    </div>
</div>
<script>
    window._bd_share_config = {
        "common": {
            "bdSnsKey": {},
            "bdText": "",
            "bdMini": "2",
            "bdMiniList": false,
            "bdPic": "",
            "bdStyle": "0",
            "bdSize": "24"
        }, "share": {}
    };
    with (document) 0[(getElementsByTagName('head')[0] || body).appendChild(createElement('script')).src = 'http://bdimg.share.baidu.com/static/api/js/share.js?v=89860593.js?cdnversion=' + ~(-new Date() / 36e5)];
</script>

<!-- PRODUCT DETAIL END -->
<script type="text/javascript">
    function favorGood(goodid1) {
        <c:choose>
        <c:when test="${empty sessionScope.user}">
        alert("亲，请先登录");

        window.location.href="<%=basePath%>jsp/loginregister.jsp";
        </c:when>
        <c:otherwise>
        if($("#shoucang").attr("src")==("../images/shoucang.png")){
            $.ajax(
                {
                    type: "post",
                    url: "${pageContext.request.contextPath}/favor/favorGood.action",
                    data: "uid=" + ${sessionScope.user.uid} + "&goodid="+goodid1,
                    success:function (data) {
                        if(data==1){
                            alert("收藏成功，可以到我的收藏中查看！");
                            $("#shoucang").attr("src","../images/shoucanghou.png");
                        }else if(data==2){
                            alert("您已经收藏过该商品了");
                        }

                    }

                }
            );
        }/*else{
            $("#shoucang").attr("src","../images/shoucang.png");
            $.ajax(
                {
                    type: "post",
                    url: "${pageContext.request.contextPath}/favor/quxiaoFavor.action",
                    data: "uid=" + ${sessionScope.user.uid} + "&goodid=" + goodid1,
                    success:function (data) {
                        if(data==1){
                            alert("取消收藏成功");
                        }
                    }
                }
            );
        }*/
        </c:otherwise>
        </c:choose>

    }
</script>
<script type="text/javascript">
    function subForm(){
        document.getElementById("form1").submit();
    }
</script>



<!-- PRODUCT TAB START -->
<div class="section padding-top-0">
    <div class="line">
        <div class="fullwidth">
            <div class="tabs left">
                <div class="tab-item">
                    <a class="tab-label">极致特效</a>
                    <div class="tab-content padding-left-10">
                        <h3>极致特效</h3>
                        <p class="margin-bottom">肌肤是女人永葆青春的最直接的体现。</p>
                        <ul class="speciality padding padding-top-0">
                            <li>此款化妆品让你体会不一样的疗养特效</li>
                            <li>睡前请让自己精致美美哒</li>
                            <li>遇见更美丽的自己</ul>
                    </div>
                </div>
                <div class="tab-item tab-active">
                    <a class="tab-label active-btn">相关描述</a>
                    <div class="tab-content padding-left-10">
                        <h3>相关描述</h3>
                        <p>${product.gooddetail}</p>
                        <p>新品上市，快快来体验吧！</p>
                        <p>遇见更美丽的自己！邂逅最正确的他！！</p>
                        <p>相信我们，我们会是你最好的选择！！！！</p>
                        <p>最好的化妆，其实不是去掩盖一个人的缺点，而是去突出一个人的优点。就像爱情一样，当你爱一个人的时候，你眼中只是看到对方的优点，不是看不见缺点，而是不介意，好的化妆，不是伪装。</p>
                    </div>
                </div>

                <div class="tab-item">
                    <a class="tab-label">购买优惠</a>
                    <div class="tab-content padding-left-10">
                        <h3>购买优惠</h3>
                        <p>现阶段购买，优惠多多</p>
                    </div>
                </div>
                <div class="tab-item">
                    <a class="tab-label">商品评论</a>
                    <div class="tab-content padding-left-10" style="width: 1075px">
                        <h3>评论详情</h3>
                        <c:if test="${empty comments}">
                            <h2 style="position: relative;left: 250px;">该商品暂时还没有评论</h2>
                        </c:if>
                        <c:forEach items="${comments}" var="comment">
                            <div>
                                <img style="position: relative;width: 50px;height: 50px;"
                                     src="<%=basePath%>${comment.forumUser.headpic}">
                                <span>${comment.forumUser.uname}</span>
                                <span style="position: relative; top: -30px;left: 50px;">${comment.content}</span>
                                <span style="position: relative;left: 500px;text-align: right"><fmt:formatDate
                                        value='${comment.createtime}'
                                        pattern='yyyy-MM-dd hh:mm:ss'/></span>
                            </div>
                        </c:forEach>

                    </div>
                    <br>

                    <hr />
                    <br>
                    <c:if test="${not empty post}">
                        <div style="position: relative;left: 250px;top: -50px;">

                            <div style="position: relative;top: 20px;">
                                美论热帖： <a href="<%=basePath%>luntan/tiezidetail.action?pid=${post.pid}">${post.ptitle}</a>
                                <span style="position: relative;left: 200px;">${post.user.uname}</span>&nbsp;
                                 <span style="position: relative;left: 200px"><fmt:formatDate value='${post.createtime}'
                                                                                             pattern='yyyy-MM-dd hh:mm:ss'/></span>
                            </div>
                            <a style="position: relative;top: 50px;color: deeppink"
                               href="<%=basePath%>search/goodsPosts.action?goodid=${product.goodid}">去美论查看更多关于${product.goodname}的热帖</a>
                        </div>
                    </c:if>
                    <c:if test="${empty post}">
                        <div style="position: relative;left: 250px;top: 10px;">
                            <h2 style="position: relative;color: grey;font-size: 20px">美论还没有该商品相关帖子</h2>
                        </div>
                        <a style="position: relative;left: 250px;top: 0px;color: hotpink"
                           href="<%=basePath%>luntan/luntanshouye.action?tid=1">去美论查看更多热帖>></a>
                    </c:if>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- PRODUCT TAB END -->



<!-- RELATED PRODUCTS START -->
<div class="section padding-top-0">
    <div class="line">
        <div class="margin">
            <div class="fullwidth margin-bottom-20">
                <h2 class="text-center">相关推荐</h2>
                <hr class="break-small break-center">
            </div>

            <c:forEach items="${recommendGoodsList}" var="recommendGood">
                <div class="s-12 m-4 l-3 margin-bottom-30">
                    <div class="margin">
                        <div class="fullwidth">
                            <figure class="imghvr-reveal-down">
                                <img src="<%= basePath%>${recommendGood.goodpic}">
                                <figcaption>
                                    <div class="product-hover-content">
                                        <div class="btn-box">
                                            <a href="<%=basePath%>goods/list.action?goodid=${recommendGood.goodid}" class="btn">查看详情</a>
                                        </div>
                                    </div>
                                </figcaption>
                            </figure>
                        </div>
                        <div class="fullwidth">
                            <h5>${recommendGood.goodname}</h5>
                            <p class="text-center"><span class="strike">$149.00</span> &nbsp;&nbsp; <span class="text-primary">${recommendGood.goodprice}</span></p>
                        </div>
                    </div>
                </div>
            </c:forEach>
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
                    <a href=""><img src="<%= basePath%>images/1_06.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href=""><img src="<%= basePath%>images/4_15.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href=""><img src="<%= basePath%>images/6_03.jpg" alt=""/></a>
                </div>
                <div class="clearfix"> </div>

                <div class="flickr-grid">
                    <a href=""><img src="<%= basePath%>images/3_05.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href=""><img src="<%= basePath%>images/2_04.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href=""><img src="<%= basePath%>images/5_09.jpg" alt=""/></a>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<script src="https://qiyukf.com/script/8461da5aef2206ef029adb41eea97bfb.js"></script>

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

