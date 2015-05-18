<%@ page language="java" pageEncoding="UTF-8"%>
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title">请假申请单</h4>
							</div>
							<div class="modal-body">
								<form id="dataForm" method="post" action="">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-1" class="control-label">请假者</label>
											<input type="text" class="form-control" id="field-1" disabled="" placeholder="" value="${currentUser.name}">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-2" class="control-label">请假类型</label>
											<select class="form-control" id="sboxit-1">
												<option value="a">事假</option>
												<option value="b">病假</option>
												<option value="c">婚假</option>
												<option value="d">产假</option>
											</select>
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-1" class="control-label">请假开始时间</label>
											<input type="text" class="form-control" id="field-1" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-2" class="control-label">请假结束时间</label>
											<input type="text" class="form-control" id="field-2" placeholder="" onclick="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm',isShowClear:false});">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group no-margin">
											<label for="field-7" class="control-label">请假原因</label>
											<textarea class="form-control autogrow" id="field-7" placeholder="请简洁明确的填写请假原因"></textarea>
										</div>
									</div>
								</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-info">保存</button>
							</div>