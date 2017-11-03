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
    <link rel="stylesheet" href="static/css/xcyl/querenDingdan.css"/>
    <script type="text/javascript" src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/xcyl/fastclick.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jquery-weui.js"></script>
    <script type="text/javascript" src="static/js/layer/mobile/layer.js"></script>
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
        .weui-tabbar{
            z-index: 630;
        }
        .xiaoji {
		    width: 100%;
		    height: 38px;
		    line-height: 3;
		}
		.xiaoji>span:nth-child(1) {
		    float: left;
		    color: #333;
		    margin-left: 0px;
		}
		.dianpu {
		    font-size: 14px;
		}
		.xin {
		    font-size: 14px;
		}
		
		.zq{

            float: right;
            font-size: 15px;
        }

        .zq img{
            margin-left: 5px;
		    width: 18px;
		    float: right;
		    height: 18px;
		    font-size: 15px;
		    color: #58BC4C;
		    margin-top: 5px;
        }
        .x_box1{
            width: 100%;
            height: 30px;
            line-height: 30px;
            border-bottom: 1px solid #efefef;
        }
    </style>
</head>
<body ontouchstart>
<div class="contentDiv">
    <a href="javascript:void(0)" class="dizhiDiv">
    	<c:if test="${not empty mrdzData.address}">
        	<p>${mrdzData.address}&nbsp;${mrdzData.detailAddress}</p>
        </c:if>
        <c:if test="${empty mrdzData.address}">
        	<p>${userData.address}&nbsp;${userData.detailAddress}</p>
        </c:if>
        <p>${userData.userName}<span>${userData.phone}</span></p>
    </a>
    <div class="shangpinList">
        <p class="dianpu">购买清单：</p>
        <div class="shangpinBox">
        <c:forEach items="${resultList}" var="rs">
            <div class="shangpin">
                <img src="${rs.img }" alt=""/>
                <div class="rightDiv">
                    <p><span>${rs.name }</span><span>￥${rs.price }</span></p>
                    <p>x${rs.num }</p>
                </div>
            </div>
         </c:forEach>
        </div>
    </div>
  <!--   <div class="peisongfei">
        <span>配送费</span>
        <span>￥3</span>
    </div> -->
    <div class="xiaoji">
        <span>商品金额：</span><i>￥${totolData.totol}</i>
    </div>
    <div class="xiaoji">
        <span>昨日补差：</span><i>￥</i><i id="bucha">${userData.bucha}</i>
    </div>
    <div class="xiaoji">
        <span>费用总计：</span><i>￥${userData.bucha>0?((totolData.totol)+(userData.bucha)):((totolData.totol)+(userData.bucha))}</i>
    </div>
    <div class="xiaoji">
        <span>账户余额：</span><i>￥${userData.balance}</i>
    </div>
    <div class="xin">
        <span>本次支付：￥<fmt:formatNumber type="number" value="${userData.bucha>0?((totolData.totol)+(userData.bucha))-(userData.balance):((totolData.totol)+(userData.bucha))-(userData.balance)}" pattern="#.00"/></span>
    </div>
     <div class="x_box1" style="padding: 0 3%;background-color: white;margin: 10px 0;font-size: 14px">
                支付方式：
                <div class="zq" style="float: right">
                    <span>货到付款</span>
                    <img src="static/images/xcyl/gou5.png" alt=""/>
                </div>
                <div class="zq" style="margin-right: 25px;">
                    <span>在线支付</span>
                    <img src="static/images/xcyl/gou5.png" alt=""/>
                </div>
                

      </div>
    <div style="font-size: 12px;color: red;">
    	补差价说明：补差价大于0表示客户补差给门店，补差价小于0表示门店补差给客户。
    </div>
   <!--  <div class="xiaoji">
        <span style="float: left;margin:0;">备注</span>
        <a href="api/kehu/beizhu.do">输入你想说的... <i class="iconfont icon-arrow_r"></i></a>
    </div> -->
</div>
<!--底部-->
<div class="tqfooter">
    <div class="ft-lt">
        <div class="price plet" >
            <div class="peis">
            	<input type="hidden" id="payType">
                <span>应付</span>￥<span id="total" class="total"><fmt:formatNumber type="number" value="${userData.bucha>0?((totolData.totol)+(userData.bucha))-(userData.balance):((totolData.totol)+(userData.bucha))-(userData.balance)}" pattern="#.00"/></span>
            </div>
        </div>
    </div>
    <div class="ft"  style="display: block;">
        <p><a id="jiesuan" href="javascript:void(0);" onclick="jiesuan()">去支付</a></p>
    </div>
</div>
<script>
    $(function () {
        FastClick.attach(document.body);
        $(".rightDiv").width($(".shangpin").width()-52);
    });
     $(".zq img").click(function(){
        $(this).attr("src","static/images/xcyl/gou4.png");
        $(this).parent().siblings().find("img").attr("src","static/images/xcyl/gou5.png");
        if($(this).parent().find("span").text()=="货到付款"){
    		$("#jiesuan").text("提交订单");
    	}else{
    		$("#jiesuan").text("去支付");
    	}
        $("#payType").val($(this).parent().find("span").text());
    });
    
    function jiesuan(){
    	var total = $("#total").text();
    	var payType = $("#payType").val();
    	var bucha = $("#bucha").text();
    	if(payType=="" || payType==undefined){
    	//提示
		  layer.open({
		    content: '请选择支付方式'
		    ,skin: 'msg'
		    ,time: 2 //2秒后自动关闭
		  });
		  return false;
    	}
    
    	if(payType=="在线支付"){
    		layer.open({
		    content: '在线支付暂未开通'
		    ,skin: 'msg'
		    ,time: 2 //2秒后自动关闭
		  });
		   return false;
    	}
    	window.location.href="api/kehu/jiesuan.do?total="+total+"&payType="+payType+"&bucha="+bucha;
    };
</script>
</body>
</html>