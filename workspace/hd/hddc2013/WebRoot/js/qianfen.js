

$(document).ready(function(){
	
	var divs=$("td>div");
	//alert(divs.length);
	//alert(divs.size());//也行
	for(var i=0;i<divs.length;i++){
		var div=divs[i];
		var jquerydiv=$(div);
		//alert(jquerydiv.attr("id"));
		//alert(div);
		jquerydivid=jquerydiv.attr("id");
		var divid=jquerydivid.substring(0,jquerydivid.indexOf("_d"))+"_hidden";
		var hidden=$("#"+divid);
		//alert(hidden.attr("value"));
		var value=hidden.attr("value");
		if(value.length<=20){
			jquerydiv.html(value);
		}else{
		jquerydiv.html(value.substring(0,20)+"...");
		}
		//div.write("afdsaf")
		//div.html("aaa");
		//alert(div.attr("id"));
	}
	
	divs.mouseover(function(event){
		var div=$(this);
		var divid=div.attr("id");
		//alert(divid);
		//alert(divid.indexOf("_d"));
		var hiddenid=divid.substring(0,divid.indexOf("_d"))+"_hidden";
		//alert(hidden);
		var hidden=$("#"+hiddenid);
		//alert(hidden.attr("value"));
		var msgText=hidden.attr("value");
		var msg=$("#msg");
		
		
		var myEvent=event||window.event;
		var x=myEvent.screenX-300;
		var y=myEvent.screenY-300;
		msg.css("position","absolute");
		msg.css("top",y);
		msg.css("left",x);
		msg.css("background-color","gray");
		
		msg.html(msgText);
	});
	$("td>div").mouseout(function(){
		var msg=$("#msg");
		
		msg.css("background-color","transparent");
		
		msg.html("");
	});
	
});

