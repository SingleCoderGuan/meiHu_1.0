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
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
    // String tid = request.getParameter("tid");
%>
<html>
<head>
    <title>后台管理系统</title>
    <meta name="author" content="DeathGhost" />
    <link rel="stylesheet" type="text/css" href="../css/styleadmin.css">
    <link rel="stylesheet" type="text/css" href="../css/bootstrap.css">
    <script src="../js/jquery-3.2.1.min.js"></script>
    <script src="../js/bootstrap.js"></script>
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

    <h2><a href="index.html">管理区</a></h2>
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
            <h2 class="fl">举报处理</h2>
        </div>
        <form action="<%=basePath%>admin/chaxun.action" type="post">
        <section class="mtb">
            <select class="form-control-static" id="isshow" name="isshow" style="width: 200px;">
                <option value="1" <c:if test="${value==1}">selected</c:if>>帖子举报</option>
                <option value="2" <c:if test="${value1==2}">selected</c:if>>评论举报</option>
            </select>
            <input type="submit" value="查询" class="group_btn"/>

        </section>

        </form>



        <table class="table">
            <tr>
                <th>举报编号</th>
                <th>举报人</th>
                <th>举报类型</th>
                <th>举报理由</th>
                <th>举报时间</th>
                <th>操作</th>
            </tr>
            <c:if test="${not empty pageInfo}">
            <c:forEach var="prlist" items="${pageInfo.list}">
            <tr>
                <td class="center">${prlist.reportid}</td>
                <td>${prlist.user.uname}</td>
                <td class="center">帖子举报</td>
                <td class="center">${prlist.reportreason}</td>
                <td class="center">
                    <fmt:formatDate
                            value='${prlist.reporttime}'
                            pattern='yyyy-MM-dd hh:mm:ss'/></td>

                <td class="center">
                    <a data-toggle="modal" data-target="#myModal${prlist.reportid}" >查看</a>
                    <a href="#" onclick="deletepost(${prlist.post.pid})" >删除帖子</a>
                </td>
                <script>
                    function deletepost(pidd){
                       var r = confirm("是否删除");
                       if(r==true){

                        $.ajax({
                            type:"post",
                            url:"${pageContext.request.contextPath}/admin/deletepost.action",
                            data:"pid="+pidd,
                            success:function (data) {
                                if(data==1){
                                    alert("删除成功！！");
                                    window.location.reload();
                                }
                            }
                        });
                       }
                    }
                </script>
            </tr>
                <div class="modal fade" id="myModal${prlist.reportid}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel">帖子详情</h4>
                            </div>
                            <div class="modal-body">
                                <strong>标题</strong>：<br>  ${prlist.post.ptitle}<br>
                                <strong>发帖时间</strong>：<br>  <fmt:formatDate
                                    value='${prlist.post.createtime}'
                                    pattern='yyyy年MM月dd日 hh:mm:ss'/> <br>
                                <strong>内容</strong>：<br>  <p class="lead">${prlist.post.pcontent}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
            </c:forEach>
            </c:if>

            <c:if test="${not empty pageInfo1}">
                <c:forEach items="${pageInfo1.list}" var="crlist">
            <tr>
                <td class="center">${crlist.reportid}</td>
                <td>${crlist.user.uname}</td>
                <td class="center">评论举报</td>
                <td class="center">${crlist.reportreason}</td>
                <td class="center">
                    <fmt:formatDate
                            value='${crlist.reporttime}'
                            pattern='yyyy-MM-dd hh:mm:ss'/></td>

                <td class="center">
                    <a data-toggle="modal" data-target="#myModal${crlist.reportid}" >查看</a>
                    <a href="#" onclick="deletecomment(${crlist.comment.cid})" >删除评论</a>
                </td>
                <script>
                    function deletecomment(cidd) {
                        var r = confirm("是否删除");
                        if (r == true) {

                            $.ajax({
                                type: "post",
                                url: "${pageContext.request.contextPath}/admin/deletecomment.action",
                                data: "cid=" + cidd,
                                success: function (data) {
                                    if (data == 1) {
                                        alert("删除成功！！");
                                        window.location.reload();
                                    }
                                }
                            });
                        }
                    }
                </script>
                <div class="modal fade" id="myModal${crlist.reportid}" tabindex="-1" role="dialog" aria-labelledby="myModalLabel">
                    <div class="modal-dialog" role="document">
                        <div class="modal-content">
                            <div class="modal-header">
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                                <h4 class="modal-title" id="myModalLabel1">评论详情</h4>
                            </div>
                            <div class="modal-body">

                                <strong>评论时间</strong>：<br>  <fmt:formatDate
                                    value='${crlist.comment.commenttime}'
                                    pattern='yyyy年MM月dd日 hh:mm:ss'/> <br>
                                <strong>评论内容</strong>：<br>  <p class="lead">${crlist.comment.commenttext}</p>
                            </div>
                            <div class="modal-footer">
                                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                            </div>
                        </div>
                    </div>
                </div>
                </c:forEach>
            </c:if>
        </table>
<c:if test="${not empty pageInfo}">
        <form id="mainForm"
              action="<%=basePath%>admin/showallpostreport.action"
              method="post">
            <input hidden name="curPage" id="curPage"/>
        </form>
        <aside class="paging">
            <c:if test="${!pageInfo.isFirstPage}">

                <a href="javascript:getPage(${pageInfo.firstPage})">首页</a>
            </c:if>

            <c:if test="${!pageInfo.isFirstPage}">
                <a href="javascript:getPage(${pageInfo.prePage})">上一页</a>
            </c:if>
            <a> 共 ${pageInfo.total}条
                当前第<span>${pageInfo.pageNum}</span>页</a>
            <c:if test="${!pageInfo.isLastPage}">
                <a href="javascript:getPage(${pageInfo.nextPage})">下一页</a>
            </c:if>
            <c:if test="${!pageInfo.isLastPage}">
                <a href="javascript:getPage(${pageInfo.lastPage})">末页</a>
            </c:if>
        </aside>

        <script>
            function getPage(curPage) {
                //将隐藏域的值变成curPage
                document.getElementById("curPage").value = curPage;
                //触发表单的提交事件
                document.getElementById("mainForm").submit();
            }
        </script>
</c:if>
        <c:if test="${not empty pageInfo1}">
            <form id="mainForm1"
                  action="<%=basePath%>admin/chaxun.action?isshow=2"
                  method="post">
                <input hidden name="curPage" id="curPage1"/>
            </form>
            <aside class="paging">
                <c:if test="${!pageInfo1.isFirstPage}">

                    <a href="javascript:getPage1(${pageInfo1.firstPage})">首页</a>
                </c:if>

                <c:if test="${!pageInfo1.isFirstPage}">
                    <a href="javascript:getPage1(${pageInfo1.prePage})">上一页</a>
                </c:if>
                <a> 共 ${pageInfo1.total}条
                    当前第<span>${pageInfo1.pageNum}</span>页</a>
                <c:if test="${!pageInfo1.isLastPage}">
                    <a href="javascript:getPage1(${pageInfo1.nextPage})">下一页</a>
                </c:if>
                <c:if test="${!pageInfo1.isLastPage}">
                    <a href="javascript:getPage1(${pageInfo1.lastPage})">末页</a>
                </c:if>
            </aside>

            <script>
                function getPage1(curPage) {
                    //将隐藏域的值变成curPage
                    document.getElementById("curPage1").value = curPage;
                    //触发表单的提交事件
                    document.getElementById("mainForm1").submit();
                }
            </script>
        </c:if>
    </div>
</section>

</body>
</html>

