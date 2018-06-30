<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/6/9/009
  Time: 15:22
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jstl/core_rt" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost"/>
    <link rel="stylesheet" type="text/css" href="../css/styleadmin.css">
    <link href="<%= basePath%>css/bootstrap.css" rel='stylesheet' type='text/css' />
    <!--[if lt IE 9]>
    <script src="../js/html5.js"></script>
    <![endif]-->
    <script src="../js/jquery.js"></script>
    <script src="../js/jquery.mCustomScrollbar.concat.min.js"></script>
    <script>

        (function ($) {
            $(window).load(function () {

                $("a[rel='load-content']").click(function (e) {
                    e.preventDefault();
                    var url = $(this).attr("href");
                    $.get(url, function (data) {
                        $(".content .mCSB_container").append(data); //load new content inside .mCSB_container
                        //scroll-to appended content
                        $(".content").mCustomScrollbar("scrollTo", "h2:last");
                    });
                });

                $(".content").delegate("a[href='top']", "click", function (e) {
                    e.preventDefault();
                    $(".content").mCustomScrollbar("scrollTo", $(this).attr("href"));
                });

            });
        })(jQuery);
    </script>
    <style>
        #img-upload{
            position: relative;
            top:-60px;
            left:280px;
        }
    </style>
</head>
<body>
<!--header-->
<header style="height: 71px">
    <h1><img src="<%=basePath%>images/LOGO.png"/></h1>
    <ul class="rt_nav">
        <li><a href="#" class="website_icon">站点首页</a></li>
        <li><a href="<%=basePath%>admin/adminlogin.jsp" class="quit_icon">安全退出</a></li>
    </ul>
</header>
<!--aside nav-->
<!--aside nav-->
<aside class="lt_aside_nav content mCustomScrollbar">
    <h2><a href="#">管理区 </a></h2>
    <ul>
        <li>
            <dl>
                <dt>商品信息</dt>
                <dd><a href="<%=basePath%>shopAdmin/getAllProducts.action" >查看商品</a></dd>
                <dd><a href="<%=basePath%>shopAdmin/showCategoryLists.action">商品上架</a></dd>
            </dl>
        </li>
        <li>
            <dl>
                <dt>订单信息</dt>
                <dd><a href="<%=basePath%>shopAdminManage/selectYiFuKuanOrder.action">订单管理</a></dd>
                <dd><a href="<%=basePath%>shopAdminManage/selectDrawbackInfo.action">退货信息</a></dd>
            </dl>
        </li>

        <li>
            <dl>
                <dt>论坛信息</dt>
                <dd><a href="<%=basePath%>admin/showallpostreport.action">举报信息</a></dd>

            </dl>
        </li>
        <li>
            <dl>
                <dt>文章管理</dt>
                <dd><a href="<%=basePath%>admin/wenzhangfabiao.jsp">文章发表</a></dd>
                <dd><a href="<%=basePath%>admin/articleList.action">文章查看</a></dd>
            </dl>
        </li>

    </ul>
</aside>
<section class="rt_wrap content mCustomScrollbar">
    <div class="rt_content">
        <div class="page_title">
            <p  style="font-size: 20px;font-weight: bold;color: lightpink">商品修改</p>

        </div>
        <section>
            <div>

                <form class="form-horizontal" action="<%=basePath%>shopAdmin/updateGoodTrue.action?goodid=${good.goodid}"
                      method="post" enctype="multipart/form-data">

                    <div class="form-group">
                        <label for="inputEmail3" class="col-sm-2 control-label">商品序号:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="empid" value="${good.goodid}" id="inputEmail3" placeholder="商品号" disabled>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3"class="col-sm-2 control-label" >商品名称:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" value="${good.goodname}" name="goodname"/>
                        </div>
                    </div>


                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">商品价格:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" value="${good.goodprice}" name="goodprice" placeholder="商品价格">
                        </div>
                    </div>



                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">商品库存:</label>
                        <div class="col-sm-3">
                            <input type="text" class="form-control" name="goodstore" value='${good.goodstore}'   placeholder="商品库存">
                        </div>
                    </div>
                   <div class="form-group">
                       <label for="inputPassword3" class="col-sm-2 control-label">上传图片:</label>

                        <img name="goodpic" src="<%=application.getContextPath()%>/${good.goodpic}" id="img-show"
                                   width="90px" height="90px"/>
                        <input name="imgFileUp"  id="img-upload"  type="file" multiple="multiple" accept="image/*"/>



                        <script type="text/javascript">
                            $('#img-upload').change(function(e){
                                var input = $("#img-upload");
                                var f = input[0].files[0];//获取input上传的文件
                                if(!f.name){
                                    alert("未选择图片");
                                }else{
                                    //高版本浏览器对文件上传路径进行了安全处理，无法直接通过获取input的value进行访问，故转化为获取图片的url进行安全访问
                                    var url = window.URL.createObjectURL(f);//将上传的文件转化为url
                                    $("#img-show").attr('src', url);//更新img的src属性
                                };
                            });
                        </script>
                   </div>



                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">商品地址:</label>
                        <div class="col-sm-3">
                            <input type="text" name="goodaddress" class="form-control" value='${good.goodaddress}' id="inputPassword3"  placeholder="商品地址">
                        </div>
                    </div>

                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">商品销量:</label>
                        <div class="col-sm-3">
                            <input type="text" name="goodsales" class="form-control" value='${good.goodsales}'   placeholder="商品销量" disabled>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="inputPassword3" class="col-sm-2 control-label">商品简介:</label>
                        <div class="col-sm-3">
                            <input type="textarea"  name="gooddetail" class="form-control" value='${good.gooddetail}'placeholder="商品简介">
                        </div>
                    </div>

                    <div class="form-group">
                        <div class="col-sm-offset-2 col-sm-3">

                            <input class="btn btn-default btn-lg" type="submit" value="提交"/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                            <input class="btn btn-default btn-lg" type="reset" value="取消"/>

                        </div>
                    </div>
                </form>
            </div>

        </section>
    </div>
</section>


</body>
</html>

