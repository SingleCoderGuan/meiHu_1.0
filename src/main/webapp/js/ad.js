	var delta=0.08
	var collection;
	function floaters() {
		this.items	= [];
		this.addItem	= function(id,x,y,content)
				  {
					document.write('<DIV id='+id+' style="Z-INDEX: 10; POSITION: absolute;  width:80px; height:60px;left:'+(typeof(x)=='string'?eval(x):x)+';top:'+(typeof(y)=='string'?eval(y):y)+'">'+content+'</DIV>');
					
					var newItem				= {};
					newItem.object			= document.getElementById(id);
					newItem.x				= x;
					newItem.y				= y;

					this.items[this.items.length]		= newItem;
				  }
		this.play	= function()
				  {
					collection				= this.items
					setInterval('play()',10);
				  }
		}
		function play()
		{

			for(var i=0;i<collection.length;i++)
			{
				var followObj		= collection[i].object;
				var followObj_x		= (typeof(collection[i].x)=='string'?eval(collection[i].x):collection[i].x);
				var followObj_y		= (typeof(collection[i].y)=='string'?eval(collection[i].y):collection[i].y);

				if(followObj.offsetLeft!=(document.body.scrollLeft+followObj_x)) {
					var dx=(document.body.scrollLeft+followObj_x-followObj.offsetLeft)*delta;
					dx=(dx>0?1:-1)*Math.ceil(Math.abs(dx));
					followObj.style.left=followObj.offsetLeft+dx;
					}

				if(followObj.offsetTop!=(document.body.scrollTop+followObj_y)) {
					var dy=(document.body.scrollTop+followObj_y-followObj.offsetTop)*delta;
					dy=(dy>0?1:-1)*Math.ceil(Math.abs(dy));
					followObj.style.top=followObj.offsetTop+dy;
					}
				followObj.style.display	= '';
			}
		}	
		
	var theFloaters		= new floaters();
	//����
	theFloaters.addItem('followDiv1','document.body.clientWidth-106',80,'<a href="../quchoujiang.action" target="_blank"><img src="../images/huodong.png" width="120" height="300" border="0"></a>');
	//����
    theFloaters.addItem('followDiv2',6,80,'<a href="../quchoujiang.action" target="_blank"><img src="../images/huodong.png" width="120" height="300" border="0"></a>');

    // theFloaters.addItem('followDiv2',6,80,'<EMBED src=images/duilian.swf quality=high  WIDTH=100 HEIGHT=300 TYPE=application/x-shockwave-flash id=ad wmode=opaque></EMBED>');
	theFloaters.play();
	
//ͼƬ��ʽ���÷���
//<a href=http://www.makewing.com/lanren/ target=_blank><img src=images/ad_100x300.jpg border=0></a>
	