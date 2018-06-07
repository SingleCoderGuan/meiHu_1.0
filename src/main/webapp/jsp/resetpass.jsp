<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/5/31
  Time: 10:09
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path =request.getContextPath();
    String basePath =request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html >
<head>

    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>美乎重置密码</title>
    <link href="<%=basePath%>bootstrap/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="<%=basePath%>css/stylelogin.css">
    <link rel="stylesheet" href="<%=basePath%>css/style_inner.css">
    <link href="https://fonts.googleapis.com/css?family=Lato" rel="stylesheet">
    <link rel='stlesheet prefetch' href='https://fonts.googleapis.com/icon?family=Material+Icons'>
    <link href="<%=basePath%>css/demo.css" type="text/css" rel="stylesheet" />
</head>
<body>

<div class="cotn_principal container">
    <div class="cont_centrar">
        <img id="logo" src="<%=basePath%>images/LOGO.png" >
        <span class="slogan">中国最专业化妆品交流平台</span>
        <div style="width: 480px;height: 520px;">
        <form class="resetform" >
            <li style="position: relative;top: 110px;left:-65px;list-style-type:none; ">
                <label class="label" style="position: relative;top: 15px;left: 8px;color:#996666;font-size: 18px" >新  密  码：</label>
                <input  type="password"  value=""style="position: relative; left: 8px;" placeholder="请输入新密码" name="userpassword" class="inputxt" />
            </li>
            <li style="position: relative;top: 150px;left:-65px;list-style-type:none; ">
                <label class="label" style="position: relative;top: 15px;left: -5px;color:#996666;font-size: 18px">确认新密码：</label>
                <input  type="password" value="" style="position: relative; left: -5px;" placeholder="请确认新密码" name="verificationpsw" class="inputxt"/>
            </li>
            <div class="action" style="position: relative;top: 160px;left:-30px ">
                <input type="submit"  class="btn_my_login" value="提 交" />
            </div>
        </form>
        </div>
    </div>
</div>

<script src="<%=basePath%>js/index.js"></script>
<script src="<%=basePath%>js/index_inner.js"></script>
<script src="<%=basePath%>bootstrap/js/bootstrap.min.js"></script>
<script src="<%=basePath%>js/jquery-1.9.1.min.js"></script>
<script src="<%=basePath%>js/Validform_v5.3.2.js"></script>
<script type="text/javascript">

    $(function(){
        var demo=$(".resetform").Validform({
            tiptype:3,
            label:".label",
            showAllError:false,
        });

        demo.addRule([
            {
                ele:".inputxt:eq(0)",
                datatype:"*6-20"
            },
            {
                ele:".inputxt:eq(1)",
                datatype:"*6-20",
                recheck:"userpassword"
            }
        ]);
    })
</script>
</body>
</html>


