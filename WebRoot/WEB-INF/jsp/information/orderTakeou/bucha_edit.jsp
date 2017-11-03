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
		<meta charset="utf-8" />
		<title></title>
		<meta name="description" content="overview & stats" />
		<meta name="viewport" content="width=device-width, initial-scale=1.0" />
		<link href="static/css/bootstrap.min.css" rel="stylesheet" />
		<link href="static/css/bootstrap-responsive.min.css" rel="stylesheet" />
		<link rel="stylesheet" href="static/css/font-awesome.min.css" />
		<link rel="stylesheet" href="static/css/ace.min.css" />
		<link rel="stylesheet" href="static/css/ace-responsive.min.css" />
		<link rel="stylesheet" href="static/css/ace-skins.min.css" />
		<script type="text/javascript" src="static/js/jquery-1.7.2.js"></script>
		<!--提示框-->
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
		<script type="text/javascript" src="static/js/bootstrap.min.js"></script>
		<script type="text/javascript" src="static/js/ace-elements.min.js"></script>
		<script type="text/javascript" src="static/js/ace.min.js"></script>
</head>
<style>
	.ace-file-input {
	    width: 950px;
	}
	.ace-file-input label{
		width: 225px;
	}
</style>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#bucha").val()==""){
			$("#bucha").tips({
				side:3,
	            msg:'请输入补差金额',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#bucha").focus();
			return false;
		}
		//判断是否已经存在
		/* var url='api/kehu/MokuaiByName.do';
		$.post(url,{"title":$("#title").val()},function(data){
			if("01" == data.result){
				$("#title").tips({
					side:3,
		            msg:'该名称已存在',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#title").focus();
			}else{
				//判断是否已经存在
				var url='api/kehu/getDateBytype.do';
				$.post(url,{"type":$("#type").val()},function(data){
					if("02" == data.result){
						$("#type").tips({
							side:3,
				            msg:'该序号不可重复',
				            bg:'#AE81FF',
				            time:2
				        });
						$("#type").focus();
					}else{
						$("#Form").submit();
					}
				});
				//$("#Form").submit();
			}
		}); */
		$("#Form").submit();
	}
	//取消
	function closes() {
		window.location.href='javascript:history.go(-1)';
	}
</script>
<body>
	<form action="orderTakeout/${msg }.do?user_kehu_id=${pd.user_kehu_id}" name="Form" id="Form" method="post">
		<input type="hidden" name="user_kehu_fid" id="user_kehu_fid" value="${pd.user_kehu_id}"/>
		<div id="zhongxin">
		<table id="table_report"  class="table table-striped table-bordered table-hover">
			<div style="font-size: 12px;color: red; margin-top: 10px;padding-left: 10px;">
		    	<h6><b>补差价说明：补差价大于0表示客户补差给门店，补差价小于0表示门店补差给客户。</b></h6>
		    </div>
			<tr>
				<td>补差金额:</td>
				<td>
					<input type="text" name="bucha" id="bucha" placeholder="补差金额" value="${pd.bucha }"/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 140px"colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">返回 </a>
				</td>
			</tr>
		</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>
<script type="text/javascript">
	$(function(){
			//上传
			$('#file').ace_file_input({
				no_file:'请选择图片 ...',
				btn_choose:'选择',
				btn_change:'更改',
				droppable:false,
				onchange:null,
				thumbnail:false, //| true | large
				whitelist:'gif|png|jpg|jpeg',
				//blacklist:'gif|png|jpg|jpeg'
				//onchange:''
				//
			});
	});
	function jump(id){
		var file = $("#file").val();
		var title = $("#title").val();
		var type = $("#type").val();
		window.location.href="api/kehu/jumpcailanEdit?files="+file+"&title="+title+"&type="+type+"&goods_mokuai_id="+id;
	}
</script>
</html>