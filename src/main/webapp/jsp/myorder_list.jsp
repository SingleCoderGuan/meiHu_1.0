<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>我的订单</title>
    <meta http-equiv="Content-Type" content="text/html;charset=UTF-8" >
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="../css/bootstrap.min.css" />
    <link rel="stylesheet" href="../css/bootstrap-theme.min.css" />
    <link rel="stylesheet" type="text/css" href="../css/common-top.css">
    <link rel="stylesheet" type="text/css" href="../css/myorderings.css">
    <link rel="stylesheet" type="text/css" href="../css/dialogbox.css">
    <script type="text/javascript" src="../js/jquery-3.2.1.min.js" ></script>
    <script type="text/javascript" src="../js/jquery.dialogBox.js" ></script>
    <script type="text/javascript" src="../js/common-resolve.js" ></script>
    <script type="text/javascript" src="../js/myorders.js" ></script>
    <style>
        .logo1{
            position: relative;
            margin-top:-210px;
            left:-450px;
        }
        nav{
            display: inline-block;
            margin-top:-40px;
            left:370px;
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
    </style>
</head>
<body>



<div class="middle01">
    <nav>
        <a href="<%=basePath%>jsp/index.jsp">
            <span data-hover="美淘首页">美淘首页</span>
        </a>
        <a href="">
            <span data-hover="芬馨香水">芬馨香水</span>
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

    <div style="height:20px;"></div>
    <div class="middle01_n1">
        <c:if test="${orderList.size() == 0}">
            <div style="width:980px; height:390px; margin:10px auto; text-align:center;">
                <font style="font-weight:600; font-size:40px; color:#bcbcbc; ">主人还没光顾过咱家的东西呢</font>
            </div>
        </c:if>
        <c:if test="${orderList.size() != 0}">
            <div class="car_item_list">
                <ul class="car_item_list_ul">
                    <c:forEach items="${orderList}" var="ordering">
                        <li>
                            <div class="car_item">
                                <div class="car_item_top_info">
                                    <ul class="car_item_top_ul">
                                        <li>
                                            订单流水号:<span class="ordering_info_id">${ordering.orderid}</span>
                                        </li>
                                        <li>
                                            提交时间:<span class="ordering_info_id"><fmt:formatDate pattern="yyyy-MM-dd HH:mm:ss" value="${ordering.ordertime}" /></span>
                                        </li>
                                    </ul>
                                </div>
                                <div class="car_item_contain">
                                    <c:forEach items="${ordering.items}" var="eachdetail">
									<span class="car_item_good">
										<%--<a href="${pageContext.request.contextPath }/goods/list.action?goodid=${eachdetail.good.gooid}">--%>
											<span class="car_item_img">

												<span class="car_item_img_sub">
													<img src="${pageContext.request.contextPath }/${eachdetail.good.goodpic}">
												</span>
											</span>
											<span class="car_item_title">${eachdetail.good.goodname}</span>
											<span class="car_item_subtitle">
												<c:out value="${fn:substringBefore(eachdetail.good.goodname,fn:substringAfter(eachdetail.good.goodname,']'))}">
                                                </c:out>
											</span>

											<span class="car_item_price">吃货价：
												<span>
												￥<fmt:formatNumber type="number" maxFractionDigits="2" value="${eachdetail.good.goodprice}"></fmt:formatNumber>
												</span>
											</span>
											<span class="car_item_hasbuy">
												已购<span>${eachdetail.count}</span>件
											</span>
										</a>
									</span>
                                    </c:forEach>

                                    <span class="car_item_info_block">
										<span class="car_item_haspay">
											实付<span>￥<fmt:formatNumber type="number" maxFractionDigits="2" value="${ordering.total}"></fmt:formatNumber></span>
										</span>



									</span>
                                </div>
                            </div>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </c:if>
    </div>
</div>

<div id="question_watchingBox"></div>
<div id="sendQues_watchingBox"></div>
<div id="aboutus_watchingBox"></div>
<div id="tip-dialogBox"></div>

<jsp:include page="footer.jsp" flush="true"></jsp:include>
</body>
</html>
