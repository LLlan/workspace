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
    <link rel="stylesheet" href="static/css/xcyl/register.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <script src="static/js/layer/mobile/layer.js"></script>
    <title>找回密码</title>
</head>
<body ontouchstart>
<div class="x_register">
    <form action="">
        <div class="x_box_a">
            <div class="x_box">
                <label for="phone">手机号</label>
                <input type="text" id="phone" name="phone" maxlength="11" placeholder="请输入手机号"/>
                <input type="button" class="img-ver1" value="获取验证码" onclick="clickButton(this)">
            </div>
            <div class="x_box">
                <label for="Identify">验证码</label>
                <input type="text" id="Identify" name="Identify" placeholder="请输入验证码"/>
            </div>
        </div>
        <div class="x_box_a">
            <div class="x_box">
                <label for="pass">新密码</label>
                <input type="password" id="pass" name="pass" placeholder="新密码"/>
            </div>
            <div class="x_box">
                <label for="pass1">确认密码</label>
                <input type="password" id="pass1" name="pass1" placeholder="确认密码"/>
            </div>
        </div>
         <!-- 服务器返回的验证码 -->
        <input type="hidden"  name="fhyzm" id="fhyzm">
        <div class="register" onclick="wancheng();">确认重设</div>
    </form>
</div>
<script>
    $(function() {
        FastClick.attach(document.body);
    });
    var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
	var phoneReg = /^1[3-9]\d{9}$/;
    /* 获取验证码 */
    function clickButton(obj){
    	var obj1 = $(obj);
    	//请求获取验证码
		$.ajax({
			type : "post",
			url : "api/kehu/getSmspwd.do",
			data : {
				phone : $("#phone").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.respCode == "04") {
					 if ($("#phone").val() != ""&& phoneReg.test($("#phone").val())) {
						var obj = obj1;
						obj.attr("disabled", "disabled");/*按钮倒计时*/
						var time = 60;
						var set = setInterval(function() {
							obj.val(--time + "(s)");
						}, 1000);/*等待时间*/
						setTimeout(function() {
							obj.attr("disabled", false).val("重新获取");/*倒计时*/
							clearInterval(set);
						}, 60000);
					} else {
						//提示
						layer.open({
							content : '手机号码格式不正确!',
							skin : 'msg',
							time : 2
						//2秒后自动关闭
						});
					}
					//将返回的验证码赋到隐藏域中，用于注册带过去
					$("#fhyzm").val(data.yanzhengma);
					console.log(data.yanzhengma);
				} else if(data.respCode == "03") {
					layer.open({
						content : data.respMsg,
						skin : 'msg',
						time : 1.5
					//2秒后自动关闭
					});
				}else{
					layer.open({
						content : data.respMsg,
						skin : 'msg',
						time : 1.5
					//2秒后自动关闭
					});
				}
			}
		});
    }
    /*去执行修改密码*/
	function wancheng() {
		var phone = $("#phone").val();
		var password = $("#pass").val();
		$.ajax({
			url : "api/kehu/toUpdatePwd.do",
			type : "post",
			data : {
				phone : phone,
				password : $("#pass").val(),
				passwords : $("#pass1").val(),
				yzm : $("#Identify").val(),
				fhyzm : $("#fhyzm").val(),
			},
			success : function(data) {
				if (data.respCode == "01") {
					//提示
					layer.open({
						content : data.respMsg,
						skin : 'msg',
						time : 1.5
					//2秒后自动关闭
					});
					setTimeout(function() {
						window.location.href = "api/kehu/toLogin.do";
					}, 1000);
				} else {
					layer.open({
						content : data.respMsg,
						skin : 'msg',
						time : 1.5
					//2秒后自动关闭
					});
				}
			},
			error : function(e) {
				alert("出错误啦！！");
				//window.clearInterval(timer);
			}
		}); //ajax end
	}
</script>
</body>
</html>