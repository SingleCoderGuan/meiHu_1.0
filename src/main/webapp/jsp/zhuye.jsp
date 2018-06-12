<%--
  Created by IntelliJ IDEA.
  User: 上官龙超
  Date: 2018/5/31/031
  Time: 18:27
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<base href="<%=basePath%>">
<html>
<head>
    <title>美乎</title>


        <!-- custom-theme -->
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
        <meta name="keywords" content="Beauty Style Responsive web template, Bootstrap Web Templates, Flat Web Templates, Android Compatible web template,
Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyEricsson, Motorola web design" />
        <script type="application/x-javascript">
            addEventListener("load", function () {
                setTimeout(hideURLbar, 0);
            }, false);

            function hideURLbar() {
                window.scrollTo(0, 1);
            }
        </script>

        <link rel="stylesheet" type="text/css" href="css/slicebox.css" />
        <!-- for banner-->
        <!-- font-awesome-icons -->

        <link href="https://cdn.bootcss.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet"  />
        <!-- //font-awesome-icons -->
        <!-- //custom-theme files-->
        <link href="css/bootstrap.css" rel="stylesheet" type="text/css" media="all" />
        <link href="css/shouyestyle.css" rel="stylesheet" type="text/css" media="all" />
        <!-- //custom-theme files-->
        <!-- fonts -->
        <link href="//fonts.googleapis.com/css?family=Josefin+Sans:100,100i,300,300i,400,400i,600,600i,700,700i&amp;subset=latin-ext,vietnamese"
              rel="stylesheet">
        <link href="//fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i,800,800i&amp;subset=cyrillic,cyrillic-ext,greek,greek-ext,latin-ext,vietnamese"
              rel="stylesheet">
        <!-- //fonts -->

    </head>

<body>

<!-- navigation -->
<div class="nav-links">
    <div class="container">
        <nav class="navbar navbar-inverse">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="#">
                    <h1 style="width: 140px;">
                        <img src="images/LOGO.png" height="70px" width="10px"/>
                    </h1>
                </a>
            </div>
            <div class="collapse navbar-collapse" id="myNavbar">
                <ul class="nav navbar-nav link-effect">
                    <li class="active">
                        <a href="#">美乎</a>
                    </li>

                    <li>
                        <a href="<%=basePath%>luntan/luntanshouye.action?tid=1" >美论</a>
                    </li>
                    <li>
                        <a href="article/article.action" >美文</a>
                    </li>
                    <li>
                        <a href="<%=basePath%>jsp/index.jsp">美淘</a>

                    </li>

                    <li>
                        <a href="#team" class="scroll">团队</a>
                    </li>
                    <li>
                        <a href="#about" class="scroll">关于我们</a>
                    </li>
                    <li>
                        <a href="#contact" class="scroll">联系我们</a>
                    </li>
                </ul>
            </div>
        </nav>
    </div>
</div>
<!-- /navigation -->
</div>
<div class="wrapper">
    <ul id="sb-slider" class="sb-slider">
        <li>
            <a href="#">
                <img src="images/1.jpg" alt="image1" />
            </a>
            <div class="sb-description">
                <h3>Be<span>au</span>ty St<span>yl</span>e</h3>
                <p style="font-size: 20px;">生命中有许多你不想做却不能不做的事，这就是责任;生命中有许多你想做却不能做的事，这就是命运.</p>
                <i></i>
            </div>
        </li>
        <li>
            <a href="#">
                <img src="images/2.jpg" alt="image2" />
            </a>
            <div class="sb-description">
                <h3>Be<span>au</span>ty St<span>yl</span>e</h3>
                <p style="font-size: 20px;">有那么一天，有一个人，会走进你的生活，让你明白，为什么你和其他人都没有结果.</p>
                <i></i>
            </div>
        </li>
        <li>
            <a href="#">
                <img src="images/3.jpg" alt="image1" />
            </a>
            <div class="sb-description">
                <h3>Be<span>au</span>ty St<span>yl</span>e</h3>
                <p style="font-size: 20px;">要相信自己，善待自己，让自己的生活精彩纷呈。不要误认为是要让某个人后悔，而是为了让自己的人生更精彩.</p>
                <i></i>
            </div>
        </li>
    </ul>
    <div id="nav-arrows" class="nav-arrows">
        <a href="#">Next</a>
        <a href="#">Previous</a>
    </div>

</div>
<!-- /wrapper -->
</div>
<!-- //banner -->
<!--grids -->
<div class="popular-wthree" id="about">
    <div class="container">
        <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">
            关于我们
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <script>

            function display(obj) {
                document.getElementById(obj).style.display = "block";
            }
            function disappear(obj) {
                document.getElementById(obj).style.display = "none";
            }

        </script>
        <div class="col-xs-4 popular-wthree-grid">
            <img src="images/a3.jpg" class="img-responsive" alt="" />
            <div class="popular-wthree-text">
                <h5 style="font-family: '本墨锵黑';" onmouseover="display('box')" onmouseout="disappear('box')">代购</h5>
                <div id="box"class="box" style="display: none;">美乎在这里等你！</div>
            </div>
        </div>
        <div class="col-xs-4 popular-wthree-grid">
            <img src="images/a2.jpg" class="img-responsive" alt="" />
            <div class="popular-wthree-text">
                <h5 style="font-family: '本墨锵黑';" onmouseover="display('box1')" onmouseout="disappear('box1')">分享</h5>
                <div id="box1"class="box1" style="display: none;">来美乎看看吧！</div>
            </div>
        </div>
        <div class="col-xs-4 popular-wthree-grid">
            <img src="images/a1.jpg" class="img-responsive" alt="" />
            <div class="popular-wthree-text">
                <h5 style="font-family: '本墨锵黑';" onmouseover="display('box2')" onmouseout="disappear('box2')">乐购</h5>
                <div id="box2"class="box2" style="display: none;">买点东西奖励一下自己吧！</div>
            </div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!-- //grids -->
<!-- services -->
<div class="services-agile-w3l" id="services">
    <div class="services-agile-w3l-right-grids">
        <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">
            你想要的
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <div class="col-xs-4 services-agile-w3l-right-grid grid-1">

            <div class="services-agile-w3l-icon">
                <span class="fa fa-female" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>口红</h5>
                <p>请妹子喝奶茶，她问这多钱一杯啊？
                    我说10块。
                    她摇摇手说：不喝了，口红很贵.</p>
            </div>
        </div>
        <div class="col-xs-4 services-agile-w3l-right-grid grid-2">

            <div class="services-agile-w3l-icon">
                <span class="fa fa-bed" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>香水</h5>
                <p>那是谁的月亮站在琴弦上把香水川的忧伤一缕缕吟唱.
                哦 我的香水</p>
            </div>
        </div>
        <div class="col-xs-4 services-agile-w3l-right-grid grid-3">
            <div class="services-agile-w3l-icon">
                <span class="fa fa-scissors" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>防晒</h5>
                <p> 别让夏的热情,灼伤你的容颜，清爽不油受欢迎，外加防水就更好.</p>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
    <div class="services-agile-w3l-right-grids">
        <div class="col-xs-4 services-agile-w3l-right-grid grid-4">
            <div class="services-agile-w3l-icon">
                <span class="fa fa-cubes" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>眼霜</h5>
                <p>想让他眼前一亮么?</p>
            </div>
        </div>
        <div class="col-xs-4 services-agile-w3l-right-grid grid-5">
            <div class="services-agile-w3l-icon">
                <span class="fa fa-code-fork" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>洗面</h5>
                <p>洗好脸也是技术活.</p>
            </div>
        </div>
        <div class="col-xs-4 services-agile-w3l-right-grid grid-6">
            <div class="services-agile-w3l-icon">
                <span class="fa fa-external-link" aria-hidden="true"></span>
            </div>
            <div class="services-agile-w3l-icon-info">
                <h5>水乳</h5>
                <p>女孩们都是水做的.</p>
            </div>
        </div>
        <div class="clearfix"> </div>
    </div>
</div>
<!-- //services -->

<!-- pricing -->
<div class="pricing-agile">
    <div class="container">
        <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">
            时尚助力
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <div class="pricing-agile-grids">
            <div class="col-xs-4 grid-info">
                <h3 style="font-family: '本墨剪字';">兰蔻口红</h3>
                <h4>￥29.99
                    <sup>*</sup>
                </h4>
                <div class="pricing-agile-text">
                    <img src="images/1.png" />
                </div>
                <a href="#register" class="scroll">去看看</a>
            </div>
            <div class="col-xs-4 grid-info grid-two">
                <h3 style="font-family: '本墨剪字';">香奈儿口红</h3>
                <h4>￥48.99
                    <sup>*</sup>
                </h4>
                <div class="pricing-agile-text">
                    <img src="images/2.png" />
                </div>
                <a href="#register" class="scroll">去看看</a>
            </div>
            <div class="col-xs-4 grid-info grid-three">
                <h3 style="font-family: '本墨剪字';">百雀羚美肌水</h3>
                <h4>￥76.99
                    <sup>*</sup>
                </h4>
                <div class="pricing-agile-text">
                    <img src="images/3.png" />
                </div>
                <a href="#register" class="scroll">去看看</a>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //pricing table -->
<div class="news-section" id="news">
    <div class="container">
        <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">
            女孩们都讨论的
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <div class="news-grids-w3l">
            <div class="col-xs-6 news-grid">
                <a href="#" data-toggle="modal" data-target="#myModal">
                    <img src="images/f4.jpg" class="img-responsive" alt="" />
                </a>
                <div class="news-text">
                    <div class="news-events-agile">

                        <div class="post-img">
                            <a href="#" data-toggle="modal" data-target="#myModal">
                                <ul>
                                    <li>
                                        <span class="fa fa-comments" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-heart" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-share" aria-hidden="true"></span>
                                    </li>
                                </ul>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="detail-bottom">
                        <a href="#" data-toggle="modal" data-target="#myModal">
                            <h6 style="font-family: '本墨剪字';">优妮女神 耀目美博会——“寻找优妮女神”大型选秀</h6>
                        </a>

                    </div>
                </div>
            </div>
            <div class="col-xs-6 news-grid">
                <a href="#" data-toggle="modal" data-target="#myModal2">
                    <img src="images/f6.jpg" class="img-responsive" alt="" />
                </a>
                <div class="news-text">
                    <div class="news-events-agile event-colo1">

                        <div class="post-img">
                            <a href="#" data-toggle="modal" data-target="#myModal2">
                                <ul>
                                    <li>
                                        <span class="fa fa-comments" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-heart" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-share" aria-hidden="true"></span>
                                    </li>
                                </ul>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="detail-bottom">
                        <a href="#" data-toggle="modal" data-target="#myModal2">
                            <h6 style="font-family: '本墨剪字';">安媞珀推出Halo亮白清透火山泥面膜 在上海举办媒体</h6>
                        </a>

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="news-grids-w3l-2">
            <div class="col-xs-6 news-grid">
                <a href="#" data-toggle="modal" data-target="#myModal3">
                    <img src="images/f2.jpg" class="img-responsive" alt="" />
                </a>
                <div class="news-text">
                    <div class="news-events-agile event-colo4">

                        <div class="post-img">
                            <a href="#" data-toggle="modal" data-target="#myModal3">
                                <ul>
                                    <li>
                                        <span class="fa fa-comments" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-heart" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-share" aria-hidden="true"></span>
                                    </li>
                                </ul>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="detail-bottom">
                        <a href="#" data-toggle="modal" data-target="#myModal3">
                            <h6 style="font-family: '本墨剪字';">2018丽得姿与威海纳薇雅品牌合作发布会璀璨启幕</h6>
                        </a>

                    </div>
                </div>
            </div>
            <div class="col-xs-6 news-grid">
                <a href="#" data-toggle="modal" data-target="#myModal4">
                    <img src="images/f5.jpg" class="img-responsive" alt="" />
                </a>
                <div class="news-text">
                    <div class="news-events-agile event-colo3">

                        <div class="post-img">
                            <a href="#" data-toggle="modal" data-target="#myModal4">
                                <ul>
                                    <li>
                                        <span class="fa fa-comments" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-heart" aria-hidden="true"></span>
                                    </li>
                                    <li>
                                        <span class="fa fa-share" aria-hidden="true"></span>
                                    </li>
                                </ul>
                            </a>
                        </div>
                        <div class="clearfix"></div>
                    </div>
                    <div class="detail-bottom">
                        <a href="#" data-toggle="modal" data-target="#myModal4">
                            <h6 style="font-family: '本墨剪字';">
                                CHARM ZENUS瓷妆臻颜无暇粉饼 为你打造清透无暇肌</h6>
                        </a>

                    </div>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
    </div>
</div>
<!-- Modal1 -->
<div class="modal video-modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <h5>优妮女神 耀目美博会——“寻找优妮女神”大型选秀</h5>
                    <img src="images/new1.jpg" alt=" " class="img-responsive" />
                    <p>本次活动有幸请到中国美容博览
                        会（上海CBE）创始人、主席，上海百文
                        会展有限公司总经理。高级经济师，高级
                        会展师桑敬民先生、凯捷集团董事长、优妮品
                        牌创始人李靖先生、广州市优妮日化有限公司总
                        经理王睿斌先生 、资深媒体人，行业研究者，C2CC传媒总编
                        陈敏先生、羽贝纳传媒总经理谷峰先生、中国电视舞蹈第一人《这就是街舞》艺术总监，本次大赛总决赛评
                        委方俊先生、创作型歌手、本次大赛总决赛评委阿兰女士</p>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- //Modal1 -->
<!-- Modal2 -->
<div class="modal video-modal fade" id="myModal2" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <h5>安媞珀推出Halo亮白清透火山泥面膜 在上海举办媒体</h5>
                    <img src="images/new2.jpg" alt=" " class="img-responsive" />
                    <p>5月18日，于泰安路的Chez Maurice餐厅，安媞珀举办了Halo亮白清透火山泥面膜的新品发布会。Halo是安媞珀亮白系列的最新成员，安媞珀团队也同时向来宾们介绍了亮白系列的其它产品：Juliet亮白透肌洁面啫喱、Apostle臻白抗氧化精华露、麦卢卡蜂蜜亮白透肌黄金搭档等。
                    </p>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- //Modal2 -->
<!-- Modal3 -->
<div class="modal video-modal fade" id="myModal3" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <h5>2018丽得姿与威海纳薇雅品牌合作发布会璀璨启幕</h5>
                    <img src="images/new3.jpg" alt=" " class="img-responsive" />
                    <p>韩国丽得姿（株）金镇久代表应邀出席发布会并致辞。他说，中国市场是丽得姿全球化战略的关键一步，作为品牌方将始终立足品牌责任，持续加大在中国市场的广告投入和品牌宣传，通过与威海纳薇雅的品牌合作，不断加强渠道建设和品牌维权力度，让中国更多的消费者了解和认知丽得姿，购买到放心安全的丽得姿产品，用真诚和服务谱写丽得姿化妆品品牌新篇章。
                    </p>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- //Modal3 -->
<!-- Modal4 -->
<div class="modal video-modal fade" id="myModal4" tabindex="-1" role="dialog" aria-labelledby="myModal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <section>
                <div class="modal-body">
                    <h5>CHARM ZENUS瓷妆臻颜无暇粉饼 为你打造清透无暇肌</h5>
                    <img src="images/new4.jpg" alt=" " class="img-responsive" />
                    <p>每次写到粉饼，大家都有点傻傻分不清，到底是用在哪一步？有什么功效？首先大家要知道，粉饼≠蜜粉，粉饼是可以直接作为底妆，替代粉底液，粉底霜，起到均匀肤色、遮盖瑕疵的作用，而蜜粉仅仅是定妆功效。

                        粉饼方便携带，也可以用作补妆使用。大家可以先用纸巾压一下面部油脂，用粉扑或者化妆刷蘸取粉饼进行补妆。如果是油皮，还可以再叠加一层蜜粉，可以让妆效更加持久；如果是偏干皮，可以直接用了粉饼就完工。

                        瓷妆集团？所以，今天小编要给大家介绍一款控油效果超好，可以说是油皮亲妈，并且还不容易脱粉的粉饼——瓷妆臻颜无暇粉饼。这款粉饼甄选植物卵磷脂，维生素E、云母等天然成分，能够均匀修饰肤色，遮盖瑕疵，长效控油，持久不脱妆，让肌肤显得平滑透亮，让你可以一键美颜得到清透会呼吸的肌肤。
                    </p>
                </div>
            </section>
        </div>
    </div>
</div>
<!-- //Modal4 -->
<!-- //news -->
<!-- team -->
<div class="team-w3l" id="team">
    <div class="container">
        <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">
            我们的团队
            <span class="heading-style">
					<i></i>
					<i></i>
					<i></i>
				</span>
        </h3>
        <div class="team-w3l-grids">
            <div class="col-xs-3 info-team-grid-w3l">
                <img src="images/t1.jpg" alt="">
                <div class="captn">
                    <h4>上官</h4>
                    <div class="media-social-agile">
                        <ul>

                            <li>
                                <a href="#">
                                    <span class="fa fa-send"></span>
                                </a>
                            </li>
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 info-team-grid-w3l">
                <img src="images/t2.jpg" alt="">
                <div class="captn">
                    <h4>欢娇</h4>
                    <div class="media-social-agile">
                        <ul>
                            <li>
                                <a href="#">
                                    <span class="fa fa-send"></span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 info-team-grid-w3l">
                <img src="images/t4.jpg" alt="">
                <div class="captn">
                    <h4>玲子</h4>
                    <div class="media-social-agile">
                        <ul>
                            <li>
                                <a href="#">
                                    <span class="fa fa-send"></span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-xs-3 info-team-grid-w3l">
                <img src="images/t3.jpg" alt="">
                <div class="captn">
                    <h4>东梁</h4>
                    <div class="media-social-agile">
                        <ul>
                            <li>
                                <a href="#">
                                    <span class="fa fa-send"></span>
                                </a>
                            </li>

                        </ul>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //trainers -->

<!-- contact -->
<div class="contact" id="contact">
    <div class="container">
        <div class="contact-grid-agiles-w3l">
            <div class="col-md-7 contact-grid-agile">
                <h3 class="tittle-w3l" style="font-family: '本墨锵黑';">联系美乎
                    <span class="heading-style">
							<i></i>
							<i></i>
							<i></i>
						</span>
                </h3>
                <form action="#" method="post">
                    <input type="text" placeholder="姓名" name="name" required="">
                    <input type="email" placeholder="电子邮箱" name="email" required="">
                    <textarea placeholder="您的意见" name="message" required=""></textarea>
                    <input type="submit" value="留下意见">
                </form>
            </div>
            <div class="col-md-5 contact-grid-agile">
                <div class="contact-right1">
                    <img src="images/con-img.jpg" alt="" />
                </div>
                <div class="contact-right2">
                    <div class="call ">
                        <div class="col-xs-4 contact-grdr-w3l">
                            <h3>Tel :</h3>
                        </div>
                        <div class="col-xs-8 contact-grdr-w3l">
                            <ul>
                                <li>+18551226751</li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="call">
                        <div class="col-xs-4 contact-grdr-w3l">
                            <h3>Adress :</h3>
                        </div>
                        <div class="col-xs-8 contact-grdr-w3l">
                            <ul>
                                <li style="font-family: '本墨锵黑';">苏州高博</li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="call">
                        <div class="col-xs-4 contact-grdr-w3l">
                            <h3>Email :</h3>
                        </div>
                        <div class="col-xs-8 contact-grdr-w3l">
                            <ul>
                                <li>
                                    <a href="mailto:info@example.com">123456789@qq.com</a>
                                </li>
                            </ul>
                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
            </div>
            <div class="clearfix"> </div>
        </div>
    </div>
</div>
<!-- //contact -->

<!-- flicker -->
<div class="insta-text">
    <h3 style="font-family: '本墨锵黑';">粉丝展示</h3>
</div>
<div class="portfolio">
    <ul id="flexiselDemo1">
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f6.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f3.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f4.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f5.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f6.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f2.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f4.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
        <li>
            <div class="portfolio_grid-agile">
                <img src="images/f5.jpg" alt=" " class="img-responsive" />
            </div>
        </li>
    </ul>
</div>
<!-- //flicker -->

<!-- footer -->
<footer>
    <div class="footer-bottom-agile">
        <div class="container">
            <div class="footer-bottom-agile-grids">
                <div class="col-md-4 footer-logo">
                    <h2>
                        <span>美</span>乎
                        <span>Be</span>auty
                        <span>St</span>yle</h2>
                    <p>美容化妆品论坛是专注于美容化妆品的消费交流社区,涉及美容、护肤、彩妆、
                        香水、瘦身等领域,所有内容均为顾客自发交流
                        ,为您提供最新的化妆品使用者点评信息参考,交流....</p>


                </div>
                <div class="col-md-4 footer-bottom-agile-left">
                    <h5>美乎大事件</h5>
                    <div class="footer-img-grids">
                        <div class="footer-img">
                            <img src="images/f4.jpg" alt="" />
                        </div>
                        <div class="footer-img-info">
                            <p>美乎网全面上线.</p>

                        </div>
                        <div class="clearfix"> </div>
                    </div>
                    <div class="footer-img-grids grid-foot-2">
                        <div class="footer-img">
                            <img src="images/f6.jpg" alt="" />
                        </div>
                        <div class="footer-img-info">
                           <a href="<%=basePath%>jsp/activity.jsp"> <p>美论美换活动开始了.</p></a>

                        </div>
                        <div class="clearfix"> </div>
                    </div>
                </div>
                <div class="col-md-4 mk-footer one tweet footer-bottom-agile-right">
                    <h5>美乎 遇见更美的自己</h5>
                    <ul>
                        <li>
                            <a href="#">
                                <i class="fa fa-send"></i>认准官方网站.
                                <i>http//www.meihuwang.com</i>
                            </a>

                            <span>
									</span>
                            </span>
                        </li>
                    </ul>
                </div>
                <div class="clearfix"> </div>
            </div>
        </div>
    </div>
    <div class="copyright-agile">
        <div class="container">
            <p>© 2018 美乎. All rights reserved | Design by
                <a href="http://w3layouts.com">第六组</a>
            </p>
        </div>
    </div>
</footer>
<!-- //footer -->


<!-- js -->
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<!-- for bootstrap working -->
<script src="js/bootstrap.js"></script>
<!-- //for bootstrap working -->
<!-- //js -->

<!-- banner slider js -->
<script type="text/javascript" src="js/modernizr.custom.46884.js"></script>
<script type="text/javascript" src="js/jquery.slicebox.js"></script>
<script type="text/javascript">
    $(function () {

        var Page = (function () {

            var $navArrows = $('#nav-arrows').hide(),
                $shadow = $('#shadow').hide(),
                slicebox = $('#sb-slider').slicebox({
                    onReady: function () {

                        $navArrows.show();
                        $shadow.show();

                    },
                    orientation: 'r',
                    cuboidsRandom: true
                }),

                init = function () {

                    initEvents();

                },
                initEvents = function () {

                    // add navigation events
                    $navArrows.children(':first').on('click', function () {

                        slicebox.next();
                        return false;

                    });

                    $navArrows.children(':last').on('click', function () {

                        slicebox.previous();
                        return false;

                    });

                };

            return {
                init: init
            };

        })();

        Page.init();

    });
</script>
<!-- //banner slider js -->

<!-- //here starts scrolling icon -->
<script src="<%=basePath%>js/SmoothScroll.min.js"></script>
<script type="text/javascript" src="<%=basePath%>js/move-top.js"></script>
<script type="text/javascript" src="<%=basePath%>js/easing.js"></script>
<!-- here stars scrolling script -->
<script type="text/javascript">
    $(document).ready(function () {
        /*
            var defaults = {
            containerID: 'toTop', // fading element id
            containerHoverID: 'toTopHover', // fading element hover id
            scrollSpeed: 1200,
            easingType: 'linear'
            };
        */

        $().UItoTop({
            easingType: 'easeOutQuart'
        });

    });
</script>
<!-- //here ends scrolling script -->
<!-- //here ends scrolling icon -->

<!-- scrolling script -->
<script type="text/javascript">
    jQuery(document).ready(function ($) {
        $(".scroll").click(function (event) {
            event.preventDefault();
            $('html,body').animate({
                scrollTop: $(this.hash).offset().top
            }, 1000);
        });
    });
</script>
<!-- //scrolling script -->
<!-- flexisel -->
<script type="text/javascript" src="js/jquery.flexisel.js"></script>
<script type="text/javascript">
    $(window).load(function () {
        $("#flexiselDemo1").flexisel({
            visibleItems: 4,
            animationSpeed: 1000,
            autoPlay: true,
            autoPlaySpeed: 3000,
            pauseOnHover: true,
            enableResponsiveBreakpoints: true,
            responsiveBreakpoints: {
                portrait: {
                    changePoint: 480,
                    visibleItems: 1
                },
                landscape: {
                    changePoint: 640,
                    visibleItems: 2
                },
                tablet: {
                    changePoint: 768,
                    visibleItems: 3
                }
            }
        });

    });
</script>
<!-- //flexisel -->
<!-- password-script -->

<!-- //password-script -->

</body>

</html>
