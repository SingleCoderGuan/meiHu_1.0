<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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
    <title>收货地址</title>
    <meta name="keywords" content="">
    <meta name="description" content="">
    <link href="<%=basePath%>css/iconfont.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/common1.css" rel="stylesheet"/>
    <link href="<%=basePath%>css/uc.css" rel="stylesheet"/>
    <link href="<%= basePath%>css/bootstrap1.css" rel='stylesheet' type='text/css' />
    <script src="<%= basePath%>js/jquery.min.js"> </script>
    <script type="text/javascript" src="<%= basePath%>plugins/bootstrap/bootstrap.min.js"></script>
    <style>
        .uc-header-bg{
            background-color: #ffded9;
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
            <div class="order"><em></em><a href="<%=basePath%>goods/myOrder.action">我的订单</a></div>
            <div class="fav"><em></em><a href="<%=basePath%>favor/selectMyFavor.action">我的收藏</a></div>
            <div class="help"><em></em><a href="#">帮助中心</a></div>
        </div>
    </div>
</div>
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <a class="logo" href="<%=basePath%>main.action"><img src="<%=basePath%>images/u8.png" alt="" /></a>


        <div class="schbox">
            <form action="" method="post">
                <input class="search-txt" type="text" placeholder="请输入搜索内容"
                       style="border: solid 2px;border-right: none"/>
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
                    <li><a class="active" href="<%=basePath%>goods/myOrder.action">我的订单</a></li>

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
                <div class="uc-bigtit">收货地址</div>
                <div class="uc-panel-bd">

                      <div class="address-list">
                        <div class="col col-4">
                            <a class="item va-m-box ta-c add">
                                <div class="add-new">
                                    <span class="ico"><i class="iconfont icon-tianjia"></i></span>
                                    <div class="label"><button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">添加收货地址</button></div>
                                    <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                                        <div class="modal-dialog" role="document">
                                            <div class="modal-content">

                                                <div class="modal-body">

                                                    <div class="form-group">
                                                        <label  class="control-label">地址:</label>
                                                        <input type="text" name="address" class="form-control" id="address1">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">详细地址:</label>
                                                        <input type="text" name="addressdetail" class="form-control" id="addressdetail1">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">收货人姓名:</label>
                                                        <input type="text" name="receivename" class="form-control" id="receivename1">
                                                    </div>
                                                    <div class="form-group">
                                                        <label class="control-label">收货人联系方式:</label>
                                                        <input type="text" name="receivetel" class="form-control" id="receivetel1">
                                                    </div>

                                                    <div class="modal-footer">
                                                        <button type="button" class="btn btn-default" data-dismiss="modal">取消</button>
                                                        <button  onclick="tianjiaAddr()" class="btn btn-primary">确定</button>
                                                    </div>

                                                </div>

                                            </div>
                                        </div>
                                    </div>

                                    <script>
                                        function tianjiaAddr() {
                                            var address=document.getElementById("address1").value;
                                            var addressdetail=document.getElementById("addressdetail1").value;
                                            var receivename=document.getElementById("receivename1").value;
                                            var receivetel=document.getElementById("receivetel1").value;
                                            $.ajax({
                                                type:"post",
                                                url:"<%=basePath %>goods/insertAddress.action",
                                                data:"address="+address+"&addressdetail="+addressdetail+"&receivename="+receivename+"&receivetel="+receivetel,
                                                success:function (address1) {
                                                    window.location.reload();
                                                }
                                            });
                                        }
                                    </script>
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
                                </div>
                            </a>
                        </div>
                          <c:forEach items="${addressList}" var="address">
                            <div class="col col-4">
                                <div class="item">
                                    <div class="action">
                                    </div>
                                    <div class="info">
                                        <ul>
                                            <li >${address.address}</li>
                                            <li >${address.addressdetail}</li>
                                            <li>${address.receivename}</li>
                                            <li>${address.receivetel}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                          </c:forEach>
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