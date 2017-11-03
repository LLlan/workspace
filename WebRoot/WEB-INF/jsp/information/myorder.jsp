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
    <link rel="stylesheet" href="static/css/xcyl/myorder.css"/>
    <script src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script src="static/js/xcyl/fastclick.js"></script>
    <script src="static/js/xcyl/jquery-weui.js"></script>
    <title>订单</title>
	<style type="text/css">
		.order_b span.p_price {
			    font-size: 12px;
		}	
		.order_t span:first-child {
		    max-width: 52%;
		  font-size: 13px;
		}
		.order_b {
		    line-height: 20px;
		}
	</style>
</head>
<body ontouchstart>
<!--主体-->
<div class="weui-tab">
    <div class="weui-navbar" style="position:fixed; top:0; left:0; right:0; height:44px;line-height: 35px; background:#fff;">
        <a class="weui-navbar__item proinfo-tab-tit font-14 weui-bar__item--on" id="tt1" href="api/kehu/orderList.do">代付款</a>
        <a class="weui-navbar__item proinfo-tab-tit font-14" id="tt2" href="api/kehu/orderList.do?payState=2">待处理</a>
        <a class="weui-navbar__item proinfo-tab-tit font-14" id="tt3" href="api/kehu/orderList.do?payState=3">派送中</a>
        <a class="weui-navbar__item proinfo-tab-tit font-14" id="tt4" href="api/kehu/orderList.do?payState=4">已完成</a>

    </div>
    <div class="weui-tab__bd proinfo-tab-con" style="padding-top:47px;">
        <div id="tab1" class="weui-tab__bd-item weui-tab__bd-item--active">
        <c:choose>
        	<c:when test="${empty finaList}">
        	 <!--暂时没有订单-->
	            <div class="w_order">
	                <img src="static/images/xcyl/kong.png" alt=""/>
	                <p>暂时没有任何订单！</p>
	            </div> 
        	</c:when>
        	<c:otherwise>
            <!--已有的订单-->
            <c:forEach items="${finaList}" var="result">
            <div class="order">
                <div class="order_t">
                    <span>订单号:${result.orderNumber}</span>
                    <span>${result.orderTime}</span>
                </div>
                <ul class="order_m">
                <c:forEach items="${result.resultList}" var="rs">
                    <li>
                        <div class="order_m_l">
                            <img src="${rs.img }" alt=""/>
                        </div>
                        <div class="order_m_r">
                            <p class="fruit">${rs.goodsName }</p>
                            <p class="num">x${rs.goodsNum }</p>
                            <span class="price">¥${rs.price }</span>
                        </div>
                    </li>
                  </c:forEach>
                </ul>
                <div class="order_b">
                   <%--  <a style="background-color: #EC1E45;">补差：￥${result.bucha}</a> --%>
                    <span class="p_price" style="color: #EC1E45">补差：￥${result.bucha}</span>
                    <span class="p_price" style="color: #EC1E45">商品总计：¥${result.totalSum}</span>
                    <span class="p_price" style="color: #EC1E45">总共支付：￥${result.paySum}</span>

                </div>
           		 </div>
               </c:forEach>
            </c:otherwise>
        </c:choose>
        </div>
    </div>
</div>
   <%@include file="buttom.jsp" %>
<script>
    $(function () {
        FastClick.attach(document.body);
        $("#t2").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    });
    
    $(function(){
    	var payState = "${pd.payState}";
    	if(payState=="1"){
    		 $("#tt1").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}else if(payState=="2"){
    		 $("#tt2").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}else if(payState=="3"){
    		 $("#tt3").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}else{
    		$("#tt4").addClass("weui-bar__item--on").siblings().removeClass("weui-bar__item--on");
    	}
    })
</script>
</body>
</html>