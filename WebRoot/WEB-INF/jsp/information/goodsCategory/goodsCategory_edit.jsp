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
</head>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#goods_mokuai_id").val() == ""){
			$("#goods_mokuai_id").tips({
				side:3,
	            msg:'请选择商品所属菜篮',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#goods_mokuai_id").focus();
			return false;
		}
		if($("#NAME").val()==""){
			$("#NAME").tips({
				side:3,
	            msg:'请输入商品类别名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#NAME").focus();
			return false;
		}
		//判断是否已经存在
		/* var url='api/kehu/spflselectByName.do';
		$.post(url,{"categoryName":$("#NAME").val()},function(data){
			if("已存在" == data.result){
				$("#NAME").tips({
					side:3,
		            msg:'该名称已存在',
		            bg:'#AE81FF',
		            time:2
		        });
				$("#NAME").focus();
			}else{
				$("#Form").submit();
			}
		}); */
		$("#Form").submit();
	}
</script>
<body>
	<form action="api/kehu/${msg }.do" name="Form" id="Form" method="post" >
	<input type="hidden" name="goods_category_id" value="${pd.goods_category_id}"/>
		<div id="zhongxin">
		</div>
			<table id="table_report"  class="table table-striped table-bordered table-hover">
				<tr>
					<td>商品所属菜篮:</td>
					<td>
						<input type="hidden" name="goods_mokuai_fid" id="goods_mokuai_fid" value="${pd.goods_mokuai_fid}"/>
						<select  name="goods_mokuai_id" id="goods_mokuai_id">
							<option value="${pd.goods_mokuai_fid }">请选择商品所属菜篮</option>
							<c:forEach items="${mokuailist }" var="mokuailists">
								<option value="${mokuailists.goods_mokuai_id }" <c:if test="${mokuailists.goods_mokuai_id==pd.goods_mokuai_fid }">selected="selected"</c:if>>${mokuailists.title }</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td>商品类别名称:</td>
					<td><input type="text" name="categoryName" id="NAME" placeholder="这里输入商品类别的名称" value="${pd.categoryName }" title="名称"/></td>
				</tr>
				<tr>
					<td style="text-align: center;" colspan="2">
						<a class="btn btn-mini btn-primary" onclick="save();">保存</a>
						<a class="btn btn-mini btn-danger" onclick="top.Dialog.close();">取消</a>
					</td>
				</tr>
			</table>
		</div>
		<div id="zhongxin2" class="center" style="display:none"><br/><br/><br/><img src="static/images/jzx.gif" style="width: 50px;" /><br/><h4 class="lighter block green"></h4></div>
	</form>
</body>

</html>