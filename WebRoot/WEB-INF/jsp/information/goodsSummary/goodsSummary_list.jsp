<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html lang="en">
	<head>
	<base href="<%=basePath%>">
	<!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%>
	<meta charset="utf-8" />
	<link rel="stylesheet" href="static/css/bootstrap.min.css"/>
	<link rel="stylesheet" href="static/css/bootstrap-responsive.min.css"/>
	<link rel="stylesheet" href="static/css/font-awesome.min.css" />
	<link rel="stylesheet" href="static/css/ace.min.css" />
	<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
	<link rel="stylesheet" href="static/css/ace-skins.min.css" />
	<!-- 引入 -->
	<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
	<script src="static/js/bootstrap.min.js"></script>
	<script src="static/js/ace-elements.min.js"></script>
	<script src="static/js/ace.min.js"></script>
	<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
	<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
	<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
	<!-- 引入 -->
	<!-- <script type="text/javascript" src="static/js/jquery.tips.js"></script>提示框 -->
		
<script type="text/javascript">
	$(top.hangge());
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="添加商品";
		 diag.URL = '<%=basePath%>shangjia/goodstoAdd.do';
		 diag.Width = 400;
		 diag.Height = 400;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				var num = '${page.currentPage}';
			 	if(num == '0'){
			 		top.jzts();
			 		location.href = location.href;
			 	}else{
			 		nextPage('${page.currentPage}');
			 	}
			}
			 diag.close();
		 };
		 diag.show();
	}
	//修改
	function edit(tagID){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="商品编辑";
		 diag.URL = '<%=basePath%>shangjia/goodstoEdit.do?tagID='+tagID;
		 diag.Width = 400;
		 diag.Height = 400;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			 diag.close();
		 };
		 diag.show();
	}
	//删除
		function del(tagID){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = '<%=basePath%>shangjia/goodsdelete.do?ids='+tagID;
					$.get(url,function(data){
						nextPage('${page.currentPage}');
					});
				}
			});
		}
		$(function() {
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					//$(this).closest('tr').toggleClass('selected');
				});	
			});
		});
		//批量上架或下架
		function changeState(state){
			bootbox.confirm('确定执行该操作吗？',function(result){
				if(result){
					var str='';
					for ( var i = 0; i < document.getElementsByName('ids').length; i++) {
						if(document.getElementsByName('ids')[i].checked){
							if(str==''){
								str+=document.getElementsByName('ids')[i].value;
							}else{
								str+=','+document.getElementsByName('ids')[i].value;
							}
						}
					}
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:4
				        });
						return;
					}else{
						$.ajax({
							type:'post',
							url:'<%=basePath%>shangjia/goodsstate.do',
							dataTyoe:'json',
							cache: false,
							data:{
								"ids":str,
								"state":state
							},
							success:function(data){
								nextPage('${page.currentPage}');
							},
						});
					}
				}
			});	
		}
		//批量删除
		function makeAll() {
			bootbox.confirm('确定执行批量删除操作吗？',function(result){
				if(result){
					var str='';
					for ( var i = 0; i < document.getElementsByName('ids').length; i++) {
						//alert(document.getElementsByName('ids').length);
						if(document.getElementsByName('ids')[i].checked){
							if(str==''){
								str+=document.getElementsByName('ids')[i].value;
							}else{
								str+=','+document.getElementsByName('ids')[i].value;
							}
						}
					}
					//alert("str:"+str);
					if(str==''){
						bootbox.dialog("您没有选择任何内容!", 
							[
							  {
								"label" : "关闭",
								"class" : "btn-small btn-success",
								"callback": function() {
									//Example.show("great success");
									}
								}
							 ]
						);
						$("#zcheckbox").tips({
							side:3,
				            msg:'点这里全选',
				            bg:'#AE81FF',
				            time:4
				        });
						return;
					}else{
						$.ajax({
							type:'post',
							url:'<%=basePath%>shangjia/goodsdelete.do',
							dataTyoe:'json',
							cache: false,
							data:{
								"ids":str
							},
							success:function(data){
								nextPage('${page.currentPage}');
							},
						});
					}
				}
			});	
		}
		
		//查看订单明细
	function ordermingxi(order_takeou_id,user_kehu_fid){
		alert(order_takeou_id);
		alert(user_kehu_fid);
		window.location.href='orderTakeout/ordermingxilist.do?user_shangjia_fid='+id;
	}
</script>

<script type="text/javascript">
		
		$(function() {
			
			//日期框
			$('.date-picker').datepicker();
			
			//下拉框
			$(".chzn-select").chosen(); 
			$(".chzn-select-deselect").chosen({allow_single_deselect:true}); 
			
			//复选框
			$('table th input:checkbox').on('click' , function(){
				var that = this;
				$(this).closest('table').find('tr > td:first-child input:checkbox')
				.each(function(){
					this.checked = that.checked;
					$(this).closest('tr').toggleClass('selected');
				});
					
			});
			
		});
		
		//导出excel
		function toExcel(){
			var searchName = $("#nav-search-input").val();
			var create_time = $("#create_time").val();
			var searchDateEnd = $("#searchDateEnd").val();
			window.location.href='<%=basePath%>goodsSummary/getgoodsSummaryExcel.do?searchName='+searchName+'&create_time='+create_time+'&searchDateEnd='+searchDateEnd;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '<%=basePath%>shangjia/goUploadExcel.do';
			 diag.Width = 300;
			 diag.Height = 150;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					 if('${page.currentPage}' == '0'){
						 top.jzts();
						 setTimeout("self.location.reload()",100);
					 }else{
						 nextPage('${page.currentPage}');
					 }
				}
				diag.close();
			 };
			 diag.show();
		}
		//取消
	function closes() {
		window.location.href='javascript:history.go(-1)';
	}
		</script>
</head>
<style>
	.btn-minis {
	    line-height: 24px;
	    border-width: 2px;
	    font-size: 12px;
	}

</style>
<body>
<div id="page-content" class="clearfix">
<div class="row-fluid">
	<h3>销售商品汇总</h3>
	<!-- <a class="btn btn-mini btn-success" onclick="PrintMx('div_print');">打印预览</a>&nbsp;&nbsp; -->
	<!-- 检索  -->
	<form action="<%=basePath%>/goodsSummary/getgoodsSummarylist.do" method="post" name="userForm" id="userForm">
	<table>
		<tr>
			<td>
				<span class="input-icon">
					<input autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入关键词" />
					<i id="nav-search-icon" class="icon-search"></i>
				</span>
			</td>
			<td><input class="span10 date-picker" name="create_time" id="create_time"  value="${pd.create_time}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="检索开始日期"/></td>
			<td><input class="span10 date-picker" name="searchDateEnd" id="searchDateEnd"  value="${pd.searchDateEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="检索结束日期"/></td>
			<c:if test="${QX.cha == 1 }">
				<td style="vertical-align:top;">
					<button class="btn btn-mini btn-light" title="检索">
						<i id="nav-search-icon" class="icon-search"></i>
					</button>
				</td>
				<td style="vertical-align:top;">
					<a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL">
						<i id="nav-search-icon" class="icon-download-alt"></i>
					</a>
				</td>
				<td style="vertical-align:top;">
					<a class="btn btn-mini btn-light" onclick="PrintMx('div_print');" title="打印">
						<i id="nav-search-icon" class="icon-print"></i>
					</a>
				</td>
				<%-- 
				<c:if test="${QX.edit == 1 }">
					<td style="vertical-align:top;">
						<a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入">
							<i id="nav-search-icon" class="icon-cloud-upload"></i>
						</a>
					</td>
				</c:if> --%>
			</c:if>
		</tr>
	</table>
	<!-- printDiv -->
					<form class="reserve">
						<h2 class="m0a">销售商品汇总明细表</h2><span style="color: red;">注：当前列表数据默认查询的是今日销售数据,要查询其他日期的数据请在上方选择日期</span>
						<%-- <h6>订单号：${pd.orderNum}</h6><h6>客户：${pd.userName }</h6><h6>手机：${pd.phone }</h6><h6>地址：${pd.address }</h6> --%>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<!-- <th class="center">
									<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
								</th> -->
								<th class="center"  style="width: 30px;">序号</th>
								<th class='center'>商品名称</th>
								<th class='center'>商品汇总数</th>
								<th class='center'>商品单位</th>
								<th class='center'>商品单价</th>
								<th class='center'>商品合计</th>
								<th class='center'><i class="icon-time hidden-phone"></i>时间</th>
								<!-- <th class='center'>操作</th> -->
							</tr>
							</thead>
							<c:choose>
								<c:when test="${not empty goodsSummaryList}">
									<c:forEach items="${goodsSummaryList}" var="var" varStatus="vs">
									<tr>
										<%-- <td class='center' style="width: 30px;">
									 		<label><input type='checkbox' name='ids' value="${var.order_takeou_id }"/><span class="lbl"></span></label>
										</td> --%>
										<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class='center'>${var.goodsName}</td>
										<td class='center'><fmt:formatNumber value="${var.zongshu}" pattern="#" type="number"/></td>
										<td class='center'>${var.name }</td>
										<td class='center'>${var.price }</td>
										<td class='center'>${var.Total }</td>
										<td class='center'>${var.create_time }</td>
										<%-- <td style="width: 68px;">
											<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.order_takeou_id }')" ><i class='icon-edit'></i></a>
											<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.order_takeou_id }')"><i class='icon-trash'></i></a>
										</td> --%>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
									<td colspan="100" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<div style="float: right;margin: -12px 0 10px 0;font-size: 20px;font-weight: bold;">
							<span>合计：</span>
							<span>${Totals }</span>
						</div>
					</form>
				
				
				<div id="div_print" class="iframe_reserve" style="display: none">
					<form class="reserve">
						<h2 class="m0a">商品汇总明细表</h2>
						<%-- <h6>订单号：${pd.orderNum}</h6><h6>客户：${pd.userName }</h6><h6>手机：${pd.phone }</h6><h6>地址：${pd.address }</h6> --%>
						<table id="table_report" class="table table-striped table-bordered table-hover">
							<thead>
							<tr>
								<!-- <th class="center">
									<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
								</th> -->
								<th class="center"  style="width: 30px;">序号</th>
								<th class='center'>商品名称</th>
								<th class='center'>商品汇总数</th>
								<th class='center'>商品单位</th>
								<th class='center'><i class="icon-time hidden-phone"></i>时间</th>
								<!-- <th class='center'>操作</th> -->
							</tr>
							</thead>
							<c:choose>
								<c:when test="${not empty goodsSummaryList}">
									<c:forEach items="${goodsSummaryList}" var="var" varStatus="vs">
									<tr>
										<%-- <td class='center' style="width: 30px;">
									 		<label><input type='checkbox' name='ids' value="${var.order_takeou_id }"/><span class="lbl"></span></label>
										</td> --%>
										<td class='center' style="width: 30px;">${vs.index+1}</td>
										<td class='center'>${var.goodsName}</td>
										<td class='center'><fmt:formatNumber value="${var.zongshu}" pattern="#" type="number"/></td>
										<td class='center'>${var.name }</td>
										<td class='center'>${var.create_time }</td>
										<%-- <td style="width: 68px;">
											<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.order_takeou_id }')" ><i class='icon-edit'></i></a>
											<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.order_takeou_id }')"><i class='icon-trash'></i></a>
										</td> --%>
									</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
									<td colspan="100" class="center">没有相关数据</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</table>
						<div style="float: right;margin: -12px 0 10px 0;font-size: 20px;font-weight: bold;">
							<span>合计：</span>
							<span>${Totals }</span>
						</div>
					</form>
				</div><!-- printDiv end -->
	
	
		<input type="hidden" name="order_takeou_id" id="order_takeou_id" value="${pd.order_takeou_id}"/>
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<!-- <td style="vertical-align:top;width:50px;">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll();" style="margin: -55px 0 0 59px;width: 26px;text-align: center;"><i class='icon-trash'></i></a>
				</td> -->
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
	</form>
</div>
</div>
<script type="text/javascript">
		//打印明细单
		function PrintMx(printpage) {
             var headstr = "<html><head><title></title></head><body>"; 
             var footstr = "</body>"; 
             var newstr = document.all.item(printpage).innerHTML; 
             var oldstr = document.body.innerHTML; 
             document.body.innerHTML = headstr+newstr+footstr; 
             window.print(); 
             document.body.innerHTML = oldstr; 
             return false; 
        } 
</script>
</body>
</html>