function check(inputNode,userid){
	//alert(userid);
	//alert(inputNode.value);
	
	var url="manage/data/user!checkUser.action";
	
	var params={
			username:inputNode.value,
			userid:userid
	};
	
	$.getJSON(url,params, function(data){
		  //alert("Data Loaded: " + data);
		  var list = eval("("+data+")");
		  for(var index in list){
			  if(list[index]==true){
				  //alert(list["checkusername"]);
				  $("#nameSpan").html("<font color=red>用户名已存在</font>");
			  }
		  }
	});
	
}