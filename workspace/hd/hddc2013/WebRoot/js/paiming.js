

function changewarning(warning,departmentid,type){
	//alert(warning+departname);
	var url;
	if(type==1){
		url="manage/department/department!changewarning.action?departmentid="+departmentid+"&&description="+warning;
	}else if(type==2){
		url="manage/department/department!changewarning.action?departmentid="+departmentid+"&&description="+warning;
	}
	$.get(url);
	
}