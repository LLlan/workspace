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
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="format-detection" content="telephone=no">
    <link rel="stylesheet" href="static/css/sx/iconfont.css"/>
    <link rel="stylesheet" href="static/css/sx/yahu.css"/>
    <link rel="stylesheet" href="static/css/sx/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/sx/weui.css"/>
    <link rel="stylesheet" href="static/css/sx/commen.css"/>
    <script type="text/javascript" src="static/js/sx/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/sx/fastclick.js"></script>
    <script type="text/javascript" src="static/js/sx/jquery-weui.js"></script>
    <title>下单成功</title>
    <style>
        body{
            background-color:#fff;
        }
        .contentDiv{
            width:100%;
            padding-top:60px;
        }
        .contentDiv>img{
            width:20%;
            margin:0 40%;
        }
      /*  .contentDiv>p:nth-child(2){
            width:100%;
            height:20px;
            line-height: 20px;
            font-size: 20px;
            color:#000;;
            text-align: center;
            margin-top:10px;
        }*/
        .chengg{
            width:100%;
            height:50px;
            line-height: 50px;
            text-align: center;
        }
        .chengg>a:nth-child(1){
            margin-right:20px;
        }
		.contentDiv>h3{
			text-align:center;
			font-size:20px;
			margin:30px 0;
		}
    </style>
</head>
<body >
<div class="contentDiv">
	<h3>下单成功！</h3>
    <img src="static/images/xcyl/xiadanss.png" alt=""/>
    <p class="chengg"><a href="api/kehu/orderList.do">订单详情</a><a href="api/kehu/index.do">返回首页</a></p>
</div>
<script>
    $(function() {
        FastClick.attach(document.body);
     /*   setInterval(function(){
            window.location.href="my.html";
        }, 5000);/!*等待时间*!/*/
    });
</script>
</body>
</html>