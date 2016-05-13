$(document).ready(
	$(function () {
		context.init({preventDoubleContext: false});
		context.settings({compress: true});
		context.attach('#KSreport', [
			{text: '剪切', action: function(e){
				ccp('cut');
			}},
			{text: '复制', action: function(e){
				ccp('copy');
			}},
			{text: '粘贴', action: function(e){
				ccp('paste');
			}},
			{divider: true},
			{text: '合并单元格', action: function(e){
				mergeCell();
			}},
			{text: '拆分单元格', action: function(e){
				unMergeCell();
			}},
			{divider: true},
			{text: '行高', action: function(e){
				mergeCell();
			}},
			{text: '列宽', action: function(e){
				unMergeCell();
			}},
			{text: '清除', subMenu: [
				{text: '清除内容', action: function(e){
					unMergeCell();
				}},
				{text: '清除格式', action: function(e){
					unMergeCell();
				}},
				{text: '清除格式及内容', action: function(e){
					unMergeCell();
				}}
			]},
			{divider: true},
			{text: '插入', subMenu: [
				{text: '插入行', action: function(e){
					insertRow();
				}},
				{text: '插入列', action: function(e){
					insertCol();
				}}
			]},
			{text: '删除', subMenu: [
				{text: '删除行', action: function(e){
					deleteRow();
				}},
				{text: '删除列', action: function(e){
					deleteCol();
				}}
			]},
			{divider: true},
			{text: 'demo', href: '#'}
		]);
		
		$('.splitTHead a').hover(function(){
		},function(){
		});
		
		$('#bgcolorSelector').ColorPicker({
    		color: '#000000',
    		onSubmit: function(hsb, hex, rgb, el) {
    			$(el).ColorPickerHide();
    		},
    		onShow: function (colpkr) {
    			$(colpkr).fadeIn(500);
    			return false;
    		},
    		onHide: function (colpkr) {
    			$(colpkr).fadeOut(500);
    			return false;
    		},
    		onChange: function (hsb, hex, rgb) {
    			$('#bgcolorSelector').css('backgroundColor', '#' + hex);
    		}
    	});
    	$('#fontcolorSelector').ColorPicker({
    		color: '#000000',
    		onSubmit: function(hsb, hex, rgb, el) {
    			$(el).ColorPickerHide();
    		},
    		onShow: function (colpkr) {
    			$(colpkr).fadeIn(500);
    			return false;
    		},
    		onHide: function (colpkr) {
    			$(colpkr).fadeOut(500);
    			return false;
    		},
    		onChange: function (hsb, hex, rgb) {
    			$('#fontcolorSelector').css('backgroundColor', '#' + hex);
    		}
    	});
    	$('#borderColorSelector').ColorPicker({
    		color: '#000000',
    		onSubmit: function(hsb, hex, rgb, el) {
    			$(el).ColorPickerHide();
    		},
    		onShow: function (colpkr) {
    			$(colpkr).fadeIn(500);
    			return false;
    		},
    		onHide: function (colpkr) {
    			$(colpkr).fadeOut(500);
    			return false;
    		},
    		onChange: function (hsb, hex, rgb) {
    			$('#borderColorSelector').css('backgroundColor', '#' + hex);
    		}
    	});
	})
);

function getActualCellRange(cellRange, rowCount, columnCount) {
	if (cellRange.row == -1 && cellRange.col == -1) {
		return new $.wijmo.wijspread.Range(0, 0, rowCount, columnCount);
	}
	else if (cellRange.row == -1) {
		return new $.wijmo.wijspread.Range(0, cellRange.col, rowCount, cellRange.colCount);
	}
	else if (cellRange.col == -1) {
		return new $.wijmo.wijspread.Range(cellRange.row, 0, cellRange.rowCount, columnCount);
	}

	return cellRange;
}
//合并单元格
function mergeCell(event) {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();

	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
		sheet.addSpan(sel.row, sel.col, sel.rowCount, sel.colCount);
	}
}
//拆分单元格
function unMergeCell(event) {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();

	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
		sheet.isPaintSuspended(true);
		for (var i = 0; i < sel.rowCount; i++) {
			for (var j = 0; j < sel.colCount; j++) {
				sheet.removeSpan(i + sel.row, j + sel.col);
			}
		}
		sheet.isPaintSuspended(false);
	}
}
//插入行
function insertRow() {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();
	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
	}
	if(sel.rowCount==0)sel.rowCount=1;
	sheet.addRows(sheet.getActiveRowIndex(), sel.rowCount);
}
//插入列
function insertCol() {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();
	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
	}
	if(sel.rowCount==0)sel.rowCount=1;
	sheet.addColumns(sheet.getActiveColumnIndex(), sel.colCount);
}
//删除行
function deleteRow() {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();
	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
	}
	if(sel.rowCount==0)sel.rowCount=1;
	sheet.deleteRows(sheet.getActiveRowIndex(), sel.rowCount);
}
//删除列
function deleteCol() {
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();
	var sel = sheet.getSelections();
	if (sel.length > 0) {
		sel = getActualCellRange(sel[sel.length - 1], sheet.getRowCount(), sheet.getColumnCount());
	}
	if(sel.rowCount==0)sel.rowCount=1;
	sheet.deleteColumns(sheet.getActiveColumnIndex(), sel.colCount);
}

//剪切复制粘贴
function ccp(action){
	var KSreport = $("#KSreport").wijspread("spread");
	var sheet = KSreport.getActiveSheet();
	sheet.isPaintSuspended(true);
	if(action === "cut")
		$.wijmo.wijspread.SpreadActions.cut.call(sheet);
	else if(action === "copy")
		$.wijmo.wijspread.SpreadActions.copy.call(sheet);
	else if(action === "paste")
		$.wijmo.wijspread.SpreadActions.paste.call(sheet);
	sheet.isPaintSuspended(false);
}