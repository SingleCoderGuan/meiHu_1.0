<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/6/4
  Time: 21:00
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>设置中心</title>
</head>

<link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css" />
<link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css" />
<link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css" />

<link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/stylebankuai.css" rel="stylesheet" type="text/css" />
<link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" href="<%=basePath%>css/user.css" />
<link rel="stylesheet" href="<%=basePath%>css/user-setting.css" />
<link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />
<script src="<%=basePath%>js/jquery-1.9.1.js" type="text/javascript" charset="utf-8"></script>
<script src="<%=basePath%>js/xcConfirm.js" type="text/javascript" charset="utf-8"></script>
<link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>
<script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
<script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
<script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108" type="text/javascript"></script>
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

<body>
<img src="<%=basePath%>images/bg-halfmei.png" style="position: absolute;top: 150px;left: 23px"/>
<img src="<%=basePath%>images/bg-hu.png" style="position: absolute;top: 450px;left:1004px"/>
    <div class="aw-top-menu-wrap">
        <div class="aw-wecenter aw-top-menu clearfix">
            <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;" />
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="#" id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off" name="q" id="aw-search-query" class="search-query" />
                        <span class="input-group-addon" title="搜索" id="global_search_btns" onClick="$('#global_search_form').submit();"><i class="fa fa-search"></i></span>
                        <div class="clearfix"></div>

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

                        <li class="nav-current" role="presentation">
                            <a href="<%=basePath%>luntan/luntanshouye.action?tid=1">美论首页</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>article/article.action">美文</a>
                        </li>

                        <li>
                            <a href="<%=basePath%>jsp/index.jsp">美淘</a>
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
            <div class="aw-user-nav" style="width: 259px;">
                <!-- 登陆&注册栏 -->
                <a style="position: relative;left: 30px;top: -0.5px;text-align: left;width: 150px" href="<%=basePath%>user/userCenter.action" >
                    <img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/>${user.uname}
                </a>
                <img id="message" hidden style="position: absolute;left: 65px;top: -3px;width: 30px" src="<%=basePath%>images/comment.png"/>

                <a href="<%=basePath%>user/signOut.action" style="position: absolute;left: 215px;top: 0px;">注销</a>
                    <!--<a href="#">注册</a>
                    <a href="#">登录</a>-->

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
        </div>
    </div>

    <div class="aw-container-wrap">
        <div class="container">
            <div class="row">
                <div class="aw-content-wrap clearfix">
                    <div class="aw-user-setting">
                        <div class="tabbable">
                            <ul class="nav nav-tabs aw-nav-tabs active">
                                <li class="active"><a href="#">基本资料</a></li>
                            </ul>
                        </div>

                        <div class="tab-content clearfix">
                            <!-- 基本信息 -->
                            <div class="aw-mod">
                                <div class="mod-body">
                                    <div class="aw-mod mod-base">
                                        <div class="mod-head">
                                            <h3>基本信息</h3>
                                        </div>
                                        <form id="setting_form"  action="<%=basePath%>user/updateUser.action" method="post"  enctype="multipart/form-data">
                                            <div class="mod-body">
                                                <input type="hidden" name="uid" value="${user.uid}" hidden />
                                                <dl>
                                                    <dt>用户名:</dt>
                                                    <dd><input type="text" name="uname" value="${user.uname}"/></dd>
                                                </dl>
                                                <dl>
                                                    <dt>性别:</dt>
                                                    <dd>
                                                        <label>

                                                            <input name="sex" id="sex1" value="男" type="radio"<c:if test="${user.sex=='男'}">checked</c:if> /> 男						</label>
                                                        <label>
                                                            <input name="sex" id="sex2" value="女" type="radio" <c:if test="${user.sex=='女'}">checked="checked"</c:if> /> 女						</label>

                                                    </dd>
                                                </dl>
                                                <dl style="position: relative;top: 10px;">
                                                    <dt>电话:</dt>
                                                    <dd><input type="text" name="tel" value="${user.tel}"/></dd>
                                                </dl>
                                                <dl>
                                                    <dt>邮箱:</dt>
                                                    <dd><input type="text" name="email" value="${user.email}"/></dd>
                                                </dl>

                                                <!-- 上传头像 -->
                                                <div class="side-bar">
                                                    <dl>
                                                        <dt class="pull-left"><img class="aw-border-radius-5" style="width: 100px;height: 100px;" src="<%=basePath%>${user.headpic}" id="img-show"/></dt>
                                                        <dd class="pull-left">
                                                            <h5>头像设置</h5>
                                                            <p>支持 jpg、png 等格式的图片</p>
                                                            <input name="imgFileUp" id="img-upload"  type="file" multiple="multiple" accept="image/*"/>
                                                        </dd>
                                                    </dl>
                                                </div>
                                                <!-- end 上传头像 -->
                                            </div>
                                            <div class="mod-footer clearfix">
                                                <input type="submit"  class="btn btn-large btn-success pull-right" value="保存"></input>
                                            </div>
                                        </form>
                                        <script type="text/javascript">
                                            $('#img-upload').change(function(e){
                                                var input = $("#img-upload");
                                                var file = input[0].files[0];//获取input上传的文件
                                                if(!file.name){
                                                    $(function () {
                                                        var txt=  "未选择图片";
                                                        window.wxc.xcConfirm(txt, window.wxc.xcConfirm.typeEnum.warning);
                                                    })
                                                }else{
                                                    //高版本浏览器对文件上传路径进行了安全处理，无法直接通过获取input的value进行访问，故转化为获取图片的url进行安全访问
                                                    var url = window.URL.createObjectURL(file);//将上传的文件转化为url
                                                    $("#img-show").attr('src', url);//更新img的src属性
                                                };
                                            });
                                        </script>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
<script>
    var uid = ${user.uid}

        $(function () {
            <c:if test="${not empty sessionScope.user.uid}">
            getMessage(uid);
            setInterval("getMessage(uid)",10000);
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
                }else {
                    $("#message").attr("hidden","true")
                }
            }
        })
    }

</script>
</html>
