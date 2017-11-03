<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
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
	</head>
<style>
#trs>td {
	vertical-align: middle;
}
</style>
<body>
		
<div class="container-fluid" id="main-container">


<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="<%=basePath%>api/kehu/goodsgetlistPage.do" method="post" name="userForm" id="userForm">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="goodsName" value="${pd.goodsName }" placeholder="商品名称关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					<%-- <td><input class="span10 date-picker" name="lastLoginStart" id="lastLoginStart"  value="${pd.lastLoginStart}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="开始日期" title="最近登录开始"/></td>
					<td><input class="span10 date-picker" name="lastLoginEnd" id="lastLoginEnd"  value="${pd.lastLoginEnd}" type="text" data-date-format="yyyy-mm-dd" readonly="readonly" style="width:88px;" placeholder="结束日期" title="最近登录结束"/></td> --%>
					<td style="vertical-align:top;"> 
					 	<select class="chzn-select" name="searchNames" id="searchNames" data-placeholder="请选择商品类别" style="vertical-align:top;width: 150px;">
						<option value=""></option>
						<option value=""><c:if test="${not empty spfllist}">全部</c:if></option>
						<c:forEach items="${spfllist}" var="spfllists">
							<option value="${spfllists.goods_category_id }" <c:if test="${spfllists.goods_category_id==pd.searchNames}">selected</c:if>>${spfllists.categoryName }</option>
						</c:forEach>
					  	</select>
					</td>
					<td style="vertical-align:top;">
						<select class="chzn-select" name="goodsState" id="goodsState" data-placeholder="请选择商品状态" title="检索(上/下)架" style="vertical-align:top;width: 150px;">
							<option value=""></option>
							<option value="">全部</option>
							<option value="1" <c:if test="${pd.goodsState == '1' }">selected</c:if> >上架</option>
							<option value="0" <c:if test="${pd.goodsState == '0' }">selected</c:if> >下架</option>
						</select>
					</td>
					<%-- <c:if test="${QX.cha == 1 }"> --%>
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td> --%>
					<!-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td> -->
					<%-- <c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if> --%>
					<%-- </c:if> --%>
				</tr>
			</table>
			<a class="btn btn-small btn-success" style="margin-bottom: 5px;" onclick="changeState('1');">批量上架</a>
			<a class="btn btn-small btn-success" style="margin-bottom: 5px;" onclick="changeState('0');">批量下架</a>
			<!-- 检索  -->
			<table id="table_report" class="table table-striped table-bordered table-hover">
				<thead>
					<tr>
						<th class="center">
						<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th>
						<th class="center"  style="width: 50px;">序号</th>
						<th class='center'>商品所属类别名称</th>
						<th class='center'>商品名称</th>
						<th class='center'>商品图片</th>
						<th class='center'>商品最高价</th>
						<th class='center'>商品建议价</th>
						<th class='center'>上架价</th>
						<th class='center'>商户价</th>
						<th class='center'>商品单位</th>
						<th class='center'>商品库存</th>
						<th class='center'>商品状态</th>
						<th class='center'><i class="icon-time hidden-phone"></i>商品发布的时间</th>
						<th class='center'>操作</th>
					</tr>
				</thead>
			<tbody>
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty list}">
						<c:forEach items="${list}" var="var" varStatus="vs">
									
							<tr id="trs">
								<td class='center' style="width: 30px;">
									<label><input type='checkbox' name='ids' value="${var.goods_id }"/><span class="lbl"></span></label>
								</td>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td class='center'>${var.categoryName}</td>
								<td class='center'>${var.goodsName}</td>
								<td class='center'>
									<img alt="" src="<%=basePath%>${var.goodsImg}" style="width: 40px;height: 40px;">
								</td>
								<td class='center'>${var.topPrice}</td>
								<td class='center'>${var.advisePrice}</td>
								<td class='center'>${var.shangjiaPrice}</td>
								<td class='center'>${var.shanghuPrice}</td>
								<td class='center'>${var.name}</td>
								<td class='center'>${var.Stock}</td>
								<td class='center'>
									<c:if test="${var.goodsState == '0'}">下架</c:if>
									<c:if test="${var.goodsState == '1'}">上架</c:if>
								</td>
								<td class='center'>${var.fabuTime}</td>
								<td style="width: 68px;">
									<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${var.goods_id }')" ><i class='icon-edit'></i></a>
									<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${var.goods_id }')"><i class='icon-trash'></i></a>
								</td>
							</tr>
						
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				</tbody>
</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
				</td>
				<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
			</tr>
		</table>
		</div>
		</form>
	</div>
 
 
 
 
	<!-- PAGE CONTENT ENDS HERE -->
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
	<!-- 	<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a> -->
		
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
		window.location.href='api/kehu/goodstoAdd.do';
		 <%-- top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="添加商品";
		 diag.URL = '<%=basePath%>api/kehu/goodstoAdd.do';
		 diag.Width = 500;
		 diag.Height = 600;
		 diag.CancelEvent == function(){ //关闭事件
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
		 diag.show(); --%>
	}
	//修改
	function edit(tagID){
		window.location.href='api/kehu/goodstoEdit.do?tagID='+tagID;
		 <%-- top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="商品编辑";
		 diag.URL = '<%=basePath%>api/kehu/goodstoEdit.do?tagID='+tagID;
		 diag.Width = 500;
		 diag.Height = 600;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			 diag.close();
		 };
		 diag.show(); --%>
	}
	//删除
		function del(tagID){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = '<%=basePath%>api/kehu/goodsdelete.do?ids='+tagID;
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
							url:'<%=basePath%>api/kehu/goodsstate.do',
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
							url:'<%=basePath%>api/kehu/goodsdelete.do',
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
		</script>
		
	</body>
</html>

