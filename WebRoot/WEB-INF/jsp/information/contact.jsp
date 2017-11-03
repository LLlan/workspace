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
    <link rel="stylesheet" href="static/css/xcyl/weui.css">
    <link rel="stylesheet" href="static/css/xcyl/jquery-weui.css">
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <link rel="stylesheet" href="static/css/xcyl/contact.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <title>联系我们</title>
    <style>
        .img_b_t1 {
            display: flex;
            width: 100%;
            height: 140px;
            padding: 15px 3%;
            border-bottom: 1px solid #E8E8E8;
        }
        .img_b_t1>img{
            width: 25px;
            height: 25px;

            margin-right: 10px;
        }
        .img_b_t1 span{
            font-size: 14px;
        }
        .kefu img{
            width: 80px;
            height: 80px;
            display: block;
            margin-top: 10px;
            margin-left: 40px;
        }
        .img_b{
            background-color: #fff;
        }
    </style>
</head>
<body ontouchstart>
<div class="img">
    <img src="static/images/xcyl/shopname.png" alt=""/>
</div>
<c:forEach items="${contactlist }" var="clist">
<div class="img_b">
    <a href="javascript:void(0);" class="img_b_t">
        <img src="static/images/xcyl/location.png" alt=""/>
        <span>${clist.weizhi}${clist.detailWeizhi}</span>
    </a>
    
    <a href="javascript:void(0);" class="img_b_t">
        <img src="static/images/xcyl/phone.png" alt=""/>
        <span >${clist.hotline}</span>
    </a>
</div>
 </c:forEach>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>