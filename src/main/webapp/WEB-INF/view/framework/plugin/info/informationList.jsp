<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
<div id="jsAutoHeight" class="scrollable" data-max-height="600">
	<div class="page-container" class="scrollable" data-max-height="400"><!-- add class "sidebar-collapsed" to close sidebar by default, "chat-visible" to make chat appear always -->
		<div class="main-content">
			<div class="row">
				<div class="col-md-12">
					<div class="panel panel-default">
						<div class="panel-body">
							<table class="table table-bordered table-striped" id="dataList">
								<thead>
									<tr>
										<th>请假编号</th>
										<th>创建人</th>
										<th>创建时间</th>
										<th>请假原因</th>
										<th>当前节点</th>
										<th>操作</th>
									</tr>
								</thead>
							</table>
						</div>					
					</div>
				</div>
			</div>
		</div>
	</div>
</div>	
	<script type="text/javascript">
		jQuery(document).ready(function($) {
			$("#jsAutoHeight").attr("data-max-height", $(window).height());
			$('#dataList').dataTable( {
        		"bLengthChange": false,
				"bFilter": false,
				"bSort": false,
				"bInfo": true,
				"bProcessing": true, // 加载条
				"iDisplayLength": 10,
				"bProcessing": false, // 是否显示取数据时的那个等待提示
				"bServerSide": true,//这个用来指明是通过服务端来取数据
				"sAjaxSource": "${ctx}/information/getListData.do",//这个是请求的地址
				"fnServerData": retrieveData, // 获取数据的处理函数
				"oLanguage": {
					"sProcessing": "正在加载中......",
					"sLengthMenu": "每页显示 _MENU_ 条记录",
					"sZeroRecords": "对不起，查询不到相关数据！",
					"sEmptyTable": "表中无数据存在！",
					"sInfo": "当前显示 _START_ 到 _END_ 条，共 _TOTAL_ 条记录",
					"sInfoFiltered": "数据表中共为 _MAX_ 条记录",
					"oPaginate": {
						"sFirst": "首页",
						"sPrevious": "上一页",
						"sNext": "下一页",
						"sLast": "末页",
					}
				},
				"columns": [
					{ "data": "first_name" },
					{ "data": "last_name" },
					{ "data": "position" },
					{ "data": "office" },
					{ "data": "start_date" },
					{ "data": "salary" }
				]
			} );
		});
		function retrieveData(sSource, aoData, fnCallback ) {
			$.ajax({
				url : sSource,//这个就是请求地址对应sAjaxSource
				data : {"aoData":JSON.stringify(aoData)},//这个是把datatable的一些基本数据传给后台,比如起始位置,每页显示的行数
				type : 'post',
				dataType : 'json',
				async : false,
				success : function(result) {
					fnCallback(result);//把返回的数据传给这个方法就可以了,datatable会自动绑定数据的
				},
				error : function(msg) {
				}
			});
		}
	</script>
	
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	<%@ include file="/WEB-INF/view/taglib/datatables.jsp" %>
	<script src="${ctx_assets}/js/rwd-table/js/rwd-table.min.js"></script>
</body>
</html>
