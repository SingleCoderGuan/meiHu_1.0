<%--
  Created by IntelliJ IDEA.
  User: chimeralala
  Date: 2018/6/2
  Time: 10:16
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort() + path + "/";
%>
<!DOCTYPE html>
<html>

<head>

    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title>文章发布</title>

    <script type="text/javascript" src="<%= basePath%>/release/jquery-3.2.1.min.js"></script>
    <script type="text/javascript" src="<%= basePath%>/release/wangEditor.min.js"></script>

    <link rel="stylesheet" type="text/css" href="<%=basePath%>css/bootstrap.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/font-awesome.css"/>
    <link rel="stylesheet" type="text/css" href="//img-cdn-qiniu.dcloud.net.cn/static/css/aw-font.css"/>

    <link href="<%=basePath%>css/common.css" rel="stylesheet" type="text/css"/>
    <link rel="shortcut icon" type="image/x-icon" href="../images/defaultheadpic.png" />

    <link href="<%=basePath%>css/classblack.css" rel="stylesheet" type="text/css"/>

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.2.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/jquery.form.js?v=20171108" type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/plug_module/plug-in_module.js?v=20171108"
            type="text/javascript"></script>
    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/functions.js?v=20171108" type="text/javascript"></script>

    <script src="//img-cdn-qiniu.dcloud.net.cn/static/js/common.js?v=20171108" type="text/javascript"></script>

    <script type="text/javascript" src="//img-cdn-qiniu.dcloud.net.cn/static/js/compatibility.js"></script>
    <style type="text/css">
        .toolbar {
            border: 1px solid #ccc;
        }
    </style>
    <script>
        function subm() {
            document.getElementById('content').value = editor.txt.html();
            document.getElementById('newspost').submit();
        }
    </script>
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
<img src="<%=basePath%>images/bg-halfmei.png" style="position: absolute;top: 150px;left: 33px"/>
<img src="<%=basePath%>images/bg-hu.png" style="position: absolute;top: 450px;left:1004px"/>
<div class="aw-top-menu-wrap" style="height: 55px">
    <div class="aw-wecenter aw-top-menu clearfix">
        <div class="container">
            <!-- logo -->
            <div class="aw-logo hidden-xs">
                <img src="<%=basePath%>images/LOGO.png" style="width: 72px; height: 41px;"/>
            </div>
            <!-- end logo -->
            <!-- 搜索框 -->
            <div class="aw-search-box  hidden-xs hidden-sm">
                <form class="navbar-search pull-right" action="<%=basePath%>search/searchReasult.action"
                      id="global_search_form" method="post">
                    <div class="input-group">
                        <input value="" class="form-control" type="text" placeholder="搜索问题、话题" autocomplete="off"
                               name="searchcontent
" id="aw-search-query" class="search-query"/>
                        <span class="input-group-addon" title="搜索" id="global_search_btns"
                              onClick="$('#global_search_form').submit();">搜索</span>
                        <div id="context1" style="background-color:white; border: 1px solid deepskyblue;width:167px;
                                position: absolute;top: 36px;left:0px;display:none"></div>
                        <script>
                            $("#aw-search-query").keyup(function () {
                                var content = $(this).val();
                                //如果当前搜索内容为空，无须进行查询
                                if (content == "") {
                                    $("#context1").css("display", "none");
                                    return;
                                }
                                //由于浏览器的缓存机制 所以我们每次传入一个时间
                                var time = new Date().getTime();
                                $.ajax({
                                    contentType: "application/x-www-form-urlencoded; charset=utf-8",
                                    type: "post",
                                    url: "${pageContext.request.contextPath}/search/automatch.action",
                                    data: {name: content, time: time},
                                    success: function (data) {
                                        //拼接html
                                        var res = data.split(",");
                                        var html = "";
                                        for (var i = 0; i < res.length; i++) {
                                            //每一个div还有鼠标移出、移入点击事件
                                            html += "<div onclick='setSearch_onclick(this)' onmouseout='changeBackColor_out(this)' onmouseover='changeBackColor_over(this)'>" + res[i] + "</div>";
                                        }
                                        $("#context1").html(html);
                                        //显示为块级元素
                                        $("#context1").css("display", "block");
                                    }
                                });
                            });

                            //鼠标移动到内容上
                            function changeBackColor_over(div) {
                                $(div).css("background-color", "#CCCCCC");
                            }

                            //鼠标离开内容
                            function changeBackColor_out(div) {
                                $(div).css("background-color", "");
                            }

                            //将点击的内容放到搜索框
                            function setSearch_onclick(div) {
                                $("#aw-search-query").val(div.innerText);
                                $("#context1").css("display", "none");
                            }
                        </script>
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
            <div class="aw-user-nav" style="width: 259px">
                <!-- 登陆&注册栏 -->
                <span>
                    <a href="<%=basePath%>user/userCenter.action" style="position: relative;left: -100px;top: -0.5px;"><img style="width: 55px;height: 55px;" src="<%=basePath%>${user.headpic}"/>${user.uname}</a>
                         <img id="message" hidden style="position: absolute;left: 60px;top: -3px;width: 30px" src="<%=basePath%>images/comment.png"/>
                         <a href="<%=basePath%>user/signOut.action" style="position: absolute;left: 200px;">注销</a>
                </span>

                <!-- end 登陆&注册栏 -->
            </div>
            <!-- end 用户栏 -->
            <!-- 发起 -->
            <!-- end 发起 -->
        </div>
    </div>
</div>

<div class="aw-container-wrap">
    <div class="container aw-publish">
        <div class="row">
            <div class="aw-content-wrap clearfix">
                <div class="col-sm-12 col-md-9 aw-main-content">
                    <!-- tab 切换 -->
                    <ul class="nav nav-tabs aw-nav-tabs active">
                        <li>
                            <a>发表帖子</a>
                        </li>

                    </ul>
                    <!-- end tab 切换 -->
                    <form id="newspost" method="post" action="<%=application.getContextPath()%>/user/newpost.action"
                          enctype="multipart/form-data">

                        <span style="position: relative;left:5px;top: 5px;font-size: 20px">标题：</span>
                        <input type="text" style="width: 590px;position: relative;top: 10px; " class="form-control"
                               id="title" name="ptitle"/><br/><br/>

                        <span style="position: relative;left:5px;top: -11px;font-size: 20px">板块：</span>
                        <select style="position: relative;top: -10px;width: 130px" class="form-control" id="topicList"
                                name="topicid">
                            <option value="1">香水</option>
                            <option value="2">水乳</option>
                            <option value="3">口红</option>
                            <option value="4">防晒霜</option>
                            <option value="5">洗面奶</option>
                            <option value="6">眼霜</option>
                            <option value="7">代购</option>
                        </select>

                        <input type="hidden" id="content" name="pcontent"/>

                        <div id="div1" class="toolbar">
                        </div>
                        <div style="padding: 5px 0; color: #ccc"></div>
                        <div id="div2" class="text" style="height: 480px;">

                        </div>
                        <input type="button" value="发表" style="width: 50px;" onclick="subm()"/>

                    </form>

                </div>
                <!-- 侧边栏 -->
                <div class="col-sm-12 col-md-3 aw-side-bar hidden-xs">
                    <!-- 问题发起指南 -->
                    <div class="aw-mod publish-help">
                        <div class="mod-head">
                            <h3>问题发起指南</h3>
                        </div>
                        <div class="mod-body">
                            <p><b>• 问题标题:</b> 请用准确的语言描述您发布的问题思想</p>
                            <br/>
                            <p><b>• 问题补充:</b> 详细补充您的帖子内容, 并提供一些相关的素材以供参与者更多的了解您所要问题的主题思想</p>
                            <br/>
                            <p><b>• 关于积分：</b> 发起一个帖子会增加您 5 个积分, 每多一个回复你将获得 3 个积分的奖励 ,积分在商城可兑换商品,
                                在发起问题的时候希望能够更好的描述您的问题以及多使用站内搜索功能.</p>
                        </div>
                    </div>
                    <!-- end 问题发起指南 -->
                </div>
                <!-- end 侧边栏 -->
            </div>
        </div>
    </div>
</div>
<script type="text/javascript">

    var E = window.wangEditor;
    var editor = new E('#div1', '#div2');

    // 颜色
    editor.customConfig.colors = ['#EE00EE', '#EE0000', '#EDEDED', '#EBEBEB', '#EAEAEA', '#E9967A', '#E8E8E8', '#E6E6FA', '#E5E5E5', '#E3E3E3', '#E0FFFF', '#E0EEEE', '#E0EEE0', '#E0E0E0', '#E066FF', '#DEDEDE', '#DEB887', '#DDA0DD', '#DCDCDC', '#DC143C', '#DBDBDB', '#DB7093', '#DAA520', '#DA70D6', '#D9D9D9', '#D8BFD8', '#D6D6D6', '#D4D4D4', '#D3D3D3', '#D2B48C', '#D2691E', '#D1EEEE', '#D1D1D1', '#D15FEE', '#D02090', '#CFCFCF', '#CDCDC1', '#CDCDB4', '#CDCD00', '#CDC9C9', '#CDC9A5', '#CDC8B1', '#CDC673', '#CDC5BF', '#CDC1C5', '#CDC0B0', '#CDBE70', '#CDBA96', '#CDB7B5', '#CDB79E', '#CDB5CD', '#CDB38B', '#CDAF95', '#CDAD00', '#CDAA7D', '#CD9B9B', '#CD9B1D', '#CD96CD', '#CD950C', '#CD919E', '#CD8C95', '#CD853F', '#CD8500', '#CD8162', '#CD7054', '#CD69C9', '#CD6889', '#CD6839', '#CD661D', '#CD6600', '#CD6090', '#CD5C5C', '#CD5B45', '#CD5555', '#CD4F39', '#CD3700', '#CD3333', '#CD3278', '#CD2990', '#CD2626', '#CD1076', '#CD00CD', '#CD0000', '#CCCCCC', '#CAFF70', '#CAE1FF', '#C9C9C9', '#C7C7C7', '#C71585', '#C6E2FF', '#C67171', '#C5C1AA', '#FFFFFF', '#FFFFF0', '#FFFFE0', '#FFFF00', '#FFFAFA', '#FFFAF0', '#FFFACD', '#FFF8DC', '#FFF68F', '#FFF5EE', '#FFF0F5', '#FFEFDB', '#FFEFD5', '#FFEC8B', '#FFEBCD', '#FFE7BA', '#FFE4E1', '#FFE4C4', '#FFE4B5', '#FFE1FF', '#FFDEAD', '#FFDAB9', '#FFD700', '#FFD39B', '#FFC1C1', '#FFC125', '#FFC0CB', '#FFBBFF', '#FFB90F', '#FFB6C1', '#FFB5C5', '#FFAEB9', '#FFA54F', '#FFA500', '#FFA07A', '#FF8C69', '#FF8C00', '#FF83FA', '#FF82AB', '#FF8247', '#FF7F50', '#FF7F24', '#FF7F00', '#FF7256', '#FF6EB4', '#FF6A6A', '#FF69B4', '#FF6347', '#FF4500', '#FF4040', '#FF3E96', '#FF34B3', '#FF3030', '#FF1493', '#FF00FF', '#FF0000', '#FDF5E6', '#FCFCFC', '#FAFAFA', '#FAFAD2', '#FAF0E6', '#FAEBD7', '#FA8072', '#F8F8FF', '#F7F7F7', '#F5FFFA', '#F5F5F5', '#F5F5DC', '#F5DEB3', '#F4F4F4', '#F4A460', '#F2F2F2', '#F0FFFF', '#F0FFF0', '#F0F8FF', '#F0F0F0', '#F0E68C', '#F08080', '#EEEEE0', '#EEEED1', '#EEEE00', '#EEE9E9', '#EEE9BF', '#EEE8CD', '#EEE8AA', '#EEE685', '#EEE5DE', '#EEE0E5', '#EEDFCC', '#EEDC82', '#EED8AE', '#EED5D2', '#EED5B7', '#EED2EE', '#EECFA1', '#EECBAD', '#EEC900', '#EEC591', '#EEB4B4', '#EEB422', '#EEAEEE', '#EEAD0E', '#EEA9B8', '#EEA2AD', '#EE9A49', '#EE9A00', '#EE9572', '#EE82EE', '#EE8262', '#EE7AE9', '#EE799F', '#EE7942', '#EE7621', '#EE7600', '#EE6AA7', '#EE6A50', '#EE6363', '#EE5C42', '#EE4000', '#EE3B3B', '#EE3A8C', '#EE30A7', '#EE2C2C', '#EE1289', '#C4C4C4', '#C2C2C2', '#C1FFC1', '#C1CDCD', '#C1CDC1', '#C1C1C1', '#C0FF3E', '#BFEFFF', '#BFBFBF', '#BF3EFF', '#BEBEBE', '#BDBDBD', '#BDB76B', '#BCEE68', '#BCD2EE', '#BC8F8F', '#BBFFFF', '#BABABA', '#BA55D3', '#B9D3EE', '#B8B8B8', '#B8860B', '#B7B7B7', '#B5B5B5', '#B4EEB4', '#B4CDCD', '#B452CD', '#B3EE3A', '#B3B3B3', '#B2DFEE', '#B23AEE', '#B22222', '#B0E2FF', '#B0E0E6', '#B0C4DE', '#B0B0B0', '#B03060', '#AEEEEE', '#ADFF2F', '#ADD8E6', '#ADADAD', '#ABABAB', '#AB82FF', '#AAAAAA', '#A9A9A9', '#A8A8A8', '#A6A6A6', '#A52A2A', '#A4D3EE', '#A3A3A3', '#A2CD5A', '#A2B5CD', '#A1A1A1', '#A0522D', '#A020F0', '#9FB6CD', '#9F79EE', '#9E9E9E', '#9C9C9C', '#9BCD9B', '#9B30FF', '#9AFF9A', '#9ACD32', '#9AC0CD', '#9A32CD', '#999999', '#9932CC', '#98FB98', '#98F5FF', '#97FFFF', '#96CDCD', '#969696', '#949494', '#9400D3', '#9370DB', '#919191', '#912CEE', '#90EE90', '#8FBC8F', '#8F8F8F', '#8EE5EE', '#8E8E8E', '#8E8E38', '#8E388E', '#8DEEEE', '#8DB6CD', '#8C8C8C', '#8B8B83', '#8B8B7A', '#8B8B00', '#8B8989', '#8B8970', '#8B8878', '#8B8682', '#8B864E', '#8B8386', '#8B8378', '#8B814C', '#8B7E66', '#8B7D7B', '#8B7D6B', '#8B7B8B', '#8B795E', '#8B7765', '#8B7500', '#8B7355', '#8B6969', '#8B6914', '#8B668B', '#8B6508', '#8B636C', '#8B5F65', '#8B5A2B', '#8B5A00', '#8B5742', '#8B4C39', '#8B4789', '#8B475D', '#8B4726', '#8B4513', '#8B4500', '#8B3E2F', '#8B3A62', '#8B3A3A', '#8B3626', '#8B2500', '#8B2323', '#8B2252', '#8B1C62', '#8B1A1A', '#8B0A50', '#8B008B', '#8B0000', '#8A8A8A', '#8A2BE2', '#8968CD', '#87CEFF', '#87CEFA', '#87CEEB', '#878787', '#858585', '#848484', '#8470FF', '#838B8B', '#838B83', '#836FFF', '#828282', '#7FFFD4', '#7FFF00', '#7F7F7F', '#7EC0EE', '#7D9EC0', '#7D7D7D', '#7D26CD', '#7CFC00', '#7CCD7C', '#7B68EE', '#7AC5CD', '#7A8B8B', '#7A7A7A', '#7A67EE', '#7A378B', '#79CDCD', '#787878', '#778899', '#76EEC6', '#76EE00', '#757575', '#737373', '#71C671', '#7171C6', '#708090', '#707070', '#6E8B3D', '#6E7B8B', '#6E6E6E', '#6CA6CD', '#6C7B8B', '#6B8E23', '#6B6B6B', '#6A5ACD', '#698B69', '#698B22', '#696969', '#6959CD', '#68838B', '#68228B', '#66CDAA', '#66CD00', '#668B8B', '#666666', '#6495ED', '#63B8FF', '#636363', '#616161', '#607B8B', '#5F9EA0', '#5E5E5E', '#5D478B', '#5CACE', '#5C5C5C', '#5B5B5B', '#595959', '#575757', '#556B2F', '#555555', '#551A8B', '#54FF9F', '#548B54', '#545454', '#53868B', '#528B8B', '#525252', '#515151', '#4F94CD', '#4F4F4F', '#4EEE94', '#4D4D4D', '#4B0082', '#4A708B', '#4A4A4A', '#48D1CC', '#4876FF', '#483D8B', '#474747', '#473C8B', '#4682B4', '#458B74', '#458B00', '#454545', '#43CD80', '#436EEE', '#424242', '#4169E1', '#40E0D0', '#404040', '#3D3D3D', '#3CB371', '#3B3B3B', '#3A5FCD', '#388E8E', '#383838', '#36648B', '#363636', '#333333', '#32CD32', '#303030', '#2F4F4F', '#2E8B57', '#2E2E2E', '#2B2B2B', '#292929', '#282828', '#27408B', '#262626', '#242424', '#228B22', '#218868', '#212121', '#20B2AA', '#1F1F1F', '#1E90FF', '#1E1E1E', '#1C86EE', '#1C1C1C', '#1A1A1A', '#191970', '#1874CD', '#171717', '#141414', '#121212', '#104E8B', '#0F0F0F', '#0D0D0D', '#0A0A0A', '#080808', '#050505', '#030303', '#00FFFF', '#00FF7F', '#00FF00', '#00FA9A', '#00F5FF', '#00EEEE', '#00EE76', '#00EE00', '#00E5EE', '#00CED1', '#00CDCD', '#00CD66', '#00CD00', '#00C5CD', '#00BFFF', '#00B2EE', '#009ACD', '#008B8B', '#008B45', '#008B00', '#00868B', '#00688B', '#006400', '#0000FF', '#0000EE', '#0000CD', '#0000AA', '#00008B', '#000080', '#000000'
    ];

    //表情包
    editor.customConfig.emotions = [

        {

            title: '表情包',
            type: 'image',
            content: [
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/41/zz2_org.gif", alt: "[织]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_org.gif", alt: "[神马]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/fuyun_org.gif", alt: "[浮云]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_org.gif", alt: "[给力]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_org.gif", alt: "[围观]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_org.gif", alt: "[威武]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_org.gif", alt: "[熊猫]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/81/rabbit_org.gif", alt: "[兔子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/otm_org.gif", alt: "[奥特曼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_org.gif", alt: "[囧]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/hufen_org.gif", alt: "[互粉]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c4/liwu_org.gif", alt: "[礼物]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_org.gif", alt: "[呵呵]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_org.gif", alt: "[嘻嘻]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/laugh.gif", alt: "[哈哈]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/14/tza_org.gif", alt: "[可爱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/kl_org.gif", alt: "[可怜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/kbsa_org.gif", alt: "[挖鼻屎]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f4/cj_org.gif", alt: "[吃惊]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/shamea_org.gif", alt: "[害羞]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c3/zy_org.gif", alt: "[挤眼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/29/bz_org.gif", alt: "[闭嘴]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/71/bs2_org.gif", alt: "[鄙视]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/lovea_org.gif", alt: "[爱你]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9d/sada_org.gif", alt: "[泪]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/heia_org.gif", alt: "[偷笑]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8f/qq_org.gif", alt: "[亲亲]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b6/sb_org.gif", alt: "[生病]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/58/mb_org.gif", alt: "[太开心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/17/ldln_org.gif", alt: "[懒得理你]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/98/yhh_org.gif", alt: "[右哼哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/zhh_org.gif", alt: "[左哼哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a6/x_org.gif", alt: "[嘘]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/cry.gif", alt: "[衰]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/73/wq_org.gif", alt: "[委屈]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/t_org.gif", alt: "[吐]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f3/k_org.gif", alt: "[打哈气]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/27/bba_org.gif", alt: "[抱抱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7c/angrya_org.gif", alt: "[怒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5c/yw_org.gif", alt: "[疑问]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a5/cza_org.gif", alt: "[馋嘴]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/88_org.gif", alt: "[拜拜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e9/sk_org.gif", alt: "[思考]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/24/sweata_org.gif", alt: "[汗]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/sleepya_org.gif", alt: "[困]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/sleepa_org.gif", alt: "[睡觉]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/90/money_org.gif", alt: "[钱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/sw_org.gif", alt: "[失望]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/cool_org.gif", alt: "[酷]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8c/hsa_org.gif", alt: "[花心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/49/hatea_org.gif", alt: "[哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/36/gza_org.gif", alt: "[鼓掌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/dizzya_org.gif", alt: "[晕]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1a/bs_org.gif", alt: "[悲伤]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/62/crazya_org.gif", alt: "[抓狂]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/h_org.gif", alt: "[黑线]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/yx_org.gif", alt: "[阴险]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/nm_org.gif", alt: "[怒骂]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/hearta_org.gif", alt: "[心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ea/unheart.gif", alt: "[伤心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/58/pig.gif", alt: "[猪头]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d6/ok_org.gif", alt: "[ok]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/ye_org.gif", alt: "[耶]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/good_org.gif", alt: "[good]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c7/no_org.gif", alt: "[不要]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/z2_org.gif", alt: "[赞]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/come_org.gif", alt: "[来]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/sad_org.gif", alt: "[弱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/lazu_org.gif", alt: "[蜡烛]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/clock_org.gif", alt: "[钟]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/cake.gif", alt: "[蛋糕]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1b/m_org.gif", alt: "[话筒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d1/house_org.gif", alt: "[房子]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/36/../23/bianpao_org.gif",
                    alt: "[鞭炮]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/71/hongbao_org.gif", alt: "[红包]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f1/wennuanmaozi_org.gif",
                    alt: "[温暖帽子]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3f/weijin_org.gif", alt: "[围脖]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/shoutao_org.gif", alt: "[手套]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4f/daxiongshuluo_org.gif",
                    alt: "[dx数落]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/aa/daxiongsha_org.gif",
                    alt: "[dx傻]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/45/daxiongpaomeiyan_org.gif",
                    alt: "[dx抛媚眼]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d2/bofuyinxiao_org.gif",
                    alt: "[bofu淫笑]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/77/bofuxinhuiyileng_org.gif",
                    alt: "[bofu心灰意冷]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6f/bofuxiandanchaoren_org.gif",
                    alt: "[bofu咸蛋超人]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c3/zy_org.gif", alt: "[挤眼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8f/qq_org.gif", alt: "[亲亲]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/nm_org.gif", alt: "[怒骂]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/58/mb_org.gif", alt: "[太开心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/17/ldln_org.gif", alt: "[懒得理你]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f3/k_org.gif", alt: "[打哈气]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b6/sb_org.gif", alt: "[生病]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/61/sdz_org.gif", alt: "[书呆子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/sw_org.gif", alt: "[失望]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/kl_org.gif", alt: "[可怜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/h_org.gif", alt: "[黑线]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/t_org.gif", alt: "[吐]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/73/wq_org.gif", alt: "[委屈]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e9/sk_org.gif", alt: "[思考]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/laugh.gif", alt: "[哈哈]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a6/x_org.gif", alt: "[嘘]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/98/yhh_org.gif", alt: "[右哼哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/zhh_org.gif", alt: "[左哼哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5c/yw_org.gif", alt: "[疑问]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/yx_org.gif", alt: "[阴险]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/d_org.gif", alt: "[顶]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/90/money_org.gif", alt: "[钱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1a/bs_org.gif", alt: "[悲伤]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/71/bs2_org.gif", alt: "[鄙视]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/88_org.gif", alt: "[拜拜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f4/cj_org.gif", alt: "[吃惊]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/29/bz_org.gif", alt: "[闭嘴]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/cry.gif", alt: "[衰]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bd/fn_org.gif", alt: "[愤怒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/gm_org.gif", alt: "[感冒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/cool_org.gif", alt: "[酷]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/come_org.gif", alt: "[来]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/good_org.gif", alt: "[good]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/13/ha_org.gif", alt: "[haha]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c7/no_org.gif", alt: "[不要]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d6/ok_org.gif", alt: "[ok]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cc/o_org.gif", alt: "[拳头]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/sad_org.gif", alt: "[弱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/ws_org.gif", alt: "[握手]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/z2_org.gif", alt: "[赞]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/ye_org.gif", alt: "[耶]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3e/bad_org.gif", alt: "[最差]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/14/tza_org.gif", alt: "[可爱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/tootha_org.gif", alt: "[嘻嘻]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/24/sweata_org.gif", alt: "[汗]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/smilea_org.gif", alt: "[呵呵]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/sleepya_org.gif", alt: "[困]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/sleepa_org.gif", alt: "[睡觉]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/shamea_org.gif", alt: "[害羞]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9d/sada_org.gif", alt: "[泪]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/lovea_org.gif", alt: "[爱你]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/kbsa_org.gif", alt: "[挖鼻屎]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8c/hsa_org.gif", alt: "[花心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/heia_org.gif", alt: "[偷笑]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/hearta_org.gif", alt: "[心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/49/hatea_org.gif", alt: "[哼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/36/gza_org.gif", alt: "[鼓掌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/dizzya_org.gif", alt: "[晕]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a5/cza_org.gif", alt: "[馋嘴]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/62/crazya_org.gif", alt: "[抓狂]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/27/bba_org.gif", alt: "[抱抱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7c/angrya_org.gif", alt: "[怒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0d/right_org.gif", alt: "[右抱抱]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/54/left_org.gif", alt: "[左抱抱]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/78/daxiongzhadan_org.gif",
                    alt: "[dx炸弹]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/07/daxiongxizao_org.gif",
                    alt: "[dx洗澡]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ff/daxiongwozhua_org.gif",
                    alt: "[dx握爪]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4f/daxiongshuluo_org.gif",
                    alt: "[dx数落]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f5/daxiongshuaya_org.gif",
                    alt: "[dx刷牙]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/aa/daxiongsha_org.gif",
                    alt: "[dx傻]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c4/daxiongshai_org.gif",
                    alt: "[dx晒]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/45/daxiongpaomeiyan_org.gif",
                    alt: "[dx抛媚眼]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7b/daxiongpaipaishou_org.gif",
                    alt: "[dx拍拍手]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/10/daxiongoye_org.gif",
                    alt: "[dx耶]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/00/daxiongniu_org.gif",
                    alt: "[dx扭]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/daxiongmeiyou_org.gif",
                    alt: "[dx没有]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/51/daxiongmaimeng_org.gif",
                    alt: "[dx卖萌]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b7/daxionglianhong_org.gif",
                    alt: "[dx脸红]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ca/daxiongleibenxiong_org.gif",
                    alt: "[dx泪奔]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d7/daxiongjiayouxiong_org.gif",
                    alt: "[dx加油]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/daxiongjiaotache_org.gif",
                    alt: "[dx脚踏车]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b9/daxionghuaxin_org.gif",
                    alt: "[dx花心]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/01/daxionghuanle_org.gif",
                    alt: "[dx欢乐]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9f/daxionghuaban_org.gif",
                    alt: "[dx滑板]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/57/daxiongdao_org.gif",
                    alt: "[dx倒]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/daxiongchaoren_org.gif",
                    alt: "[dx超人]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/27/daxiongbao_org.gif",
                    alt: "[dx饱]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/da/daxiongai_org.gif",
                    alt: "[dx哎]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d2/bofuyinxiao_org.gif",
                    alt: "[bofu淫笑]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/bofuyalishanda_org.gif",
                    alt: "[bofu压力山大]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/77/bofuxinhuiyileng_org.gif",
                    alt: "[bofu心灰意冷]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/76/bofuxindong_org.gif",
                    alt: "[bofu心动]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6f/bofuxiandanchaoren_org.gif",
                    alt: "[bofu咸蛋超人]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/52/bofushishen_org.gif",
                    alt: "[bofu食神]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/93/bofupiaozikuailai_org.gif",
                    alt: "[bofu票子快来]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/50/bofunu_org.gif",
                    alt: "[bofu怒]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fb/bofuniu_org.gif",
                    alt: "[bofu扭]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/80/bofumengyi_org.gif",
                    alt: "[bofu梦遗]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ee/bofulei_org.gif",
                    alt: "[bofu累]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5a/bofukenxigua_org.gif",
                    alt: "[bofu啃西瓜]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5c/bofugeili_org.gif",
                    alt: "[bofu给力]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/71/bofufafentuqiang_org.gif",
                    alt: "[bofu发愤图强]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1f/bofudousao_org.gif",
                    alt: "[bofu抖骚]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7e/bofudese_org.gif",
                    alt: "[bofu得瑟]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/37/bofudafeiji_org.gif",
                    alt: "[bofu打飞机]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bb/bofubianlian_org.gif",
                    alt: "[bofu变脸]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5e/bofubengji_org.gif",
                    alt: "[bofu蹦极]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/20/bofubaozao_org.gif",
                    alt: "[bofu暴躁]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/63/chn_zhuashafa_org.gif",
                    alt: "[抓沙发]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ae/chn_zhenhan_org.gif",
                    alt: "[震撼]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bd/chn_yun_org.gif", alt: "[晕晕]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/06/chn_xiayan_org.gif",
                    alt: "[瞎眼]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/chn_weinan_org.gif",
                    alt: "[为难]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/chn_tian_org.gif", alt: "[舔]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/99/chn_liuhan_org.gif",
                    alt: "[流汗]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/48/chn_leng_org.gif", alt: "[冷]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/90/chn_laoda_org.gif",
                    alt: "[老大]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/chn_keshui_org.gif",
                    alt: "[瞌睡]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2b/chn_kelian_org.gif",
                    alt: "[可怜的]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d7/chn_kafei_org.gif",
                    alt: "[咖啡咖啡]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/chn_huaixiao_org.gif",
                    alt: "[坏笑]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c0/chn_ding_org.gif",
                    alt: "[顶啊]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/chn_deyi_org.gif",
                    alt: "[好得意]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b5/chn_chonga_org.gif",
                    alt: "[冲啊]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/63/chn_chixigua_org.gif",
                    alt: "[吃西瓜]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5e/chn_buyaoya_org.gif",
                    alt: "[不要啊]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/04/chn_biaolei_org.gif",
                    alt: "[飙泪中]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/02/chn_aini_org.gif",
                    alt: "[爱你哦]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/36/../23/bianpao_org.gif",
                    alt: "[鞭炮]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c8/../e0/hongbao1_org.gif",
                    alt: "[让红包飞]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3f/weijin_org.gif", alt: "[围脖]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f1/wennuanmaozi_org.gif",
                    alt: "[温暖帽子]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/shoutao_org.gif", alt: "[手套]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/71/hongbao_org.gif", alt: "[红包]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bf/xi_org.gif", alt: "[喜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c4/liwu_org.gif", alt: "[礼物]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/cake.gif", alt: "[蛋糕]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/31/r_org.gif", alt: "[钻戒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9f/diamond_org.gif", alt: "[钻石]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9c/dynamicbus_org.gif",
                    alt: "[大巴]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6d/travel_org.gif", alt: "[飞机]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/46/zxc_org.gif", alt: "[自行车]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a4/jc_org.gif", alt: "[汽车]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4b/sj2_org.gif", alt: "[手机]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/33/camera_org.gif", alt: "[照相机]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5d/y_org.gif", alt: "[药]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/df/dn_org.gif", alt: "[电脑]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/sz_org.gif", alt: "[手纸]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/yellowMood_org.gif",
                    alt: "[落叶]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a2/christree_org.gif",
                    alt: "[圣诞树]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/06/chrishat_org.gif",
                    alt: "[圣诞帽]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c5/chrisfather_org.gif",
                    alt: "[圣诞老人]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/chrisbell_org.gif",
                    alt: "[圣诞铃铛]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/08/chrisocks_org.gif",
                    alt: "[圣诞袜]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0a/xunlu_org.gif", alt: "[驯鹿]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/21/shfabu_org.gif",
                    alt: "[上海志愿者]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/yinyuehe_org.gif",
                    alt: "[音乐盒]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/eb/shoufa_org.gif", alt: "[首发]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/26/Jobs_org.gif", alt: "[悼念乔布斯]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/iPhone_org.gif",
                    alt: "[iPhone]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e3/weibo2zhounian_org.png",
                    alt: "[微博蛋糕]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/lazu_org.gif", alt: "[蜡烛]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2e/muqinjie_org.png",
                    alt: "[康乃馨]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ce/tupianimage_org.gif",
                    alt: "[图片]"
                },
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/56/zhishujie_org.gif",
                    alt: "[植树节]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bf/nycake_org.gif", alt: "[粉蛋糕]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/34/candy_org.gif", alt: "[糖果]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/73/nanguatou2_org.gif",
                    alt: "[万圣节]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3b/hj_org.gif", alt: "[火炬]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/wine_org.gif", alt: "[酒壶]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/96/mooncake3_org.gif",
                    alt: "[月饼]"
                },
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5d/moon1_org.gif", alt: "[满月]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b1/qkl_org.gif", alt: "[巧克力]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/12/jy_org.gif", alt: "[脚印]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/39/j2_org.gif", alt: "[酒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5d/g_org.gif", alt: "[狗]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/gz3_org.gif", alt: "[工作]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ce/gz2_org.gif", alt: "[档案]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b8/green_org.gif", alt: "[叶子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/gq_org.gif", alt: "[钢琴]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/84/foot_org.gif", alt: "[印迹]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/clock_org.gif", alt: "[钟]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a8/cha_org.gif", alt: "[茶]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/watermelon.gif", alt: "[西瓜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/33/umb_org.gif", alt: "[雨伞]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b3/tv_org.gif", alt: "[电视机]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9d/tel_org.gif", alt: "[电话]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e5/sun.gif", alt: "[太阳]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0b/star_org.gif", alt: "[星]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/shao.gif", alt: "[哨子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1b/m_org.gif", alt: "[话筒]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/music_org.gif", alt: "[音乐]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/77/movie_org.gif", alt: "[电影]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b9/moon.gif", alt: "[月亮]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/ktv_org.gif", alt: "[唱歌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/ice.gif", alt: "[冰棍]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d1/house_org.gif", alt: "[房子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/25/hat_org.gif", alt: "[帽子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c0/football.gif", alt: "[足球]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6c/flower_org.gif", alt: "[鲜花]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6c/flower.gif", alt: "[花]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/92/fan.gif", alt: "[风扇]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bd/cheer.gif", alt: "[干杯]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/cafe_org.gif", alt: "[咖啡]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/41/zz2_org.gif", alt: "[织]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/81/rabbit_org.gif", alt: "[兔子]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/horse2_org.gif", alt: "[神马]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/fuyun_org.gif", alt: "[浮云]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/geili_org.gif", alt: "[给力]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/42/kawayi_org.gif", alt: "[萌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bb/pear_org.gif", alt: "[鸭梨]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/panda_org.gif", alt: "[熊猫]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/hufen_org.gif", alt: "[互粉]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f2/wg_org.gif", alt: "[围观]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/91/rjd_org.gif", alt: "[扔鸡蛋]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bc/otm_org.gif", alt: "[奥特曼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/vw_org.gif", alt: "[威武]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ea/unheart.gif", alt: "[伤心]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/60/rw_org.gif", alt: "[热吻]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j_org.gif", alt: "[囧]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c0/orz1_org.gif", alt: "[orz]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d7/z_org.gif", alt: "[宅]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/xc_org.gif", alt: "[小丑]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/36/s2_org.gif", alt: "[帅]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/58/pig.gif", alt: "[猪头]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/48/sx_org.gif", alt: "[实习]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bd/kl2_org.gif", alt: "[骷髅]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/34/s_org.gif", alt: "[便便]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/xx2_org.gif", alt: "[雪人]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/yellowcard.gif", alt: "[黄牌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/redcard.gif", alt: "[红牌]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/twh_org.gif", alt: "[跳舞花]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3d/bingo_org.gif", alt: "[礼花]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b0/zt_org.gif", alt: "[打针]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3b/th_org.gif", alt: "[叹号]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9d/wh_org.gif", alt: "[问号]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9b/jh_org.gif", alt: "[句号]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cc/dh_org.gif", alt: "[逗号]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ce/03_org.gif", alt: "[闪]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/04_org.gif", alt: "[啦啦]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/34/05_org.gif", alt: "[吼吼]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/67/06_org.gif", alt: "[庆祝]"},
                {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/01_org.gif",
                    alt: "[嘿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/43/twot_org.gif",
                    alt: "[22]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/zero_org.gif",
                    alt: "[00]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/61/two_org.gif",
                    alt: "[2]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/78/three_org.gif",
                    alt: "[3]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bf/six_org.gif",
                    alt: "[6]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/32/seven_org.gif",
                    alt: "[7]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/82/one_org.gif",
                    alt: "[1]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/54/nine_org.gif",
                    alt: "[9]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/four_org.gif",
                    alt: "[4]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f5/five_org.gif",
                    alt: "[5]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5c/eight_org.gif",
                    alt: "[8]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1b/kissgirl_org.gif",
                    alt: "[女孩儿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/kissboy_org.gif",
                    alt: "[男孩儿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/newz_org.gif",
                    alt: "[z]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3b/newy_org.gif",
                    alt: "[y]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d7/newx_org.gif",
                    alt: "[x]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e3/newv_org.gif",
                    alt: "[v]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b8/newu_org.gif",
                    alt: "[u]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/75/newt_org.gif",
                    alt: "[t]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/22/news_org.gif",
                    alt: "[s]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/newr_org.gif",
                    alt: "[r]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/de/newq_org.gif",
                    alt: "[q]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e7/newp_org.gif",
                    alt: "[p]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e7/newn_org.gif",
                    alt: "[n]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f5/newl_org.gif",
                    alt: "[l]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/newk_org.gif",
                    alt: "[k]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/newj_org.gif",
                    alt: "[j]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8b/newh_org.gif",
                    alt: "[h]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/16/newg_org.gif",
                    alt: "[g]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/07/newf_org.gif",
                    alt: "[f]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/newd_org.gif",
                    alt: "[d]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/32/newa_org.gif",
                    alt: "[a]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/94/weibow_org.gif",
                    alt: "[w]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fd/weibop_org.gif",
                    alt: "[点]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f5/weiboo_org.gif",
                    alt: "[o]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/98/weibom_org.gif",
                    alt: "[m]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e6/weiboi_org.gif",
                    alt: "[i]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/dd/weiboe_org.gif",
                    alt: "[e]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/59/weiboc_org.gif",
                    alt: "[c]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fa/weibob_org.gif",
                    alt: "[b]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0d/shengluehao_org.gif",
                    alt: "[省略号]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/59/kiss2_org.gif",
                    alt: "[kiss]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/yuan_org.gif",
                    alt: "[圆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/11/tuan_org.gif",
                    alt: "[团]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/68/w_org.gif",
                    alt: "[雾]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/tf_org.gif",
                    alt: "[台风]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/69/sc_org.gif",
                    alt: "[沙尘暴]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d2/qzdy_org.gif",
                    alt: "[晴转多云]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8e/lx_org.gif",
                    alt: "[流星]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/ljf_org.gif",
                    alt: "[龙卷风]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ba/hs2_org.gif",
                    alt: "[洪水]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/74/gf_org.gif",
                    alt: "[风]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f3/dyzq_org.gif",
                    alt: "[多云转晴]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/03/ch_org.gif",
                    alt: "[彩虹]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/05/bb2_org.gif",
                    alt: "[冰雹]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a5/wind_org.gif",
                    alt: "[微风]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1a/sunny_org.gif",
                    alt: "[阳光]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/00/snow_org.gif",
                    alt: "[雪]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e3/sh_org.gif",
                    alt: "[闪电]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/50/rain.gif",
                    alt: "[下雨]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/37/dark_org.gif",
                    alt: "[阴天]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3c/alizuoguilian_org.gif",
                    alt: "[ali做鬼脸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/67/alizhui_org.gif",
                    alt: "[ali追]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/alizhuan_org.gif",
                    alt: "[ali转]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/alizhuanquanku_org.gif",
                    alt: "[ali转圈哭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/aliyumen_org.gif",
                    alt: "[ali郁闷]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a1/aliyuanbao_org.gif",
                    alt: "[ali元宝]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/21/aliyaohuang_org.gif",
                    alt: "[ali摇晃]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ff/alixuxuxu_org.gif",
                    alt: "[ali嘘嘘嘘]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/alixiu_org.gif",
                    alt: "[ali羞]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0e/alixia_org.gif",
                    alt: "[ali吓]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/alixiao_org.gif",
                    alt: "[ali笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ae/alixianzhuo_org.gif",
                    alt: "[ali掀桌子]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/27/alixianhua_org.gif",
                    alt: "[ali献花]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/alixiang_org.gif",
                    alt: "[ali想]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/67/aliwa_org.gif",
                    alt: "[ali哇]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/alituxue_org.gif",
                    alt: "[ali吐血]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/alitoukan_org.gif",
                    alt: "[ali偷看]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/21/alisongliwu_org.gif",
                    alt: "[ali送礼物]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5b/alishui_org.gif",
                    alt: "[ali水]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1f/alishuai_org.gif",
                    alt: "[ali摔]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/alishuaishou_org.gif",
                    alt: "[ali甩手]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d5/alisaqian_org.gif",
                    alt: "[ali撒钱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8e/aliqinyige_org.gif",
                    alt: "[ali亲一个]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e9/aliqianzou_org.gif",
                    alt: "[ali欠揍]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/50/alipu_org.gif",
                    alt: "[ali扑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/54/alipudao_org.gif",
                    alt: "[ali扑倒]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/52/alipiao_org.gif",
                    alt: "[ali飘]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/alipiaoguo_org.gif",
                    alt: "[ali飘过]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/alipenti_org.gif",
                    alt: "[ali喷嚏]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/01/alipaipaishou_org.gif",
                    alt: "[ali拍拍手]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ba/alini_org.gif",
                    alt: "[ali你]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/83/alinaoqiang_org.gif",
                    alt: "[ali挠墙]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/67/alimomotou_org.gif",
                    alt: "[ali摸摸头]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/48/aliliu_org.gif",
                    alt: "[ali溜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/dd/alilaipi_org.gif",
                    alt: "[ali赖皮]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ca/alilaiba_org.gif",
                    alt: "[ali来吧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8d/alijiu_org.gif",
                    alt: "[ali揪]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cd/alijiong_org.gif",
                    alt: "[ali囧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cd/alijing_org.gif",
                    alt: "[ali惊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ae/alijiayou_org.gif",
                    alt: "[ali加油]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/alijiangshitiao_org.gif",
                    alt: "[ali僵尸跳]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cd/alihulaquan_org.gif",
                    alt: "[ali呼啦圈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a7/alihuaquanquan_org.gif",
                    alt: "[ali画圈圈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5e/alihuanhu_org.gif",
                    alt: "[ali欢呼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3a/alihuaixiao_org.gif",
                    alt: "[ali坏笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5a/aliguiqiu_org.gif",
                    alt: "[ali跪求]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7b/alifengzheng_org.gif",
                    alt: "[ali风筝]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/75/alifei_org.gif",
                    alt: "[ali飞]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/75/alifanbaiyan_org.gif",
                    alt: "[ali翻白眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e6/alidingqi_org.gif",
                    alt: "[ali顶起]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/alidiantou_org.gif",
                    alt: "[ali点头]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/65/alidese_org.gif",
                    alt: "[ali得瑟]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c6/alidalanqiu_org.gif",
                    alt: "[ali打篮球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ec/alidagun_org.gif",
                    alt: "[ali打滚]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/06/alidachi_org.gif",
                    alt: "[ali大吃]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/alicai_org.gif",
                    alt: "[ali踩]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/32/alibunaifan_org.gif",
                    alt: "[ali不耐烦]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/alibuma_org.gif",
                    alt: "[ali不嘛]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/51/alibiechao_org.gif",
                    alt: "[ali别吵]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/35/alibianpao_org.gif",
                    alt: "[ali鞭炮]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a8/alibaoyibao_org.gif",
                    alt: "[ali抱一抱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e3/alibainian_org.gif",
                    alt: "[ali拜年]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/56/ali88_org.gif",
                    alt: "[ali88]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/69/ali233_org.gif",
                    alt: "[ali笑死了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d5/zk_org.gif",
                    alt: "[狂笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5f/wq2_org.gif",
                    alt: "[冤]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/87/q2_org.gif",
                    alt: "[蜷]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ae/mh_org.gif",
                    alt: "[美好]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5f/m2_org.gif",
                    alt: "[乐和]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/j3_org.gif",
                    alt: "[揪耳朵]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bf/h2_org.gif",
                    alt: "[晃]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e7/f_org.gif",
                    alt: "[high]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/33/c_org.gif",
                    alt: "[蹭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f4/bz3_org.gif",
                    alt: "[抱枕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/85/bgp_org.gif",
                    alt: "[不公平]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c3/liaobuqi_org.gif",
                    alt: "[欢欢]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/66/guanbuzhao_org.gif",
                    alt: "[乐乐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/78/2guanbuzhao1_org.gif",
                    alt: "[管不着爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/09/ai_org.gif",
                    alt: "[爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/11/2liaobuqiai_org.gif",
                    alt: "[了不起爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2a/gbzzhenchuanyue_org.gif",
                    alt: "[gbz真穿越]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/73/gbzzaishuihui_org.gif",
                    alt: "[gbz再睡会]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c6/gbzwuwu_org.gif",
                    alt: "[gbz呜呜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/74/gbzweiqu_org.gif",
                    alt: "[gbz委屈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/gbzwananle_org.gif",
                    alt: "[gbz晚安了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/gbzqifu_org.gif",
                    alt: "[gbz祈福]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/96/gbzqifule_org.gif",
                    alt: "[gbz祈福了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/57/gbzqiexiao_org.gif",
                    alt: "[gbz窃笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8d/gbzqichuangla_org.gif",
                    alt: "[gbz起床啦]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f5/gbzkun_org.gif",
                    alt: "[gbz困]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/gbzjiaban_org.gif",
                    alt: "[gbz加班]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/gbzjiabanzhong_org.gif",
                    alt: "[gbz加班中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/50/gbze_org.gif",
                    alt: "[gbz饿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e4/gbzeyun_org.gif",
                    alt: "[gbz饿晕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0a/gbzdeyi_org.gif",
                    alt: "[gbz得意]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f7/gbzdaxiao_org.gif",
                    alt: "[gbz大笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/16/gbzchuanyuele_org.gif",
                    alt: "[gbz穿越了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/68/youdiankun_org.gif",
                    alt: "[有点困]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/yes_org.gif",
                    alt: "[yes]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/yanhuiqule_org.gif",
                    alt: "[咽回去了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/01/yalihenda_org.gif",
                    alt: "[鸭梨很大]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/42/xiuxiu_org.gif",
                    alt: "[羞羞]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/xihuang_org.gif",
                    alt: "[喜欢你]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/xiaobianpi_org.gif",
                    alt: "[小便屁]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d6/wunai22_org.gif",
                    alt: "[无奈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/da/tutu_org.gif",
                    alt: "[兔兔]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/98/tushetou_org.gif",
                    alt: "[吐舌头]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/48/touyun_org.gif",
                    alt: "[头晕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/tingyinyue_org.gif",
                    alt: "[听音乐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/65/shuijiao_org.gif",
                    alt: "[睡大觉]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/shanshanzi_org.gif",
                    alt: "[闪闪紫]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a8/shanshanlu_org.gif",
                    alt: "[闪闪绿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1e/shanshanhui_org.gif",
                    alt: "[闪闪灰]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/10/shanshanhong_org.gif",
                    alt: "[闪闪红]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9d/shanshanfen_org.gif",
                    alt: "[闪闪粉]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4b/paoxiao_org.gif",
                    alt: "[咆哮]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2c/motou_org.gif",
                    alt: "[摸头]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d2/meihao_org.gif",
                    alt: "[真美好]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/lianhongzibao_org.gif",
                    alt: "[脸红自爆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1c/kuqinv_org.gif",
                    alt: "[哭泣女]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/38/kuqinan_org.gif",
                    alt: "[哭泣男]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fd/kong_org.gif",
                    alt: "[空]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9f/jinqingwan_org.gif",
                    alt: "[尽情玩]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b8/jingxi_org.gif",
                    alt: "[惊喜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/58/jingdai_org.gif",
                    alt: "[惊呆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e1/huluobo_org.gif",
                    alt: "[胡萝卜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/63/huangtengquai_org.gif",
                    alt: "[欢腾去爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/67/ganmao_org.gif",
                    alt: "[感冒了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ef/fennu_org.gif",
                    alt: "[怒了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a6/fendou123_org.gif",
                    alt: "[我要奋斗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/95/faya_org.gif",
                    alt: "[发芽]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ca/chunnuanhuakai_org.gif",
                    alt: "[春暖花开]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/83/chouyan_org.gif",
                    alt: "[抽烟]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/31/ang_org.gif",
                    alt: "[昂]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/12/aa_org.gif",
                    alt: "[啊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/zichashuangmu_org.gif",
                    alt: "[自插双目]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9f/yiwen_org.gif",
                    alt: "[咦]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cf/xu_org.gif",
                    alt: "[嘘嘘]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/00/wochiwode_org.gif",
                    alt: "[我吃]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a7/weiqu_org.gif",
                    alt: "[喵呜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c5/v5_org.gif",
                    alt: "[v5]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f7/tiaoxi_org.gif",
                    alt: "[调戏]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d7/taihaoxiaole_org.gif",
                    alt: "[打牙]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b8/shoujian_org.gif",
                    alt: "[手贱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a1/se_org.gif",
                    alt: "[色]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4a/pen_org.gif",
                    alt: "[喷]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2e/nidongde_org.gif",
                    alt: "[你懂的]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/miaomiao_org.gif",
                    alt: "[喵]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/meiwei_org.gif",
                    alt: "[美味]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/46/jingkong_org.gif",
                    alt: "[惊恐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7c/gandong_org.gif",
                    alt: "[感动]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/fangkai_org.gif",
                    alt: "[放开]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e8/chidai_org.gif",
                    alt: "[痴呆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/99/chelian_org.gif",
                    alt: "[扯脸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ab/buzhisuocuo_org.gif",
                    alt: "[不知所措]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/24/baiyan_org.gif",
                    alt: "[白眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4a/totowuliao_org.gif",
                    alt: "[toto无聊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/totowozuiyaogun_org.gif",
                    alt: "[toto我最摇滚]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/04/totoshuluo_org.gif",
                    alt: "[toto数落]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cb/totoshuijiao_org.gif",
                    alt: "[toto睡觉]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/34/totoshuaitoufa_org.gif",
                    alt: "[toto甩头发]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/74/totopiaoguo_org.gif",
                    alt: "[toto飘过]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/totokuanghan_org.gif",
                    alt: "[toto狂汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/30/totohaolei_org.gif",
                    alt: "[toto好累]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8d/bobozhuakuang_org.gif",
                    alt: "[bobo抓狂]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a3/boboyiwen_org.gif",
                    alt: "[bobo疑问]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/74/bobopaomeiyan_org.gif",
                    alt: "[bobo抛媚眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/bobomobai_org.gif",
                    alt: "[bobo膜拜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f0/bobojiujie_org.gif",
                    alt: "[bobo纠结]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d0/bobobuyaoa_org.gif",
                    alt: "[bobo不要啊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/98/bobobulini_org.gif",
                    alt: "[bobo不理你]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b9/totoyouai_org.gif",
                    alt: "[有爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/totoyes_org.gif",
                    alt: "[气死了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/02/tototingge_org.gif",
                    alt: "[我爱听]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/totonu_org.gif",
                    alt: "[怒火]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bd/totoleigu_org.gif",
                    alt: "[擂鼓]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d8/totojixiao_org.gif",
                    alt: "[讥笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/37/totoheixianpaoqian_org.gif",
                    alt: "[抛钱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/72/boboxianhua_org.gif",
                    alt: "[变花]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/boboweiqu_org.gif",
                    alt: "[飙泪]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/18/bobotoukan_org.gif",
                    alt: "[藏猫猫]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9e/bobotiaopi_org.gif",
                    alt: "[淘气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/47/boboshengmenqi_org.gif",
                    alt: "[生闷气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a7/boboren_org.gif",
                    alt: "[忍]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a5/bobopaopaotang_org.gif",
                    alt: "[泡泡糖]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e0/bobook_org.gif",
                    alt: "[好的]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/44/bobohi_org.gif",
                    alt: "[Hi]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/bobofeiwen_org.gif",
                    alt: "[飞吻]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/29/bobochixigua_org.gif",
                    alt: "[我爱西瓜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ce/bobochijing_org.gif",
                    alt: "[吓一跳]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/87/bobochifan_org.gif",
                    alt: "[吃饭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/61/cat_zhendanding_org.gif",
                    alt: "[真淡定]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c3/cat_yunqizhong_org.gif",
                    alt: "[运气中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/03/cat_yi_org.gif",
                    alt: "[嗯]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bb/cat_yitoushuxian_org.gif",
                    alt: "[一头竖线]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9c/cat_xingxingyan_org.gif",
                    alt: "[星星眼儿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/26/cat_xiaomimi_org.gif",
                    alt: "[笑眯眯]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/be/cat_xiaodizhu_org.gif",
                    alt: "[小地主]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/54/cat_wocuole_org.gif",
                    alt: "[我错了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/63/cat_wei_org.gif",
                    alt: "[喂]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/21/cat_tushetou_org.gif",
                    alt: "[伸舌头]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e2/cat_tianrandai_org.gif",
                    alt: "[天然呆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8d/cat_taozuile_org.gif",
                    alt: "[陶醉了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/39/cat_shengqile_org.gif",
                    alt: "[生气了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/06/cat_shengbingle_org.gif",
                    alt: "[生病鸟]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9c/cat_renbuliao_org.gif",
                    alt: "[忍不了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/05/cat_pukelian_org.gif",
                    alt: "[扑克脸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/22/cat_pubuhan_org.gif",
                    alt: "[瀑布汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3d/cat_nimeishiba_org.gif",
                    alt: "[你没事吧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/68/cat_neiniumanmian_org.gif",
                    alt: "[内牛满面]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/62/cat_meitingjian_org.gif",
                    alt: "[没听见]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/30/cat_kusila_org.gif",
                    alt: "[哭死啦]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/21/cat_jionghan_org.gif",
                    alt: "[囧汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f8/cat_jingkongzhong_org.gif",
                    alt: "[惊恐中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e8/cat_hunluanzhong_org.gif",
                    alt: "[混乱中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/cat_huachishanshan_org.gif",
                    alt: "[花痴闪闪]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/93/cat_heiheihei_org.gif",
                    alt: "[嘿嘿嘿]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b9/cat_hahaha_org.gif",
                    alt: "[哈哈哈哈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/cat_ganxiaozhong_org.gif",
                    alt: "[干笑中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c5/cat_exinsi_org.gif",
                    alt: "[恶心死]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/48/cat_duduzui_org.gif",
                    alt: "[嘟嘟嘴]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d9/cat_danu_org.gif",
                    alt: "[大怒]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/cat_dajingshise_org.gif",
                    alt: "[大惊失色]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c2/cat_daidai_org.gif",
                    alt: "[呆呆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/94/cat_dacuoxian_org.gif",
                    alt: "[搭错线]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/15/cat_bitichong_org.gif",
                    alt: "[鼻涕虫]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e2/cat_baoyuhan_org.gif",
                    alt: "[暴雨汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f4/cat_awuawu_org.gif",
                    alt: "[啊呜啊呜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/22/cat_ai_org.gif",
                    alt: "[哇]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ac/cat_aiaiai_org.gif",
                    alt: "[爱爱爱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e1/weisuo_org.gif",
                    alt: "[猥琐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c9/tiaomei_org.gif",
                    alt: "[挑眉]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3c/tiaodou_org.gif",
                    alt: "[挑逗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1c/qinerduo_org.gif",
                    alt: "[亲耳朵]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/32/meiyan_org.gif",
                    alt: "[媚眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/32/maogepao_org.gif",
                    alt: "[冒个泡]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f0/jiongerduo_org.gif",
                    alt: "[囧耳朵]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/14/guilian_org.gif",
                    alt: "[鬼脸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fd/fangdian_org.gif",
                    alt: "[放电]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ea/beiju_org.gif",
                    alt: "[悲剧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/78/touch_org.gif",
                    alt: "[抚摸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/13/sweat_org.gif",
                    alt: "[大汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/74/suprise_org.gif",
                    alt: "[大惊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0c/supcry_org.gif",
                    alt: "[惊哭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5c/stareyes_org.gif",
                    alt: "[星星眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8b/sleepy_org.gif",
                    alt: "[好困]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/75/sick_org.gif",
                    alt: "[呕吐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ee/plus1_org.gif",
                    alt: "[加我一个]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/pipioye_org.gif",
                    alt: "[痞痞兔耶]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c6/muamua_org.gif",
                    alt: "[mua]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fd/mianchou_org.gif",
                    alt: "[面抽]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/laugh_org.gif",
                    alt: "[大笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d6/knead_org.gif",
                    alt: "[揉]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/38/jiong_org.gif",
                    alt: "[痞痞兔囧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/honeyoye_org.gif",
                    alt: "[哈尼兔耶]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/happy_org.gif",
                    alt: "[开心]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/handkerchief_org.gif",
                    alt: "[咬手帕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/go_org.gif",
                    alt: "[去]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a4/dizzy_org.gif",
                    alt: "[晕死了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/af/cry_org.gif",
                    alt: "[大哭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a1/coverface_org.gif",
                    alt: "[扇子遮面]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ea/angery_org.gif",
                    alt: "[怒气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6f/886_org.gif",
                    alt: "[886]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/07/byz2_org.gif",
                    alt: "[白羊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/46/ssz2_org.gif",
                    alt: "[射手]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e2/syz2_org.gif",
                    alt: "[双鱼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/89/szz2_org.gif",
                    alt: "[双子]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/tpz2_org.gif",
                    alt: "[天秤]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1e/txz2_org.gif",
                    alt: "[天蝎]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1b/spz2_org.gif",
                    alt: "[水瓶]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/62/cnz2_org.gif",
                    alt: "[处女]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3b/jnz2_org.gif",
                    alt: "[金牛]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d2/jxz2_org.gif",
                    alt: "[巨蟹]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4a/leo2_org.gif",
                    alt: "[狮子]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/16/mjz2_org.gif",
                    alt: "[摩羯]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/09/txz_org.gif",
                    alt: "[天蝎座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/tpz_org.gif",
                    alt: "[天秤座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d4/szz_org.gif",
                    alt: "[双子座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7f/syz_org.gif",
                    alt: "[双鱼座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5d/ssz_org.gif",
                    alt: "[射手座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/00/spz_org.gif",
                    alt: "[水瓶座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/da/mjz_org.gif",
                    alt: "[摩羯座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/23/leo_org.gif",
                    alt: "[狮子座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a3/jxz_org.gif",
                    alt: "[巨蟹座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/8d/jnz_org.gif",
                    alt: "[金牛座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/09/cnz_org.gif",
                    alt: "[处女座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e0/byz_org.gif",
                    alt: "[白羊座]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b8/aixincd_org.gif",
                    alt: "[爱心传递]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9b/green_band_org.gif",
                    alt: "[绿丝带]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/77/pink_org.gif",
                    alt: "[粉红丝带]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/59/red_band_org.gif",
                    alt: "[红丝带]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d4/jiayou_org.gif",
                    alt: "[加油]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/dc/flag_org.gif",
                    alt: "[国旗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/f4/jinpai_org.gif",
                    alt: "[金牌]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1e/yinpai_org.gif",
                    alt: "[银牌]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/26/tongpai_org.gif",
                    alt: "[铜牌]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/shao.gif",
                    alt: "[哨子]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/yellowcard.gif",
                    alt: "[黄牌]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/redcard.gif",
                    alt: "[红牌]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c0/football.gif",
                    alt: "[足球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2c/bball_org.gif",
                    alt: "[篮球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6b/black8_org.gif",
                    alt: "[黑8]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cf/volleyball_org.gif",
                    alt: "[排球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b9/swimming_org.gif",
                    alt: "[游泳]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a5/pingpong_org.gif",
                    alt: "[乒乓球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7a/basketball_org.gif",
                    alt: "[投篮]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/77/badminton_org.gif",
                    alt: "[羽毛球]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e0/zuqiu_org.gif",
                    alt: "[射门]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/40/shejian_org.gif",
                    alt: "[射箭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/14/juzhong_org.gif",
                    alt: "[举重]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9a/xiaoheweixiao_org.gif",
                    alt: "[微微笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/02/xiaoheweiqu_org.gif",
                    alt: "[特委屈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/xiaohetua_org.gif",
                    alt: "[我吐]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/66/xiaoheshengqi_org.gif",
                    alt: "[很生气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/08/xiaoheliubiti_org.gif",
                    alt: "[流鼻涕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a0/xiaohekuqi_org.gif",
                    alt: "[默默哭泣]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e3/xiaohehan_org.gif",
                    alt: "[小盒汗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/44/xiaohefadai_org.gif",
                    alt: "[发呆中]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a8/xiaohebulini_org.gif",
                    alt: "[不理你]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d4/xiaohebishi_org.gif",
                    alt: "[强烈鄙视]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c5/fanzao_org.gif",
                    alt: "[烦躁]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/ciya_org.gif",
                    alt: "[呲牙]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e6/youqian_org.gif",
                    alt: "[有钱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/05/weixiao_org.gif",
                    alt: "[微笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c1/shuaibao_org.gif",
                    alt: "[帅爆]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/0a/shengqi_org.gif",
                    alt: "[生气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/shengbing_org.gif",
                    alt: "[生病了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/90/semimi_org.gif",
                    alt: "[色眯眯]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d1/pilao_org.gif",
                    alt: "[疲劳]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/14/miao_org.gif",
                    alt: "[瞄]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/ku_org.gif",
                    alt: "[哭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/76/kelian_org.gif",
                    alt: "[好可怜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/75/jinzhang_org.gif",
                    alt: "[紧张]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/dc/jingya_org.gif",
                    alt: "[惊讶]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/bb/jidong_org.gif",
                    alt: "[激动]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2b/jianqian_org.gif",
                    alt: "[见钱]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7d/han_org.gif",
                    alt: "[汗了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/fendou_org.gif",
                    alt: "[奋斗]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/09/xrdz_org.gif",
                    alt: "[小人得志]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cc/whh_org.gif",
                    alt: "[哇哈哈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/90/tq_org.gif",
                    alt: "[叹气]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/d3/sjdj_org.gif",
                    alt: "[冻结]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1d/q_org.gif",
                    alt: "[切]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ec/pz_org.gif",
                    alt: "[拍照]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/7c/pp_org.gif",
                    alt: "[怕怕]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4d/nh_org.gif",
                    alt: "[怒吼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/9f/mb2_org.gif",
                    alt: "[膜拜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/70/lg_org.gif",
                    alt: "[路过]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/34/lb_org.gif",
                    alt: "[泪奔]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cd/lbs_org.gif",
                    alt: "[脸变色]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/05/kiss_org.gif",
                    alt: "[亲]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/86/kb_org.gif",
                    alt: "[恐怖]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e2/jgwb_org.gif",
                    alt: "[交给我吧]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2b/hxgw_org.gif",
                    alt: "[欢欣鼓舞]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/c7/gx3_org.gif",
                    alt: "[高兴]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/43/gg_org.gif",
                    alt: "[尴尬]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/4e/fd_org.gif",
                    alt: "[发嗲]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/19/fc_org.gif",
                    alt: "[犯错]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fb/dy_org.gif",
                    alt: "[得意]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/fa/cn_org.gif",
                    alt: "[吵闹]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/2f/cf_org.gif",
                    alt: "[冲锋]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/eb/ceg_org.gif",
                    alt: "[抽耳光]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ee/cdyn_org.gif",
                    alt: "[差得远呢]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5a/bz2_org.gif",
                    alt: "[被砸]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6e/bt_org.gif",
                    alt: "[拜托]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/cf/bs3_org.gif",
                    alt: "[必胜]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/e8/bgws_org.gif",
                    alt: "[不关我事]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/64/bf_org.gif",
                    alt: "[上火]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b6/bdw_org.gif",
                    alt: "[不倒翁]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/bco_org.gif",
                    alt: "[不错哦]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/1a/yeah_org.gif",
                    alt: "[yeah]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5f/xh_org.gif",
                    alt: "[喜欢]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/5f/xd_org.gif",
                    alt: "[心动]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/53/wl_org.gif",
                    alt: "[无聊]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b2/gx_org.gif",
                    alt: "[手舞足蹈]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/09/gx2_org.gif",
                    alt: "[搞笑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/eb/gd_org.gif",
                    alt: "[痛哭]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/38/fn2_org.gif",
                    alt: "[爆发]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/31/d2_org.gif",
                    alt: "[发奋]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b0/bx_org.gif",
                    alt: "[不屑]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/3b/zy2_org.gif",
                    alt: "[眨眨眼]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/ec/zs_org.gif",
                    alt: "[杂技]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/17/wh2_org.gif",
                    alt: "[多问号]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/79/ts_org.gif",
                    alt: "[跳绳]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/b1/q3_org.gif",
                    alt: "[强吻]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/37/lb2_org.gif",
                    alt: "[不活了]"
                }, {
                    src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/6a/kt_org.gif",
                    alt: "[磕头]"
                }, {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/55/bya_org.gif", alt: "[呜呜]"},
                {src: "http://img.t.sinajs.cn/t35/style/images/common/face/ext/normal/a2/bx2_org.gif", alt: "[不]"}


            ]
        }

    ];

    // 字体
    editor.customConfig.fontNames = [
        '宋体', '黑体', '微软雅黑', '微软正黑体', '新细明体', '标楷体', '仿宋', '楷体', '文细黑', '华文黑体',
        '华文楷体', '华文宋体', '华文仿宋', '儷黑 Pro', '儷宋 Pro', '標楷體', '蘋果儷中黑', '蘋果儷細宋', '新宋体',
        '楷体_GB2312', '微軟正黑體', '微软雅黑体', '隶书', '幼圆', '华文细黑', '华文楷体', '华文宋体', '华文中宋',
        '华文仿宋', '方正舒体', '方正姚体', '华文彩云', '华文琥珀', '华文隶书', '华文行楷', '华文新魏', '仿宋_GB2312',
        'Arial', 'Helvetica', 'Tahoma', 'Verdana', 'Lucida Grande', 'Times New Roman', 'Georgia',
        'PmingLiu', 'Impact', 'Book Antiqua', 'Century Gothic', 'Courier New', 'sans-serif'

    ];

    editor.customConfig.showLinkImg = false; // 隐藏“网络图片”tab
    editor.customConfig.uploadImgMaxSize = 1024 * 1024 * 1024;//默认限制图片大小是 10M
    // 限制一次最多上传 10 张图片
    editor.customConfig.uploadImgMaxLength = 10;
    editor.customConfig.uploadImgParamsWithUrl = true;//如果还需要将参数拼接到 url 中，可再加上如下配置
    editor.customConfig.uploadImgServer = '<%=basePath%>user/picload.action';//官方文档上写的是服务器地址，也就是上传图片的方法名
    editor.customConfig.uploadFileName = 'uploadImage';     //给上传的本地图片文件命名的统一名称

    editor.customConfig.uploadImgHooks = {
        success: function (xhr, editor, result) {
            // 图片上传并返回结果，图片插入成功之后触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象，result 是服务器端返回的结果
        },
        fail: function (xhr, editor, result) {
            alert("图片插入失败");
        },
        error: function (xhr, editor) {
            // 图片上传出错时触发
            // xhr 是 XMLHttpRequst 对象，editor 是编辑器对象
            alert("图片上传出错");
        },

        // 如果服务器端返回的不是 {errno:0, data: [...]} 这种格式，可使用该配置
        // （但是，服务器端返回的必须是一个 JSON 格式字符串！！！否则会报错）
        customInsert: function (insertImg, result, editor) {
            // 图片上传并返回结果，自定义插入图片的事件（而不是编辑器自动插入图片！！！）
            // insertImg 是插入图片的函数，editor 是编辑器对象，result 是服务器端返回的结果

            var url = result.url;
            insertImg(url);
        }

    }

    editor.create();

</script>
</body>
<script>
    var uid = ${user.uid}

        $(function () {
            if(uid!=null){
                getMessage(uid);
                setInterval("getMessage(uid)",10000);
            }
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
