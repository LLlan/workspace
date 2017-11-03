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
    <link rel="stylesheet" href="static/css/xcyl/login.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <script src="static/js/layer/mobile/layer.js"></script>
    <title>登录</title>

</head>
<body ontouchstart style="background: url('static/images/xcyl/banner00.png') no-repeat 0 0;background-size: 100% 100%;">
<div class="name">鲜鲜一篮</div>
<div class="x_content">
    <form action="">
        <div class="x_box">
            <i class="iconfont icon-ren"></i>
            <input type="text" id="phone" placeholder="请输入手机号" maxlength="11" name="phone"/>
        </div>
        <div class="x_box">
            <i class="iconfont icon-mima"></i>
            <input type="password" id="password" name="password" placeholder="请输入密码"/>
        </div>
        <div class="agree">
            <label for="weuiAgree" class="weui-agree">
                <input id="weuiAgree" type="checkbox" class="weui-agree__checkbox">
          <span class="weui-agree__text" style="color: #fff;">
         	   记住我
          </span>
            </label>
        </div>
        <div class="login" onclick="checkLogin()">登录</div>
        <div class="login_b">
            <a href="api/kehu/register.do">快速注册</a>
            <a href="api/kehu/forget.do">忘记密码</a>
        </div>
    </form>

</div>
<script>
    $(function () {
        FastClick.attach(document.body);
        $("html").height($(window).height());
    });
    
	//检查服务器验证登录
	function checkLogin() {
		$.ajax({
			type : "post",
			url : "api/kehu/login.do",
			data : {
				phone : $("#phone").val(),
				password : $("#password").val()
			},
			dataType : "json",
			success : function(data) {
				var msg = data.respMsg;
				console.log(msg)
				if (data.respCode == "01") {
					location.href = "api/kehu/index.do";
				} else if (data.respCode == "02") {
					//提示
					layer.open({
						content : msg,
						skin : 'msg',
						time : 2
					//2秒后自动关闭
					});

				} else {
					//提示
					layer.open({
						content : msg,
						skin : 'msg',
						time : 2
					//2秒后自动关闭
					});
				}

			}
		});
	}
</script>
</body>
</html>