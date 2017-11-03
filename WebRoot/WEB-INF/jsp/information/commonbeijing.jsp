<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!-- 引入标签库 -->
<%@include file="/common/include/taglibs.jsp" %>
<%-- <%
	String path = request.getContextPath();
	String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%> --%>
<!DOCTYPE html>
<html>
<head lang="en">
    <%--  <base href="<%=basePath%>"> --%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no">
    <link rel="stylesheet" href="static/css/xcyl/weui.css">
    <link rel="stylesheet" href="static/css/xcyl/jquery-weui.css">
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <link rel="stylesheet" href="static/css/xcyl/myorder.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
</head>
<style>
	.w_order {
	    position: fixed;
	    top: 23%;
	    left: 50%;
	    text-align: center;
	    width: 150px;
	    overflow: hidden;
	    margin-left: -75px;
	    padding-top: 70px;
	}

</style>
<body ontouchstart>
<!--主体-->
<div class="weui-tab">
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:47px;">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
            <!--暂时没有订单-->
            <div class="w_order">
                <img src="static/images/xcyl/kong.png" alt=""/>
                <p>暂时没有数据！</p>
            </div>
        </div>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
        $("#t2").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    });
</script>
</body>
</html>