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
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <link rel="stylesheet" href="static/css/xcyl/register.css"/>
    <link rel="stylesheet" href="static/css/xcyl/jquery-weui.css">
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <script src="static/js/layer/mobile/layer.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jsAddress.js"></script>
<style>
.dizhiDiv {
	width: 100%;
	overflow: hidden;
	background-color: #fff;
	padding: 0 5%;
	border-bottom: 1px solid #efefef;
	position:relative;
}

.dizhiDiv>p {
	width: 100%;
	height: 44px;
	line-height: 44px;
	color: #000;
	font-size: 15px;
}

.selectDiv {
	width: 100%;
	height: 50px;
	color: #9a9a9a;
	font-size: 15px;
}

.xiangxiDizhi {
	width: 100%;
	height: 54px;
	line-height: 54px;
	background-color: #fff;
	font-size: 15px;
	padding: 0 3%;
	border-top: 1px solid #efefef;
	border-bottom: 1px solid #efefef;
}

.xiangxiDizhi>input {
	width: 100%;
}

.dizhi>select {
	width: 30%;
	height: 30px;
	line-height: 30px;
	border: 1px solid #666;
	border-radius: 5px;
	margin-right: 1%;
	margin-top: 5px;
	color: #9a9a9a;
}

.register {
	position: fixed;
}

.x_register {
	margin-bottom: 60px;
}

.x_box {
	position: relative;
}

.x_box {
	padding: 15px 5%;
}

.icon-xinghao {
	font-size: 31px;
	color: #5EBE74;
}

.agree>a {
	display: inline-block;
	margin-top: 2px;
}

.sing_a {
	width: 100%;
	padding: 10px 3%;
	height: 50px;
	line-height: 30px;
	border: 1px solid #d4d4d4;
	border-radius: 5px;
	font-size: 13px;
	margin-top: 10px;
	background-color: #F7F7F7;
}

.zq {
	margin-left: 20px;
	float: left;
	font-size: 15px;
}

.zq img {
	width: 15px;
	height: 15px;
	font-size: 15px;
	color: #58BC4C;
}

.x_box1 {
	width: 100%;
	height: 30px;
	line-height: 30px;
	border-bottom: 1px solid #efefef;
}

.agree img {
	width: 17px;
	height: 17px;
	/* margin-top: -10px; */
	display: inline-block;
}

.weui-agree__text {
	color: #999;
	margin-top: 1px;
	font-size: 13px;
	vertical-align: top;
	display: inline-block;
}

.x_box i {
	position: absolute;
	top: 15px;
	left: -6px;
	z-index: 999;
	color:red;
}
 body{
            background-color: #EEEEEE;
        }
        .container{
            padding: 15px;
            width: 100%;
            overflow: hidden;
            margin-bottom: 60px;
        }
        .tixian{
            width: 100%;
            font-size: 15px;
            color: #3C3C3C;
            overflow: hidden;
            margin-bottom:20px;
        }
        .tixian h1,.jinfen h1{
            width: 100%;
            height: 30px;
            line-height: 30px;
            margin-bottom: 15px;
        }
        .tixian p,.jinfen p{
           margin-bottom: 15px;
            line-height: 20px;
        }
        .jinfen{
            width: 100%;
            font-size: 15px;
            color: #3C3C3C;
            overflow: hidden;
        }
        .right_cell{
        	position: fixed;		 
		    bottom: 0;		  
		    width: 100%;
		    height: 50px;
		    border: 1px solid #efefef;
		    border-radius: 5px;
		    text-align: center;
		    background-color: #40B55C;
		    color: #fff;
		    line-height: 50px;
        }
        
.dz{
	color:red;
	position:absolute;
	top:0;
	left:-6px;
}	
.xxdz{
	color:red;
	position:absolute;
	top:96px;
	left:-6px;
}	
</style>
<title>注册</title>
</head>
<body ontouchstart>
<div class="x_register">
    <form action="">
        <div class="x_box_a">
            <div class="x_box">
            	<i class="iconfont icon-xinghao"></i>
                <label for="phone">手机号</label>
                <input type="text" id="phone" name="phone" maxlength="11" placeholder="请输入手机号"/>
                <input type="button" class="img-ver1" value="获取验证码" onclick="clickButton(this)">
            </div>
            <div class="x_box">
           		<i class="iconfont icon-xinghao"></i>
                <label for="Identify">验证码</label>
                <input type="text" id="Identify" name="Identify" placeholder="请输入验证码"/>
            </div>
        </div>
        <div class="x_box_a">
            <div class="x_box">
            	<i class="iconfont icon-xinghao"></i>
                <label for="pass">新密码</label>
                <input type="password" id="pass" name="pass" placeholder="新密码"/>
            </div>
            <div class="x_box">
            	<i class="iconfont icon-xinghao"></i>
                <label for="pass1">确认密码</label>
                <input type="password" id="pass1" name="pass1" placeholder="确认密码"/>
            </div>
        </div>
         <div class="x_box_a" style="margin-top: 10px;">
         	<div class="x_box" style="border-bottom: none;">
                <i class="iconfont icon-xinghao"></i>
                <label for="pass">姓名</label>
                <input type="text" id="names" name="names" placeholder="请输入您的姓名"/>
            </div>
            <div class="x_box">
                <i class="iconfont icon-xinghao"></i>
                <label for="pass">性别</label>
                <input type="text" readonly id="sex" name="sex" placeholder="请选择您的性别"/>
            </div>
            <div class="x_box1">
                <div class="zq">
                    <span id="xinli">新历</span>
                    <img src="static/images/xcyl/gou5.png" alt=""/>
                </div>
                <div class="zq">
                    <span id="nongli">农历</span>
                    <img src="static/images/xcyl/gou5.png" alt=""/>
                </div>
            </div>
            <div class="x_box">
                <label for="pass1">生日</label>
                <input type="text" value=""  id="birthday" name="birthday" placeholder="请选择您的生日"/>
            </div>
        </div>
        <div class="x_box_a" style="margin-top: 10px;">
            <div class="x_box">
                <i class="iconfont icon-xinghao"></i>
                <label for="pass">商户名称</label>
                <input type="text" id="shanghuName" name="shanghuName" placeholder="请输入您的商户名称"/>
            </div>
            <div class="dizhiDiv">
                 <p><i class="iconfont icon-xinghao dz"></i>地址：</p>
                <div class="selectDiv">
                    <div class="dizhi">
                        <select name="cmbProvince" id="cmbProvince"></select>
                        <select name="cmbCity" id="cmbCity"></select>
                        <select name="cmbArea" id="cmbArea"></select>
                    </div>
                </div>
                <div class="xiangxiDizhi">
                    <i class="iconfont icon-xinghao xxdz"></i><input type="text" name="detailAddress" id="detailAddress" placeholder="详细地址（街道）"/>
                </div>
            </div>
        </div>
        <div class="agree">
            	<img alt="" src="static/images/xcyl/gou5.png">
            	<input type="hidden" id="agrees" name="agrees"/>
                  <span class="weui-agree__text" style="color: #333;">
                   	 我已同意<a href="javascript:void(0);" class="clickx" style="color:#40B55C">《鲜鲜一篮门店协议》</a>
                  </span>
           
            <a href="api/kehu/toLogin.do">已有账号，去登陆</a>
        </div>
        <!-- 服务器返回的验证码 -->
        <input type="hidden"  name="fhyzm" id="fhyzm">
        <!-- 日历（新历/农历） -->
        <input type="hidden" id="calendar" name="calendar"/>
        <div class="register" onclick="register()">注册</div>
    </form>
</div>

<!-- 协议内容 -->
<div class="xieyi" style="display:none;">
		<div class="right_cell">返 回</div>
	 <div class="container">
        <div class="tixian">
            <h1>一、鲜鲜一篮门店协议</h1>
            <p>1.提现账号姓名需要与账号实名认证过的身份一致。</p>
            <p>2.每周一、周四为固定提现日，每个提现日只能发起一次提现，每次提现金额的上限为3500元。</p>
            <p>3.提现申请提交后预计2-3个工作日内到账。</p>
            <p>4.如有异常，请在[侧边栏]-[联系客服]中，与在线客服进行沟通。</p>
        </div>
        <div class="jinfen">
            <h1>二、积分兑换规则</h1>
            <p>1.积分可兑换1元人民币</p>
            <p>2.积分兑换不设限制</p>
            <p>3.兑换立即生效，相应余额增加</p>
        </div>
    </div>
</div>
<script>
    $(document).ready(function(){
        addressInit('cmbProvince','cmbCity','cmbArea')
    })
    $("#birthday").calendar();
    /* 点击查看协议内容 */
   /** $(".clickx").click(function(){
    	$(".x_register").hide();
    	$(".xieyi").show();
    	$(".right_cell").click(function(){
    		$(".x_register").show();
    		$(".xieyi").hide();
    	})
    	
    })*/
    
    /* 点击是否同意协议*/
    $(".agree img").click(function(){
    	if($(this).attr("src")=="static/images/xcyl/gou5.png"){
    		$("#agrees").val("1");
    		$(this).attr("src","static/images/xcyl/gou4.png");
    	}else{
    		$("#agrees").val("0");
    		$(this).attr("src","static/images/xcyl/gou5.png");
    	}
    })
    /*选择新历、农历*/
    $(".zq img").click(function(){
	        $(this).attr("src","static/images/xcyl/gou4.png");
	        $(this).parent().siblings().find("img").attr("src","static/images/xcyl/gou5.png");
	         if ($(this).attr("src") == "static/images/xcyl/gou4.png") {//判断将选择的赋值给隐藏域
				$("#calendar").val($(this).prev().text());
			}
		});
	$(document).on("click", "#sex", function() {
		$.actions({
			actions : [ {
				text : "男",
				onClick : function() {
					$("#sex").val("男")
				}

			}, {
				text : "女",
				onClick : function() {
					$("#sex").val("女")
				}
			} ]
		});
	});
</script>
<script>
    $(function() {
        FastClick.attach(document.body);
        if($(".agree img").attr("src") == "static/images/xcyl/gou5.png"){//判断初始化默认是新历
       		 $("#agrees").val("0");
        }
    });
</script>
<script type="text/javascript">
	var reg = new RegExp(/[A-Za-z].*[0-9]|[0-9].*[A-Za-z]/);
	var phoneReg = /^1[3-9]\d{9}$/;
	var phones=/^(1[3|4|5|8])[0-9]{9}$/;
	/* 获取验证码 */
	function clickButton(obj) {
		var obj1 = $(obj);
		//请求获取验证码
		$.ajax({
			type : "post",
			url : "api/kehu/getSms.do",
			data : {
				phone : $("#phone").val()
			},
			dataType : "json",
			success : function(data) {
				if (data.respCode == "03") {
					if($("#phone").val() == ""){
						//提示
						layer.open({
							content : '手机号码不能为空!',
							skin : 'msg',
							time : 2
						//2秒后自动关闭
						});
					}else if ($("#phone").val() != ""&& phones.test($("#phone").val())) {
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
				} else {
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

	/*去执行注册*/
	function register() {
		var phone = $("#phone").val();
		var password = $("#pass").val();
		var address = $("#cmbProvince").val() + $("#cmbCity").val()
				+ $("#cmbArea").val();
		$.ajax({
			url : "api/kehu/toRegister.do",
			type : "post",
			data : {
				phone : phone,
				password : $("#pass").val(),
				passwords : $("#pass1").val(),
				yzm : $("#Identify").val(),
				fhyzm : $("#fhyzm").val(),
				names : $("#names").val(),/* 姓名 */
				sex : $("#sex").val(),/* 性别 */
				calendar : $("#calendar").val(),/* 日历（农历/新历） */
				birthday : $("#birthday").val(),/* 生日 */
				shanghuName : $("#shanghuName").val(),/* 商户名称 */
				agrees : $("#agrees").val(),/*是否已选菜篮协议*/
				address : address,/* 地址 */
				//cmbProvince : $("#cmbProvince").val(),/* 省 */
				//cmbCity : $("#cmbCity").val(),/* 市 */
				//cmbArea : $("#cmbArea").val(),/* 区、县 */
				detailAddress : $("#detailAddress").val()
			/* 详细地址 */
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