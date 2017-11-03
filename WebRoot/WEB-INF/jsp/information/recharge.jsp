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
    <link rel="stylesheet" href="static/css/xcyl/recharge.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <title>我的钱包</title>
    <style>
        .cash{
            width: 100%;
            overflow: hidden;

            margin-top: 10px;
            background-color: #fff;
            border-top: 1px solid #efefef;
            border-bottom: 1px solid #efefef;
        }
        .cash_t{
            display: block;
            width: 100%;
            height: 50px;
            line-height: 30px;
            padding: 10px 3%;

        }
        .cash_t span{
            color: #333;
            font-size: 15px;
            float: left;
        }
        .icon-arrow_r{
            font-size: 15px;
            float: right;
        }
    </style>
</head>
<body ontouchstart>
<div class="pic">
    <div class="pic_t">
        <div class="pic_t_l">
            <img src="static/images/xcyl/money.png" alt=""/>
        </div>
        <div class="pic_t_r">
            <p class="balance">余额 (元)</p>
            <p class="price">0.00</p>
        </div>
        <div class="pic_t_b">充值</div>
    </div>
</div>
<div class="cash">
    <a href="api/kehu/zhifuyue.do" class="cash_t" style="border-bottom: 1px solid #efefef;">
        <span >支付余额记录</span>
        <i class="iconfont icon-arrow_r"></i>
    </a>
    <a href="api/kehu/bucha.do" class="cash_t">
        <span>补差金额记录</span>
        <i class="iconfont icon-arrow_r"></i>
    </a>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
</script>
</body>
</html>