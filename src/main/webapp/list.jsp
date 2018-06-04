<%--
  Created by IntelliJ IDEA.
  User: Xena
  Date: 2018/5/31
  Time: 下午5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>新闻详情</title>
</head>
<body>

<c:forEach items="${nlist}"  var="news">

    <a href="<%=basePath %>/infor.action?id=${news.id}">${news.title}</a><br/>

</c:forEach>








</body>
</html>
