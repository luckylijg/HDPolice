<%@page import="org.jfree.chart.axis.CategoryLabelPositions"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="org.jfree.chart.renderer.AbstractRenderer"%>
<%@page import="java.awt.Color"%>
<%@ page contentType="text/html;charset=utf-8"%>

<%@ page	import="java.awt.Font,
org.jfree.chart.StandardChartTheme,
org.jfree.chart.ChartFactory,              
org.jfree.chart.JFreeChart,              
org.jfree.chart.plot.PlotOrientation,          
org.jfree.chart.servlet.ServletUtilities,      
org.jfree.data.category.CategoryDataset,
org.jfree.data.category.DefaultCategoryDataset, 
org.jfree.data.general.DatasetUtilities, 
org.jfree.chart.plot.*, 
org.jfree.chart.labels.*, 
org.jfree.chart.renderer.category.CategoryItemRenderer,
org.jfree.chart.renderer.category.*,
java.awt.*, 
org.jfree.ui.*,
 java.text.SimpleDateFormat,
org.jfree.chart.axis.AxisLocation"
%> 
<%@include file="/commons/taglibs.jsp"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>My JSP 'MyJsp.jsp' starting page</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="css/Admin.css" />
	<script type="text/javascript" src="js/jquery1.js"></script>
    <script type="text/javascript" src="js/search.js"></script>
    <script type="text/javascript" src="js/time.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
 <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
  <body><br>
  <p class="R-Tit" align="center">预警统计图</p><br>
  	 <div style="{position:absolute;top:6%;right:16%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div>
  <div class="R-CON" align="center">
  	<form id="form119" action="jfreechart/complaint1!searchListByEarlyWarning.action" method="post" style="display:none;">
   <table  width="100%">
 		<tr><td colspan="2">
 		<input type="radio" name="condition" value="0" checked onclick="check(this)"/>年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="1" onclick="check(this)"/>半年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="2" onclick="check(this)"/>季度&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="3" onclick="check(this)"/>月</td></tr>		
  		<tr>
  			<td>
  				<select id="0" name="year">
  					<option value="<%=a %>"><%=a %></option>
  					<% for(int i=1;i<a-2008;i++){%>
 						<option value="<%=a-i %>"><%=a-i %></option>
									 <% } %>
  				</select>&nbsp;年
  				<span id="1" style="{display:none}" >
  				<select name="bannian">
  					
  					<option value="0">上</option>
  					<option value="1">下</option>
  				</select>&nbsp;半年
  				</span>
  				<span id="2" style="{display:none}" >
  				<select name="jidu">
  					
  					<option value="0">第一季度</option>
  					<option value="1">第二季度</option>
  					<option value="2">第三季度</option>
  					<option value="3">第四季度</option>
  				</select>&nbsp;季度
  				</span>
  				<span id="3" style="{display:none}" >
  				<select name="month">
  					
  					<% for(int i=1;i<13;i++){%>
 						<option value="<%=i %>"><%=i %></option>
									 <% } %>
  				</select>&nbsp;月
  				</span>
  			</td>
  			<td width="30%">
  			<input type="radio" name="yesno" value="1" style="cursor:pointer"/>查实
  			<input type="radio" name="yesno" value="2" style="cursor:pointer"/>查否
  			<input type="radio" name="yesno" value="0" style="cursor:pointer"/>未定
  		    <input type="radio" name="yesno" value="3" style="cursor:pointer" checked/>不限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  		    <input type="submit" value="搜索" class="btn"/>
  		</td>
  			
  			
  		</tr>
  		
  		

	</table></form><br/>
  			


<% 
//double[][] data =(double[][])request.getAttribute("data");
//System.out.println(data.length);
double[][] data = new double[][] {{5},{6},{4},{1},{5}}; 

//创建主题样式  
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
//设置标题字体  
standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));  
//设置图例的字体  
standardChartTheme.setRegularFont(new Font("宋书",Font.PLAIN,15));  
//设置轴向的字体  
standardChartTheme.setLargeFont(new Font("宋书",Font.PLAIN,15));  
//应用主题样式  
ChartFactory.setChartTheme(standardChartTheme); 
	
String[] rowKeys =  {""};
String[] columnKeys ={"现场督察", "网上督察", "网络舆情调查", "受理举报投诉","现场督察"}; 

CategoryDataset dataset = DatasetUtilities.createCategoryDataset(columnKeys,rowKeys,data);  
//DefaultCategoryDataset dataset = new DefaultCategoryDataset();
JFreeChart chart = ChartFactory.createBarChart3D("","","次数",dataset,PlotOrientation.VERTICAL,true,false,false); 


CategoryPlot plot = (CategoryPlot) chart.getCategoryPlot(); 

//CategoryPlot plot = chart.getCategoryPlot(); 
//设置网格背景颜色 
plot.setBackgroundPaint(Color.lightGray); 
//设置网格竖线颜色 
plot.setDomainGridlinePaint(Color.white); 
//设置网格横线颜色 
plot.setRangeGridlinePaint(Color.white); 
//显示每个柱的数值，并修改该数值的字体属性 
 
BarRenderer3D renderer = new BarRenderer3D(); 
renderer.setWallPaint(Color.PINK); 
renderer.setBaseItemLabelGenerator(new  StandardCategoryItemLabelGenerator()); 
renderer.setBaseItemLabelsVisible(true); 

//默认的数字显示在柱子中，通过如下两句可调整数字的显示 
//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题 
renderer.setBasePositiveItemLabelPosition(new  ItemLabelPosition(ItemLabelAnchor.OUTSIDE12,
		TextAnchor.BOTTOM_LEFT)); 
renderer.setItemLabelAnchorOffset(10D);

/* for(int i=0;i<data.length;i++){		
		if(data[i][0]<=3){
		  renderer.setSeriesPaint(i,Color.green);
		}else if(data[i][0]<5&&data[i][0]>3){
		 renderer.setSeriesPaint(i, Color.yellow);}
		 else if(data[i][0]<8&&data[i][0]>=5){
		  renderer.setSeriesPaint(i, Color.orange);
		}else if(data[i][0]>=8){
		  renderer.setSeriesPaint(i, Color.red);
		}	
} */
//设置每个地区所包含的平行柱的之间距离 
renderer.setItemMargin(0.4); 
plot.setRenderer(renderer); 
//设置地区、销量的显示位置 
//将下方的“肉类”放到上方 
plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_LEFT); 
//将默认放在左边的“销量”放到右方 
plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_LEFT); 
 
String filename = ServletUtilities.saveChartAsPNG(chart,1000,500, null, session); 
String graphURL = request.getContextPath() + "/displaychart?filename=" + filename; 
%>

<img src="<%= graphURL %>" width=1000 height=500 border=0
	usemap="#<%= filename %>">
	</div>
	  </body>
</html>