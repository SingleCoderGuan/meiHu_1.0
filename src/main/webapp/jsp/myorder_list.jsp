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
</head>
<body>


<%-- <input type="hidden" value="${user.uid}" id="uid">
<div class="top">
    <div class="top02">
        <div class="top02_1">

            <div class="top02_right">
                <ul class="top02_right_ul">
                    <c:if test="${user != null}">
                        <li>
                            <a href="#" class="top02_right_login">
                                欢迎<c:out value="${user.uname}"></c:out>
                            </a>
                            <ul class="top02_right_ul1" id="top02_right_ul14" style="display:none;">
                                <li><h3><a href="#" id="user_logout_bt">退出登录</a></h3></li>
                            </ul>
                        </li>

                    </c:if>


                    <li>
                        <a class="btn_showdown" href="#">
                            网站导航
                            <span class="glyphicon glyphicon-chevron-down icon_font"></span>
                        </a>
                        <ul class="top02_right_ul1" id="top02_right_ul13" style="display:none;">
                            <li><h3><a href="${pageContext.request.contextPath }/jsp/index.jsp">商城主页</a></h3></li>
                            <li><h3><a id="aboutus_watching" href="#">关于我们</a></h3></li>
                        </ul>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <div class="top03">
        <div class="top03_1">
            <div class="top03_11">

            </div>
            <div class="top03_12">
                <div class="top3_middle01">
                   <form action="${pageContext.request.contextPath }/goods/getGoodByKw.action" method="post">
                        <input type="hidden" name="pageIndex" value="1">
                        <input type="text" placeholder="吃货天堂，快来加入吧" class="top3_input" name="kw"/>
                        <button class="top3_btn"><span class="glyphicon glyphicon-search" style="color:#fff; "></span></button>
                    </form>
                </div>

            </div>
        </div>
    </div>
</div>--%>
<div class="middle01">

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
