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
    <link rel="stylesheet" href="static/css/xcyl/beizhu.css"/>
    <script type="text/javascript" src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/xcyl/fastclick.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jquery-weui.js"></script>
    <title>小菜一篮</title>
    <style>
        a{
            cursor:none;
        }
        .mask{
            background-color:rgba(0,0,0,0.3);
            display:none;
        }
        ::-webkit-scrollbar{width:0px;height:0px;}
        body{
            background-color:#fff;
        }
    </style>
</head>
<body ontouchstart>
    <div class="contentDiv">
        <textarea class="beizhu" placeholder="口味、偏好等要求"></textarea>
        <a href="querenDingdan.html" class="wancheng">完成</a>
    </div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>