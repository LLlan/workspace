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
    <link rel="stylesheet" href="static/css/xcyl/dizhi.css"/>
    <script type="text/javascript" src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/xcyl/fastclick.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jquery-weui.js"></script>
    <title>小菜一篮</title>
    <style>
        a{
            cursor:none;
        }
        ::-webkit-scrollbar{width:0px;height:0px;}
        .mask{
            display: none;
        }
    </style>
</head>
<body ontouchstart>
    <div class="contentDiv">
     <c:forEach items="${dizhiList}" var="dzList">
        <div class="dizhiDiv">
            <p class="lin1P"><span>${dzList.lianxirnName}</span><span>${dzList.phone}</span></p>
            <div class="dizhiBox">
                <p>${dzList.address}</p>
                <p>${dzList.detailAddress}</p>
            </div>
            <c:if test="${dzList.isDefault eq '1'}">
            <div class="moren">
                <a href="javascript:void(0)" class="morenA"><img src="static/images/xcyl/gou4.png" alt=""/><span>设为默认</span></a>
                <a href="javascript:void(0);" class="shanchu" onclick="deletes('${dzList.shouhuo_address_id}',this);"><img src="static/images/xcyl/shan.png" alt=""/><span>删除</span></a>
                <a href="api/kehu/edit.do?shouhuo_address_id=${dzList.shouhuo_address_id}" class="bianji" style="margin-right:10px;"><img src="static/images/xcyl/bian.png" alt=""/><span>编辑</span></a>
            </div>
            </c:if>
            <c:if test="${dzList.isDefault eq '0'}">
            <div class="moren">
                <a href="javascript:void(0);" class="morenA" onclick="isDefault('${dzList.shouhuo_address_id}',this);"><img src="static/images/xcyl/gou5.png" alt=""/><span>设为默认</span></a>
                <a href="javascript:void(0);" class="shanchu" onclick="deletes('${dzList.shouhuo_address_id}',this);"><img src="static/images/xcyl/shan.png" alt=""/><span>删除</span></a>
                <a href="api/kehu/edit.do?shouhuo_address_id=${dzList.shouhuo_address_id}" class="bianji" style="margin-right:10px;"><img src="static/images/xcyl/bian.png" alt=""/><span>编辑</span></a>
            </div>
            </c:if>
        </div>
      </c:forEach>
    <!-- 当列表为空时，暂无数据 -->
 	<c:if test="${empty dizhiList}"><%@include file="commonbeijing.jsp" %></c:if>
    </div>
    <a href="api/kehu/xinzengDizhi.do" class="xinzeng">
        <i>+</i>
    </a>
    <div class="mask"></div>
    <div class="tanchuBox">
        <p>确认删除此地址？</p>
        <p><a href="javascript:void(0)" class="quxiao">取消</a><a href="javascript:void(0)" class="queren">确认</a></p>
    </div>
    
    <div class="tanchuBoxs">
        <p>确认设为默认地址？</p>
        <p><a href="javascript:void(0)" class="quxiaos">取消</a><a href="javascript:void(0)" class="querens">确认</a></p>
    </div>
<script>
    $(function () {
        FastClick.attach(document.body);
    });
   	function isDefault(id){//执行设置默认地址
  	   var n;
       n=$(this);
       $(".mask").fadeIn();
       $(".tanchuBoxs").fadeIn();
       $(".querens").click(function(){
           $(".mask").fadeOut();
           $(".tanchuBoxs").fadeOut();
           n.parent().parent().remove();
           location.href="api/kehu/SetisDefaultAddress.do?shouhuo_address_id="+id;
       });
       $(".quxiaos").click(function(){
           $(".mask").fadeOut();
           $(".tanchuBoxs").fadeOut();
       });
   	}
    function deletes(id){//执行删除
		var n;
        n=$(this);
        $(".mask").fadeIn();
        $(".tanchuBox").fadeIn();
        $(".queren").click(function(){
            $(".mask").fadeOut();
            $(".tanchuBox").fadeOut();
            n.parent().parent().remove();
            location.href="api/kehu/addressDelete.do?shouhuo_address_id="+id;
        });
        $(".quxiao").click(function(){
            $(".mask").fadeOut();
            $(".tanchuBox").fadeOut();
        });
	}
    $(function(){
        $(".morenA").click(function(){
            $(this).find("img").attr("src","static/images/xcyl/gou4.png");
            $(this).parent().parent().siblings().find(".morenA").children("img").attr("src","static/images/xcyl/gou5.png");
        });
    });
</script>
</body>
</html>