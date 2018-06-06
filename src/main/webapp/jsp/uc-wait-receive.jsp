<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html lang="zh-CN">
<head>
    <meta name="renderer" content="webkit|ie-comp|ie-stand">
    <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
    <meta charset="utf-8">
    <meta http-equiv="Cache-Control" content="no-siteapp">
    <title>我的待收货</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>

    <style>
        .uc-header-bg{
            background-color: #cdc6d7;
        }
    </style>
</head>
<body>
<!--头部-->
<div class="topper">
    <div class="wrapper">
        <div class="left-bar">
            <div class="back-home divider">
                <em></em><a href="#">美淘商城</a>
            </div>
            <div class="item"><a href="#">登录</a></div>
            <div class="item"><a href="#">注册</a></div>
        </div>
        <div class="right-bar">
            <div class="login-user sub-menu">
                <a class="menu-hd" href="">txtangxia<em></em></a>
                <div class="down">
                    <a href="">内容</a>
                    <a href="">内容</a>
                    <a href="">内容</a>
                </div>
            </div>
            <div class="item"><a href="#">消息（<span class="txt-theme">0</span>）</a></div>
            <div class="logout divider"><a href="<%=basePath%>jsp/login.jsp">退出</a></div>
            <span class=""></span>
            <div class="cart"><em></em><a href="<%=basePath%>jsp/cart.jsp">购物车<span class="txt-theme">2</span>件</a></div>
            <div class="order"><em></em><a href="<%=basePath%>jsp/uc-order.jsp">我的订单</a></div>
            <div class="fav"><em></em><a href="#">我的收藏</a></div>
            <div class="help"><em></em><a href="<%=basePath%>jsp/help.jsp">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <a class="logo" href="<%=basePath%>jsp/index.jsp"><img src="<%=basePath%>images/u8.png" alt="" /></a>
        <div class="back-home"><a href="">返回商城首页</a></div>
        <ul class="uc-nav">
            <li><a href="<%=basePath%>jsp/index.jsp">首页</a></li>
            <li class="toggle">
                <span class="label">账户设置<i class="iconfont"></i></span>
                <div class="toggle-cont">
                    <a href="#">个人信息</a>
                    <a href="<%=basePath%>jsp/uc-address.jsp">收货地址</a>
                </div>
            </li>
            <li><a href="#">系统消息</a></li>
        </ul>
        <div class="schbox">
            <form action="" method="post">
                <input class="search-txt" type="text" placeholder="请输入搜索内容"/>
                <button class="search-btn">搜索</button>

            </form>
        </div>
    </div>
</div>

<div class="wrapper uc-router">
    <ul>
        <li><a href="<%=basePath%>jsp/index.jsp">首页</a></li>
        <li><span class="divider"></span></li>
        <li><span>个人中心</span></li>
    </ul>
</div>

<div class="wrapper">
    <div class="uc-main clearfix">
        <div class="uc-aside">
            <div class="uc-menu">
                <div class="tit">订单中心</div>
                <ul class="sublist">
                    <li><a class="active" href="">我的订单</a></li>

                </ul>
                <div class="tit">客户服务</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>jsp/uc-cancel.jsp">取消订单记录</a></li>
                    <li><a href="<%=basePath%>jsp/uc-refund.jsp">退款/退货</a></li>
                </ul>
                <div class="tit">账户中心</div>
                <ul class="sublist">

                    <li><a href="<%=basePath%>jsp/uc-address.jsp">收货地址</a></li>
                </ul>

                <div class="tit">消息中心</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>jsp/uc-tatal-credits.jsp">我的积分</a></li>
                    <li><a href="<%=basePath%>jsp/uc-discount-coupon.jsp">我的优惠卷</a></li>

                </ul>
                <div class="tit">服务中心</div>
                <ul class="sublist">
                    <li><a href="#">美淘服务</a></li>
                </ul>
            </div>
        </div>
        <div class="uc-content">
            <div class="uc-panel">
                <div class="uc-bigtit">我的订单</div>
                <div class="uc-panel-bd">
                    <div class="uc-sort">
                        <div class="uc-tabs">
                            <a class="item" href="<%=basePath%>jsp/uc-order.jsp">所有订单</a>
                            <a class="item" href="<%=basePath%>jsp/uc-nopay-money.jsp">待付款</a>
                            <a class="item" href="<%=basePath%>jsp/uc-waitsent.jsp">待发货</a>
                            <a class="item" href="<%=basePath%>jsp/uc-runorder.jsp">已发货</a>
                            <a class="item active" href="<%=basePath%>jsp/uc-wait-receive.jsp">待收货</a>
                            <a class="item" href="<%=basePath%>jsp/uc-doneorder.jsp">已收货</a></div>
                        <div class="uc-search">
                            <form action="">
                                <input type="text" class="sch-input" placeholder="输入商品名称,订单号，商品编号" />
                                <button class="sch-btn"><i class="iconfont icon-search"></i></button>

                            </form>
                        </div>
                    </div>
                    <table class="uc-table">
                        <thead>
                        <td>商品详情</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>总价</th>
                        <th>状态</th>
                        <th width="120">操作</th>
                        </thead>
                        <tr class="hd order-meta">
                            <td colspan="4">
                                <div class="left">2016-05-29   订单号: 1947584672162364</div>
                                <div class="right"></div>
                            </td>
                        </tr>
                        <tr class="order-goods">

                            <td>
                                <div class="goods-info">
                                    <div>小米短袖T恤 五彩换 黑色 S</div>
                                    <div>499元×1</div>
                                </div>
                            </td>
                            <td>298.00</td>
                            <td>1</td>
                            <td>
                                <span class="text-theme fwb">298.00元</span>
                            </td>
                            <td>已付款</td>
                            <td><span>等待收货</span></td>
                        </tr>


                    </table>

                    <div class="pages">
                        <a class="page prev" href="">上一页</a>
                        <span class="cur-page">1</span>
                        <a class="page next" href="">下一页</a>
                    </div>
                    <!--<div class="pages">
                         <a class="page prev" href="">上一页</a>
                         <a class="page" href="">1</a>
                         <span class="cur-page">2</span>
                         <a class="page" href="">3</a>
                         <a class="page" href="">4</a>
                         <i class="page-split">...</i>
                         <a class="page" href="">71</a>
                         <a class="page next" href="">下一页</a>
                     </div>-->

                    <!-- <div class="ta-c">
                         <ul class="pagination">
                             <li class="disabled"><a href="#" aria-label="Previous"><span aria-hidden="true">«</span></a></li>
                             <li class="active"><a href="#">1 <span class="sr-only">(current)</span></a></li>
                             <li><a href="#">2</a></li>
                             <li><a href="#">3</a></li>
                             <li><a href="#">4</a></li>
                             <li><a href="#">5</a></li>
                             <li><a href="#" aria-label="Next"><span aria-hidden="true">»</span></a></li>
                          </ul>
                     </div>
                 </div>
             </div>
         </div>
     </div>
 </div>

 <!--脚部-->
                    <div class="fatfooter">

                    </div>
                    <!--脚部-->
</body>
<script src="<%=basePath%>js/jquery.js"></script>
<link rel="stylesheet" href="<%=basePath%>css/style2.css"/>
<script src="<%=basePath%>js/icheck.min.js"></script>
<script src="<%=basePath%>js/global.js"></script>
<script>


</script>
</html>