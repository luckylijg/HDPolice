<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@page import="com.goldsoft.util.JFreeChart2"%>
<%@ page contentType="text/html;charset=utf-8"%>
<%@ page import="java.awt.Color,
java.awt.Paint,java.awt.Font,java.awt.GradientPaint,java.awt.RenderingHints,
                org.jfree.chart.ChartFactory,
                org.jfree.chart.JFreeChart,
                org.jfree.chart.plot.PlotOrientation,
                org.jfree.chart.servlet.ServletUtilities,
                org.jfree.data.category.CategoryDataset,
                org.jfree.data.general.*,
                org.jfree.chart.plot.CategoryPlot,
                org.jfree.chart.axis.CategoryAxis,
                org.jfree.chart.axis.ValueAxis,
                org.jfree.chart.renderer.category.BarRenderer3D,
                org.jfree.chart.urls.StandardCategoryURLGenerator,
                org.jfree.chart.*,
                org.jfree.chart.entity.*,
                org.jfree.chart.labels.*,
                org.jfree.chart.axis.CategoryLabelPositions,
                org.jfree.ui.TextAnchor,
                org.jfree.chart.axis.NumberAxis,
                org.jfree.chart.axis.NumberTickUnit,
				java.io.File,
				org.jfree.chart.renderer.category.*,
				java.io.FileNotFoundException,
				java.io.FileOutputStream,
				java.io.IOException,
				java.text.DecimalFormat,
				org.jfree.chart.ChartUtilities,
				org.jfree.chart.axis.NumberAxis,
				org.jfree.chart.plot.CategoryPlot,
				org.jfree.chart.plot.PlotOrientation,
				org.jfree.chart.title.TextTitle,
				java.text.SimpleDateFormat,
				org.jfree.data.general.DatasetUtilities
                "%>

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
  <body>
  <p class="R-Tit" align="center"></p><br>
  	 <div style="{position:absolute;top:5%;right:15%;}">
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
  				</select>&nbsp;年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				<span id="1" style="{display:none}" >
  				<select name="bannian">
  					
  					<option value="0">上</option>
  					<option value="1">下</option>
  				</select>&nbsp;半年&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
  				</span>
  				<span id="2" style="{display:none}" >
  				&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
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
  			<td width="30%">

  			<!-- <input type="radio" name="yesno" value="1" style="cursor:pointer"/>查实
  			<input type="radio" name="yesno" value="2" style="cursor:pointer"/>查否
  			<input type="radio" name="yesno" value="0" style="cursor:pointer"/>未定
  		    <input type="radio" name="yesno" value="3" style="cursor:pointer" checked/>不限&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; -->
  		    <input type="submit" value="统计" class="btn"/>

  		</td>
  			
  			
  		</tr>
  		
  		

	</table></form><br/>      
<%

//创建主题样式  
StandardChartTheme standardChartTheme=new StandardChartTheme("CN");  
//设置标题字体  
standardChartTheme.setExtraLargeFont(new Font("隶书",Font.BOLD,20));  
//设置图例的字体  
standardChartTheme.setRegularFont(new Font("黑体",Font.BOLD,15));  
//设置轴向的字体  
standardChartTheme.setLargeFont(new Font("隶书",Font.BOLD,20));  
//应用主题样式  
ChartFactory.setChartTheme(standardChartTheme); 

double[][] data =(double[][])request.getAttribute("data");
String titles =(String)request.getAttribute("titles");
String[] rowKeys = {"总数","查实"};
String[] columnKeys ={"举报投诉","现场督察","网上督察","网络舆情"}; 
		CategoryDataset dataset = DatasetUtilities.createCategoryDataset(rowKeys,columnKeys,data);

JFreeChart jfreechart = ChartFactory.createBarChart3D(titles, // 标题
				"", // categoryAxisLabel （category轴，横轴，X轴的标签）
				"次数", // valueAxisLabel（value轴，纵轴，Y轴的标签）
				dataset, // dataset
				PlotOrientation.VERTICAL, true, // legend
				false, // tooltips
				false); // URLs
		Font labelFont = new Font("黑体",Font.BOLD,15);

		CategoryPlot plot = jfreechart.getCategoryPlot();// 获得图表区域对象
		//设置网格背景颜色 
		//plot.setBackgroundPaint(Color.lightGray); 
		//设置网格竖线颜色 
		plot.setDomainGridlinePaint(Color.white); 
		//设置网格横线颜色 
		plot.setRangeGridlinePaint(Color.white); 
		// 设置横虚线可见
		plot.setRangeGridlinesVisible(true);
		// 虚线色彩
		//plot.setRangeGridlinePaint(Color.gray);
		// 数据轴精度
		NumberAxis vn = (NumberAxis) plot.getRangeAxis();
		// vn.setAutoRangeIncludesZero(true);
		DecimalFormat df = new DecimalFormat("#0.0");
		vn.setNumberFormatOverride(df); // 数据轴数据标签的显示格式

		// x轴设置
		CategoryAxis domainAxis = plot.getDomainAxis();
		domainAxis.setLabelFont(labelFont);// 轴标题
		domainAxis.setTickLabelFont(labelFont);// 轴数值
		// Lable（Math.PI/3.0）度倾斜
		// domainAxis.setCategoryLabelPositions(CategoryLabelPositions
		// .createUpRotationLabelPositions(Math.PI / 3.0));
		domainAxis.setMaximumCategoryLabelWidthRatio(6.00f);// 横轴上的 Lable
		// 是否完整显示

		// 设置距离图片左端距离
		domainAxis.setLowerMargin(0.1);
		// 设置距离图片右端距离
		domainAxis.setUpperMargin(0.1);
		// 设置 columnKey 是否间隔显示
		// domainAxis.setSkipCategoryLabelsToFit(true);
		plot.setDomainAxis(domainAxis);
		// 设置柱图背景色（注意，系统取色的时候要使用16位的模式来查看颜色编码，这样比较准确）
		//plot.setBackgroundPaint(new Color(255, 255, 204));
		plot.setBackgroundPaint(Color.lightGray);
		
		// y轴设置
		ValueAxis rangeAxis = plot.getRangeAxis();
		rangeAxis.setLabelFont(labelFont);
		rangeAxis.setTickLabelFont(labelFont);
		// 设置最高的一个 Item 与图片顶端的距离
		rangeAxis.setUpperMargin(0.1);
		// 设置最低的一个 Item 与图片底端的距离
		rangeAxis.setLowerMargin(0.15);
		plot.setRangeAxis(rangeAxis);

       BarRenderer3D renderer = new BarRenderer3D();
        renderer.setWallPaint(Color.PINK); 
		// 设置柱子宽度
		renderer.setMaximumBarWidth(0.5);
		// 设置柱子高度
		renderer.setMinimumBarLength(0.2);
		renderer.setItemLabelFont(new java.awt.Font("宋体",java.awt.Font.PLAIN,15));   
		
		// 设置柱子边框颜色
		//renderer.setBaseOutlinePaint(Color.BLACK);
		// 设置柱子边框可见
		//renderer.setDrawBarOutline(true);
		//默认的数字显示在柱子中，通过如下两句可调整数字的显示 
		//注意：此句很关键，若无此句，那数字的显示会被覆盖，给人数字没有显示出来的问题 
		renderer.setBasePositiveItemLabelPosition(new  ItemLabelPosition(ItemLabelAnchor.OUTSIDE12,
			TextAnchor.BOTTOM_LEFT)); 
		renderer.setItemLabelAnchorOffset(10D);		
		// 设置每个地区所包含的平行柱的之间距离
		renderer.setItemMargin(0);
		//jfreechart.getRenderingHints().put(RenderingHints.KEY_TEXT_ANTIALIASING, RenderingHints.VALUE_TEXT_ANTIALIAS_OFF);
		// 显示每个柱的数值，并修改该数值的字体属性
		renderer.setIncludeBaseInRange(true);
		renderer.setBaseItemLabelGenerator(new StandardCategoryItemLabelGenerator());
		renderer.setBaseItemLabelsVisible(true);

		renderer.setSeriesPaint(0,new Color(255,0,0));
		renderer.setSeriesPaint(1,Color.yellow);
		plot.setRenderer(renderer);
		//CategoryAxis domainAxis = plot.getDomainAxis();
        domainAxis.setLowerMargin(0.04);//设置距离图片左端距离此时为10%
        domainAxis.setUpperMargin(0.02);//设置距离图片右端距离此时为百分之10
        domainAxis.setCategoryLabelPositionOffset(10);//图表横轴与标签的距离(10像素)
        domainAxis.setCategoryMargin(0.3);//横轴标签之间的距离20%
        //domainAxis.setCategoryLabelPositions(CategoryLabelPositions.UP_45); 
		// 设置柱的透明度
		plot.setForegroundAlpha(1.0f);

		// 背景色 透明度
		//plot.setBackgroundAlpha(0.5f);

         //生成图形的名称
         //可以改变ServletUtilities源代码，设置图形统一前缀名称和默认存放路径
         //注意：图形的大小往往都是通过配置文件设置的，不可能所有图形一个大小
        String filename = ServletUtilities.saveChartAsPNG(jfreechart,700,500, null, session); 
		String graphURL = request.getContextPath() + "/displaychart?filename=" + filename; 
%>



            <img src="<%= graphURL %>" width="700" height=500 border=0 usemap="#<%=filename %>">
<br><br>
</body>
</html>

