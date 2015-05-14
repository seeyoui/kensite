<%@ page language="java" pageEncoding="UTF-8"%>
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								<h4 class="modal-title">Modal Content is Responsive</h4>
							</div>
							<div class="modal-body">
								<form id="dataForm" method="post">
								<div class="row">
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-1" class="control-label">Name</label>
											<input type="text" class="form-control" id="field-1" placeholder="John">
										</div>
									</div>
									<div class="col-md-6">
										<div class="form-group">
											<label for="field-2" class="control-label">Surname</label>
											<input type="text" class="form-control" id="field-2" placeholder="Doe">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group">
											<label for="field-3" class="control-label">Address</label>
											<input type="text" class="form-control" id="field-3" placeholder="Address">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-4">
										<div class="form-group">
											<label for="field-4" class="control-label">City</label>
											<input type="text" class="form-control" id="field-4" placeholder="Boston">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="field-5" class="control-label">Country</label>
											<input type="text" class="form-control" id="field-5" placeholder="United States">
										</div>
									</div>
									<div class="col-md-4">
										<div class="form-group">
											<label for="field-6" class="control-label">Zip</label>
											<input type="text" class="form-control" id="field-6" placeholder="123456">
										</div>
									</div>
								</div>
								<div class="row">
									<div class="col-md-12">
										<div class="form-group no-margin">
											<label for="field-7" class="control-label">Personal Info</label>
											<textarea class="form-control autogrow" id="field-7" placeholder="Write something about yourself"></textarea>
										</div>
									</div>
								</div>
								</form>
							</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-white" data-dismiss="modal">关闭</button>
								<button type="button" class="btn btn-info">保存</button>
							</div>