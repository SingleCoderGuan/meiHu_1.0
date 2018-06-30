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
    <script src="<%= basePath%>js/jquery.min.js"> </script>
    <script src="<%= basePath%>js/respond.js"></script>

    <style>
        .bt1{
            position: relative;
            left:205px;
            top:-33px;
        }
        #addgood{
            position: relative;
            margin-left:-20px;
            margin-top:-28px;
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

    <h2><a href="#">管理区</a></h2>
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
            <c:if test="${not empty categoryList}">
                <p  style="color: lightpink;font-size:20px;font-weight: bold">商品列表：
                <c:choose>
                    <c:when test="${categoryId==1}">口红专区</c:when>
                    <c:when test="${categoryId==2}">香水专区</c:when>
                    <c:when test="${categoryId==3}">洗面奶专区</c:when>
                    <c:when test="${categoryId==4}">防晒霜专区</c:when>
                    <c:when test="${categoryId==5}">眼霜专区</c:when>
                    <c:when test="${categoryId==6}">水乳专区</c:when>

                </c:choose>
                </p>
            </c:if>
            <c:if test="${empty categoryList}">
                <p  style="color: rgba(136,142,252,0.99);font-size:20px;font-weight: bold">商品列表：</p>
            </c:if>

            <div id="addgood"><a href="<%=basePath%>shopAdmin/showCategoryLists.action"  class="fr top_rt_btn "><strong>+   </strong>添加商品</a></div>
        </div>
        <section class="mtb">

            <form id="myform" action="<%=basePath%>shopAdmin/goodCategory.action" method="post">

               <select id = "see"name="categoryId" class="form-control"  style="width: 200px;">
                    <option value="1">请选择</option>

                  <c:forEach items="${categoryList}" var="category">
                        <option  value="${category.categoryid}" <c:if test="${category.categoryid==categoryId}">selected</c:if> >${category.categoryname}</option>
                  </c:forEach>

               </select>
                <div class="bt1">
                    <input type="submit" value="查询" class="group_btn"/>
                </div>
            </form>

            </br>

        </section>
        <div id="allProducts">
        <table class="table">
            <tr>
                <th>缩略图</th>
                <th>产品名称</th>
                <th>产品号</th>
                <th>产品类别</th>
                <th>单价</th>
                <th>库存</th>
                <th>操作</th>
            </tr>
            <c:if test="${not empty pageInfo}">
            <c:forEach items="${pageInfo.list}" var="allp">
            <tr id="${allp.goodid}">

                <td class="center"><img src="<%=basePath%>${allp.goodpic}" width="50" height="50"/></td>
                <td>${allp.goodname}</td>
                <td class="center">${allp.goodid}</td>
                <td class="center">${allp.category.categoryname}</td>
                <td class="center"><strong class="rmb_icon">${allp.goodprice}</strong></td>
                <td class="center">${allp.goodstore}</td>
                <td class="center">
                    <a href="<%=basePath%>shopAdmin/updateGoods.action?id=${allp.goodid}" title="编辑" >编辑</a>
                    <a href="javascript:void(0)" onclick="deleteGood('${allp.goodid}')" title="删除" >删除</a>
                </td>

            </tr>
            </c:forEach>

        </table>
        </div>
        <script type="text/javascript">
            //根据id删除一条数据
            function deleteGood(id){
                if(confirm("你确定要删除本条数据吗?")){
                    var url="<%=basePath%>/shopAdmin/deleteGood.action";

                    $.get(url,"goodid="+id,function (data) {

                        if(data==1){

                            var tr=$("#"+id);
                            tr.remove();
                            alert("删除成功！！！");
                        }else {

                            alert("删除失败！！！");
                        }
                    });
                }
            }

        </script>
        <form id="mainForm"
              action="<%=basePath%>shopAdmin/getAllProducts.action"
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


    </div>
    <script>
        function getPage(curPage) {
            //将隐藏域的值变成curPage
            document.getElementById("curPage").value = curPage;
            //触发表单的提交事件
            document.getElementById("mainForm").submit();
        }
    </script>
    </c:if>
    <%--<c:if test="${empty pageInfo}">
        <c:forEach items="${pageInfoCategory.list}" var="allp">

            <tr id="${allp.goodid}">

                <td class="center"><img `src="<%=basePath%>${allp.goodpic}" width="50" height="50"/></td>
                <td>${allp.goodname}</td>
                <td class="center">${allp.goodid}</td>
                <td class="center">${allp.category.categoryname}</td>
                <td class="center"><strong class="rmb_icon">${allp.goodprice}</strong></td>
                <td class="center">${allp.goodstore}</td>
                <td class="center">
                    <a href="<%=basePath%>shopAdmin/updateGoods.action?id=${allp.goodid}" title="编辑" >编辑</a>
                    <a href="javascript:void(0)" onclick="deleteGood('${allp.goodid}')" title="删除" >删除</a>
                </td>

            </tr>
        </c:forEach>

        </table>
        </div>
        <script>
            function getPage1(curPage1) {
                //将隐藏域的值变成curPage1
                document.getElementById("curPage1").value = curPage1;
                //触发表单的提交事件
                document.getElementById("mainForm1").submit();
            }
        </script>
        <script type="text/javascript">
            //根据id删除一条数据
            function deleteGood(id){
                if(confirm("你确定要删除本条数据吗?")){
                    var url="<%=basePath%>/shopAdmin/deleteGood.action";

                    $.get(url,"goodid="+id,function (data) {

                        if(data==1){

                            var tr=$("#"+id);
                            tr.remove();
                            alert("删除成功！！！");
                        }else {

                            alert("删除失败！！！");
                        }
                    });
                }
            }

        </script>
        <form id="mainForm1"
              action="<%=basePath%>shopAdmin/goodCategory.action?categoryId=${categoryId}"
              method="post">
            <input hidden name="curPage1" id="curPage1"/>
        </form>
        <aside class="paging">
            <c:if test="${!pageInfoCategory.isFirstPage}">

                <a href="javascript:getPage1(${pageInfoCategory.firstPage})">首页</a>
            </c:if>

            <c:if test="${!pageInfoCategory.isFirstPage}">
                <a href="javascript:getPage1(${pageInfoCategory.prePage})">上一页</a>
            </c:if>
            <a> 共 ${pageInfoCategory.total}条
                当前第<span>${pageInfoCategory.pageNum}</span>页</a>
            <c:if test="${!pageInfoCategory.isLastPage}">
                <a href="javascript:getPage1(${pageInfoCategory.nextPage})">下一页</a>
            </c:if>
            <c:if test="${!pageInfoCategory.isLastPage}">
                <a href="javascript:getPage1(${pageInfoCategory.lastPage})">末页</a>
            </c:if>

        </aside>
    </c:if>--%>

</section>

</body>
</html>

