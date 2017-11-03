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
	<base href="<%=basePath%>"><!-- jsp文件头和头部 -->
	<%@ include file="../../system/admin/top.jsp"%> 
	</head>
<body>
<div class="container-fluid" id="main-container">
<div id="page-content" class="clearfix">
  <div class="row-fluid">
	<div class="row-fluid">
			<!-- 检索开始  -->
			<form action="api/contact/contactlistPage.do" method="post" name="Form" id="Form">
			<table>
				<tr>
					<td>
						<span class="input-icon"> <input autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入关键词!" /> <i id="nav-search-icon"class="icon-search"></i> </span>
					</td>
					<td style="vertical-align:top;">
						<button class="btn btn-mini btn-light" onclick="search();"title="检索">
							<i id="nav-search-icon" class="icon-search"></i>
						</button>
					</td>
				</tr>
			</table>
			<!-- 检索结束  -->
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr>
						<!-- <th class="center">
						<label><input type="checkbox" id="zcheckbox" onclick="selectAll()"/><span class="lbl"></span></label>
						</th>
						<th class="center"  style="width: 50px;">序号</th>
						<th class="center">客服热线(区号+XXX)</th>
						<th class="center">微信号</th>
						<th class="center">操作</th> -->
						<th class="center" style="width: 30px;">序号</th>
						<th class="center">客服热线(区号+XXX)</th>
						<th class="center">位置</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
				<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty contactlist}">
							<c:forEach items="${contactlist}" var="clist" varStatus="vs">
								<tr>
									<%-- <td class='center' style="width: 30px;">
										<label><input type='checkbox' name='ids' value="${var.contact_id}" /><span class="lbl"></span></label>
									</td> --%>
									<td class='center' style="width: 30px;">${vs.index+1}</td>
									<td class="center">${clist.hotline}</td>
									<td class="center">${clist.weizhi}${clist.detailWeizhi}</td>
									<td style="width: 68px;">
										<a class='btn btn-mini btn-info' title="编辑" onclick="edit('${clist.contact_id }')" ><i class='icon-edit'></i></a>
										<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${clist.contact_id }')"><i class='icon-trash'></i></a>
									</td>
								</tr>
							</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="100" class="center" >没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				<!-- 结束循环 -->	
				</tbody>
			</table>
			<div class="page-header position-relative">
				<table style="width:100%;">
					 <tr>
					 <c:if test="${contactlist.size()==0}">
						<td style="vertical-align:top;">
							<a class="btn btn-small btn-success" onclick="add();">新增</a>
							<!-- <a class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" title="批量删除" >批量删除<i class='icon-trash'></i></a> -->
						</td>
					 </c:if>	
						<td style="vertical-align:top;"><div class="pagination" style="float: right;padding-top: 0px;margin-top: 0px;">${page.pageStr}</div></td>
					</tr>
				</table>
			</div>
		</form>
	</div>
  </div><!--/row-->
	
</div><!--/#page-content-->
</div><!--/.fluid-container#main-container-->
		
		<!-- 返回顶部  -->
		<a href="#" id="btn-scroll-up" class="btn btn-small btn-inverse">
			<i class="icon-double-angle-up icon-only"></i>
		</a>
		
		<!-- 引入 -->
		<script type="text/javascript">window.jQuery || document.write("<script src='static/js/jquery-1.9.1.min.js'>\x3C/script>");</script>
		<script src="static/js/bootstrap.min.js"></script>
		<script src="static/js/ace-elements.min.js"></script>
		<script src="static/js/ace.min.js"></script>
		
		<script type="text/javascript" src="static/js/chosen.jquery.min.js"></script><!-- 下拉框 -->
		<script type="text/javascript" src="static/js/bootstrap-datepicker.min.js"></script><!-- 日期框 -->
		<script type="text/javascript" src="static/js/bootbox.min.js"></script><!-- 确认窗口 -->
		<!-- 引入 -->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script><!--提示框-->
		<script type="text/javascript">
			$(top.hangge());
			//检索
			function search(){
				top.jzts();
				$("#Form").submit();
			}
			
	//新增
	function add(){
		 top.jzts();
		 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="新增";
		 diag.URL = '<%=basePath%>api/contact/contactwmAdd.do';
		 diag.Width = 400;
		 diag.Height = 300;
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
	function edit(Id){
		 top.jzts();
	   	 var diag = new top.Dialog();
		 diag.Drag=true;
		 diag.Title ="编辑";
		 diag.URL = '<%=basePath%>api/contact/toContactwmEdit.do?Id='+Id;
		 diag.Width = 400;
		 diag.Height = 300;
		 diag.CancelEvent = function(){ //关闭事件
			 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
				 nextPage('${page.currentPage}');
			}
			 diag.close();
		 };
		 diag.show();
	}
	//删除
		function del(Id){
			bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = '<%=basePath%>api/contact/deleteContactwm.do?id='+Id;
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
		//批量删除
		function makeAll() {
			bootbox.confirm('确定要删除选中的数据吗?',function(result){
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
							url:'<%=basePath%>h5sys/deletelianxiwm.do',
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
		
	//审核受理失败
	function checkedNo(tagID){
		bootbox.confirm("确定要执行受理失败操作吗?", function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>bankCardTixian/syschecked.do?ids='+tagID+'&num=0';
				$.get(url,function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}	
	//审核受理成功
	function checkedYes(tagID){
		bootbox.confirm("确定要执行确认受理操作吗?", function(result) {
			if(result) {
				top.jzts();
				var url = '<%=basePath%>bankCardTixian/syschecked.do?ids='+tagID+'&num=1';
				$.get(url,function(data){
					nextPage('${page.currentPage}');
				});
			}
		});
	}
	
	//批量通过和拒绝
	function checkedAll(msg) {
		bootbox.confirm(msg,function(result){
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
			            time:8
			        });
					return;
				}else{
					var num="";
					if(msg=="确定批量受理失败吗?"){
						num="0";
					}else if(msg=="确定批量受理成功吗?"){
						num="1";
					}
					$.ajax({
						type:'post',
						url:'<%=basePath%>bankCardTixian/syschecked.do',
						dataTyoe:'json',
						cache: false,
						data:{
							"ids":str,
							"num":num
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
		</script>
	</body>
</html>

