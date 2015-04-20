$position=0;

function $getClientWidthHeight(w){
	var win=w||window;
	var d = win.document;
	if(d.documentElement&& !(d.documentElement.scrollTop==undefined||d.documentElement.scrollTop==0)){
		return{
			'width':win.document.documentElement.clientWidth,
			'height':win.document.documentElement.clientHeight
		};
	}
	else if(win.document.body){
		return{
			'width':win.document.body.clientWidth,
			'height':win.document.body.clientHeight
		};
	}
}

function $getScroll(w){
	var win=w||window;
	var d = win.document;
	if(d.documentElement&& !(d.documentElement.scrollTop==undefined||d.documentElement.scrollTop==0)){
		return{
			'top':win.document.documentElement.scrollTop,
			'left':win.document.documentElement.scrollLeft
		};
	}
	else if(win.document.body){
		return{
			'top':win.document.body.scrollTop,
			'left':win.document.body.scrollLeft
		};
	}
}
function $getAbsM(topWin){
	if(topWin==null){
		topWin=top;
	}
	var leftM=0;var topM=0;
	var tempWin=window;
	while(tempWin!=topWin){
		var ifs=tempWin.parent.document.getElementsByTagName('iframe');
		for(var i=0;i<ifs.length;i++){
			try{
				if(ifs[i].contentWindow==tempWin.window){
					var rc=$getBoundingClientRect(ifs[i]);
					leftM+=rc.left;
					topM+=rc.top;
					break;
				}
			}
			catch(e){
				continue;
			}
		}
		tempWin=tempWin.parent;
	}
	return{'leftM':leftM,'topM':topM};
}

function $getBoundingClientRect(obj){
//	if(navigator.product=='Gecko'){
		var objWin=null;
		var top=obj.offsetTop;
		var left=obj.offsetLeft;
		var right=obj.offsetWidth;
		var bottom=obj.offsetHeight;
		while(obj=obj.offsetParent){
			top+=obj.offsetTop;left+=obj.offsetLeft;
			if(obj.tagName.toLowerCase()=="body"){
				objWin=obj.ownerDocument.defaultView;
			}
		}
		var theScroll=$getScroll(objWin);
		left-=theScroll.left;
		top-=theScroll.top;
		right+=left;
		bottom+=top;
		return{'left':left,'top':top,'right':right,'bottom':bottom};
//	}else{
//		return obj.getBoundingClientRect();
//	}
}

function getOffset(id){
	var top = window;
	var eCont = document.getElementById(id);
	while(top.parent.document != top.document
			&&top.parent.document.getElementsByTagName("frameset").length==0){
		top = top.parent;
	}

	var objxy = $getBoundingClientRect(eCont);
	var mm = $getAbsM(top);
	var currWinSize = $getClientWidthHeight(top);
	var theScroll = $getScroll(top);
	var ddTop = mm.topM + objxy.bottom;
	var ddLeft = mm.leftM + objxy.left;
	var ddHeight = 200;
	var ddWidth = 280;
//	var ddHeight=Math.max(parseInt(this.dd.offsetHeight),200);
//	var ddWidth=Math.max(parseInt(this.dd.offsetWidth),280);
	var offset = {};
	if(
			($position==2)||(
					($position==0)&&(
							(ddTop+ddHeight<currWinSize.height)||(ddTop-ddHeight<ddHeight*0.8)
					)
			)
	){
		offset.top = (theScroll.top+ddTop+3)+'px';
	}else{
		offset.top = (theScroll.top+ddTop-ddHeight-eCont.offsetHeight-1)+'px';
	}
	offset.left = 3+theScroll.left+Math.min(ddLeft,currWinSize.width-ddWidth-5)+'px';
	
	return offset;
}

