$(function() {
	$(".car_item_img").mouseenter(
		function(){
			$(this).find(".car_item_img_sub").css("z-index","6");
			$(this).find(".car_item_img_sub").animate({width:"120px",height:"120px",background:"#fff"},100);
			$(this).find(".car_item_img_sub img").animate({display:"display",width:"120px",height:"120px"},100);
		}
	);
	$(".car_item_img").mouseleave(
		function(){
			$(this).find(".car_item_img_sub").css("z-index","5");
			$(this).find(".car_item_img_sub").animate({width:"50px",height:"50px",background:"#fff"},1);
			$(this).find(".car_item_img_sub img").animate({width:"50px",height:"50px",display:"none"},1);
	});
	
	//催单
	$(".reminder_shopper").click(function(){
		$("#tip-dialogBox").dialogBox({
			width:340,
			height:120,
			autoHide: true,
			time: 3000,
			hasMask: true,
			title: '小屋Tip',
			content: '催单成功~小屋的跑腿宝宝正在马不停蹄赶路~'
		});
	});
	
	//确认收货
	$(".contain_receiver").click(function(){
		$.ajax({
			type:"POST",
			url:$("#base-Path").val()+"/order/receiveGood.action",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"order":{"id":$(this).attr("id")}}),
			success:function(obj){
				if(obj.dealResult=="true"){
					$("#tip-dialogBox").dialogBox({
						type: 'correct',
						width: 320,
						height: 170,
						hasMask: true,
						effect: 'sign',
						title: '小屋Tip',
						content: '<h6 style="font-size:14px; margin-left:30px; color:#ff4040; text-align:center;">确认收货成功~</h6><br>'
							+'<div class="bt_order_confirm_div"><a href="'+$("#base-Path").val()+'/order/clientUnReceiveOrders.action?cid='+$("#cid").val()+'" class="bt_order_confirm" >确定</a></div>'
					});
				}else if(obj.dealResult == "false"){
					$("#tip-dialogBox").dialogBox({
						width:270,
						height:100,
						autoHide: true,
						time: 3000,
						hasMask: true,
						title: '小屋Tip',
						content: '确认收货出错，请重试~'
					});
				}
			},
			error:function(){
				$("#tip-dialogBox").dialogBox({
					width:270,
					height:100,
					autoHide: true,
					time: 3000,
					hasMask: true,
					title: '小屋Tip',
					content: '服务器连接有误，请重试~'
				});
			}
		});
	});
	
	//移除订单
	$(".delete_order").click(function(){
		$.ajax({
			type:"POST",
			url:$("#base-Path").val()+"/order/removeOrder.action",
			contentType:"application/json",
			dataType:"json",
			data:JSON.stringify({"order":{"id":$(this).attr("id")}}),
			success:function(obj){
				if(obj.dealResult=="true"){
					$("#tip-dialogBox").dialogBox({
						type: 'correct',
						width: 320,
						height: 170,
						hasMask: true,
						effect: 'sign',
						title: '小屋Tip',
						content: '<h6 style="font-size:14px; margin-left:30px; color:#ff4040; text-align:center;">移除订单成功~</h6><br>'
							+'<div class="bt_order_confirm_div"><a href="'+$("#base-Path").val()+'/order/clientDoneOrders.action?cid='+$("#cid").val()+'" class="bt_order_confirm" >确定</a></div>'
					});
				}else if(obj.dealResult == "again"){
					$("#tip-dialogBox").dialogBox({
						width:270,
						height:100,
						autoHide: true,
						time: 3000,
						hasMask: true,
						title: '小屋Tip',
						content: '该订单已被移除，请刷新页面~'
					});
				}else if(obj.dealResult == "err"){
					$("#tip-dialogBox").dialogBox({
						width:270,
						height:100,
						autoHide: true,
						time: 3000,
						hasMask: true,
						title: '小屋Tip',
						content: '移除订单出错，请重试~'
					});
				}
			},
			error:function(){
				$("#tip-dialogBox").dialogBox({
					width:270,
					height:100,
					autoHide: true,
					time: 3000,
					hasMask: true,
					title: '小屋Tip',
					content: '服务器连接有误，请重试~'
				});
			}
		});
	});
	
	
	$(".to_evaluation").click(function(){
		var g_id = $(this).attr(id);
		$("#tip-dialogBox").dialogBox({
			type: 'correct',
			width: 330,
			height: 250,
			hasMask: true,
			effect: 'sign',
			title: '小屋Tip-评价订单',
			content: '<span class="car_item_address evaluation_contain"><label >请输入您对此次购物的评价</label><br>'
				+'<textarea rows="3" cols="40" placeholder="最多80个字符~" maxlength="80" class="evaluation_label"></textarea>'
				+'</span>'
				+'<br>'
				+'<div class="bt_order_confirm_div" style="margin-top:30px;"><a href="'+$("#base-Path").val()+'/goods/getIndex.action" class="bt_order_confirm" >确定</a></div>'
		});
	});
	
});