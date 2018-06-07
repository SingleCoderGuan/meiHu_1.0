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
    <title>退款/退货</title>
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
                <em></em><a href="<%=basePath%>jsp/index.jsp">美淘商城</a>
            </div>

        </div>
        <div class="right-bar">
            <div class="login-user sub-menu">
                <a class="menu-hd" href="">txtangxia<em></em></a>

            </div>
            <div class="item"><a href="#">消息</a></div>
            <div class="logout divider"><a href="<%=basePath%>jsp/login.jsp">退出</a></div>
            <span class=""></span>
            <div class="cart"><em></em><a href="<%=basePath%>jsp/cart.jsp">购物车</a></div>
            <div class="order"><em></em><a href="<%=basePath%>jsp/mh-orders.jsp">我的订单</a></div>
            <div class="fav"><em></em><a href="#">我的收藏</a></div>
            <div class="help"><em></em><a href="#">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <a class="logo" href="index.html"><img src="<%=basePath%>images/u8.png" alt="" /></a>
        <div class="back-home"><a href="<%=basePath%>jsp/index.jsp">返回商城首页</a></div>
        <ul class="uc-nav">
            <li><a href="<%=basePath%>jsp/index.jsp">首页</a></li>
            <li class="toggle">
                <span class="label">账户设置<i class="iconfont"></i></span>
                <div class="toggle-cont">

                    <a href="#">个人信息</a>
                    <a href="<%=basePath%>jsp/order_address.jsp">收货地址</a>
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
                    <li><a  href="<%=basePath%>jsp/mh-orders.jsp">我的订单</a></li>
                   </ul>
                <div class="tit">客户服务</div>
                <ul class="sublist">

                    <li><a  class="item active" href="<%=basePath%>jsp/mh-refund.jsp">退款/退货</a></li>
                </ul>


                <div class="tit">消息中心</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>jsp/mh-tatal-credits.jsp">我的积分</a></li>
                    <li><a href="<%=basePath%>jsp/mh-discount-coupon.jsp">我的优惠卷</a></li>

                </ul>
                <div class="tit">服务中心</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>jsp/mh-msg.jsp">美淘服务</a></li>
                </ul>
            </div>
        </div>
        <div class="uc-content">
            <div class="uc-panel">
                <div class="uc-bigtit">退款/退货</div>
                <div class="uc-panel-bd">
                    <table class="refund-returns-list">
                        <tr class="head bd-t">
                            <td width="370" class="first">商品信息</td>
                            <td colspan="3"></td>
                        </tr>
                        <tr class="item-head">
                            <td colspan="4">
                                <div class="fl">
                                    退款编号: 1947584672162364 <span class="ml15">商家：<a class="sname" href="">小米旗舰店</a></span>
                                </div>
                                <div class="fr">申请时间：2016-05-29 16:02   </div>
                            </td>
                        </tr>
                        <tr class="item">
                            <td class="first">
                                <div class="good-desc">
                                    <img class="gimg" src="Picture/9.jpg" alt="" />
                                    <div class="ginfo">
                                        小米短袖T恤 五彩换<br />订单编号：16978514363344786
                                    </div>
                                </div>
                            </td>
                            <td>单价：499.00元×1</td>
                            <td>合计：<span class="text-danger">499.00元</span></td>
                            <td width="160">
                                    <span class="btn-get-wl" >物流信息<i class="caret"></i>
                                        <div class="wl-toggle">
                                            <div class="inner-box">
                                                <i class="arrow"></i>
                                                <div class="wl-hd">百汇世通:846721123123</div>
                                                <div class="wl-item active">已签收,签收凭取货吗签收，感谢使用百汇世通及速递易【自提柜】期待再次为你服务</div>
                                                <div class="wl-item">已签收,签收凭取货吗签收，感谢使用百汇世通及速递易【自提柜】期待再次为你服务</div>
                                                <div class="wl-item">以上为最新信息跟踪信息 <a class="text-info" href="">查看全部</a></div>
                                            </div>
                                        </div>
                                    </span>
                            </td>
                        </tr>
                    </table>

                    <div class="refund-returns-panel mt15">
                        <div class="tabs">
                            <a class="item active" href="">我要退货</a><a class="item" href="">我要退款（无需退货）</a>
                        </div>
                        <div class="panel-bd">
                            <div class="control-group">
                                <div class="hd"><em>*</em>是否收货：</div>
                                <div class="bd">
                                    <label class="check"><input type="radio" name="sex" />未收到货</label>
                                    <label class="check ml25"><input type="radio" name="sex" />已收到货</label>
                                </div>
                            </div>
                            <div class="control-group">
                                <div class="hd"><em>*</em>退款原因：</div>
                                <div class="bd"><select name="" id="" class="ui-txtin"><option value="">请选择</option></select></div>
                            </div>
                            <div class="control-group">
                                <div class="hd"><em>*</em>退款金额：</div>
                                <div class="bd"><input class="ui-txtin" type="text" name=""  value="499.00" /><span class="ml10 text-muted">最多499.00元</span></div>
                            </div>
                            <div class="control-group">
                                <div class="hd vat">退款说明：</div>
                                <div class="bd"><textarea name="" id=""  class="ui-txtin" style="width:560px;height:90px;"></textarea><span class="vab dib ml10">还可以输入200字</span></div>
                            </div>
                            <div class="control-group">
                                <div class="hd vat">上传凭证：</div>
                                <div class="bd">
                                    <label class="ui-uploads">
                                        <span class="upload-img"></span>
                                        <input type="file" name="" id="" />
                                    </label>
                                    <div class="mt10 text-muted">每张图片大小不超过5M，最多3张，支持gif、jpg、png、bmp格式</div>
                                </div>
                            </div>
                            <div class="submit-group">
                                <input class="ui-btn-theme uc-btn-lg" type="submit" value="提交退款申请" />
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
    $('.check').iCheck({
        radioClass: 'sty2-radio'
    });
</script>
</html>