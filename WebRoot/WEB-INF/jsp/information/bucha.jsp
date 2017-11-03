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
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <title>补差金额记录</title>
    <style>
        .bucha{
            width: 100%;
            overflow: hidden;
        }
        .bucha_t{
            width: 100%;
            overflow: hidden;
            padding: 10px 3%;
            border-top: 1px solid #efefef;
            border-bottom: 1px solid #efefef;
            margin-top: 10px;
            background-color: #fff;
        }
        .bucha_t:last-child{
            margin-bottom: 10px;
        }
        .bucha_t p:first-child, .bucha_t p:last-child{
            width: 100%;
            height: 30px;
            line-height: 30px;
        }
        .bucha_t p:first-child span:first-child{
            float: left;
            font-size: 15px;
            color: #333;
        }
        .bucha_t p:first-child span:last-child{
            float: right;
            font-size: 15px;
            color: #333;
        }
        .bucha_t p:last-child{
            font-size: 12px;
            color: #ddd;
        }
    </style>
</head>
<body>
<div class="bucha">
    <div class="bucha_t">
        <p>
            <span>补差金额</span>
            <span>3.70</span>
        </p>
        <p>2017-08-30 15:36</p>
    </div>
    <div class="bucha_t">
        <p>
            <span>补差金额</span>
            <span>3.70</span>
        </p>
        <p>2017-08-30 15:36</p>
    </div>
    <div class="bucha_t">
        <p>
            <span>补差金额</span>
            <span>3.70</span>
        </p>
        <p>2017-08-30 15:36</p>
    </div>
</div>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>