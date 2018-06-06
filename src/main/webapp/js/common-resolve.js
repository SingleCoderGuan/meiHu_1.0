$(function(){
	//页面顶部菜单栏响应弹出副菜单
	$('ul.top02_right_ul li').mouseover(function(){
		$(this).find('#top02_right_ul11').css('display','block');
		$(this).find('#top02_right_ul12').css('display','block');
		$(this).find('#top02_right_ul13').css('display','block');
		$(this).find('#top02_right_ul14').css('display','block');
	}).mouseout(function(){
		$(this).find('#top02_right_ul11').css('display','none');
		$(this).find('#top02_right_ul12').css('display','none');
		$(this).find('#top02_right_ul13').css('display','none');
		$(this).find('#top02_right_ul14').css('display','none');
	});
	
	//弹出常见问题窗口
	$('#question_watching').click(function(){
		$('#question_watchingBox').dialogBox({
			type: 'correct',
			width: 500,
			height: 250,
			hasMask: true,
			hasClose: true,
			hasBtn: true,
			effect: 'sign',
			title: '常见问题',
			content: '<h6><span>Q.</span>为何我等了那么久还没送过来？</h6>'
				+'<h6><span>A:</span>我们的跑腿哥已经在努力赶去，请亲耐心等待~</h6>'
				+'<h6><span>Q.</span>零食质量如何？</h6>'
				+'<h6><span>A:</span>亲，我们一向以高质量，高要求的原则运营，零食绝对新鲜~</h6>'
		});
	});
	
	//弹出配送范围窗口
	$('#sendQues_watching').click(function(){
		$('#sendQues_watchingBox').dialogBox({
			type: 'correct',
			width: 500,
			height: 250,
			hasMask: true,
			hasClose: true,
			hasBtn: true,
			effect: 'sign',
			title: '配送范围',
			content: '<h6><span>Tip1.</span>郑州航院校内10元起送免费</h6><h6><span>Tip2:</span>郑州航院校外、省内运费8元，购物满66元起免邮</h6><h6><span>Tip3.</span>省外运费12元，购物满88元起免邮</h6>'
		});
	});
	
	//弹出关于我们窗口
	$('#aboutus_watching').click(function(){
		$('#aboutus_watchingBox').dialogBox({
			type: 'correct',
			width: 500,
			height: 320,
			hasMask: true,
			hasClose: true,
			hasBtn: true,
			effect: 'sign',
			title: '关于我们',
			content: '<h5><span>小屋梦想：</span>创造独特的吃货王国</h5><h5><span>小屋使命：</span>让天下主人爽起来</h5><h5><span>小屋愿景：</span></h5><h5 style="margin-left:70px;">成为持续为主人、合作伙伴、员工创造新价值的公司</h5><h5 style="margin-left:70px;">成为一个让员工有安全感、幸福感的大家庭</h5><h5><span>核心价值观：</span>把顾客真正当成主人</h5>'
		});
	});

	//---------------------------------------------------------------------
	
	//响应用户退出登录(各页面皆适用)
	$('#user_logout_bt').click(function(){
		$.ajax({
			type:"POST",
			url:$("#base-Path").val()+"/clients/logout.action",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"cId":$("#cid").val()}),
			success:function(obj){
				if(obj.dealResult=="true"){
					window.location.href=$("#base-Path").val()+"/skip/toLogin.action";
				}else if(obj.dealResult=="false"){
					$("#tip-dialogBox").dialogBox({
						width:200,
						height:100,
						autoHide: true,
						time: 3000,
						hasMask: true,
						title: '小屋Tip',
						content: '退出登录出错，请重试~'
					});
				}
			},
			error:function(){
				$("#tip-dialogBox").dialogBox({
					width:200,
					height:100,
					autoHide: true,
					time: 3000,
					hasMask: true,
					title: '小屋Tip',
					content: '连接数据出错，请重试~'
				});
			}
		});
	});
	
});