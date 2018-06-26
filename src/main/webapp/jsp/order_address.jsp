<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width,initial-scale=1.0,maximum-scale=1.0, user-scalable=no">
    <title>订单结算页</title>
    <script type="text/javascript" src="//cdn.staticfile.org/jquery.pjax/1.9.6/jquery.pjax.min.js"></script>
    <link rel="stylesheet" href="<%= basePath%>plugins/bootstrap/bootstrap.min.css"/>
    <link rel="stylesheet" href="<%= basePath%>plugins/layui/css/layui.css"/>
    <link rel="stylesheet" href="<%= basePath%>plugins/awesome/css/font-awesome.min.css"/>
    <link rel="stylesheet" href="<%= basePath%>plugins/eleme-ui/index.css"/>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);

    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <link href="<%= basePath%>css/bootstrap1.css" rel='stylesheet' type='text/css'/>
    <link href="<%= basePath%>css/style.css" rel='stylesheet' type='text/css'/>
    <script src="<%= basePath%>js/jquery.min.js"></script>
    <script src="<%=basePath%>js/bootstrap.min.js"></script>
    <link href='http://fonts.googleapis.com/css?family=Raleway:400,100,200,300,500,600,700|Cinzel+Decorative:400,700'
          rel='stylesheet' type='text/css'>
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
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png"/>

    <style>


        #p {
            text-align: center;
        }

        .icon-text {
            font-family: 华文楷体;

        }

        .icon-text li a {
            color: #ffffff;
        }

        .layui-form {
            position: relative;
            left: 150px;
            width: 1119px;
        }

        .uc-content {
            position: relative;
            left: -80px;
        }

        .logo1 {
            position: relative;
            margin-top: -220px;
            left: -450px;
        }

        nav {
            display: inline-block;
            top: -60px;
            left: 330px;
            font-family: 华文楷体;
            font-size: 20px;
            font-weight: bolder;
        }

        nav a {
            display: inline-block;
            color: white;
            text-decoration: none;
            perspective: 200px;
        }

        nav a span {
            line-height: 50px;
            background-color: #f8fff9;
            display: inline-block;
            padding: 0 30px;
            position: relative;
            transform-origin: top;
            transition: all 1s;
            transform-style: preserve-3d;

        }

        nav a span::after {
            content: attr(data-hover);
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #1f2d3d;
            text-align: center;
            color: #ffffff;
            width: 100%;
            height: 100%;
            transform: rotateX(-90deg);
            transform-origin: top;
        }

        nav a:hover span {
            transform: rotateX(90deg) translateY(-20px);
        }

        .pay {
            position: relative;
            margin-left: 1050px;
        }

        .uc-header-bg {
            background-color: rgba(192, 192, 191, 0.81);
            height: 120px;
        }

        .footer-section {
            position: relative;
            margin-top: -70px;
        }

        .xuanzhong {
            background-color: pink;
        }

        #p {
            text-align: center;
        }

        .layui-form {
            position: relative;
            left: 150px;
            width: 1119px;
        }

        .uc-content {
            position: relative;
            left: -80px;
        }

        .pay {
            position: relative;
            margin-left: 1050px;
        }

        .footer-section {
            position: relative;
            margin-top: -70px;
        }

        .icon-text {
            font-family: 华文楷体;

        }

        .icon-text li a {
            color: #ffffff;
        }

        .logo1 {
            position: relative;
            margin-top: -230px;
            left: -450px;

        }

        nav {
            display: inline-block;
            top: -60px;
            left: 460px;
            font-family: 本墨锵黑;
            font-size: 16px;

        }

        nav a {
            display: inline-block;
            color: white;
            text-decoration: none;
            perspective: 200px;
        }

        nav a span {
            line-height: 40px;
            background-color: #fdf0ef;
            display: inline-block;
            padding: 0 30px;
            position: relative;
            transform-origin: top;
            transition: all 1s;
            transform-style: preserve-3d;

        }

        nav a span::after {
            content: attr(data-hover);
            position: absolute;
            top: 100%;
            left: 0;
            background-color: #000000;
            text-align: center;
            color: #ffffff;
            width: 100%;
            height: 100%;
            transform: rotateX(-90deg);
            transform-origin: top;
        }

        nav a:hover span {
            transform: rotateX(90deg) translateY(-20px);
        }

        .uc-header-bg {
            /*background-color: #f39894;*/
            background-color: #ffded9;

            height: 90px;
        }

        .section {
            background-color: #fdf0ef;
        }

        .jiesuan {
            position: relative;
            top: 0px;
            background-color: #fdf0ef;
        }

        .xuanzhong {
            background-color: pink;
        }

        .xinzengdizhi {
            position: absolute;
            right: 100px;
            top: 30px;
            font-size: 20px;
        }
    </style>
</head>


<body style="width:100%">
<div class="uc-header-bg">
    <div class="uc-header wrapper">
        <div class="logo1"><a class="logo" href="<%=basePath%>jsp/index.jsp">
            <img src="<%=basePath%>images/LOGOMeiTao.png" style="height: 70px;width: 100px;" alt=""/></a></div>

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
<div class="jiesuan">
    <h1 class="text-center">结算页</h1>
    <p id="p">愉快购物每一天！</p></div>

<div class="section">
    <div class="uc-content">
        <div class="uc-panel">
            <div class="uc-bigtit">收货地址</div>
                <div class="xinzengdizhi">
                    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
                        添加收货地址
                    </button>
                </div>
            <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel">
                <div class="modal-dialog" role="document">
                    <div class="modal-content">
                        <div class="modal-header">
                            <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span
                                    aria-hidden="true">&times;</span></button>
                            <h4 class="modal-title" id="exampleModalLabel">新增地址</h4>
                        </div>
                        <div class="modal-body">

                            <div class="form-group">
                                <label class="control-label">地址:</label>
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
                                <button onclick="tianjiaAddr($('#address1').val(),$('#addressdetail1').val(),$('#receivename1').val(),$('#receivetel1').val())" class="btn btn-primary">确定</button>
                            </div>

                        </div>

                    </div>
                </div>
            </div>

            <script>
                function tianjiaAddr(address,addressdetail,receivename,receivetel) {
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/goods/orderorder.action",
                        data: "address=" + address + "&addressdetail=" + addressdetail + "&receivename=" + receivename + "&receivetel=" + receivetel+"&orderid="+${sessionScope.order.orderid},
                        success:function (data) {
                            if(data==1){
                                $('#exampleModal').modal('hide');
                                window.location.reload();
                            }
                        }
                    });


                }

                function DiZhi() {
                    if (confirm("您确定选此地址作为付款地址吗？")) {
                        var div = document.getElementById("xuanzhi");
                        var ul = div.childNodes.item(0);
                        var lis = ul.childNodes;
                        var addressdetail = lis.item(1).innerHTML;
                        var receivename = lis.item(2).innerHTML;
                        var receivetel = lis.item(3).innerHTML;
                        var orderid =${order.orderid};
                        $.ajax({
                            type: "get",
                            url: "<%=basePath %>goods/addAddressIntoOrder.action",
                            data: "orderId=" + orderid + "&addressdetail=" + addressdetail + "&receivename=" + receivename + "&receivetel=" + receivetel,
                            success: function (result) {
                                alert("选取付款地址成功！");
                                $("#fukuananliu").attr("disabled", false);
                                $("[name='xuandizhi']").removeClass("xuanzhong");
                                document.getElementById('xuanzhi').classList.add("xuanzhong");
                            }
                        });
                    }
                }

            </script>
            <%--<script>--%>
                <%--$('#exampleModal').on('show.bs.modal', function (event) {--%>
                    <%--var button = $(event.relatedTarget) // Button that triggered the modal--%>
                    <%--var recipient = button.data('whatever') // Extract info from data-* attributes--%>
                    <%--// If necessary, you could initiate an AJAX request here (and then do the updating in a callback).--%>
                    <%--// Update the modal's content. We'll use jQuery here, but you could use a data binding library or other methods instead.--%>
                    <%--var modal = $(this)--%>
                    <%--modal.find('.modal-title').text('New message to ' + recipient)--%>
                    <%--modal.find('.modal-body input').val(recipient)--%>
                <%--})--%>
            <%--</script>--%>
            <form id="payform" action="<%=basePath %>goods/alipay.action" method="post">
                <div class="uc-panel-bd">

                    <div class="address-list" id="parent">
                        <c:forEach items="${addressList}" var="address">
                            <div class="col col-4" id="${address.addressid}" name="dizhi">
                                <div class="item">
                                    <div class="action">
                                        <div class="fl">
                                            <a class="del" onclick="deleteAddress(${address.addressid})">删除</a></div>
                                        <div class="fr"><a class="setdft" href="javascript:void(0)"
                                                           onclick="addAddrIntoOrderInfo('${order.orderid}','${address.addressdetail}','${address.receivename}','${address.receivetel}','${address.addressid}')">选我为付款地址</a>
                                        </div>
                                        <script type="text/javascript">
                                            function addAddrIntoOrderInfo(orderid, addressdetail, receivename, receivetel, addressId) {
                                                if (confirm("您确定选此地址作为付款地址吗？")) {
                                                    var orderid = orderid;
                                                    var addressdetail = addressdetail;
                                                    var receivename = receivename;
                                                    var receivetel = receivetel;
                                                    $.ajax({
                                                        type: "get",
                                                        url: "<%=basePath %>goods/addAddressIntoOrder.action",
                                                        data: "orderId=" + orderid + "&addressdetail=" + addressdetail + "&receivename=" + receivename + "&receivetel=" + receivetel,
                                                        success: function (result) {
                                                            alert("选取付款地址成功！");
                                                            $("#fukuananliu").attr("disabled", false);
                                                            $("[name='dizhi']").removeClass("xuanzhong");
                                                            document.getElementById(addressId).classList.add("xuanzhong");
                                                            document.getElementById("info").style.display="none";


                                                        }
                                                    });
                                                }
                                            }
                                        </script>
                                        <script type="text/javascript">
                                            function deleteAddress(addressid) {
                                                var add = addressid;
                                                if (confirm("您确定要删除地址信息吗？")) {
                                                    $.ajax({
                                                        type: "get",
                                                        url: "<%=basePath %>goods/deleteAddress.action",
                                                        data: "addressid=" + add,
                                                        success: function (flag) {
                                                            var parent = document.getElementById("parent");
                                                            parent.removeChild(document.getElementById(add));
                                                        }
                                                    });
                                                }
                                            }
                                        </script>

                                    </div>
                                    <div class="info">
                                        <ul>
                                            <li>${address.address}</li>
                                            <li>${address.addressdetail}</li>
                                            <li>${address.receivename}</li>
                                            <li>${address.receivetel}</li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                        <%--添加地址--%>



                    </div>
                </div>
        </div>
    </div>


    <div class="row deliverymode">

        <div id="orders" class="col-lg-9 deliverymodeRight">

            <div class="layui-form">
                <div class="uc-bigtit">&nbsp;&nbsp;&nbsp;&nbsp;我的订单</div>
                <table class="layui-table">
                    <tr>
                        <th colspan="2">订单编号：${order.orderid}</th>
                        <th colspan="1">未付款</th>
                        <th colspan="2">时间：<fmt:formatDate value="${order.ordertime}" pattern="yyyy-MM-dd"/></th>


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
                        <td colspan="2"
                            style="color: red">
                            <c:if test="${ empty userofflist}">
                                <option value="1">您暂无优惠券</option>
                            </c:if>
                            <c:if test="${ not empty userofflist}">

                                <button type="button" class="btn btn-danger" data-toggle="modal"
                                        data-target=".bs-example-modal-sm"
                                        style="width:240px;font-size: 15px">有可用优惠券
                                </button>
                            </c:if>
                        </td>

                        <td>总金额:￥${order.total}</td>
                        <td>运费:￥0.00</td>
                        <td>应付金额：<span id="yingfu">
                        ${order.total}元</span></td>
                    </tr>
                    <tr>
                        <td colspan="3"></td>
                        <td><a href="javascript:void(0)" onclick='remove()'>取消订单</a></td>
                        <td><a href="<%=basePath %>jsp/cart.jsp">返回修改购物车</a></td>
                    </tr>
                </table>
            </div>
        </div>
    </div>
    <div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel">
        <div class="modal-dialog modal-sm" role="document">
            <div class="modal-content">
                选择相应的优惠券自动识别使用一张
                <c:forEach items="${userofflist}" var="userofflist">
                  <span><img src="<%=basePath%>images/${userofflist.offLevel.picname}"
                             style="width:120px;height: 80px;"/>
                      ${10-userofflist.offLevel.offid}折优惠券（${userofflist.remainnum}）张
                      <input type="button" id="${userofflist.offLevel.offname}" value="选择"
                             onclick="xuanzeyouhuiquan(${userofflist.offLevel.offname})" style="height:30px;font-size: 15px;"></span>
                </c:forEach>
                <script>
                    function xuanzeyouhuiquan(id) {
                        var aa = ${order.total} * id;
                        var c = aa.toFixed(2);
                        $('#yingfu').html(c);

                        $("#money").val("${order.total}" * id);
                        $('.bs-example-modal-sm').modal('hide');
                    }
                </script>
                <div class="modal-footer">
                    <a id="guanbi" class="btn btn-default" data-dismiss="modal">关闭</a>
                </div>
            </div>
        </div>
    </div>

    <script type="text/javascript">
        function remove() {
            if (confirm("您确定要取消订单吗？")) {
                $.ajax({
                    type: "get",
                    url: "<%=basePath %>goods/deleteOrder.action",
                    data: "orderid=" +${order.orderid},
                    success: function (result) {
                        $("#orders").html("");
                        $("#payform").html("");
                    }
                });
            }
        }

    </script>
    <div class="pay">


        <input type="hidden" name="orderId" value="${order.orderid}"/>
        <input type="hidden" name="WIDout_trade_no" value="${order.orderid}"/>
        <input type="hidden" name="WIDsubject" value="${order.orderid}"/>
        <input type="hidden" name="WIDtotal_amount" id="money" value="${order.total}"/>
        <button id="fukuananliu" class="btn submitForm" disabled>确定提交</button>
        <br/>
        <span id="info">亲您先去选择付款地址吧！！！</span>
    </div>

    <%--<script>
        $("#fukuananliu").click( function(){
            $.ajax({
                type:"get",
                url:"<%=basePath%>goods/selectAddressByOid.action",
                data:"orderid="+${order.orderid},
                success:function(msg){
                    if(msg==1){
                        $("#fukuananliu").disabled();
                        alert("请先选择地址哦！");
                    }
                }
            });
        })
    </script>--%>
    </form>

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
            <p class="sub">相宜本草 「红景天莹」透彻幼白精华乳（亮白乳液护肤）</p>
            <p class="sub">百雀羚 「至臻皙白」晶亮焕肤乳液（补水保湿 美白焕肤）</p>
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
                <div class="clearfix"></div>

                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/3_05.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/2_04.jpg" alt=""/></a>
                </div>
                <div class="flickr-grid">
                    <a href="#"><img src="<%= basePath%>images/5_09.jpg" alt=""/></a>
                </div>
                <div class="clearfix"></div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--//end-footer-section-->
<!--/start-copyright-section-->
<div class="copyright">
    <p class="write">Copyright &copy; 2018 All rights Reserved | Design by <a href="#">美乎网</a></p>
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
