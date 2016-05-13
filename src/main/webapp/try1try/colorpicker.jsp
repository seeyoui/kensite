<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
	<title>Kensite开发平台</title>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/layer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/jqueryui.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/colorPicker.jsp" %>
</head>

<body>
	<script type="text/javascript">
    $(document).ready(function() {
    	$('#colorpickerField').ColorPicker({
    		onSubmit: function(hsb, hex, rgb, el) {
    			$(el).val(hex);
    			for(var o in rgb) {
    				alert(o+'='+rgb[o]);
    			}
    			$(el).ColorPickerHide();
    		},
    		onBeforeShow: function () {
    			$(this).ColorPickerSetColor(this.value);
    		}
    	})
    	.bind('keyup', function(){
    		$(this).ColorPickerSetColor(this.value);
    	});
    	
    	$('#colorSelector').ColorPicker({
    		color: '#0000ff',
    		onShow: function (colpkr) {
    			$(colpkr).fadeIn(500);
    			return false;
    		},
    		onHide: function (colpkr) {
    			$(colpkr).fadeOut(500);
    			return false;
    		},
    		onChange: function (hsb, hex, rgb) {
    			$('#colorSelector div').css('backgroundColor', '#' + hex);
    		}
    	});
    });
</script>

<input type="text" maxlength="6" size="6" id="colorpickerField" value="00ff00" />
<div id="colorSelector" style="height: 36px;position: relative;width: 36px;"><div style="background-color: #0000ff;height: 36px; position: relative;width: 36px;"></div></div>
</body>
</html>
