<%--
  Created by IntelliJ IDEA.
  User: Xena
  Date: 2018/5/31
  Time: 下午5:51
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<html>
<head>
    <title>新闻详情</title>
</head>
<body>

<center><h1>${news.title}</h1></center>
       <p>时间 ${news.createTime}</p>

    <div style="width: 800px;display: inline-block; margin: 10px auto">

        ${news.content}





    </div>


  <a href="<%=basePath%>/list.action">查看新闻列表</a>









</body>
</html>
