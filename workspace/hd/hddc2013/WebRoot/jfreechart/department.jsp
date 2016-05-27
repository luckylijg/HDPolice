<%@include file="/commons/taglibs.jsp"%>
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
org.jfree.data.category.CategoryDataset,
org.jfree.chart.renderer.category.CategoryItemRenderer,
org.jfree.chart.renderer.category.*,

java.awt.*, 
org.jfree.ui.*,
 java.text.SimpleDateFormat,
org.jfree.chart.axis.AxisLocation"
%> 

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
    <script type="text/javascript" src="js/depart.js"></script>
    <script language="javascript" type="text/javascript" src="My97DatePicker/WdatePicker.js"></script>
  </head>
 <%SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");//可以方便地修改日期格式
	String time = sdf.format( new Date() );
	 String str1=time.substring(0,4);	 
	 int a=Integer.parseInt(str1);
	 %>
  
  <body>

  <!-- <p class="R-Tit" align="center">各单位预警信息柱状统计图</p> -->
  <p class="R-Tit" align="center"></p>
<div style="{position:absolute;top:3%;right:16%;}">
  <span id="search" style="cursor:pointer"><img src="${ctx }/images/serch1.jpg"></span></div>
  <div class="R-CON" align="center" >
  
  <form id="form119" action="jfreechart/department!searchList.action" method="post" style="display:none;">
  <table  width="100%">
  		<tr><td colspan="3">
 		<input type="radio" name="condition" value="0" checked onclick="check(this)"/>年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="1" onclick="check(this)"/>半年&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="2" onclick="check(this)"/>季度&nbsp;&nbsp;&nbsp;&nbsp;
 		<input type="radio" name="condition" value="3" onclick="check(this)"/>月</td></tr>		
  		<tr>
  			<td>
  				<select id="0" name="year1">
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
  				<span id="2" style="{display:none}" >&nbsp;&nbsp;&nbsp;
  				第<select name="jidu">
  					
  					<option value="0">一</option>
  					<option value="1">二</option>
  					<option value="2">三</option>
  					<option value="3">四</option>
  				</select>&nbsp;
  				</span>
  				<span id="3" style="{display:none}" >
  				<select name="month">
  					
  					<% for(int i=1;i<13;i++){%>
 						<option value="<%=i %>"><%=i %></option>
									 <% } %>
  				</select>&nbsp;月
  				</span>
  			</td>
  			<td>单位类型
  			<select name="deptype">
  			<option value="1">大队</option>
  			<option value="2">科室</option>
  			<option value="3">全部</option>
  			</select>
  			</td>

  		<td width="30%"><input type="submit" value="统计" class="btn" onclick="changeState(1)"/>

	  			</td>
  
  </table></form><br/>


<% //double[][] data =(double[][])request.getAttribute("data");
//System.out.println(data.length);
//double[][] data = new double[][] {{15},{26},{34},{7},{4},{14},{26},{41},{9},{4},{31},{6},{4},{6},{8},{1},{6},{4},{1},{4},{1},{6},{4},{1},{4},{1},{6},{4},{1},{4},{1},{6},{4},{41},{4},{31},{6},{4},{21},{4},{31},{6},{4},{31},{4}}; 
double[][] data =(double[][])request.getAttribute("data");
String[] columnKeys =(String[])request.getAttribute("str");
String titles =(String)request.getAttribute("titles");

//创建主题样式  
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
//设置标题字体  
standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));  
//设置图例的字体  
standardChartTheme.setRegularFont(new Font("黑体",Font.BOLD,15));  
//设置轴向的字体  
standardChartTheme.setLargeFont(new Font("黑体",Font.BOLD,15));  
//应用主题样式  
ChartFactory.setChartTheme(standardChartTheme); 
String[] rowKeys = {"总数", "查实"};
CategoryDataset dataset = DatasetUtilities.createCategoryDataset(
        rowKeys,
        columnKeys,
        data);

JFreeChart chart = ChartFactory.createBarChart(titles, "", "问题次数",dataset, PlotOrientation.HORIZONTAL, true, false, false);
CategoryPlot plot = (CategoryPlot) chart.getCategoryPlot(); 

//CategoryPlot plot = chart.getCategoryPlot(); 
//设置网格背景颜色 
plot.setBackgroundPaint(Color.lightGray); 
//设置网格竖线颜色 
plot.setDomainGridlinePaint(Color.white); 
//设置网格横线颜色 
plot.setRangeGridlinePaint(Color.white); 
//显示每个柱的数值，并修改该数值的字体属性 
//BarRenderer renderer = (BarRenderer) plot.getRenderer();  
//BarRenderer3D renderer = new BarRenderer3D(); 
BarRenderer renderer = new BarRenderer();
//renderer.setWallPaint(Color.PINK); 
renderer.setBarPainter( new StandardBarPainter() );
//renderer.setBackgroundImageAlignment(0);
renderer.setBaseItemLabelGenerator(new  StandardCategoryItemLabelGenerator()); 
renderer.setBaseItemLabelsVisible(true); 
renderer.setItemLabelFont(new java.awt.Font("宋体",java.awt.Font.PLAIN,15));   

  renderer.setDrawBarOutline(false); // 设置边框是否可见
 // renderer.setBaseOutlinePaint(Color.blue); // 设置边框的颜色
  renderer.setMaximumBarWidth(0.1);
        //设置数值显示字体及大小       
         renderer.setItemLabelFont(new java.awt.Font("宋体",java.awt.Font.CENTER_BASELINE,14));        

//默认的数字显示在柱子中，通过如下两句可调整数字的显示 
//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题 
renderer.setBasePositiveItemLabelPosition(new  ItemLabelPosition(ItemLabelAnchor.OUTSIDE4,
		TextAnchor.BOTTOM_CENTER)); 
renderer.setItemLabelAnchorOffset(20D);
renderer.setMaximumBarWidth(0.1);
//renderer.
renderer.setSeriesPaint(0,new Color(255,0,0));
renderer.setSeriesPaint(1,Color.yellow);
//设置每个地区所包含的平行柱的之间距离 
renderer.setItemMargin(0);

 
plot.setRenderer(renderer); 
//plot.setForegroundAlpha(1.0f); 
//设置地区、销量的显示位置 
//将下方的“肉类”放到上方 
plot.setDomainAxisLocation(AxisLocation.BOTTOM_OR_LEFT); 
//将默认放在左边的“销量”放到右方 
plot.setRangeAxisLocation(AxisLocation.BOTTOM_OR_LEFT); 
 org.jfree.chart.axis.CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setLowerMargin(0.01);//设置距离图片左端距离此时为10%
        domainAxis.setUpperMargin(0.01);//设置距离图片右端距离此时为百分之10
        domainAxis.setCategoryLabelPositionOffset(10);//图表横轴与标签的距离(10像素)
        domainAxis.setCategoryMargin(0.2);//横轴标签之间的距离20%
        domainAxis.setMaximumCategoryLabelLines(1);
        domainAxis.setMaximumCategoryLabelWidthRatio(1);
String filename = ServletUtilities.saveChartAsPNG(chart,900,1800, null, session); 
String graphURL = request.getContextPath() + "/displaychart?filename=" + filename; 
%>
<div id="imgDiv" >
<img src="<%= graphURL %>" width=900 height=1800 border=0
	usemap="#<%= filename %>"></div>  
	  </div>
  </body>
</html>