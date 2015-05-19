<%@ page language="java" pageEncoding="UTF-8"%>
								<form id="dataForm" method="post">
								<input type="hidden" id="id_id" name="id" value="${leave.id}">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-1" class="control-label">请假者</label>
											<input type="text" class="form-control" id="applyUser" disabled="" placeholder="" value="${currentUser.name}">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-2" class="control-label">请假类型</label>
											<select class="form-control" id="leaveType_id" name="leaveType">
												<option value="事假" ${leave.leaveType=='事假'?'selected':''}>事假</option>
												<option value="病假" ${leave.leaveType=='病假'?'selected':''}>病假</option>
												<option value="婚假" ${leave.leaveType=='婚假'?'selected':''}>婚假</option>
												<option value="产假" ${leave.leaveType=='产假'?'selected':''}>产假</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-1" class="control-label">请假开始时间</label>
											<input type="text" class="form-control" id="startTime_id" name="startTime" value="<fmt:formatDate value="${leave.startTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-2" class="control-label">请假结束时间</label>
											<input type="text" class="form-control" id="endTime_id" name="endTime" value="<fmt:formatDate value="${leave.endTime}" type="both"/>" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group no-margin">
											<label for="field-7" class="control-label">请假原因</label>
											<textarea class="form-control autogrow" id="reason_id" name="reason" placeholder="请简洁明确的填写请假原因">${leave.reason}</textarea>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-10"></div>
									<div class="col-md-2">
										<button type="button" class="btn btn-success" onclick="saveInfo()">保存</button>
										<button type="button" class="btn btn-pink" onclick="complete('${leave.task.id}', null)">办理</button>
									</div>
								</div>
								</form>