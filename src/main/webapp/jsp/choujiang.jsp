<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/22/022
  Time: 10:13
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>美抽</title>
    <%--<link rel="stylesheet" type="text/css" href="css/reset.css" />--%>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/xcConfirm.css"/>
    <script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <style>
        .g-content {
            width: 100%;
            background: #fbe3cc;
            height: auto;
            font-family: "微软雅黑", "microsoft yahei";
        }

        .g-content .g-lottery-case {
            width: 500px;
            height: 470px;
            margin: 0 auto;
            overflow: hidden;
        }

        .g-content .g-lottery-case .g-left h2 {
            font-size: 20px;
            line-height: 32px;
            font-weight: normal;
            margin-left: 20px;
        }

        .g-content .g-lottery-case .g-left {
            width: 450px;
            float: left;
        }

        .g-lottery-box {
            width: 400px;
            height: 400px;
            margin-left: 30px;
            position: relative;
            background: url(<%=basePath%>images/ly-plate-c.gif) no-repeat;
        }

        .g-lottery-box .g-lottery-img {
            width: 340px;
            height: 340px;
            position: relative;
            background: url(<%=basePath%>images/zhuanpan.png) no-repeat;
            left: 30px;
            top: 30px;
        }

        .g-lottery-box .playbtn {
            width: 186px;
            height: 186px;
            position: absolute;
            top: 77px;
            left: 77px;
            background: url(<%=basePath%>images/playbtn.png) no-repeat;
        }
    </style>

</head>


<button type="button" class="btn btn-danger btn-lg btn-block "><em>50</em>积分抽奖一次，点击下方按钮立刻抽奖！</button>
<c:if test="${empty sessionScope.user}">
    <a href="<%=basePath%>jsp/loginregister.jsp" class="btn btn-default btn-lg btn-block">当前未登录，您没办法抽奖哦，点击可登录</a>
</c:if>
<c:if test="${not empty sessionScope.user}">
    <button type="button" class="btn btn-default btn-lg btn-block">您目前有<em id="point">${point}</em>积分</button>
    <%--<<input type="hidden" value="document.getElementById('point').innerTEXT" id="pointhidden">--%>
</c:if>
<div class="g-content">

    <div class="g-lottery-case">

        <div class="g-left">

            <div class="g-lottery-box">
                <div class="g-lottery-img">
                    <a class="playbtn" href="javascript:;" title="开始抽奖"></a>
                </div>
            </div>
        </div>
    </div>
</div>
<script src="<%=basePath%>js/jquery-1.8.3.min.js" type="text/javascript" charset="utf-8"></script>
<script type="text/javascript" src="<%=basePath%>js/jquery.rotate.min.js"></script>


<script>
    $(function () {
        var $btn = $('.playbtn');
        var isture = 0;
        var clickfunc = function () {
            var data = [1, 2, 3, 4, 5, 6, 7, 8, 9, 10];
            //data为随机出来的结果，根据概率后的结果
            data = data[Math.floor(Math.random() * data.length)];
            switch (data) {
                case 1:
                    rotateFunc(1, 3, '谢谢参与~再来一次吧~!');
                    break;
                case 2:
                    rotateFunc(2, 39, '恭喜您获得九折优惠券');
                    break;
                case 3:
                    rotateFunc(3, 75, '谢谢参与~再来一次吧~!');
                    break;
                case 4:
                    rotateFunc(4, 111, '恭喜您获得九折优惠券!');
                    break;
                case 5:
                    rotateFunc(5, 147, '恭喜您获得五折优惠券！');
                    break;
                case 6:
                    rotateFunc(6, 183, '谢谢参与~再来一次吧~!');
                    break;
                case 7:
                    rotateFunc(7, 219, '恭喜您获得八折优惠券！');
                    break;
                case 8:
                    rotateFunc(8, 255, '谢谢参与~再来一次吧~!');
                    break;
                case 9:
                    rotateFunc(9, 291, '恭喜您获得五折优惠券！');
                    break;
                case 10:
                    rotateFunc(10, 327, '恭喜您获得九折优惠券!');
                    break;
            }
        }
        $btn.click(function () {
            if (isture) return; // 如果在执行就退出
            isture = true; // 标志为 在执行
            //先判断是否登录,未登录则执行下面的函数
            <c:choose>
            <c:when test="${empty sessionScope.user}">
            var txt=  "您还未登录，请您先登录！！！！";
            window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);

            </c:when>
            <c:otherwise>
            $.ajax({
                type: "post",
                url: "${pageContext.request.contextPath}/choujiang.action",
                data: "uidd=" + ${sessionScope.user.uid},
                success: function (result) {
                    if (result == 1) {
                        var txt=  "您的积分不足，不能抽奖55555555！！";
                        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.error);
                        isture = false;
                    } else if (result == 2) {
                        clickfunc();
                    }
                }
            });
            </c:otherwise>
            </c:choose>
        });
        var rotateFunc = function (awards, angle, text) {
            isture = true;
            $btn.stopRotate();
            $btn.rotate({
                angle: 0,
                duration: 4000, //旋转时间
                animateTo: angle + 1440, //让它根据得出来的结果加上1440度旋转
                callback: function () {
                    isture = false; // 标志为 执行完毕
                    window.wxc.xcConfirm(text, window.wxc.xcConfirm.typeEnum.success);
                    $.ajax({
                        type: "post",
                        url: "${pageContext.request.contextPath}/choujianghou.action",
                        data: "uidd=" + ${sessionScope.user.uid}+"&jiangli="+awards,

                    });
                    var a = document.getElementById('point').innerHTML;
                    $('#point').html(a-50);


                }
        });

        }
    });
</script>

<div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
    <p>优惠券为美淘全场兑换，本活动最终解释权归美乎所有。</p>

</div>
</body>
</html>

