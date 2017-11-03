<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入标签库 -->
<%@include file="/common/include/taglibs.jsp" %>
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
	</head> 
	
<style>
	#trs>td {
		vertical-align: middle;
	}
	.yuzhong>th{
		text-align: center;
	}
</style>
<body>
		
<div class="container-fluid" id="main-container">

<div id="page-content" class="clearfix">
						
  <div class="row-fluid">


	<div class="row-fluid">
	
			<!-- 检索  -->
			<form action="api/kehu/memberlistPage.do" method="post" name="residenceForm" id="residenceForm">
			<table>
				<tr>
					<td>
						<span class="input-icon">
							<input autocomplete="off" id="nav-search-input" type="text" name="searchName" value="${pd.searchName }" placeholder="这里输入关键词" />
							<i id="nav-search-icon" class="icon-search"></i>
						</span>
					</td>
					
					<td style="vertical-align:top;"><button class="btn btn-mini btn-light" onclick="search();" title="检索"><i id="nav-search-icon" class="icon-search"></i></button></td>
					<%-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="window.location.href='<%=basePath%>/user/listtabUsers.do';" title="切换模式"><i id="nav-search-icon" class="icon-exchange"></i></a></td> --%>
					<!-- <td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="toExcel();" title="导出到EXCEL"><i id="nav-search-icon" class="icon-download-alt"></i></a></td> -->
					<%-- <c:if test="${QX.edit == 1 }"><td style="vertical-align:top;"><a class="btn btn-mini btn-light" onclick="fromExcel();" title="从EXCEL导入"><i id="nav-search-icon" class="icon-cloud-upload"></i></a></td></c:if> --%>
					
				</tr>
			</table>
			<!-- 检索  -->
		
		
			<table id="table_report" class="table table-striped table-bordered table-hover">
				
				<thead>
					<tr class="yuzhong">
					<!-- 	<th class="center">
								<label><input type="checkbox" id="zcheckbox" /><span class="lbl"></span></label>
						</th> -->
						<th>序号</th>
						<th>手机号</th>
						<th>姓名</th>
						<th>性别</th>
						<th>日历</th>
						<th>生日</th>
						<th>商户名称</th>
						<th>地址</th>
						<th>余额</th>
						<th><i class="icon-time hidden-phone"></i>注册时间</th>
						<th>状态</th>
						<th class="center">分配端口</th>
						<th class="center">操作</th>
					</tr>
				</thead>
										
		<tbody>
					
				<!-- 开始循环 -->	
				<c:choose>
					<c:when test="${not empty memberlistPage}">
						<c:forEach items="${memberlistPage}" var="rlist" varStatus="vs">		
							<tr id="trs">
							<%-- 	<td class='center' style="width: 30px;">
									<c:if test="${user.USERNAME != 'admin'}"><label><input type='checkbox' name='ids' value="${user.USER_ID }" id="${user.EMAIL }" alt="${user.PHONE }"/><span class="lbl"></span></label></c:if>
									<c:if test="${user.USERNAME eq 'admin'}"><label><input type='checkbox' disabled="disabled" /><span class="lbl"></span></label></c:if>
								</td> --%>
								<td class='center' style="width: 30px;">${vs.index+1}</td>
								<td class='center'>${rlist.phone}</td>
								<td class='center'>${rlist.userName }</td>
								<td class='center'>${rlist.sex }</td>
								<td class='center'>
									<c:if test="${rlist.calendar=='' || rlist.calendar==null}">保密...</c:if>
									<c:if test="${rlist.calendar!='' && rlist.calendar!=null}">${rlist.calendar }</c:if>
								</td>
								<td class='center'>
									<c:if test="${rlist.birthday=='' || rlist.birthday==null}">保密...</c:if>
									<c:if test="${rlist.birthday!='' && rlist.birthday!=null}">${rlist.birthday }</c:if>
								</td>
								<td>${rlist.shanghuName }</td>
								<td style="width:23%;">${rlist.address }(${rlist.detailAddress })</td>
								<td class='center'>${rlist.balance}</td>
								<td class='center'>${rlist.registerTime }</td>
								<td class='center'>
									<c:if test="${rlist.status=='1' }"><div style='background-color: #15c300; color: white;'>使用中...</div></c:if>
									<c:if test="${rlist.status=='0' }"><div style='background-color: red; color: white;'>禁用中...</div></c:if>
								</td>
								<c:if test="${rlist.dkmc != '' && not empty rlist.dkmc}">
								     <td class="center">${rlist.dkmc}
							          <div style="text-align: center;">
							          	<a style="cursor: pointer;" onclick="Duankouedit('${rlist.user_kehu_id }')">编辑</a>
							          </div>
								     </td>
								</c:if>
								<c:if test="${rlist.dkmc == '' || empty rlist.dkmc}">
								    <td style="text-align: center;">
								  		<a style="cursor: pointer;" onclick="fenpeiduankou('${rlist.user_kehu_id }');">分配</a>
								    </td>
								</c:if>
								<td class='center'>
								<%-- <a class='btn btn-mini btn-info'   title="编辑分配端口" onclick="Duankouedit('${rlist.user_kehu_id }')"><i class='icon-edit'></i></a> --%>
								<a class='btn btn-mini btn-danger' title="删除"  onclick="del('${rlist.user_kehu_id}')"><i class='icon-trash'></i></a>
								</td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr class="main_info">
							<td colspan="20" class="center">没有相关数据</td>
						</tr>
					</c:otherwise>
				</c:choose>
				
				</tbody>
</table>
			
		<div class="page-header position-relative">
		<table style="width:100%;">
			<tr>
				<td style="vertical-align:top;">
					<%-- <c:if test="${QX.add == 1 }">
					<a class="btn btn-small btn-success" onclick="add();">新增</a>
					</c:if> --%>
				<%-- 	<c:if test="${QX.FX_QX == 1 }">
					<a title="批量发送电子邮件" class="btn btn-small btn-info" onclick="makeAll('确定要给选中的用户发送邮件吗?');"><i class="icon-envelope-alt"></i></a>
					</c:if>
					<c:if test="${QX.FW_QX == 1 }">
					<a title="批量发送短信" class="btn btn-small btn-warning" onclick="makeAll('确定要给选中的用户发送短信吗?');"><i class="icon-envelope"></i></a>
					</c:if>
					<c:if test="${QX.del == 1 }">
					<a title="批量删除" class="btn btn-small btn-danger" onclick="makeAll('确定要删除选中的数据吗?');" ><i class='icon-trash'></i></a>
					</c:if> --%>
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
			$("#residenceForm").submit();
		}
		
		
		//去发送电子邮件页面
		function sendEmail(EMAIL){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送电子邮件";
			 diag.URL = '<%=basePath%>head/goSendEmail.do?EMAIL='+EMAIL;
			 diag.Width = 660;
			 diag.Height = 470;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//去发送短信页面
		function sendSms(phone){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="发送短信";
			 diag.URL = '<%=basePath%>head/goSendSms.do?PHONE='+phone+'&msg=appuser';
			 diag.Width = 600;
			 diag.Height = 265;
			 diag.CancelEvent = function(){ //关闭事件
				diag.close();
			 };
			 diag.show();
		}
		
		//分配端口
		function fenpeiduankou(tagID){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="分配端口新增";
		     diag.URL = '<%=basePath%>api/kehu/goAddPage.do?tagID='+tagID;
			 diag.Width = 575;
			 diag.Height = 485;
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
		
		//新增
		function add(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="新增";
			 diag.URL = '<%=basePath%>';
			 diag.Width = 575;
			 diag.Height = 485;
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
		
			
		//修改业主信息
		function Duankouedit(tagID){
			 top.jzts();
		   	 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="编辑";
			 diag.URL = '<%=basePath%>api/kehu/toDuankouedit.do?tagID='+tagID;
			 diag.Width = 575;
			 diag.Height = 485;
			 diag.CancelEvent = function(){ //关闭事件
				 if(diag.innerFrame.contentWindow.document.getElementById('zhongxin').style.display == 'none'){
					nextPage('${page.currentPage}');
				}
				diag.close();
			 };
			 diag.show();
		}
		
		//删除
		function del(tagID,spmc_id,shuliang){
			 bootbox.confirm("确定要删除该条数据吗?", function(result) {
				if(result) {
					top.jzts();
					var url = '<%=basePath%>api/kehu/deleteMenber.do?tagID='+tagID+'&spmc_id='+spmc_id+'&shuliang='+shuliang;
					$.get(url,function(data){
						nextPage('${page.currentPage}');
					});
				}
			}); 
		}
		
		
		//批量操作
		function makeAll(msg){
			bootbox.confirm(msg, function(result) {
				if(result) {
					var str = '';
					var emstr = '';
					var phones = '';
					for(var i=0;i < document.getElementsByName('ids').length;i++)
					{
						  if(document.getElementsByName('ids')[i].checked){
						  	if(str=='') str += document.getElementsByName('ids')[i].value;
						  	else str += ',' + document.getElementsByName('ids')[i].value;
						  	
						  	if(emstr=='') emstr += document.getElementsByName('ids')[i].id;
						  	else emstr += ';' + document.getElementsByName('ids')[i].id;
						  	
						  	if(phones=='') phones += document.getElementsByName('ids')[i].alt;
						  	else phones += ';' + document.getElementsByName('ids')[i].alt;
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
						if(msg == '确定要删除选中的数据吗?'){
							top.jzts();
							$.ajax({
								type: "POST",
								url: '<%=basePath%>user/deleteAllU.do?tm='+new Date().getTime(),
						    	data: {USER_IDS:str},
								dataType:'json',
								//beforeSend: validateData,
								cache: false,
								success: function(data){
									 $.each(data.list, function(i, list){
											nextPage('${page.currentPage}');
									 });
								}
							});
						}else if(msg == '确定要给选中的用户发送邮件吗?'){
							sendEmail(emstr);
						}else if(msg == '确定要给选中的用户发送短信吗?'){
							sendSms(phones);
						}
						
						
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
		
		//导出excel
		function toExcel(){
			var searchName = $("#nav-search-input").val();
			window.location.href='<%=basePath%>jinhuo/excel.do?searchName='+searchName;
		}
		
		//打开上传excel页面
		function fromExcel(){
			 top.jzts();
			 var diag = new top.Dialog();
			 diag.Drag=true;
			 diag.Title ="EXCEL 导入到数据库";
			 diag.URL = '<%=basePath%>user/goUploadExcel.do';
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
		
		</script>
		
	</body>
</html>

