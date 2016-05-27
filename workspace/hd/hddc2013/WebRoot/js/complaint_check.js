function checkform(){
	var depart=document.getElementById("police_depart");
	var person=document.getElementById("policemen");
	if(depart.value==-1){
		alert("请选择督察单位");
		return false;
	}else if(person.value==-1){
		alert("请选择督察民警");
		return false;
	}
	
}

function checkfield(){
	var depart=document.getElementById("depart");
	var person=document.getElementById("policemen");
	//alert(person.value.length);
	if(depart.value==-1){
		alert("请选择督察单位");
		return false;
	}
}