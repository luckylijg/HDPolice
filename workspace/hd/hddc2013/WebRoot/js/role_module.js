//当前被选中的角色
var roleid=1;
$(document).ready(function(){
	
	//role的click
	var url = 'manage/system/role!modules.action';
	//alert("bbb");
	var roletdNodes=$(".roletd");
	//alert("ccc");
	$("#1").css("color","blue");
	 var params1 = {
             roleid:1
     };
	$.getJSON(url,params1,callback);
	
	roletdNodes.click(function(){
		//alert("aaa");
		var roletdNode=$(this);
		
		roleid=roletdNode.attr("id");
		
		$(".roletd").css("color","red");
		roletdNode.css("color","blue");
		
		
        var params = {
                roleid:roleid
        };
       
	 $.getJSON(url,params,callback);  

	});
	
	
	
	//module的click
	$(".moduletd>input").click(function(){
		var moduleNode=$(this);
		var moduleid=moduleNode.attr("id");
		//alert(moduleid+"被点了");
		var params={
				moduleid:moduleid,
				roleid:roleid
		}
		//alert("roleid"+roleid+"      moduleid"+moduleid);
		$.ajax({ 
			type:"POST",
			url: "manage/system/role!addModuleToRole.action", 
			params:params,
			data:"roleid="+roleid+"&moduleid="+moduleid
		});
		
		
	});
	
	
});


function callback(data){
	$(".moduletd>input").attr("checked","");
	var temp = eval("("+data+")");  
    //alert("callback");
    
    for(var s in temp){
    	//alert(temp[s]);
    	$("#"+temp[s]).attr("checked","checked");
    }
    
}
