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
    <link rel="stylesheet" href="static/css/xcyl/my.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <title>个人中心</title>
    <style type="text/css">
    	.backlogin{
    		display:block;
    		width:100%;
    		text-align: center;
		    width: 90%;
		    margin: 10px auto 10px auto;
		    border-radius: 10px;
		    border-bottom: none;
		    font-size: 14px;
    	}
    </style>
</head>
<body ontouchstart>
<div class="pic">
    <div class="pic_t">
        <img src="static/images/xcyl/denglong.png" alt=""/>
        <h1>${userData.userName }</h1>
        <p class="name">${userData.address}${userData.detailAddress}</p>
        <p><i></i></p>
    </div>
</div>
<div class="xinxiList" style="margin-top: 60px;">
  <!--   <a href="api/kehu/recharge.do">
        <img src="static/images/xcyl/money.png" alt=""/>
        <span>我的钱包</span>
        <i class="iconfont icon-arrow_r"></i>
    </a> -->
    <a href="api/kehu/dizhi.do">
        <img src="static/images/xcyl/wode2.png" alt=""/>
        <span>我的地址</span>
        <i class="iconfont icon-arrow_r"></i>
    </a>
    <a href="api/kehu/feedback.do" style="margin-top:10px;">
        <img src="static/images/xcyl/wode3.png" alt=""/>
        <span>意见反馈</span>
        <i class="iconfont icon-arrow_r"></i>
    </a>
    <a href="api/kehu/contact.do" class="out_login">
        <img src="static/images/xcyl/wode5.png" alt=""/>
        <span>联系我们</span>
        <i class="iconfont icon-arrow_r"></i>
    </a>
    <a href="javascript:void(0)">
        <img src="static/images/xcyl/wode4.png" alt=""/>
        <span>关于我们</span>
        <i style="font-style: inherit;font-size: 14px;">2.0.1</i>
    </a>
    <a href="api/kehu/tuichu.do" class="backlogin">
        	退出登录
    </a>
</div>
<!--底部导航-->
      <%@include file="buttom.jsp"%>
<script>
    $(function() {
        FastClick.attach(document.body);
         $("#t3").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    });
</script>
</body>
</html>