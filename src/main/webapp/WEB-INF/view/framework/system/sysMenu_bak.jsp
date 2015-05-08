<%@ page language="java" pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/view/taglib/common.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
	<%@ include file="/WEB-INF/view/taglib/header.jsp" %>
</head>

<body class="page-body">
	<div id="jsAutoHeight" class="scrollable" data-max-height="400">
		<div class="panel panel-default" style="margin-bottom: 0;padding: 0 20px;">
			<div class="panel-body">
				<script type="text/javascript">
				jQuery(document).ready(function($)
				{
					$("#jsAutoHeight").attr("data-max-height", $(window).height());
					$("#example-2").dataTable({
						dom: "t" + "<'row'<'col-xs-6'i><'col-xs-6'p>>",
						aoColumns: [
							{bSortable: false},
							null,
							null,
							null,
							null
						],
					});
					
					// Replace checkboxes when they appear
					var $state = $("#example-2 thead input[type='checkbox']");
					alert($state);
					$("#example-2").on('draw.dt', function()
					{
						cbr_replace();
						
						$state.trigger('change');
					});
					
					// Script to select all checkboxes
					$state.on('change', function(ev)
					{
						alert(1);
						var $chcks = $("#example-2 tbody input[type='checkbox']");
						
						if($state.is(':checked'))
						{
							$chcks.prop('checked', true).trigger('change');
						}
						else
						{
							$chcks.prop('checked', false).trigger('change');
						}
					});
				});
				</script>
				
				<table class="table table-bordered table-striped" id="example-2">
					<thead>
						<tr>
							<th class="no-sorting">
								<input type="checkbox" class="cbr">
							</th>
							<th>Student Name</th>
							<th>Average Grade</th>
							<th>Curriculum / Occupation</th>
							<th>Actions</th>
						</tr>
					</thead>
					
					<tbody class="middle-align">
					
						<tr>
							<td>
								<input type="checkbox" class="cbr">
							</td>
							<td>Randy S. Smith</td>
							<td>8.7</td>
							<td>Social and human service</td>
							<td>
								<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
									Edit
								</a>
								
								<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
									Delete
								</a>
								
								<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
									Profile
								</a>
							</td>
						</tr>
						
						<tr>
							<td>
								<input type="checkbox" class="cbr">
							</td>
							<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
				
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
				
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
				
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
				
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Ellen C. Jones</td>
						<td>7.2</td>
						<td>Education and development manager</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Randy S. Smith</td>
						<td>8.7</td>
						<td>Social and human service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Jennifer J. Jefferson</td>
						<td>10</td>
						<td>Maxillofacial surgeon</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Carl D. Kaya</td>
						<td>9.5</td>
						<td>Express Merchant Service</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>Lillian J. Earl</td>
						<td>7.6</td>
						<td>Social and human service assistant</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
					<tr>
						<td>
							<input type="checkbox" class="cbr">
						</td>
						<td>April L. Baker <span class="label label-success">New Applicant</span></td>
						<td>6.8</td>
						<td>Set and exhibit designer</td>
						<td>
							<a href="#" class="btn btn-secondary btn-sm btn-icon icon-left">
								Edit
							</a>
							
							<a href="#" class="btn btn-danger btn-sm btn-icon icon-left">
								Delete
							</a>
							
							<a href="#" class="btn btn-info btn-sm btn-icon icon-left">
								Profile
							</a>
						</td>
					</tr>
					
				</tbody>
			</table>
			
		</div>	
		</div>
	</div>
	<%@ include file="/WEB-INF/view/taglib/footer.jsp" %>
	
</body>
</html>
