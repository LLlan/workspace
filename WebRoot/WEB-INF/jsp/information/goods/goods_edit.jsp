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
	function jump(id){
		var goodsName = $("#goodsName").val();
		var goods_category_id = $("#goods_category_id").val();
		var goodsImg = $("#goodsImg").val();
		var goodsState = $("#goodsState").val();
		var goodsIntroduce = $("#goodsIntroduce").val();
		var topPrice = $("#topPrice").val();
		var advisePrice = $("#advisePrice").val();
		var shangjiaPrice = $("#shangjiaPrice").val();
		var shanghuPrice = $("#shanghuPrice").val();
		var danwei_id = $("#danwei_id").val();
		var Stock = $("#Stock").val();
		window.location.href="api/kehu/jumpupload?goods_id="+id+"&goodsName="+goodsName+"&goods_category_id="
		+goods_category_id+"&goodsImg="+goodsImg+"&goodsState="+goodsState+"&goodsIntroduce="
		+goodsIntroduce+"&topPrice="+topPrice+"&advisePrice="+advisePrice+"&shangjiaPrice="+shangjiaPrice+"&shanghuPrice="+shanghuPrice+"&danwei_id="+danwei_id+"&Stock="+Stock;
	}
</script>
<script type="text/javascript">
	$(top.hangge());
	//保存
	function save(){
		if($("#goodsName").val()==""){
			$("#goodsName").tips({
				side:3,
	            msg:'请输入商品名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#goodsName").focus();
			return false;
		}
		if($("#goods_category_id").val()==""){
			$("#goods_category_id").tips({
				side:3,
	            msg:'请选择商品分类名称',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#goods_category_id").focus();
			return false;
		}
		if($("#goodsImg").val()==""){
			$("#goodsImg").tips({
				side:3,
	            msg:'请上传商品图片',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#goodsImg").focus();
			return false;
		}
		if($("#topPrice").val()==""){
			$("#topPrice").tips({
				side:3,
	            msg:'请输入最高价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#topPrice").focus();
			return false;
		}
		if($("#advisePrice").val()==""){
			$("#advisePrice").tips({
				side:3,
	            msg:'请输入建议价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#advisePrice").focus();
			return false;
		}
		if($("#shangjiaPrice").val()==""){
			$("#shangjiaPrice").tips({
				side:3,
	            msg:'请输入上架价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#shangjiaPrice").focus();
			return false;
		}
		if($("#shanghuPrice").val()==""){
			$("#shanghuPrice").tips({
				side:3,
	            msg:'请输入商户价',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#shanghuPrice").focus();
			return false;
		}
		if($("#danwei_id").val()==""){
			$("#danwei_id").tips({
				side:3,
	            msg:'请选择商品计量单位',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#danwei_id").focus();
			return false;
		}
		if($("#Stock").val()==""){
			$("#Stock").tips({
				side:3,
	            msg:'请输入商品库存',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#Stock").focus();
			return false;
		}
		if($("#weight").val()==""){
			$("#weight").tips({
				side:3,
	            msg:'请输入商品规格',
	            bg:'#AE81FF',
	            time:2
	        });
			$("#weight").focus();
			return false;
		}
		//判断是否已经存在
		/* var url='api/kehu/goodsselectByName.do';
		$.post(url,{"goodsName":$("#goodsName").val()},function(data){
			if("已存在" == data.result){
				$("#goodsName").tips({
					side:3,
		            msg:'该名称已存在',
		            bg:'#AE81FF',
		            time:1
		        });
				$("#goodsName").focus();
			}else{
				$("#Form").submit();
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
	<form action="api/kehu/${msg }.do" name="Form" id="Form" method="post" enctype="multipart/form-data">
	<input type="hidden" name="goods_id" value="${pd.goods_id}"/>
		<div id="zhongxin">
		<h3>编辑商品</h3>
		<table id="table_report"  class="table table-striped table-bordered table-hover">
			<tr>
				<td>商品名称:</td>
				<td>
					<input type="text" name="goodsName" id="goodsName" value="${pd.goodsName }" placeholder="商品名称"/>
				</td>
			</tr>
			<tr>
				<td>商品分类:</td>
				<td>
					<select name="goods_category_id" id="goods_category_id">
						<option value="">请选择商品所属类别</option>
						<c:forEach items="${list }" var="list">
							<option value="${list.goods_category_id }" <c:if test="${list.goods_category_id==pd.goods_category_id }">selected="selected"</c:if>>${list.categoryName }</option>
						</c:forEach>
					</select>
				</td>
			</tr>
			<tr>
				<td>商品图片:</td>
				<td>
					<%-- <input type="file" name="goodsImg" id="goodsImg" value="${pd.goodsImg }"/> --%>
					<c:if test="${pd == null || pd.goodsImg == '' || pd.goodsImg == null }">
						<input type="" id="goodsImg" name="goodsImg" onchange="fileType(this)" onclick="jump('${pd.goods_id}');" value="${pd.goodsImg}"/>
					</c:if>
					<c:if test="${pd != null && pd.goodsImg != '' && pd.goodsImg != null }">
						<a href="javascript:void(0);" onclick="jump('${pd.goods_id}');" target=""><img src="<%=basePath%>${pd.goodsImg}" width="200"/></a>
						<input type="hidden" name="goodsImg"  value="${pd.goodsImg }"/>
						<input type="" id="goodsImg" onchange="fileType(this)" onclick="jump('${pd.goods_id}');" value="${pd.goodsImg}"/>
					</c:if>
				</td>
			</tr>
			<tr>
				<td>请设置商品(上/下)架:</td>
				<td>
					<select name="goodsState" id="goodsState" title="是否">
						<option value="1" <c:if test="${pd.goodsState == '1' }">selected</c:if> >上架</option>
						<option value="0" <c:if test="${pd.goodsState == '0' }">selected</c:if> >下架</option>
					</select>
				</td>
			</tr>
			<tr>
				<td>商品详情简介:</td>
				<td>
					<textarea rows="" cols="" name="goodsIntroduce" id="goodsIntroduce">${pd.goodsIntroduce }</textarea>
				</td>
			</tr>
			<tr>
				<td>商品最高价:</td>
				<td>
					<input type="text" name="topPrice" id="topPrice" value="${pd.topPrice }" placeholder="商品最高价"/>
				</td>
			</tr>
			<tr>
				<td>商品建议价:</td>
				<td>
					<input type="text" name="advisePrice" id="advisePrice" value="${pd.advisePrice }" placeholder="商品建议价"/>
				</td>
			</tr>
			<tr>
				<td>商品上架价:</td>
				<td>
					<input type="text" name="shangjiaPrice" id="shangjiaPrice" value="${pd.shangjiaPrice }" placeholder="商品上架价"/>
				</td>
			</tr>
			<tr>
				<td>商户价:</td>
				<td>
					<input type="text" name="shanghuPrice" id="shanghuPrice" value="${pd.shanghuPrice }" placeholder="商户价"/>
				</td>
			</tr>
			<%-- <tr>
				<td>商品起订描述:</td>
				<td>
					<input type="text" name="describe" id="describe" value="${pd.describe }" placeholder="商品起订描述"/>
				</td>
			</tr> --%>
			<td>计量单位:</td>
			<td>
				<select name="danwei_id" id="danwei_id">
					<option value="">请选择商品计量单位</option>
					<c:forEach items="${sysManagerList }" var="sysManagerLists">
						<option value="${sysManagerLists.danwei_id }" <c:if test="${sysManagerLists.danwei_id==pd.danwei_fid }">selected="selected"</c:if>>${sysManagerLists.name }</option>
					</c:forEach>
				</select>
			</td>
			<tr>
				<td>商品库存:</td>
				<td>
					<input type="text" name="Stock" id="Stock" value="${pd.Stock }" placeholder="商品库存"/>
				</td>
			</tr>
			<%-- <tr>
				<td>商品规格:</td>
				<td>
					<input type="text" name="weight" id="weight" value="${pd.weight }" placeholder="商品规格"/>
				</td>
			</tr> --%>
			<tr>
				<td style="padding-left: 140px" colspan="2">
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
			$('#goodsImg').ace_file_input({
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
	})
</script>
</html>