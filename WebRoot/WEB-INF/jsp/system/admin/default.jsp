<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<base href="<%=basePath%>">

<!-- jsp文件头和头部 -->
<%@ include file="top.jsp"%>
	<link rel="stylesheet" href="static/css/index/communityService.css" type="text/css"/>
	<!--引入属于此页面的js -->
	<script type="text/javascript" src="static/js/myjs/head.js"></script>
	<style type="text/css">
		.event{
			cursor: pointer;
		}
		.event:HOVER {
			background-color: #D7D7D7;
		}
		table tr td{
			width:60px;
			overflow:hidden;
			white-space:nowrap;
			text-overflow:ellipsis;
			-o-text-overflow:ellipsis;
		}
		.welcome{
			width:100%;
		}
		.welcome>img{
			width:34%;
			margin-left:33%;
			margin-top:5%;
		}
	</style>
</head>
<body>
	<div class="container-fluid" id="main-container">
		 <div id="page-content" class="clearfix">
				<div class="page-header position-relative">
					<h1>
						后台首页 <small><i class="icon-double-angle-right"></i> </small>
					</h1>
				</div>
		</div>
		<div class="welcome">
			<img alt="" src="static/images/xcyl/welcome2.png">
		</div>		
	</div>
	<!-- back to top -->
	<!-- <a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse"> <i
		class="icon-double-angle-up icon-only"></i>
	</a> -->
	
	<!-- basic scripts -->
	<script src="static/1.9.1/jquery.min.js"></script>
	<script type="text/javascript">
		window.jQuery
				|| document
						.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");
	</script>

	<script src="static/js/bootstrap.min.js"></script>
	<script type="text/javascript" src="static/js/jquery-ui-1.10.2.custom.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.ui.touch-punch.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.slimscroll.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.easy-pie-chart.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.sparkline.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.pie.min.js"></script>
	<script type="text/javascript" src="static/js/jquery.flot.resize.min.js"></script>
	<!-- ace scripts -->
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>


	<script type="text/javascript">

		$(top.hangge());
		
		//获取动态信息详情
		 function getDynamicInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>dynamic/getInfoById.do?residence_dynamic_id='+tid;
			 diag.Width = 530;
			 diag.Height = 565;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取报修信息详情
		function getRepairsInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>equipment/getRepairsInfoById.do?REPAIRS_ID='+tid;
			 diag.Width = 530;
			 diag.Height = 565;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取小区信息详情
		function getResidenceInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>residence/getResidenceInfoById.do?RESIDENCE_ID='+tid;
			 diag.Width = 510;
			 diag.Height = 485;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//获取投诉信息详情
		function getComplaintInfoById(tid){
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="查看";
			 diag.URL = '<%=basePath%>complaint/getComplaintInfoById.do?complaint_id='+tid;
			 diag.Width = 510;
			 diag.Height = 485;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		
		/* $(function(){
			marqueesHeight=200; //内容区高度
			stopscroll=false; //这个变量控制是否停止滚动
			//var marquees = document.getElementById("marquees");
			with(marquees){
				noWrap=true; //这句表内容区不自动换行
				style.width=0; //于是我们可以将它的宽度设为0，因为它会被撑大
				style.height=marqueesHeight;
				style.overflowY="hidden"; //滚动条不可见
				onmouseover=new Function("stopscroll=true"); //鼠标经过，停止滚动
				onmouseout=new Function("stopscroll=false"); //鼠标离开，开始滚动
			}
			//这时候，内容区的高度是无法读取了。下面输出一个不可见的层"templayer"，稍后将内容复制到里面：
			document.write('<div id="templayer" style="position:absolute;z-index:1;visibility:hidden"></div>');
			function init(){ //初始化滚动内容
			//多次复制原内容到"templayer"，直到"templayer"的高度大于内容区高度：
			var templayer= document.getElementById("templayer");
			while(templayer.offsetHeight<marqueesHeight){
				templayer.innerHTML+=marquees.innerHTML;
			} //把"templayer"的内容的“两倍”复制回原内容区：
				marquees.innerHTML=templayer.innerHTML+templayer.innerHTML;
				//设置连续超时，调用"scrollUp()"函数驱动滚动条：
				setInterval("scrollUp()",10);
			}
			document.body.onload=init;
			preTop=0; //这个变量用于判断滚动条是否已经到了尽头
			
		});
		function scrollUp(){ //滚动条的驱动函数
			if(stopscroll==true)return; //如果变量"stopscroll"为真，则停止滚动
				preTop=marquees.scrollTop; //记录滚动前的滚动条位置
				marquees.scrollTop+=1; //滚动条向下移动一个像素
				//如果滚动条不动了，则向上滚动到和当前画面一样的位置
				//当然不仅如此，同样还要向下滚动一个像素(+1)：
				if(preTop==marquees.scrollTop){
					marquees.scrollTop=templayer.offsetHeight-marqueesHeight+1;
				}
			} */

	</script>
</body>
</html>
