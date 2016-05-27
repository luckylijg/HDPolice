var type;
var s="";
var buttonNode;

var textAreaText;

    function pop(thisNode,kind,index){
    	//alert($(".R-CON").css("display"))
    	//$(".R-CON").css("display","none");
    	
        document.getElementById("md").style.display="block";  
        
        //督察民警   单位 
        if(index==-1){
        	index=$("#depart").val();
        }
        
        buttonNode=$(thisNode);
        textAreaText=buttonNode.prev().text();
        //alert(buttonNode.attr("value"));
        type=kind;
        
        var url='manage/data/'+kind+'!ajaxList.action';
        var params = {
                type:index
        }
        //alert("aaa");
        $.getJSON(url,params,function(data){
        	//alert(data.list[0].name);
        	//alert("json");
        	var list = eval("("+data+")");
        	var i=0;

    		var dataDivNode=$("#dataDiv");
    		dataDivNode.empty();
    		dataDivNode.append("<table calss='tablediv' width=80% style='position:relative;left:10%'></table>");
    		var tableNode=dataDivNode.children();
    		//alert(list["num3"].name);
			tableNode.append("<tr><td>&nbsp;</td></tr><tr></tr>");
			var trNode=tableNode.children().children().next();

    		
        	for(var t in list){
        		if(i%5==0&&i!=0){
        			tableNode.append("<tr><td>&nbsp;</td></tr><tr></tr>");
        			var node=trNode.next().next();
        			trNode=node;
        		}
        		if(textAreaText.indexOf(list[t])>-1){


            		trNode.append("<td ><input type='checkbox' name='checkbox' checked='true' id="+t+">"+list[t]+"</td>");

        		}else{

        			trNode.append("<td ><input type='checkbox' name='checkbox'  id="+t+">"+list[t]+"</td>");

        		}
        		//alert("hhhh");
        		//trNode.append("<td>aaaa</td>");
        		
        		i++;
        	}
        	tableNode.children().children().children().children().click(function(){
        		//$("#"+kind).text("a");
        		var departNode=$(this);
        		//alert(s);
        		var insert=departNode.parent().text();
        		//alert(departNode.attr("checked"));
        		if(departNode.attr("checked")){
        			//alert("insert");
        			s=s+" "+insert;
        		}else{
        			//alert("delete");
        			insert =" "+insert;
        			if(s.indexOf(insert)!=-1){
            			s.replace(insert,"");
        			}
        			if(textAreaText.indexOf(insert)!=-1){
        				//alert(textAreaText+"    "+insert);
        				//textAreaText=textAreaText+"";
        				textAreaText=textAreaText.replace(insert,"");
        				//alert(temp+"    "+insert);
        				buttonNode.prev().text(temp);
        				
        				/*var str="aaabbbccc";
        				var a=str.replace("aaa", "bbb");
        				alert(a);*/
        			}
        		}
        		
        		//var temp=buttonNode.parent().html();
        		//buttonNode.parent().html(departNode.parent().text()+temp);
        		//alert(departNode.parent().text()+temp);
        		//buttonNode.insertBefore();
        	});
        });
        //alert(kind+"    "+type);
        
        
        
        
        
        //实现透明遮盖，如果不需要透明，不需要设置此属性  
        document.getElementById("md").style.filter="alpha(opacity=80)";  
          
        //clientWidth取的是实际窗口文档域的大小  
        var _x = document.body.clientWidth;  
        var _y = document.body.clientHeight;  
        var a_w = 450;  
        var a_h = 300;  
        //alert(_x+" == " + _y);  
        //计算弹出层的位置，目的是要显示在正中间  
        var dleft = _x/2 - a_w/2;  
        var dtop = _y/2 - a_h/2;  
        //alert(dleft+" == "+dtop);  
        var cd = document.getElementById("pd").style;  
        //cd.setAttribute("left",dleft+"px");  
        //cd.setAttribute("top",dtop+"px");  
        cd.left=dleft+"px";
        if(kind=="handleSort"){
        	//alert("handlesort");
        	dtop=dtop+400;
        	cd.top = dtop+"px";  
        }else{
        	cd.top = dtop+"px";  
        }
        cd.display="block"; 
    }        
    
      
   function close_div(){  
       document.getElementById("md").style.display="none";  
        document.getElementById("pd").style.display="none";
    	//$(".R-CON").css("display","block");
        //alert("textareatext="+textAreaText+"   s="+s)
        buttonNode.prev().text(s+textAreaText);
    	s="";
    	
    	//buttonNode.parent().html(s+temp);
    	  
    }  
   function insertOption(){
	   //alert($("#police_depart").attr("id"));
	   ajaxChangeOption($("#police_depart").val());
   }
   
   $(document).ready(function(){
	   if($("#police_depart").val()!=-1){
		   ajaxChangeOption($("#police_depart").val());
	   }
   });
   
   function ajaxChangeOption(id){

	  // alert("a");

	   //alert("a");

	   var url="manage/system/user!ajaxList.action";
	   var params={
			type:id
	   }
	   $.getJSON(url,params,function(data){
		   var list = eval("("+data+")");
		  // alert("b")

		   
		   var policemenNode=$("#policemen");
		   var temp="";
		   policemenNode.html("");
		   temp=temp+"<option value='-1' >--请选择--</option> ";
			  
		   for(var userid in list){
			   //alert(list[userid]);
			   var checkedPoliceNode=$("#police_men");

			   //alert(checkedPoliceNode.val());

			  // alert(checkedPoliceNode.val());

			   if(checkedPoliceNode.val()!=userid){
				   temp=temp+"<option value="+userid+">"+list[userid]+"</option>";
			   }else{
				   temp=temp+"<option value="+userid+" selected>"+list[userid]+"</option>";
			   }
			   
		   }
		   policemenNode.append(temp);
	   });
	   
   }
   
   function sub()
   {	//1保存   0提交 
   	document.getElementById("leader").value=1;
   	
   	return true;	
   }
   
   function changeState(complaintid,leaderapproved){
		//1通过2未通过
	   var params={
			   complaintid:complaintid,
			   leaderapproved:leaderapproved
	   }
	   var url="manage/complaint/audit!update1.action";
		$.post(url,params);
   }
   

  