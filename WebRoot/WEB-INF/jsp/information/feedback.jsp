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
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <title>意见反馈</title>
    <style>
        .submit{
            position: absolute;
            bottom: 0;
            left: 0;
            z-index: 999;
            width: 100%;
            height: 50px;
            line-height: 50px;
            text-align: center;
            background-color: #40B55C;
            color: #fff;
            font-size: 15px;
            letter-spacing: 3px;
        }
        #textarea{
            position: relative;
            width: 100%;
            height: 190px;
            padding: 10px;
            resize: none;
            border-top: 1px solid #ECECEC;
            border-bottom: 1px solid #ECECEC;
        }
        .feedback{
            width: 100%;
            margin-top: 10px;
            height: 190px;
        }
        .feedback span{
            position: absolute;
            bottom: 15px;
            right: 15px;
        }
        
    </style>
</head>
<body ontouchstart>
<div class="feedback">
    <form action="api/kehu/${msg}.do?user_kehu_id=${user_kehu_id}" style="position: relative" id="from" method="post">
        <textarea name="textarea" id="textarea" placeholder="请输入您的建议"></textarea>
        <span>0 / 200</span>

    </form>
    <div class="submit" onclick="save();">提交</div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
    function save(){
         $("#from").submit();
    }
</script>
</body>
</html>