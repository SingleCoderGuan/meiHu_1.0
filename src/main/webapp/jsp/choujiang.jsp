<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/7/007
  Time: 9:07
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<html>
<head>
    <title>兑换专区</title>
    <meta name="keywords" content="美论"/>
    <meta name="description" content="美论"/>
    <link rel="shortcut icon" type="image/x-icon" href="<%=basePath%>/images/defaultheadpic.png" />

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css"/>

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/link.css" rel="stylesheet" type="text/css"/>
    <link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css"/>

    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>

    <link rel="stylesheet" href="<%=basePath%>css/project.css"/>
    <link rel="stylesheet" href="<%=basePath%>css/hb.css"/>
    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/xcConfirm.css"/>

    <script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
    <script src="<%=basePath%>js/jquery.js" type="text/javascript"></script>


    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108"
            type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/functions.js?v=20171108" type="text/javascript"></script>

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/common.js?v=20171108" type="text/javascript"></script>

    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/compatibility.js"></script>

</head>
<style type="text/css">
    .sponsor .sponsor-level {
        width: 13px;
        height: 13px;
        position: absolute;
        left: 45px;
        top: 9px;
        margin-left: 0;
    }

    .sponsor .sponsor-count {
        width: 8px;
        height: 8px;
        position: absolute;
        left: 48px;
        top: 11px;
        margin-left: 0;
    }
</style>
<style>
    .g-content {
        width: 100%;

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
<style>
    .ad-item {
        position: relative;
    }

    .ad-item .close {
        position: absolute;
        width: 18px;
        height: 18px;
        background-color: #000000;
        opacity: 0.5;
        text-align: center;
        right: 0px;
        top: 0px;
        line-height: 18px;
        display: none;
    }

    .ad-item .close a {
        font-size: 14px;
        color: #FFFFFF;
        text-decoration: none;
    }

    .ad-item .guide {
        display: none;
    }

    .ad-item:hover .close {
        display: block;
    }
</style>

<body >
<div id="petalbox"></div>
<div class="aw-top-menu-wrap">
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;"/>
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="<%=basePath%>search/searchReasult.action" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off"
                               name="searchcontent" id="aw-search-query" class="search-query"/>
                        <span class="input-group-addon" title="搜索" id="global_search_btns"
                              onClick="$('#global_search_form').submit();">搜索</span>
                        <div id="context1" style="background-color:white; border: 1px solid deepskyblue;width:167px;
                                position: absolute;top: 36px;left:0px;display:none" ></div>
                        <script>
                            $("#aw-search-query").keyup(function(){
                                var content=$(this).val();
                                //如果当前搜索内容为空，无须进行查询
                                if(content==""){
                                    $("#context1").css("display","none");
                                    return ;
                                }
                                //由于浏览器的缓存机制 所以我们每次传入一个时间
                                var time=new Date().getTime();
                                $.ajax({
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    type:"post",
                                    url:"${pageContext.request.contextPath}/search/automatch.action",
                                    data:{name:content,time:time},
                                    success:function(data){
                                        //拼接html
                                        var res=data.split(",");
                                        var html="";
                                        for(var i=0;i<res.length;i++){
                                            //每一个div还有鼠标移出、移入点击事件
                                            html+="<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>"+res[i]+"</div>";
                                        }
                                        $("#context1").html(html);
                                        //显示为块级元素
                                        $("#context1").css("display","block");
                                    }
                                });
                            });

                            //鼠标移动到内容上
                            function changeBackColor_over(div){
                                $(div).css("background-color","#CCCCCC");
                            }
                            //鼠标离开内容
                            function changeBackColor_out(div){
                                $(div).css("background-color","");
                            }
                            //将点击的内容放到搜索框
                            function setSearch_onclick(div){
                                $("#aw-search-query").val(div.innerText);
                                $("#context1").css("display","none");
                            }
                        </script>

                    </div>
                </form>
            </div>
            <!-- end 搜索框 -->
            <!-- 导航 -->
            <div class="aw-top-nav navbar">
                <div class="navbar-header">
                    <button class="navbar-toggle pull-left">
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                        <span class="icon-bar"></span>
                    </button>
                </div>
                <nav role="navigation" class="collapse navbar-collapse bs-navbar-collapse">
                    <ul class="nav navbar-nav">


                        <li>
                            <a href="<%=basePath%>luntan/luntanshouye.action?tid=1">美论</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美淘</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>article/article.action">美文</a>
                        </li>
                        <li>
                            <a href="<%=basePath%>jsp/activity.jsp">精彩活动</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>user/fatie.action">发帖</a>
                        </li>

                    </ul>
                </nav>

            </div>
            <!-- end 导航 -->
            <!-- 用户栏 -->
            <div class="aw-user-nav">
                <!-- 登陆&注册栏 -->
                <span>
                     <c:if test="${not empty sessionScope.user}">
                          <a style="position: relative;left: -40px;top: -0.5px;" href="<%=basePath%>user/userCenter.action" >
                        <img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/> ${user.uname}
                    </a>
                         <img id="message" hidden style="position: absolute;left: 30px;top: 40px;width: 30px" src="<%=basePath%>images/comment.png"/>

                         <a href="<%=basePath%>user/signOut.action" style="position: relative;left: 250px;">注销</a>
                     </c:if>
                    <c:if test="${empty sessionScope.user}">
                        <a href="<%=basePath %>jsp/loginregister.jsp">注册</a>
                        <a href="<%=basePath %>jsp/loginregister.jsp">登录</a>
                    </c:if>

						</span>

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
    </div>
</div>


<div class="aw-container-wrap aw-project-container-wrap">
    <div class="aw-container aw-wecenter">
        <div class="container">
            <div class="row">
                <div class="col-sm-12 col-md-12">
                    <div class="aw-nav-filter">
                        <div class="mod-head clearfix">
                            <h2 class="pull-left"><i class="icon icon-users"></i>美论美换兑换专区(以下券均为全场通用)</h2>
                            <c:if test="${empty sessionScope.user.uid}">
                                <h1 class="pull-right">登录即可查看积分</h1>

                            </c:if>
                            <c:if test="${not empty sessionScope.user.uid}">
                                <h1 class="pull-right">可在个人中心查看已获得的优惠券，您当前剩余积分<strong id="point">${point}</strong>分</h1>
                                <%--<input type="hidden" id="point" value="${point}">--%>

                            </c:if>

                        </div>


                    </div>
                </div>
                <div style="text-align:center;margin:50px 0; font:normal 14px/24px 'MicroSoft YaHei';">
                    <p>优惠券为美淘全场兑换，本活动最终解释权归美乎所有。</p>

                </div>
            </div>
        </div>
    </div>
</div>

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


<script>

    $(function () {
        <c:if test="${not empty sessionScope.user.uid}">
        getMessage(${sessionScope.user.uid});
        setInterval("getMessage(${sessionScope.user.uid})",10000);
        </c:if>
    })

    function getMessage(uid) {
        $.ajax({
            type:"post",
            url:"${pageContext.request.contextPath}/user/getMessage.action",
            data:"uid="+uid,
            success:function (data) {
                if(data!="0"){
                    $("#message").removeAttr("hidden")
                    $("#messageNum").html(data)
                }else {
                    $("#message").attr("hidden","true")
                    $("#messageNum").html(0)
                }
            }
        })
    }

</script>

<div class="aw-footer aw-wecenter">
    <p>© 2018 美乎. All rights reserved | Design by
        <a href="#">第六组</a>
    </p>
    </span>

    <!--<span class="hidden-xs"><a href="//ask.dcloud.net.cn/feed/" target="blank"><i class="fa fa-rss-square"></i> RSS Feed</a></span>-->

</div>
</body>

</html>

