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
    <title>我的已收货</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
    <style>
        .uc-header-bg{
            background-color: #cdc6d7;
        }
        .uc-search{
            position: relative;
            margin-top:-50px;
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
            <div class="fav"><em></em><a href="<%=basePath%>favor/selectMyFavor.action">我的收藏</a></div>
            <div class="help"><em></em><a href="#">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <a class="logo" href="<%=basePath%>jsp/index.jsp"><img src="<%=basePath%>images/u8.png" alt="" /></a>
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
                    <li><a class="active" href="<%=basePath%>jsp/mh-orders.jsp">我的订单</a></li>

                </ul>
                <div class="tit">客户服务</div>
                <ul class="sublist">

                    <li><a href="<%=basePath%>goods/doneOrder.action">退款/退货</a></li>
                </ul>
                <div class="tit">账户中心</div>
                <ul class="sublist">
                    <li><a href="<%=basePath%>goods/showAddress.action">收货地址</a></li>
                    <li><a href="<%=basePath%>favor/selectMyFavor.action">我的收藏</a><li>
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
                <div class="uc-bigtit">我的订单</div>
                <div class="uc-panel-bd">
                    <div class="uc-sort">
                        <div class="uc-tabs">
                            <a class="item" href="<%=basePath%>goods/myOrder.action">所有订单</a>
                            <a class="item " href="<%=basePath%>goods/noPayOrder.action">待付款</a>
                            <a class="item" href="<%=basePath%>goods/waitOrder.action">待发货</a>
                            <a class="item" href="<%=basePath%>goods/runOrder.action">待收货</a>
                            <a class="item active" href="<%=basePath%>goods/doneOrder.action">已完成</a>
                        </div>
                    </div>
                </div>
                    <table class="uc-table">
                        <thead>
                        <th>商品详情</th>
                        <th>名称</th>
                        <th>单价</th>
                        <th>数量</th>
                        <th>小计</th>
                        <th width="120">状态</th>
                        <th>操作</th>
                        </thead>
                        <c:forEach items="${doneOrderList}" var="doneorder">
                            <tr>
                                <td>
                                    <div class="left"><fmt:formatDate pattern="yyyy-MM-dd" value="${doneorder.ordertime}" />&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订单号: ${doneorder.orderid}</div>

                                </td>
                            </tr>
                            <c:forEach items="${doneorder.items}" var="eachdetail">
                                <td class="order-goods">
                                    <img src="${pageContext.request.contextPath }/${eachdetail.good.goodpic}" width="100px" height="100px">
                                </td>
                                <td>
                                    <div class="goods-info">
                                        <div>
                                                ${eachdetail.good.goodname}
                                        </div>
                                    </div>
                                </td>
                                    <td>${eachdetail.good.goodprice}</td>
                                    <td>${eachdetail.count}</td>
                                    <td>
                                        <span class="text-theme fwb">${eachdetail.subtotal}</span>
                                    </td>
                                <td>
                                    <c:choose>
                                        <c:when test="${doneorder.state== 0}">待付款</c:when>
                                        <c:when test="${doneorder.state== 1}">待发货</c:when>
                                        <c:when test="${doneorder.state== 2}">待收货</c:when>
                                        <c:when test="${doneorder.state== 3}">已完成</c:when>
                                    </c:choose>
                                </td>
                                <td></td>
                                </tr>
                                <tr>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td></td>
                                    <td><a href="<%=basePath%>goods/drawback.action?itemid=${eachdetail.itemid}&orderid=${doneorder.orderid}">退款</a></td>
                                    <c:if test="${eachdetail.item_state!=3}"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal" style="position: relative;left: 825px;top: 135px;"
                                            onclick="comment(${eachdetail.good.goodid},${user.uid},${doneorder.orderid})">评论</button></c:if>
                                    <c:if test="${eachdetail.item_state==3}">
                                        <span style="position: relative;left: 825px;top: 131px;"><a href="#">已评论</a></span>
                                    </c:if>

                                </tr>
                            </c:forEach>
                        </c:forEach>

                    </table>
            </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">

                        <div class="modal-body">
                            <div class="form-group">
                                <label  class="control-label">评论内容:</label>
                                <textarea id="content" class="form-control" rows="3"></textarea>
                            </div>

                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                <button  onclick="publishComment()" class="btn btn-primary">提交</button>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <input type="hidden" id="goodid"  />
            <input type="hidden" id="uid" value="" />
            <input type="hidden" id="orderid" value="" />

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
            <script>
                function comment(g,u,o) {
                    $("#goodid").val(g) ;
                    document.getElementById("uid").value = u ;
                    $("#orderid").val(o) ;
                }
            </script>
            <script>
                function publishComment() {
                    var gid = $("#goodid").val() ;
                    var uid = $("#uid").val() ;
                    var c = $("#content").val() ;
                    var o = $("#orderid").val() ;
                    $.ajax({
                        type:"post",
                        data:{"goodid":gid,"uid":uid,"content":c,"orderid":o},
                        url:"<%=basePath%>user/goodsComment.action",
                        success:function (data) {
                            if(data=="1"){
                                location.reload()
                            }
                        }
                    })
                }
            </script>
        </div>
    </div>
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