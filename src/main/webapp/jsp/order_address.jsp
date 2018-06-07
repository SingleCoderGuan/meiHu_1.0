<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
    <title>订单结算页</title>
    <link rel="stylesheet" href="<%= basePath%>plugins/bootstrap/bootstrap.min.css" />
    <link rel="stylesheet" href="<%= basePath%>plugins/layui/css/layui.css" />
    <link rel="stylesheet" href="<%= basePath%>plugins/awesome/css/font-awesome.min.css" />
    <link rel="stylesheet" href="<%= basePath%>plugins/eleme-ui/index.css" />
    <link rel="stylesheet" href="<%= basePath%>css/CivilMilitaryIntegration/public.css" />
    <link rel="stylesheet" href="<%= basePath%>css/CivilMilitaryIntegration/ShoppingCartAdress.css" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <script type="application/x-javascript"> addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); function hideURLbar(){ window.scrollTo(0,1); } </script>
    <link href="<%= basePath%>css/bootstrap1.css" rel='stylesheet' type='text/css' />
    <link href="<%= basePath%>css/style.css" rel='stylesheet' type='text/css' />
    <script src="<%= basePath%>js/jquery.min.js"> </script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700|Cinzel+Decorative:400,700' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="<%= basePath%>css/myresponsee.css">
    <link rel="stylesheet" href="<%= basePath%>css/style1.css">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link href="<%= basePath%>css/responsive1.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/html5shiv/3.7.3/html5shiv.js"></script>
    <script src="<%= basePath%>js/respond.js"></script>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>
    <style>
        #p{
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
        .layui-form{
            position: relative;
            left:150px;
            width:1119px;
        }
        .uc-content{
            position: relative;
            left:-80px;
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
        .address{
            float: left;
        }
        .button{
            position: relative;
            margin-left:800px;
            margin-top:-60px;
        }
        .pay{
            position: relative;
            margin-left:1050px;
        }


    </style>
</head>


<body style="width:100%">
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <div class="logo1"> <a class="logo" href="<%=basePath%>jsp/index.jsp">
            <img src="<%=basePath%>images/u8.png"style="height: 90px;width: 180px;" alt="" /></a></div>

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
<h1 class="text-center">结算页</h1>
<p id="p">愉快购物每一天！</p>


<div class="uc-content">
    <div class="uc-panel">
        <div class="uc-bigtit">收货地址</div>
        <div class="button"> <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" data-whatever="@mdo">新增地址</button></div>

        <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
            <div class="modal-dialog" role="document">
                <div class="modal-content">
                    <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                        <h4 class="modal-title" id="exampleModalLabel">新增地址</h4>
                    </div>
                    <div class="modal-body">
                        <form action="<%=basePath %>goods/address.action" method="post">
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">地址:</label>
                                <input type="text" name="address" class="form-control" id="recipient-name">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">详细地址:</label>
                                <input type="text" name="addressdetail" class="form-control" id="recipient-name1">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">收货人姓名:</label>
                                <input type="text" name="receivename" class="form-control" id="recipient-name2">
                            </div>
                            <div class="form-group">
                                <label for="recipient-name" class="control-label">收货人联系方式:</label>
                                <input type="text" name="receivetel" class="form-control" id="recipient-name3">
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button type="submit" class="btn btn-primary">确定</button>
                            </div>
                        </form>
                    </div>

                </div>
            </div>
        </div>
        <script>
            $('#exampleModal').on('show.bs.modal', function (event) {
                var button = $(event.relatedTarget) // Button that triggered the modal
                var recipient = button.data('whatever') // Extract info from data-* attributes
                // If necessary, you could initiate an AJAX request here (and then do the updating in a callback).
                // Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.
                var modal = $(this)
                modal.find('.modal-title').text('New message to ' + recipient)
                modal.find('.modal-body input').val(recipient)
            })
        </script>
        <div class="uc-panel-bd">



            <div class="address-list">
              <c:forEach items="${addressList}" var="address">
                <div class="col col-4">
                    <div class="item">
                        <div class="action">
                            <div class="fl"><a class="edit" href="javascript:;">修改</a><a class="del" href="javascript:;">删除</a></div>
                            <div class="fr"><a class="setdft" href="javascript:;">设为默认</a></div>

                        </div>
                        <div class="info">

                             <div class="address1">
                               <ul>
                                <li >${address.address}</li>
                                <li >${address.addressdetail}</li>
                                <li>${address.receivename}</li>
                                <li>${address.receivetel}</li>
                               </ul>
                            </div>


                       </div>
                    </div>
                </div>
               </c:forEach>
            </div>

        </div>
    </div>
</div>


    <div id="orders" class="row deliverymode">

        <div class="col-lg-9 deliverymodeRight" >

            <div class="layui-form">
                <div class="uc-bigtit">我的订单</div>
                <table class="layui-table">
                    <tr>
                        <th colspan="2">订单编号：${order.orderid}</th>
                        <th colspan="1">未付款</th>
                        <th colspan="2">时间：<fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd HH:mm:ss"/> </th>
                    </tr>
                    <tr>
                        <th>商品图片</th>
                        <th>商品名称</th>
                        <th>商品价格</th>
                        <th>数量</th>
                        <th>小计</th>
                    </tr>
                    <c:forEach items="${order.items}" var="order">
                        <tr>
                            <td><img src="<%=basePath %>${order.good.goodpic}" width="50px" height="50px"/></td>
                            <td>${order.good.goodname}</td>
                            <td>${order.good.goodprice}</td>
                            <td>${order.count}</td>
                            <td>${order.subtotal}</td>
                        </tr>
                    </c:forEach>
                    <tr>
                        <td colspan="3"></td>
                        <td><a href="javascript:void(0)" onclick='remove()'>取消订单</a></td>
                        <td><a href="<%=basePath %>jsp/cart.jsp">返回修改购物车</a></td>
                    </tr>
                </table>



            </div>
        </div>
    </div>






<script type="text/javascript">
    function remove() {
        if(confirm("您确定要取消订单吗？")){
            $.ajax({
                type:"get",
                url:"<%=basePath %>goods/deleteOrder.action",
                data:"orderid="+${order.orderid},
                success:function(result){
                    $("#orders").html("");
                    $("#payform").html("");
                }

            });
        }
    }
</script>
<div class="pay">
    <form id="payform" action="<%=basePath %>goods/pay.action" method="post">
    <div class="contenterFooter">
        <p>总金额：<span class="footerPrice">￥${order.total}</span></p>
        <p>运费：<span class="footerPrice">￥0.00</span></p>
    </div>
    <div class="clearfix"></div>
    <div class="row footerRow">
        <span class="footerRowprice">应付金额：<span>${order.total}元</span></span>

    </div>
    <button class="btn submitForm" onclick="click()">确定提交</button>
</form>
</div>




<!--主要内容-->

<!-- SLIDESHOW START -->
<div class="carousel-fade-transition owl-carousel carousel-main">
    <!-- slide 1 -->
    <div class="item">
        <!-- slideshow photo -->
        <div class="image-box">
            <div class="image">
                <img src="<%= basePath%>img/slideshow/banner31.jpg" alt="">
            </div>
        </div>
        <!-- slideshow content -->
        <div class="carousel-content">
            <div class="content-center-vertical line">
                <div class="s-12 m-8 l-7">
                    <h1 class="h1">请相信化妆的神奇力量</h1>
                    <p class="p">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis eum iriure dolor in hendrerit in vulputate.</p>
                    <div class="animated-carousel-element">
                        <a href="" class="slideshow-btn">立即购物</a><a href="" class="slideshow-btn2">查看更多</a>
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
                <img src="<%= basePath%>img/slideshow/banner31.jpg" alt="">
            </div>
        </div>


        <!-- slideshow content -->
        <div class="carousel-content">
            <div class="content-center-vertical line">
                <div class="s-12 m-8 l-7">
                    <h1 class="h1">请让自己的肌肤保持长时间的水润嫩白</h1>
                    <p class="p">Duis autem vel eum iriure dolor in hendrerit in vulputate velit esse molestie consequat, vel illum dolore eu feugiat nulla facilisis eum iriure dolor in hendrerit in vulputate.</p>
                    <div class="animated-carousel-element">
                        <a href="" class="slideshow-btn">立即购物</a><a href="" class="slideshow-btn2">查看更多</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- SLIDESHOW END -->


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
<!--js类引用-->
<script type="text/javascript" src="<%= basePath%>plugins/jquery/jquery.min.js"></script>
<script type="text/javascript" src="<%= basePath%>plugins/bootstrap/bootstrap.min.js"></script>
<script type="text/javascript" src="<%= basePath%>plugins/vue/vue.js"></script>
<script type="text/javascript" src="<%= basePath%>plugins/eleme-ui/index.js"></script>
<script type="text/javascript" src="<%= basePath%>js/CivilMilitaryIntegration/ShoppingCart.js"></script>
<!--<script type="text/javascript" src="js/CivilMilitaryIntegration/abc.js" ></script>-->




</body>
</html>
