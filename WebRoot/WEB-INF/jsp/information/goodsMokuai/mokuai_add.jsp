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
		<script type="text/javascript" src="static/js/jquery.tips.js"></script>
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
		if($("#file").val()==""){
			$("#file").tips({
				side:3,
	            msg:'请选择模块商品图片',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#file").focus();
			return false;
		}
		if($("#title").val()==""){
			$("#title").tips({
				side:3,
	            msg:'输入标题名称',
	            bg:'#AE81FF',
	            time:1
	        });
			$("#title").focus();
			return false;
		}
		if($("#type").val()==""){
			$("#type").tips({
				side:3,
	            msg:'请输入序号',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#type").focus();
			return false;
		}
		//判断是否已经存在
		var url='api/kehu/MokuaiByName.do';
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
			}
		});
	}
	//取消
	function closes() {
		window.location.href='javascript:history.go(-1)';
	}
</script>
<body>
	<form action="api/kehu/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
		<input type="hidden" name="goods_mokuai_id" value="${pd.goods_mokuai_id}"/>
		<input type="hidden" name="goods_mokuai_Img_url" value="${pd.goods_mokuai_Img_url}"/>
		<div id="zhongxin">
		<h3>添加菜篮分类</h3>
		<table id="table_report"  class="table table-striped table-bordered table-hover">
			<tr>
				<td>模块图片：</td>
				<td>
					<!-- <input type="file" name="file" id="file"/> -->
					<c:if test="${filePath == null || filePath == '' || empty filePath}">
						<input type="" id="file" name="file" onchange="fileType(this)" onclick="jump();" />
					</c:if>
					<c:if test="${filePath != null && filePath != '' && filePath != null }">
						<a href="javascript:void(0);"target="" onclick="jump();"><img src="<%=basePath%>${filePath}" width="210"/></a>
						<input type="hidden" name="file" value="${filePath }"/>
						<input type="" id="file" onchange="fileType(this)" onclick="jump();" value="${filePath}"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>名称：</td>
				<td>
					<input type="text" name="title" id="title" placeholder="输入标题名称" value="${title }"/>
				</td>
			</tr>
			<tr>
				<td>排序号：</td>
				<td>
					<input type="text" name="type" id="type" placeholder="输入序号" value="${type }" <c:if test="${msg=='update' }">readonly="readonly"</c:if>/>
				</td>
			</tr>
			<tr>
				<td style="padding-left: 140px"colspan="2">
					<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
					<a class="btn btn-mini btn-danger" onclick="closes();">返回</a>
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
	function jump(){
		var file = $("#file").val();
		var title = $("#title").val();
		var type = $("#type").val();
		var goods_mokuai_id = "null";
		window.location.href="api/kehu/jumpcailan?files="+file+"&title="+title+"&type="+type+"&goods_mokuai_id="+goods_mokuai_id;
	}
</script>
</html>