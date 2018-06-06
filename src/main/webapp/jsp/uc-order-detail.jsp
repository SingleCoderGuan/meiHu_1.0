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
    <title>订单详情</title>
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
                <input class="search-txt" type="text"/>
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
                    <li><a href="<%=basePath%>jsp/uc-msg.jsp">美淘服务</a></li>
                </ul>

            </div>
        </div>
        <div class="uc-content">
            <div class="uc-panel">
                <div class="uc-bigtit">订单详情<a class="extra" href="">请谨防钓鱼链接或诈骗后台，了解更多></a></div>
                <div class="uc-panel-bd">
                    <div class="order-detail">
                        <div class="od-hd">
                            <div class="fl">
                                <span class="tit">订单号：</span><span>1344643134736</span>
                            </div>
                            <div class="fr">
                                <a href="" class="ui-btn-low ui-btn-hollow uc-btn-md">取消订单</a>
                                <a href="" class="ui-btn-theme uc-btn-md">立即支付</a>
                            </div>
                        </div>
                        <div class="od-status">
                            <div class="tit">等待付款</div>1小时35后订单将被关闭
                        </div>
                        <div class="od-percent">
                            <div class="col"><div class="inner">下单<span class="time">05月30日 11:06</span></div></div>
                            <div class="col col2 active"><div class="inner">付款</div></div>
                            <div class="col col3"><div class="inner">发货</div></div>
                            <div class="col col4"><div class="inner">交易成功</div></div>
                        </div>
                        <div class="od-pdt">
                            <div class="item">
                                <img src="Picture/11.jpg" class="figure" />
                                <div class="pname">小米短袖T恤 五彩换 黑色 S</div>
                                <div class="price">499元×1</div>
                            </div>
                            <div class="item">
                                <img src="Picture/11.jpg" class="figure" />
                                <div class="pname">小米短袖T恤 五彩换 黑色 S</div>
                                <div class="price">499元×1</div>
                            </div>
                            <div class="item">
                                <img src="Picture/11.jpg" class="figure" />
                                <div class="pname">小米短袖T恤 五彩换 黑色 S</div>
                                <div class="price">499元×1</div>
                            </div>
                            <div class="item">
                                <img src="Picture/11.jpg" class="figure" />
                                <div class="pname">小米短袖T恤 五彩换 黑色 S</div>
                                <div class="price">499元×1</div>
                            </div>
                            <div class="item">
                                <img src="Picture/11.jpg" class="figure" />
                                <div class="pname">小米短袖T恤 五彩换 黑色 S</div>
                                <div class="price">499元×1</div>
                            </div>
                        </div>
                        <div class="od-info">
                            <div class="item">
                                <div class="tit">
                                    收货信息<a href="" class="ui-btn-low ui-btn-hollow uc-btn-md fr">修改</a>
                                </div>
                                <div class="meta">
                                    <div>姓&emsp;&emsp;名：</div>
                                    <div>联系电话：</div>
                                    <div>收货地址：</div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="tit">
                                    支付方式及送货时间<a href="" class="ui-btn-low ui-btn-hollow uc-btn-md fr">修改</a>
                                </div>
                                <div class="meta">
                                    <div>支付方式：</div>
                                    <div>送货时间：</div>
                                    <div>送达时间：</div>
                                </div>
                            </div>
                            <div class="item">
                                <div class="tit">
                                    发票信息
                                </div>
                                <div class="meta">
                                    <div>发票类型：</div>
                                    <div>发票内容：</div>
                                    <div>发票抬头：</div>
                                </div>
                            </div>
                        </div>
                        <div class="od-count">
                            <div class="inner">
                                <div class="item">
                                    <div class="tit">商品总价：</div>
                                    <div class="val">0元</div>
                                </div>
                                <div class="item">
                                    <div class="tit">运&emsp;&emsp;费：</div>
                                    <div class="val">0元</div>
                                </div>
                                <div class="item">
                                    <div class="tit">订单详情：</div>
                                    <div class="val">0元</div>
                                </div>
                                <div class="item last">
                                    <div class="tit">实付金额：</div>
                                    <div class="val"><span class="strong">0</span>元</div>
                                </div>
                            </div>
                        </div>
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