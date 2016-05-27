function check(radio){
	var spanid=radio.value;
	//alert(radio.checked);
	if(radio.checked){
		for(var i=1;i<4;i++){
			$("#"+i).hide();
		}
		$("#"+spanid).show();
	}
	
}