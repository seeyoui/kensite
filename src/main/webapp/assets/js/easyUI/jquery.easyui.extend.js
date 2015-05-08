function getTreeNodeLevel(tree, node) {
	var level = 0;
	while(node != null) {
		node = tree.tree('getParent', node.target);
		level++;
	}
	return level;
}
function pagerFilter(data){
	if(data == null) {
		return;
	}
    var dg = $(this);
    var opts = dg.datagrid('options');
    var pager = dg.datagrid('getPager');
    pager.pagination({
        onSelectPage:function(pageNum, pageSize){
            opts.pageNumber = pageNum;
            opts.pageSize = pageSize;
            pager.pagination('refresh',{
                pageNumber:pageNum,
                pageSize:pageSize
            });
            dg.datagrid('loadData',data);
        }
    });
    if (!data.originalRows){
        data.originalRows = (data.rows);
    }
    var start = (opts.pageNumber-1)*parseInt(opts.pageSize);
    var end = start + parseInt(opts.pageSize);
    data.rows = (data.originalRows.slice(start, end));
    return data;
}
function formatDateTimeCol(val,row){
	if(val==null){
		return "";
	}
	var year = val.year+1900;
	var month = val.month+1;
	var date = val.date;
	var hours = val.hours;
	var minutes = val.minutes;
	var seconds = val.seconds;
	month = appendChar("l", month, 2, "0");
	date = appendChar("l", date, 2, "0");
	hours = appendChar("l", hours, 2, "0");
	minutes = appendChar("l", minutes, 2, "0");
	seconds = appendChar("l", seconds, 2, "0");
	return year+"-"+month+"-"+date+" "+hours+":"+minutes+":"+seconds;
}
function formatDateCol(val,row){
	if(val==null){
		return "";
	}
	var year = val.year+1900;
	var month = val.month+1;
	var date = val.date;
	return year+"-"+month+"-"+date;
}
function formatTimeCol(val,row){
	if(val==null){
		return "";
	}
	var hours = val.hours;
	var minutes = val.minutes;
	var seconds = val.seconds;
	return hours+":"+minutes+":"+seconds;
}

function appendChar(f, s, l, c) {
	s = ""+s;
	if(f = "l") {
		for(var i=s.length; i<l; i++) {
			s = c+s;
		}
	}
	if(f = "r") {
		for(var i=s.length; i<l; i++) {
			s = s+c;
		}
	}
	return s;
	
}