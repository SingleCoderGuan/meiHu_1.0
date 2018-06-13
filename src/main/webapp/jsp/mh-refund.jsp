<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

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
            <c:if test="${not empty user}">

                <div class="item" href="">欢迎您:${user.uname}</div>
                <div class="logout divider"> <a href="<%=basePath%>signOut.action">注销</a></div>

            </c:if>
            <c:if test="${empty user}">
                <div class="item"><a href="<%=basePath %>jsp/loginregister.jsp">登录</a></div>
                <div class="logout divider"><a href="<%=basePath%>jsp/loginregister.jsp">注册</a></div>
            </c:if>

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
        <div class="back-home"><a href="<%=basePath%>jsp/zhuye.jsp">返回美乎首页</a></div>

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

                    <li><a href="<%=basePath%>goods/doneOrder.action">退款/退货</a></li>
                </ul>


                <div class="tit">消息中心</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>goods/selectDiscount.action">我的优惠券</a></li>

                </ul>
                <div class="tit">服务中心</div>
                <ul class="sublist">
                    <li><a href="#">美淘服务</a></li>
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
                                    订单编号：${order.orderid}
                                </div>
                                <div class="fr">申请时间:<fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="<%=new Date()%>"/>   </div>
                            </td>
                        </tr>
                        <tr class="item">
                            <td class="first">
                                <div class="good-desc">
                                    <img src="<%=basePath%>${orderItem.good.goodpic}" width="100px" height="100px">
                                    <div class="ginfo">
                                        <br />商品名称：${orderItem.good.goodname}
                                    </div>
                                </div>
                            </td>
                            <td>单价：${orderItem.good.goodprice}元*${orderItem.count}件</td>
                            <td>合计：<span class="text-danger">${orderItem.subtotal}元</span></td>
                            <td width="160">

                            </td>
                        </tr>
                    </table>
                    <form action="#" method="post">
                    <div class="refund-returns-panel mt15">
                        <div class="tabs">
                            <a class="item active" href="#">我要退货退款</a>
                        </div>
                        <div class="panel-bd">

                            <div class="control-group">
                                <div class="hd"><em>*</em>退款原因：</div>
                                <div class="bd"><select name="drawbackreason" id="drawbackreason" class="ui-txtin">
                                    <option value="请选择">请选择</option>
                                    <option>商品发错了</option>
                                    <option>色差相差太大</option>
                                    <option>收到的商品与描述不符</option>
                                    <option>与想象中相差有点大</option>
                                    <option>收到的商品破损</option>
                                    <option>未按约定时间发货</option>
                                </select></div>
                            </div>
                            <div class="control-group">
                                <div class="hd"><em>*</em>退款金额：</div>
                                <div class="bd"><input class="ui-txtin" type="text" name=""  value="${orderItem.subtotal}" /><span class="ml10 text-muted">${orderItem.subtotal}元</span></div>
                            </div>
                            <div class="control-group">
                                <div class="hd vat">退款说明：</div>
                                <div class="bd"><textarea name="detail" id="detail"  class="ui-txtin" style="width:560px;height:90px;"></textarea></div>
                            </div>
                            <div class="submit-group">
                                <input class="ui-btn-theme uc-btn-lg" onclick="tiaojiao(${order.orderid})" value="提交申请" />
                            </div>

                            <script>
                                function tiaojiao(orderid){
                                    var drawbackreason=document.getElementById("drawbackreason").value;
                                    var detail=document.getElementById("detail").value;
                                    $.ajax({
                                        type:"post",
                                        dataType:"json",
                                        url:"<%=basePath%>goods/refundOrder.action?orderid="+orderid,
                                        data:"drawbackreason="+drawbackreason+"&detail="+detail,
                                        success:function(result){
                                            if(result==1){
                                                alert("提交成功！");
                                               window.location.reload();
                                            }else{
                                                alert("提交失败！");
                                            }
                                        }
                                    })
                                }
                            </script>
                        </div>
                    </div>
                </form>
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