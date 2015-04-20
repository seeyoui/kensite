function createUploadify(uploadifyInputId) {
	alert($("#"+uploadifyInputId));
	$("#"+uploadifyInputId).uploadify({
	    'swf' : '<%=path%>/uploadify/uploadify.swf',
	    'uploader' : '<%=path%>/uploadify/upload.do',
	  	//开启调试
        'debug' : false,
      	//按钮显示文本
	    'buttonText':$("#buttonText").val(),
	    //'scriptData': {'status':'1'},
	    'cancelImg' : '<%=path%>/css/themes/icons/cancel.png',
	  	//是否自动上传
	    'auto' : $("#buttonText").val()=='true'?true:false,
	    //超时时间
        'successTimeout' : 99999,
      	//文件选择后的容器ID
	    'queueID' : $("#queueID").val(),
	    //是否支持多附件上传
	    'multi' : $("#multi").val()=='true'?true:false,
	  	//在浏览窗口底部的文件类型下拉菜单中显示的文本
	    'fileTypeDesc' : '支持的格式：',
        //允许上传的文件后缀
        'fileTypeExts' : $("#fileTypeExts").val(),
        //允许上传文件数量
        'queueSizeLimit' : $("#queueSizeLimit").val(),
        //附件大小
	    'fileSizeLimit' : parseInt($("#fileSizeLimit").val()),
        //选择上传文件后调用
        'onSelect' : function(file) {
                  
        },
        //返回一个错误，选择文件的时候触发
        'onSelectError' : function(file, errorCode, errorMsg){
            switch(errorCode) {
                case -100:
                    alert("上传的文件数量已经超出系统限制的"+$('#uploadify').uploadify('settings','queueSizeLimit')+"个文件！");
                    break;
                case -110:
                    alert("文件 ["+file.name+"] 大小超出系统限制的"+$('#uploadify').uploadify('settings','fileSizeLimit')+"大小！");
                    break;
                case -120:
                    alert("文件 ["+file.name+"] 大小异常！");
                    break;
                case -130:
                    alert("文件 ["+file.name+"] 类型不正确！");
                    break;
            }
        },
        //检测FLASH失败调用
        'onFallback' : function(){
            alert("您未安装FLASH控件，无法上传图片！请安装FLASH控件后再试。");
        },
        //上传到服务器，服务器返回相应信息到data里
	    'onUploadSuccess' : function(file, data, response) {
	    	//for(var item in file){
	    	//	alert(item+"的值="+file[item]);
	    	//}
	    	//file.id
	    	//file.type文件扩展名
	    	//file.size文件大小
	    	//file.name文件名称
            alert('The file ' + file.name + ' was successfully uploaded with a response of ' + response + ':' + data);
        }
    });
}