<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>Kensite开发平台</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/easyui.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp"%>
<%@ include file="/WEB-INF/view/taglib/echarts.jsp"%>
<script type="text/javascript">
	$(document).ready(function() {
	});
</script>
<script type="text/javascript">
	var myChart;
	// 使用
	require(
			[
				'echarts', 'echarts/chart/bar', // 使用柱状图就加载bar模块，按需加载
				'echarts', 'echarts/chart/line'
			],
			function(ec) {
				// 基于准备好的dom，初始化echarts图表
				myChart = ec.init(document.getElementById('main'));
				/* myChart.showLoading({
				    text: '正在努力的读取数据中...',    //loading话术
				    effect: 'bubble'	//loading效果，可选为：'spin' | 'bar' | 'ring' | 'whirling' | 'dynamicLine' | 'bubble'，支持外部装载
				}); */
				option = {
					//标题，每个图表最多仅有一个标题控件，每个标题控件可设主副标题  
	                title: {  
	                    //主标题文本，'\n'指定换行  
	                    text: '2013年广州降水量与蒸发量统计报表',  
	                    //主标题文本超链接  
	                    link: 'http://www.tqyb.com.cn/weatherLive/climateForecast/2014-01-26/157.html',  
	                    //副标题文本，'\n'指定换行  
	                    subtext: 'www.stepday.com',  
	                    //副标题文本超链接  
	                    sublink: 'http://www.stepday.com/myblog/?Echarts',  
	                    //水平安放位置，默认为左侧，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
	                    x: 'left',  
	                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
	                    y: 'top'  
	                },
	              	//提示框，鼠标悬浮交互时的信息提示  
	                tooltip: {  
	                    //触发类型，默认（'item'）数据触发，可选为：'item' | 'axis'  
	                    trigger: 'axis'  
	                },  
	              //图例，每个图表最多仅有一个图例  
	                legend: {  
	                    //显示策略，可选为：true（显示） | false（隐藏），默认值为true  
	                    show: true,  
	                    //水平安放位置，默认为全图居中，可选为：'center' | 'left' | 'right' | {number}（x坐标，单位px）  
	                    x: 'center',  
	                    //垂直安放位置，默认为全图顶端，可选为：'top' | 'bottom' | 'center' | {number}（y坐标，单位px）  
	                    y: 'top',  
	                    //legend的data: 用于设置图例，data内的字符串数组需要与sereis数组内每一个series的name值对应  
	                    data: ['蒸发量','降水量']  
	                }, 
					toolbox : {
						//显示策略，可选为：true（显示） | false（隐藏），默认值为false
						show : true,
						orient : 'horizontal', 	// 布局方式，默认为水平布局，可选为：
													// 'horizontal' ¦ 'vertical'
						x : 'right', 				// 水平安放位置，默认为全图右对齐，可选为：
													// 'center' ¦ 'left' ¦ 'right'
													// ¦ {number}（x坐标，单位px）
						y : 'top', 					// 垂直安放位置，默认为全图顶端，可选为：
													// 'top' ¦ 'bottom' ¦ 'center'
													// ¦ {number}（y坐标，单位px）
						color : [ '#1e90ff', '#22bb22', '#4b0082', '#d2691e' ],
						backgroundColor : 'rgba(0,0,0,0)', // 工具箱背景颜色
						borderColor : '#ccc', // 工具箱边框颜色
						borderWidth : 0, // 工具箱边框线宽，单位px，默认为0（无边框）
						padding : 5, // 工具箱内边距，单位px，默认各方向内边距为5，
						showTitle : true,
						//启用功能，目前支持feature，工具箱自定义功能回调处理 
						feature : {
							mark : {
								show : true,
								title : {
									mark : '辅助线-开关',
									markUndo : '辅助线-删除',
									markClear : '辅助线-清空'
								},
								lineStyle : {
									width : 1,
									color : '#1e90ff',
									type : 'dashed'
								}
							},
							dataZoom : {
								show : true,
								title : {
									dataZoom : '区域缩放',
									dataZoomReset : '区域缩放-后退'
								}
							},
							dataView : {
								show : true,
								title : '数据视图',
								readOnly : true,
								lang : [ '数据视图', '关闭', '刷新' ],
								optionToContent : function(opt) {
									var axisData = opt.xAxis[0].data;
									var series = opt.series;
									var table = '<table style="width:100%;text-align:center"><tbody><tr>'
											+ '<td>时间</td>' + '<td>' + series[0].name + '</td>' + '<td>' + series[1].name + '</td>' + '</tr>';
									for (var i = 0, l = axisData.length; i < l; i++) {
										table += '<tr>' + '<td>' + axisData[i] + '</td>' + '<td>' + series[0].data[i] + '</td>' + '<td>' + series[1].data[i] + '</td>' + '</tr>';
									}
									table += '</tbody></table>';
									return table;
								}
							},
							magicType : {
								show : true,
								title : {
									line : '动态类型切换-折线图',
									bar : '动态类型切换-柱形图',
									stack : '动态类型切换-堆积',
									tiled : '动态类型切换-平铺'
								},
								type : [ 'line', 'bar', 'stack', 'tiled' ]
							},
							restore : {
								show : true,
								title : '还原',
								color : 'black'
							},
							saveAsImage : {
								show : true,
								title : '保存为图片',
								type : 'jpeg',
								lang : [ '点击本地保存' ]
							},
							myTool : {
								show : true,
								title : '自定义扩展方法',
								icon : 'image://../asset/ico/favicon.png',
								onclick : function() {
									alert('myToolHandler')
								}
							}
						}
					},
					//是否启用拖拽重计算特性，默认关闭(即值为false) 
					calculable : true,
					dataZoom : {
						show : true,
						realtime : true,
						start : 20,
						end : 80
					},
					//直角坐标系中横轴数组，数组中每一项代表一条横轴坐标轴，仅有一条时可省略数值  
	                //横轴通常为类目型，但条形图时则横轴为数值型，散点图时则横纵均为数值型  
					xAxis : [ {
						//显示策略，可选为：true（显示） | false（隐藏），默认值为true  
                        show: true,  
                        //坐标轴类型，横轴默认为类目型'category'  
                        type: 'category',  
						boundaryGap : false,
						data : function() {
							var list = [];
							for (var i = 1; i <= 31; i++) {
								list.push('2016-01-' + i);
							}
							return list;
						}()
					} ],
					//直角坐标系中纵轴数组，数组中每一项代表一条纵轴坐标轴，仅有一条时可省略数值  
	                //纵轴通常为数值型，但条形图时则纵轴为类目型  
					yAxis : [ {
						//显示策略，可选为：true（显示） | false（隐藏），默认值为true  
                        show: true,  
                        //坐标轴类型，纵轴默认为数值型'value'  
                        type: 'value',  
                        //分隔区域，默认不显示  
                        splitArea: {show: true}  
					} ],
					series : [ {
						name : '蒸发量',
						type : 'line',
						data : function() {
							var list = [];
							for (var i = 1; i <= 30; i++) {
								list.push(Math.round(Math.random() * 30));
							}
							return list;
						}()
					}, {
						name : '降水量',
						type : 'line',
						data : function() {
							var list = [];
							for (var i = 1; i <= 30; i++) {
								list.push(Math.round(Math.random() * 10));
							}
							return list;
						}()
					} ]
				};

				// 为echarts对象加载数据 
				myChart.setOption(option);
				myChart.setTheme('macarons');
				//myChart.hideLoading();
			});
</script>
<script type="text/javascript">
var propertygrid_data = {"total":1000,"rows":[
	{"name":"show","value":"true","group":"标题设置","editor":{
		"type":"checkbox",
		"options":{
			"on":true,
			"off":false
		}
	}},
	{"name":"text","value":"","group":"标题设置","editor":"text"},
	{"name":"link","value":"","group":"标题设置","editor":{
		"type":"validatebox",
		"options":{
			"validType":"url"
		}
	}},
	{"name":"target","value":"blank","group":"标题设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"","text":"none"},{"value":"self","text":"self"},{"value":"blank","text":"blank"}],
            "panelHeight":"auto"
        }
    }},
	{"name":"subtext","value":"","group":"标题设置","editor":"text"},
	{"name":"sublink","value":"","group":"标题设置","editor":{
		"type":"validatebox",
		"options":{
			"validType":"url"
		}
	}},
	{"name":"subtarget","value":"blank","group":"标题设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"","text":"none"},{"value":"self","text":"self"},{"value":"blank","text":"blank"}],
            "panelHeight":"auto"
        }
    }},
	{"name":"x","value":"left","group":"标题设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"center","text":"center"},{"value":"left","text":"left"},{"value":"right","text":"right"}],
            "panelHeight":"auto"
        }
    }},
	{"name":"y","value":"top","group":"标题设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"top","text":"top"},{"value":"bottom","text":"bottom"},{"value":"center","text":"center"}],
            "panelHeight":"auto"
        }
    }},
    /*******************************/
	{"name":"show","value":"true","group":"工具栏设置","editor":{
		"type":"checkbox",
		"options":{
			"on":true,
			"off":false
		}
	}},
	{"name":"x","value":"left","group":"工具栏设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"center","text":"center"},{"value":"left","text":"left"},{"value":"right","text":"right"}],
            "panelHeight":"auto"
        }
    }},
	{"name":"y","value":"top","group":"工具栏设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"top","text":"top"},{"value":"bottom","text":"bottom"},{"value":"center","text":"center"}],
            "panelHeight":"auto"
        }
    }},
	{"name":"feature","value":"top","group":"工具栏设置","editor":{
        "type":"combobox",
        "options":{
            "valueField":"value",
            "textField":"text",
            "method":"get",
            "data":[{"value":"top","text":"top"},{"value":"bottom","text":"bottom"},{"value":"center","text":"center"}],
            "panelHeight":"auto"
        }
    }},
    
    
	{"name":"Email","value":"bill@gmail.com","group":"Marketing Settings","editor":{
		"type":"validatebox",
		"options":{
			"validType":"email"
		}
	}},
	{"name":"FrequentBuyer","value":"false","group":"Marketing Settings","editor":{
		"type":"checkbox",
		"options":{
			"on":true,
			"off":false
		}
	}}
]}
</script>
<script type="text/javascript">
function run() {
	runTitle();
}
function runTitle() {
	var rows = $('#property').datagrid('getRows');
	var show = rows[0].value;
	var text = rows[1].value;
	var link = rows[2].value;
	var target = rows[3].value;
	var subtext = rows[4].value;
	var sublink = rows[5].value;
	var subtarget = rows[6].value;
	var x = rows[7].value;
	var y = rows[8].value;
	myChart.setOption({
		title : {
			show : show=='true',
			text : text,
			link : link,
			target : target,
			subtext : subtext,
			sublink : sublink,
			subtarget : subtarget,
			x : x,
			y : y
		}
	});
}
</script>
</head>

<body>
	<div id="container" style="position: absolute; top: 0px; left: 0px; right: 0px; bottom: 0px;">
		<div id="content" style="position: absolute; top: 0px; left: 0px; width: 400px; bottom: 0px;">
			<table id="property" class="easyui-propertygrid" data-options="
					data: propertygrid_data,
					title: '参数设置',
					fit: true,
					showGroup: true,
					border: true,
					footer:'#ft'
				">
			</table>
			<div id="ft">
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-4336'" onclick="save()">确定</a>
				<a href="javascript:void(0)" class="easyui-linkbutton" data-options="plain:true,iconCls:'icon-5571'" onclick="run()">试用</a>
			</div>
		</div>
		<div id="main" style="position: absolute; top: 0px; left: 400px; right: 0px; bottom: 0px;"></div>
	</div>
</body>
</html>
