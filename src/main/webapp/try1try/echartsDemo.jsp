<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Kensite</title>
<%@ include file="/WEB-INF/view/taglib/header.jsp"%>
<%@ include file="/WEB-INF/view/taglib/layer.jsp"%>
<script src="${ctx_script }/echarts/echarts.min.js"></script>
</head>
<body>
	<!-- 为ECharts准备一个具备大小（宽高）的Dom -->
	<div id="main" style="width: 435px; height: 240px;"></div>
	<script type="text/javascript">
		// 基于准备好的dom，初始化echarts实例
		var myChart,option;
		$(document).ready(function() {
			myChart = echarts.init(document.getElementById('main'));
			// 指定图表的配置项
			/*
			option = {
			    title : {
			        text: '某站点用户访问来源',
			        subtext: '纯属虚构',
			        x:'center'
			    },
			    tooltip : {
			        trigger: 'item',
			        formatter: "{a} <br/>{b} : {c} ({d}%)"
			    },
			    legend: {
			        orient: 'vertical',
			        left: 'left',
			        data: ['直接访问','邮件营销','联盟广告','视频广告','搜索引擎']
			    },
			    series : [
			        {
			            name: '访问来源',
			            type: 'pie',
			            radius : '55%',
			            center: ['50%', '60%'],
			            data:[
			                {value:335, name:'直接访问'},
			                {value:310, name:'邮件营销'},
			                {value:234, name:'联盟广告'},
			                {value:135, name:'视频广告'},
			                {value:1548, name:'搜索引擎'}
			            ],
			            itemStyle: {
			                emphasis: {
			                    shadowBlur: 10,
			                    shadowOffsetX: 0,
			                    shadowColor: 'rgba(0, 0, 0, 0.5)'
			                }
			            }
			        }
			    ]
			};
			myChart.setOption(option);
			*/
			option = {
				tooltip : {
					trigger : 'axis',
			        axisPointer : {            // 坐标轴指示器，坐标轴触发有效
			            type : 'shadow'        // 默认为直线，可选为：'line' | 'shadow'
			        }
				},
				legend: {
			        x: "right",
			        y: "top"
			    },
				grid : {
					left : '5%',
					right : '4%',
					bottom : '3%',
					containLabel : true
				},
				toolbox: {
			        show: false
			    },
				xAxis : {
					type : 'category'
				},
				yAxis : {
					type : 'value'
				},
			    color: ["#1AB394", "#F8AC59", "#23C6C8", "#ED5565", "rgb(255, 127, 80)"]
			};
			getChartData();
		});
		
		function getChartData() {
			var sqlx = "SELECT id key,name value from plan_project order by create_date";
			var sqly = "select status zkey,project_id xkey,count(1) value from v_task_details group by project_id,status";
			var sqlz = "select value key,label name,case when value='finish' or value='delay_finish' then '已完成' when value='normal' or value='delay' then '进行中' end stack from sys_dict where category = 'plan_task_status' order by sequence";
			$.ajax({
				type: "post",
				url: '${ctx}/ks/chart/bar',//${ctx}/sys/chart/echarts/line==>line返回折线图bar返回柱状图
				data: {
					sqlx : sqlx,
					sqly : sqly,
					sqlz : sqlz
				},
				dataType: 'json',
				beforeSend: function(XMLHttpRequest){
					loadi = layer.load(2, {shade: layerLoadShade,time: layerLoadMaxTime});
				},
				success: function(data, textStatus){
					layer.close(loadi);
					option.xAxis["data"] = data.xAxis.data;
					myChart.setOption(option);
					myChart.setOption(data);
				}
			});
		}
	</script>
</body>
</html>