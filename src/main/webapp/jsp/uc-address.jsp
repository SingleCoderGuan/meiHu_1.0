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
    <title>收货地址</title>
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
                <em></em><a href="<%=basePath%>jsp/index.jsp">商城首页</a>
            </div>
            <div class="item"><a href="">商家中心</a></div>
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
            <li><a href="#">消息中心</a></li>
        </ul>
        <div class="schbox">
            <form action="">
                <input class="search-txt" type="text" />
                <button class="search-btn">搜索</button>
                <div class="suggest-box">
                    <div class="item" data-title="上衣 短款 短袖">上衣 短款 短袖<div class="tags"><span>雪纺</span><span>蕾丝</span><span>一字领</span></div></div>
                </div>
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
                    <li><a href="<%=basePath%>jsp/uc-order.jsp">我的订单</a></li>
                </ul>
                <div class="tit">客户服务</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>jsp/uc-cancel.jsp">取消订单记录</a></li>
                    <li><a href="<%=basePath%>jsp/uc-refund.jsp">退款/退货</a></li>
                </ul>
                <div class="tit">账户中心</div>
                <ul class="sublist">
                   <li><a  class="item active" href="<%=basePath%>jsp/uc-address.jsp">收货地址</a></li>
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
                <div class="uc-bigtit">收货地址</div>
                <div class="uc-panel-bd">

                    <div class="ui-msg-info ui-msg-block">您已创建 2 个收货地址，最多可创建 5 个</div>

                    <div class="address-list">
                        <div class="col col-4">
                            <a class="item va-m-box ta-c add">
                                <div class="add-new">
                                    <span class="ico"><i class="iconfont icon-tianjia"></i></span>
                                    <div class="label">添加收货地址</div>
                                </div>
                            </a>
                        </div>
                        <div class="col col-4">
                            <div class="item">
                                <div class="action">
                                    <div class="fl"><a class="edit" href="javascript:;">修改</a><a class="del" href="javascript:;">删除</a></div>
                                    <div class="fr"><a class="setdft" href="javascript:;">设为默认</a></div>

                                </div>
                                <div class="info">
                                    <div class="info-item name ellipsis">安徽合肥（小柚子 收）</div>
                                    <div class="info-item address">瑶海区东方商城</div>
                                    <div class="info-item tel ellipsis">13666666666</div>
                                </div>
                            </div>
                        </div>
                        <div class="col col-4">
                            <div class="item active">
                                <div class="action">
                                    <div class="fl"><a class="edit" href="javascript:;">修改</a><a class="del" href="javascript:;">删除</a></div>
                                    <div class="fr"><a class="setdft" href="javascript:;">设为默认</a></div>
                                </div>
                                <div class="info">
                                    <div class="info-item name ellipsis">安徽合肥（小柚子 收）</div>
                                    <div class="info-item address">瑶海区东方商城</div>
                                    <div class="info-item tel ellipsis">13666666666</div>
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
<script src="<%=basePath%>js/laydate.js"></script>
<script src="<%=basePath%>js/global.js"></script>
<script>

</script>
</html>