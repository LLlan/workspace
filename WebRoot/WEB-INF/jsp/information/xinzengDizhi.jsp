<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!-- 引入标签库 -->
<%@include file="/common/include/taglibs.jsp" %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
<head lang="en">
     <base href="<%=basePath%>">
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/xcyl/weui.css"/>
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <link rel="stylesheet" href="static/css/xcyl/xinzengDizhi.css"/>
    <link rel="stylesheet" href="static/css/xcyl/layer.css"/>
    <script type="text/javascript" src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/xcyl/fastclick.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jquery-weui.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jsAddress.js"></script>
    <script type="text/javascript" src="static/js/xcyl/layer.js"></script>
    <title>小菜一篮</title>
    <style>
        a{
            cursor:none;
        }
        ::-webkit-scrollbar{width:0px;height:0px;}
        .mask{
            display: none;
        }
    </style>
</head>
<body ontouchstart>
<form action="api/kehu/${msg}.do" id="Form" method="post"> 
<input type="hidden" name="shouhuo_address_id" id="shouhuo_address_id" value="${dizhi.shouhuo_address_id}">   
<div class="contentDiv">
    <div class="xinxiDiv">
        <div class="xinxi">
           <label for="name" id="lianxiren">姓名：</label>
            <input type="text" name="lianxirnName" id="lianxirnName" value="${dizhi.lianxirnName}" placeholder="请输入您的收货人姓名"/>
        </div>
        <div class="xinxi">
            <label for="tel" id="telephone">电话：</label>
            <input type="number" name="phone" id="phone" value="${dizhi.phone}" maxlength="11" onkeyup="value=value.replace(/[\W]/g,'')" placeholder="请输入您的收货人联系电话" />
        </div>
    </div>
    <div class="dizhiDiv">
        <p>收货地址：</p>
        <div class="selectDiv">
            <div class="dizhi">
                <select name="cmbProvince" id="cmbProvince"></select>省
                <select name="cmbCity" id="cmbCity"></select>市
                <select name="cmbArea" id="cmbArea"></select>区/县
            </div>
        </div>
    </div>
    <div class="xiangxiDizhi" id="detadizhi">
        <input type="text" name="detailAddress" id="detailAddress" value="${dizhi.detailAddress}" placeholder="详细地址（街道）"/>
    </div>
</div>
<a href="javascript:void(0)" onclick="save();" class="save">保存</a>
<div class="mask"></div>
</form>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    $(function(){
        var n;
        $(".shanchu").click(function(){
            n=$(this);
            $(".mask").fadeIn();
            $(".tanchuBox").fadeIn();
            $(".queren").click(function(){
                $(".mask").fadeOut();
                $(".tanchuBox").fadeOut();
                n.parent().parent().remove();
            });
            $(".quxiao").click(function(){
                $(".mask").fadeOut();
                $(".tanchuBox").fadeOut();
            });
        });
    });
    
     //验证手机格式的正则表达是
	var phoneReg=/^1[3-9]\d{9}$/;
	var mobileRule=/^(1[3|4|5|8])[0-9]{9}$/;
	
	function save(){
	       var lianxirnName = $("#lianxirnName").val();//联系人姓名
	       var phone = $("#phone").val();//联系电话
	       var detailAddress = $("#detailAddress").val();//详细地址
	       
	      //判断联系人姓名是否为空
	      if(lianxirnName==""){
			layer.tips('请输入您的真实姓名！', '#lianxiren', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		//判断手机号是否为空
		if(phone==""){
			layer.tips('请输入正确的手机号！', '#telephone', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		//判断手机号格式是否为正确
		if(!phoneReg.test(phone)){
			layer.tips('手机号的格式错误！', '#telephone', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		//判断详细地址是否为空
		if(detailAddress == ""){
			layer.tips('请填写详细地址！', '#detadizhi', {
	     		  tips: [1, '#D9006C'],
	     		  time: 3000
	     	});
			return;
		}
		$("#Form").submit();
	}
    
</script>
<script>
     $(document).ready(function(){
        addressInit('cmbProvince','cmbCity','cmbArea','${cmbProvince}','${cmbCity}','${cmbArea}');
    })
</script>
</body>
</html>