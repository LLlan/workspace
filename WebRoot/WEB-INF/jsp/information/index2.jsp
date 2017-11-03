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
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-capable" content="yes">
    <link rel="stylesheet" href="static/css/xcyl/iconfont.css"/>
    <link rel="stylesheet" href="static/css/xcyl/yahu.css"/>
    <link rel="stylesheet" href="static/css/xcyl/jquery-weui.css"/>
    <link rel="stylesheet" href="static/css/xcyl/weui.css"/>
    <link rel="stylesheet" href="static/css/xcyl/swiper-3.4.2.min.css">
    <link rel="stylesheet" href="static/css/xcyl/commen.css"/>
    <link rel="stylesheet" href="static/css/xcyl/index.css"/>
    <script type="text/javascript" src="static/js/xcyl/jquery-2.1.4.js"></script>
    <script type="text/javascript" src="static/js/xcyl/fastclick.js"></script>
    <script type="text/javascript" src="static/js/xcyl/jquery-weui.js"></script>
    <script type="text/javascript" src="static/js/xcyl/flexible.js"></script>
    <script type="text/javascript" src="static/js/xcyl/iscroll.js"></script>
    <script type="text/javascript" src="static/js/xcyl/navbarscroll.js"></script>
    <script type="text/javascript" src="static/js/xcyl/swiper.js"></script>
    <script type="text/javascript" src="http://api.map.baidu.com/api?v=2.0&ak=f2C9QaeY2zU9joj3Z34DG2gThH70Pwzl"></script> 
    <title>鲜鲜一篮</title>
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
        #topNav {
            width: 100%;
            overflow: hidden;
            font: 16px/32px hiragino sans gb, microsoft yahei, simsun;
            background-color: #fff;
        }

        #topNav .swiper-slide{
            width:25%;
            height:112px;
        }
        .swiper-slide>img{
            width:48px;
            height:48px;
            margin:20px auto 0;
        }
        .swiper-slide {
            height:112px;
            width: 25%;
            color:#333;
            float: left;
            font-size:13px;
            text-align: center
        }
        .swiper-slide  a{
            color:#333;
        }
        .swiper-slide.hot{
            background-color:#f9f9f9;
            border-bottom:2px solid #28ac48;
            border-right:1px solid #efefef;
        }
         .swiper-slide  a {
            color: #333;
            display: block;
            margin: 0 .1rem;
        }
        
        .img_list_box>img {
		    width: 98px;
		    height: 98px;
		    padding: 10px;
		}
		.gouwuche>div:not(.first1) {
		    padding: 11px 0;
		    background-color: #fff;
		}
		.first1 {
		    padding: 8px 3%;
		    background-color: #f0f0f0;
		    color: #999;
		    font-size: 14px;
		}
		.clearB {
		    float: right;
		    padding-right: 18px;
		    background: url(static/images/xcyl/lajitong.png) right no-repeat;
		    background-size: 16px 16px;
		}
		.tqfooter {
		    z-index: 700;
		    display: none;
		}
		
		.foodsort {
		    width: 80px;
		}
    </style>
    
    <style type="text/css">
   		  /*新加样式*/
        .box1{
            width:94%;
            height:45px;
            line-height: 45px;;
            margin:0 auto;
        }
        .box1>a:nth-child(2){
            display: block;
            width: 65%;
            height: 28px;
            line-height: 28px;
            background-color: #fff;
            border-radius: 4px;
            text-align: center;
            font-size: 14px;
            color: #646464;
            float: right;
        }
        .box1>a:nth-child(1){
            display:block;
            width:30%;
            height:28px;
            line-height: 28px;
            float: left;
            background-color: #fff;
            border-radius: 4px;
            font-size: 14px;;
            text-align: center;
            color:#333;
        }
        .box1>a:nth-child(1)>i{
            font-size:16px;
            color:#333;
        }
        .swiper-container2{
            height:129px;
            position: relative;
        }
        .swiper-container2 img{
            width:100%;
            height:129px;
            margin:0;
        }
        .ovh{
            top:0px;
            position: relative;
            left:0px;
        }
        .swiper-pagination-bullet{
            background-color:rgba(255,255,255,0);
            border:1px solid #fff;
            width:10px;
            height: 10px;
        }
        .swiper-pagination-bullet-active{
            background-color:#fff;;
        }
        .bgf4,.scroll_food{
            padding-bottom:100px;
        }
        .redprice>span{
            font-size:12px;;
        }
        .hedui{
            width:166px;
            height:27px;
            line-height: 27px;
            background-color:rgba(0,0,0,0.6);
            color:#fff;
            text-align: center;
            border-radius: 4px;;
            position: absolute;
            left:-5px;
            top:-40px;
        }
        .hedui>img{
            width:19px;
            height:11px;
            position: absolute;
            left:20px;
            top:26px;
        }
        .d-stock {
		    width: 52%;
		}
		.redprice {
		    width: 48%;
		}
        .d-stock>a:nth-child(1){
            background-color:#209035;
            color:#fff;
            font-size: 18px;;
        }
        .foodlist_label{
        	height:30px;
        	line-height:30px;
        	margin:0;
        	padding:0;
        }
        
        
        /*输入框*/
        .tanchuBox{
            width:76%;
            height:120px;
            background-color:#fff;
            border:1px solid #efefef;
            border-radius:8px;
            position: fixed;
            top:35%;
            left:13%;
            display: none;
            z-index: 999999;
        }
        .tanchuBox>p:nth-child(1){
            width:100%;
            height:75px;
            line-height: 75px;
            color:#000;
            font-size: 16px;
            text-align: center;
            border-bottom: 1px solid #efefef;
        }
        .tanchuBox>p:nth-child(1) input{
            width: 40%;
            height: 42px;
            padding: 0px 5px;
            border-radius: 10px;
            border: 1px solid #efefef;
        }
        .tanchuBox>p:nth-child(2){
            width:100%;
            height:45px;
            line-height:45px;
            color:#000;
            font-size:16px;
        }
        .tanchuBox>p:nth-child(2)>a{
            display: block;
            width:50%;
            height:45px;
            line-height: 45px;
            color:#333;
            float: left;
            text-align: center;
        }
        .tanchuBox>p:nth-child(2)>a:nth-child(1){
            border-right:1px solid #efefef;

        }
        .tanchuBox>p:nth-child(2)>a:nth-child(2){
            color: #53ce7d;
        }
        .mask{
            width:100%;
            height:100%;
            position: fixed;
            top:0;
            left:0;
            z-index:600;
            display: none;
            opacity: 0.5;
        }
        .text_box {
		    width: 23px;
		}
		.chooseClass{
			background-color: #40b55c;
		}
    	</style>
</head>
<body ontouchstart>
 	<!-- <div class="searchDiv">
        <a href="api/kehu/search.do"><i class="iconfont icon-sousuo"></i>请输入您的搜索内容</a>
    </div> -->
    <div class="searchDiv">
        <div class="box1">
            <a href="javascript:void(0)"><i class="iconfont icon-dizhi"></i><span class="dizhi"></span></a>
            <a href="javascript:void(0)"><i class="iconfont icon-sousuo"></i>请输入您的搜索内容</a>
        </div>
    </div>
    <!--轮播图-->
  <!--  <div class="swiper-container2">
        <div class="swiper-wrapper">
            <div class="swiper-slide"><img src="static/images/xcyl/banner1.png"/></div>
            <div class="swiper-slide"><img src="static/images/xcyl/banner1.png"/></div>
            <div class="swiper-slide"><img src="static/images/xcyl/banner1.png"/></div>
        </div>
        <div class="swiper-pagination"></div>
    </div> -->
    
     <div class="swiper-container" id="topNav">
          <ul class="swiper-wrapper">
			<c:forEach items="${daohangMKlist }" var="daohangMKlists" varStatus="vs" >
	                <a id="tid${vs.index+1}" ttid="${daohangMKlists.goods_mokuai_id}" onclick="yilan('${daohangMKlists.goods_mokuai_id}',this)" href="javascript:void(0)" class="swiper-slide" data-tpye="#st${vs.index+1 }"><img src="${daohangMKlists.goods_mokuai_Img_url }" alt=""/><li style="margin-left:0;">${daohangMKlists.title }</li></a>
			<%--    <c:if test="${daohangMKlists.type=='1' }">
	                <a id="tid${vs.index+1}" ttid="${daohangMKlists.goods_mokuai_id}" onclick="yilan('${daohangMKlists.goods_mokuai_id}',this)" href="javascript:void(0)" class="swiper-slide hot" data-tpye="#st${vs.index+1 }"><img src="${daohangMKlists.goods_mokuai_Img_url }" alt=""/><li style="margin-left:0;">${daohangMKlists.title }</li></a>
			   </c:if> --%>
			</c:forEach>
          </ul>
    </div>
    <div id="tab1"  class="contentDiv">
            <div class="ovh" >
                <div  class="bgf4" style="overflow: auto">
                    <div class="gundLeft">
                        <ul id="food_sort">
	                         <%-- <c:forEach items="${goodsCategoryList}" var="clist" varStatus="vs">
	                            <c:forEach items="${clist}" var="clist" varStatus="vs" >
		                            	<li class="foodsort"><a data-tpye="#st${vs.index+1 }">${clist.categoryName}</a></li>
	                            </c:forEach>
	                         </c:forEach> --%>
	                         <c:forEach items="${goodsCategoryList}" var="clist" varStatus="vs">
                            	<li id="sts${vs.index+1}" class="foodsort"><a data-tpye="#st${vs.index+1 }">${clist.categoryName}</a></li>
                        	 </c:forEach>
	                            <!-- <li class="foodsort checked"><a data-tpye="#st1" class="curr" >默认</a></li>
	                            <li class="foodsort  "><a data-tpye="#st3">根茎类</a></li>
	                            <li class="foodsort  "><a data-tpye="#st4">芽苗类</a></li>
	                            <li class="foodsort  "><a data-tpye="#st5">花菜类</a></li>
	                            <li class="foodsort  "><a data-tpye="#st6">果菜类</a></li>
	                            <li class="foodsort"><a data-tpye="#st2">菌类</a></li>
	                            <li class="foodsort  "><a data-tpye="#st3">有机蔬菜</a></li>
	                            <li class="foodsort  "><a data-tpye="#st4">其他</a></li> -->
                        </ul>
                    </div>
                </div>
                <div id="scroll_food" class="right" style="width:75%;overflow:auto;">
                    <div id="food_img_list" class="bgf">
                   	 	<c:forEach items="${goodsList}" var="good" varStatus="vs">
                   	 		<h6 class="foodlist_label" id="st${vs.index+1}" style="text-align: left;">${good[0].categoryName}</h6>
	                        <div class="foodlist_box"  >
	                        	<c:forEach items="${good}" var="good">
		                            <ul>
		                                <li>
		                                    <div class="img_list_box" tid="${good.goods_id}">
		                                        <img  class="img_list_img" src="${good.goodsImg }" >
		                                    </div>	
		                                    <div class="shop_style">
		                                        <h3 class="food_img_name">${good.goodsName }</h3>
		                                        <p class="font12 clo9" style="margin-top:5px;">最高￥${good.topPrice }</p>
		                                        <p class="font12 clo9">建议￥${good.advisePrice }</p>
		                                        <div class="jiacar">
		                                            <div class="redprice">
		                                                	<span>￥</span><span class="price">${good.shangjiaPrice }/${good.danwei}</span>
		                                            </div>
		                                            <div class="weui-flex__item shop-cart">
		                                            <div class="d-stock">
		                                                <a class=" increase" onclick="addCar('${good.goods_id}','${good.goodsName }','${good.shangjiaPrice }','${good.danwei }','${good.goodsImg }',this)">+</a>
		                                                <input id="num" nid="n${vs.index+1}" class="result text_box" mid="${good.goods_id}" mstr="${good.goodsName },${good.shangjiaPrice },${good.danwei},${good.goodsImg }"  type="text" value="0">
		                                                <a class="minus decrease" onclick="reduce('${good.goods_id}','${good.goodsName }','${good.shangjiaPrice }','${good.danwei }','${good.goodsImg }',this)">-</a>
		                                            </div>
		                                            </div>
		                                        </div>
		                                    </div>
		                                </li>
		                            </ul>
	                            </c:forEach>
	                        </div>
                        </c:forEach>
                    </div>
                </div>
            </div>
            <!--底部-->
            <div class="gouwuche">
                <div class="first1"><span class="ydsp">我的菜篮子</span><span class="clearB">清空购物车</span></div>
                <div class="shangpBox">
                	<!-- 点击后显示购物车内容 -->
                </div>
            </div>
            <div class="tqfooter">
                <div class="ft-lt">
                    <div class="cart">
                        <a class="nm" href="javascript:void(0);">
                            <div class="cart-num"></div>
                        </a>
                         <p class="hedui">挑选好了，去核对一下吧！<img src="static/images/xcyl/arrowbtn.jpg" alt=""/></p>
                    </div>
                    <div class="price plet" >
                        <div class="peis" style="display: none;">
                            <span>￥</span>
                            <span id="total" class="total"></span>
                        </div>
                    </div>
                </div>
                <div class="ft"  style="display: block;">
                    <p><a id="jiesuan" href="javascript:void(0);">立即下单</a></p>
                </div>
            </div>
            <!-- 点击照片显示详情页-->
            <div id="food_img" style="display: none;">
                <div class="food_img_box pop1 gonggaoa" style="display: none;">
                    <i class="guanbi1"></i>
                    <p class="food_img_see " style="width: 100%;height:240px;">
                        <!-- <img src="static/images/xcyl/nm.jpeg" id="food_img_path" style="width: 100%; height: 100%;"> -->
                        <img src="111" id="food_img_path" style="width: 100%; height: 100%;">
                    </p>
                    <div class="food-name">
                        <span id="cainame"></span>
                        <span id="img_list_price_box"></span>
                    </div>
                    <div class="shuom" id="food_detail">
                        <p>商品暂无介绍</p>
                    </div>
                    <div class="kucun">
                        <span>库存: 50斤</span>
                        <span>累计下单: 168份</span>
                        <span>规格: 500g/份</span>
                    </div>
                    <div class="shoujia">
                        <span id="food_descs">12.0</span>
                       	<span id="food_desc">11.5</span>
                        <i></i>
                        <span>售价<i>￥</i><i id="sj">10.5</i></span>
                    </div>
                </div>
            </div>
        </div>
        
     <!--弹出输入框，选择商品数量-->
      <!-- <div class="tanchuBox">
        <p><input type="number" placeholder="请输入价格"></p>
        <p><a href="javascript:void(0)" class="quxiao">取消</a><a href="javascript:void(0)" class="queren">确定</a></p>
    </div> -->
    <!-- 放在下面的js里动态添加了 yym -->
    <div class="mask"></div>
    <!-- 当列表为空时，暂无数据 -->
 	<c:if test="${empty goodsCategoryList}"><%@include file="commonbeijing.jsp" %></c:if>
   <%@include file="buttom.jsp" %>
   <script type="text/javascript" src="http://api.map.baidu.com/getscript?v=2.0&ak=f2C9QaeY2zU9joj3Z34DG2gThH70Pwzl&services=&t=20170823191629"></script>
	<script type="text/javascript" src="http://developer.baidu.com/map/jsdemo/demo/convertor.js"></script>
	<script type="text/javascript" src="http://api.map.baidu.com/getscript?type=quick&file=feature&ak=o9B4Ol99j9NcBXSu5nFTR7uI&t=20140109092002"></script>      
   <script>
        $(".swiper-container2").swiper({
            loop: true,
            autoplay: 3000
        });
    </script>
 <script type="text/javascript">
//清除订单缓存信息  by zjh 2017-9-4 17:31:59
var zjhid="${h5User.user_kehu_id}";
if(zjhid!=""){
	$.post('api/kehu/clearCar',{},function(data){
		console.log("清除成功");
	});
		
}

//by yym 数组集合操作+
    var map=new Map();
	function Map() { 
		//创建map结构
		var struct = function(key, value) { 
			this.key = key; 
			this.value = value; 
		};
		
		var put = function(key, value){ 
		for (var i = 0; i < this.arr.length; i++){ 
			if (this.arr[i].key === key ) {
				this.arr[i].value = value; 
				return; 
			} 
		} 
			this.arr[this.arr.length] = new struct(key, value); 
		}; 
		
		var get = function(key) { 
		for (var i = 0; i < this.arr.length; i++) { 
			if ( this.arr[i].key === key ) { 
				return this.arr[i].value; 
			} 
		} 
			return null; 
		};
		
		
		var remove = function(key) { 
		var v; 
		for (var i = 0; i < this.arr.length; i++) { 
			//从尾部删除并返回删除的元素
			v = this.arr.pop(); 
			if (v.key === key ){ 
					continue; 
			} 
			this.arr.unshift(v); 
			
			} 
		};
		
		var clears = function(){
			 this.arr = new Array();
			
		};
		
		//得到集合的长度
		var size = function() { 
			return this.arr.length; 
		}; 
		
		//清空
		var isEmpty = function() { 
			return this.arr.length <= 0; 
		}; 
		this.arr = new Array(); 
		this.get = get; 
		this.put = put; 
		this.remove = remove; 
		this.size = size; 
		this.isEmpty = isEmpty; 
		this.clears = clears;
	}
</script>
   
<script>
//从确认订单页面返回 刷新当前页
    if(window.name != "isRefresh"){
    	location.reload();
   		window.name = "isRefresh";
	}else{
	    window.name = "";
	}
        $(function () {
            FastClick.attach(document.body);
            /* $(".bgf4").height($(window).height()-256);
            $("#scroll_food").height($(window).height()-256); */
            $(".bgf4").height($(window).height()-337+129);//208-129
	        $("#scroll_food").height($(window).height()-337+129);
            $("#st1").addClass("checked");
            $("#food_sort>li").click(function(){
                $(this).addClass("checked");
                $(this).siblings().removeClass("checked");
            });
          	$(".img_list_box").height($(".img_list_box").width());
            $("#food_img").height($(window).height());
        });
        
        $(function(){
			var tid = "${tid}";
			if(tid==""){
				$("#tid1").addClass("hot");
				var ttid=$("#tid1").attr("ttid");
				var pid = "tid1";
				location.href="api/kehu/index.do?goods_mokuai_id="+ttid+"&tid="+pid;
			}else{
				$("#"+tid).addClass("hot");
			}
			
			//让左边小分类第一个默认选中
			$("#food_sort>li:first").addClass("chooseClass");
			$("#food_sort>li").click(function(){
				$(this).addClass("chooseClass").siblings().removeClass("chooseClass");
			});
		});
        function yilan(id,e1){
        	var type = '2';
        	location.href="api/kehu/index.do?goods_mokuai_id="+id+"&tid="+$(e1).attr("id");
        }
        
        //输入框输入事件 by yym 9-22 10.25
        $(".d-stock #num").each(function(){
        	//$(this).bind("input propertychange",function(){
        	 $(this).click(function(){
        	 			//动态添加
			        	 var afterHtml ='';
			        	 afterHtml+='<div class="tanchuBox">';
			        	 afterHtml+='<p><input type="number" placeholder="请输入数量"></p>';
			        	 afterHtml+='<p><a href="javascript:void(0)" class="quxiao">取消</a><a href="javascript:void(0)" class="queren">确定</a></p></div>';
			        	 $(this).parent().append(afterHtml);
        	 
        			   $(".mask").fadeIn();
			            $(".tanchuBox").fadeIn();
			            var sid = $(this).attr("mid");
			            var vstr =  $(this).attr("mstr");
			            var nn;
			            var vstrss = vstr.split(",");
			            var newstr;
			            //蘑菇,900.0,,uploadFiles/uploadImgs/shangjia/shangpin/20170919/935531ee60834554a2afce839c4e54aa.jpg,22
			            $(".queren").click(function(){
			                nn = $(this).parent().siblings().find("input").val();
			                $(".mask").fadeOut();
			                $(".tanchuBox").fadeOut();
			                for(var y=0;y<vstrss.length;y++){
			                	newstr = vstrss[0]+","+vstrss[1]+","+vstrss[2]+","+nn+","+vstrss[3];
			                }
			                var myvalus =newstr;
		        			map.put(sid,myvalus);
		        			//找到点击的那个输入框把并赋值
		        			$(this).parent().parent().parent().find("input").val(nn);
		        			Total();
		        			console.log(map);
			            });
			            //取消
			              $(".quxiao").click(function(){
			                $(".mask").fadeOut();
			                $(".tanchuBox").fadeOut();
			            });
			       
        	});
        });
        
           /*弹出输入框，选择商品数量*/
      /*   $("#num").click(function(){
            $(".mask").fadeIn();
            $(".tanchuBox").fadeIn();
            $(".queren").click(function(){
                console.log($(this).parent().siblings().find("input").val());
                $(this).parent().siblings().find("input").val();
                $(".mask").fadeOut();
                $(".tanchuBox").fadeOut();
            });
            $(".quxiao").click(function(){
                $(".mask").fadeOut();
                $(".tanchuBox").fadeOut();
            })
        }); */
    </script>
    <!--点击照片显示详情页-->
    <script>
        $(".img_list_box>img").click(function(e){
            event.stopPropagation();
            $("#food_img").show();
            $(".gonggaoa").show();
            //$(".tqfooter").css("bottom","0");
            $(".gouwuche").css("bottom","49px");
            //ajax查出商品详情
            $.post('api/kehu/getGoodDetailByID.do',{good_id:$(this).parent().attr("tid")},function(data){
	        	$("#food_img_path").attr("src",data.rpd.goodsImg);
	        	$("#cainame").text(data.rpd.goodsName);
	        	$("#food_descs").text("最高￥"+data.rpd.originalPrice);
	        	$("#food_desc").text("建议￥"+data.rpd.presentPrice);
	        	$("#sj").text(data.rpd.canhefei);
	        	$("#food_detail").text(data.rpd.goodsIntroduce);
	        });
       

        });
        //详情卡关闭
         $("#food_img .guanbi1").click(function(){
             $("#food_img").fadeOut();
             //$(".tqfooter").css("bottom","49px");
             $(".gouwuche").css("bottom","98px");
         });
    </script>
    <script type="text/javascript">
        $(function(){
            /*滑动选择对应产品*/
            $(".swiper-slide").click(function(){
                $(this).addClass("hot").siblings().removeClass("hot");
            });


            var mySwiper = new Swiper('#topNav', {
                freeMode: true,
                freeModeMomentumRatio: 0.5,
                slidesPerView: 'auto',

            });
            swiperWidth = mySwiper.container[0].clientWidth;
            maxTranslate = mySwiper.maxTranslate();
            maxWidth = -maxTranslate + swiperWidth / 2;
        });
    </script>
    <script>
        //购物车减
    function reduce(id,name,shangjiaPrice,danwei,img,e1){
            var reduce=$(e1).parent().find(".text_box").val();
            if(reduce>1){
                reduce--;
                $(e1).parent().find(".text_box").val(reduce)
            }else{
                $(e1).fadeOut();
                $(e1).parent().find(".text_box").fadeOut();
                $(e1).parent().find(".text_box").val(0);
                $("#total").html("");
            }
            Total();
            //添加到集合中
	        var num=$(e1).parent().find(".text_box").val();//数量
	    	var myValues = name+","+shangjiaPrice+","+danwei+","+num+","+img;
	    	num=parseInt(num)+1;
	    	if(parseInt(num)==1){
	    		map.remove(id);
	    	}else{
	    		map.remove(id);
	    		var newNum = parseInt(num)-1;
	    		var myValues = name+","+shangjiaPrice+","+danwei+","+newNum+","+img;
	    		map.put(id,myValues);
	    	}
	    		
	    	if(map.size()>0){
	    		$(".tqfooter").css("display","block");
	    	}else{
	    		$(".tqfooter").css("display","none");
	    	}
	    	console.log(map)
        }
	    //购物车加
	    function addCar(id,name,shangjiaPrice,danwei,img,e1){
       		var add=$(e1).parent().find(".text_box").val();
            add++;
            if(add>0){
                $(e1).parent().find(".minus").fadeIn();
                $(e1).parent().find(".text_box").fadeIn();
            }
            $(e1).parent().find(".text_box").val(add);
            Total();
	        //添加到集合中
	        var num=$(e1).parent().find(".text_box").val();//数量
	    	var myValues = name+","+shangjiaPrice+","+danwei+","+num+","+img;
	    	map.put(id,myValues);
	    	if(map.size()>0){
	    		$(".tqfooter").css("display","block");
	    	}else{
	    		$(".tqfooter").css("display","none");
	    	}
	    	console.log(map)
    	}
    	
    	//去结算
    	function goTotol(){
    	 var user_shangjia_id = $("#user_shangjia_id").val();
		$.post('api/kehu/saveOrderTemp.do',
           {
	           user_shangjia_id:user_shangjia_id,
	           map:map.arr,
	           mkID:"${mkID}"
           },function(data){
           		console.log(data);
           		if(data.respCode=="01"){
           			window.location.href="api/kehu/querenDingdan.do?user_shangjia_id="+user_shangjia_id;
           		}else{
           			//未登录
           			window.location.href="api/kehu/toLogin.do";
           		}
           }); 
    	}
    	
    
    
     	//计算合计
        function Total(){
            var price=0;
            $(".shop-cart").each(function(){
                price += parseInt($(this).find('input[class*=result]').val()) * parseFloat($(this).siblings().find('span[class*=price]').text());
                //console.log(price)
               // console.log(parseFloat($(this).siblings().find('span[class*=price]').text()))
            });
          /*   var n=0;
            var nIn = $("li.foodsort a.curr").attr("data-tpye");
            $(nIn + " input[class*=result]").each(function () {
                n+=parseInt($(this).val());
                if (n > 0) {
                    $(".curr").next().html(n).show();
                } else {
                    $(".curr").next().hide();
                }
            });
 */

            var num=0;
            $(".text_box").each(function(){
                num+=parseInt($(this).val());
            });
            if(num>0){
                $(".ft-lt").css("width","75%");
                $(".ft-rt").fadeIn();
                $(".ft").fadeIn();
                $(".font6").css("margin-top","-1px");
                $(".font6").css("font-size","10px");
                $(".peis").fadeIn();
                $(".cart-num").fadeIn().html(num);
            }else{
                $(".ft-lt").css("width","100%");
                $(".ft-rt").fadeOut();
                //$(".ft").fadeOut();//by zjh 注释 2017-9-4 09:52:07
                $(".font6").css("margin-top","13px").fadeIn();
                $(".font6").css("font-size","16px");
                $(".peis").fadeOut();
                $(".cart-num").fadeOut().html("");
            }

            $("#total").html(price.toFixed(2));
            
            //商家起送金额//by zjh 添加 2017-9-4 09:52:07
            var deliveryAmount="${shangjiaData.deliveryAmount}";
            if(price>deliveryAmount){
            	$(".ft").css("background-color","#43E365");
            	$(".ft").attr("onclick","goTotol()");
            	$("#jiesuan").html("去结算");
            }else{
            	$(".ft").css("background-color","#ddd");
            	$(".ft").attr("onclick","");
            	if(price==0){
                    //$(".ft").css("display","block");
                    $(".ft-lt").css("width","75%");
                    $(".ft").fadeIn();
            		$("#jiesuan").html(deliveryAmount+"元起送");
            	}else{
            		var temp=deliveryAmount-price;
                	$("#jiesuan").html("还差    "+temp);
            	}
            }
        }
    </script>
    <script>
        //清空购物车
           $(".clearB").click(function(){
            $(".gouwuche").hide();
            $(".mask").fadeOut();
            //rr();
            //total();
            //by zjh 注释 2017-9-4 09:52:07
            location.href=location.href;
          });
          
          function rr(){
          	   	console.log(map.arr.length)
            for(var i=0;i<map.arr.length;i++){
            	map.remove(map.arr[i].key);
            	map.arr.length--;
            }
          }
          
    //点击购物车图标68551779
    $(".cart,.peis").click(function(){
    	$(".hedui").css("display","none");
        event.stopPropagation();
        if($(".gouwuche").is(":hidden")){
            $(".mask").fadeIn();
            //slideDown();
            $(".gouwuche").slideDown();
            renderGouwuche();
        }else{
            $(".mask").fadeOut();
            $(".gouwuche").slideUp();
        }
        
    });
    
    //js渲染购物车
    function renderGouwuche(){
     	$("div.gouwuche *").not(".first1").not(".ydsp").not(".clearB").each(function() { // "*"表示div.gouwuche下的所有元素
          		  $(this).remove();
       		 });
            for(var i=0;i<map.arr.length;i++){
           		var id = map.arr[i].key;
           	 	var rsArr = map.arr[i].value.split(",");
           	 	
           	 	//rsArr[0]=商品名字 rsArr[1]=价格，2=餐盒费 3=数量
           	 	for(var y=0;y<1;y++){
           	 		 var appendHtml = '<div class="shangp">';
		   			 appendHtml+='<span>'+rsArr[0]+'</span>';
		   			 appendHtml+='<span class="bianjishul" style="display: inline-block;">';
		   			 appendHtml+='<a class="jian1" onclick="jianjian(\''+id+'\',\''+rsArr[0]+'\',\''+rsArr[1]+'\',\''+rsArr[2]+'\',\''+rsArr[3]+'\',\''+rsArr[4]+'\')">-</a>';
		   			 appendHtml+='<input type="text" class="num" value="'+rsArr[3]+'" style="width:20px;border:none;outline: none;">';
		   			 appendHtml+='<a class="jia1" onclick="jiajia(\''+id+'\',\''+rsArr[0]+'\',\''+rsArr[1]+'\',\''+rsArr[2]+'\',\''+rsArr[3]+'\',\''+rsArr[4]+'\')">+</a>';
		   			 appendHtml+='</span>';
		   			 appendHtml+='<span class="danjia">￥'+rsArr[1]+'</span></div>';
           			 $(".first1").after(appendHtml);
           	 	}
            	
            } 
    
    }
   
      /*   $(document).click(function(event){
            var _con = $('.gouwuche');   // 设置目标区域
            if(!_con.is(event.target) && _con.has(event.target).length === 0){ // Mark 1

                $(".mask").fadeOut();
                $(".gouwuche").slideUp();
            }
        }); */
    
        
        //购物车减
    	function jianjian(id,name,price,canhefei,num,weight){
    		if(parseInt(num)==1){
	    		map.remove(id);
	    		renderGouwuche();
	    		total();
	    	}else{
	    		map.remove(id);
	    		var newNum = parseInt(num)-1;
	    		var myValues = name+","+price+","+canhefei+","+newNum+","+weight;
	    		map.put(id,myValues);
	    		renderGouwuche();
	    		total();
	    	}
	    	   var sname =name;
	    	  //--------------查找原来所有的物品 改变上边物品的数量begin-----------// 
			    var all = $(".foodlist_box .shop_style");
				for(var i=0;i<all.length;i++){
					//console.log(all.eq(i).find("h3").html());
					if(all.eq(i).find("h3").html()==sname){
						//console.log(all.eq(i).find(".shop-cart").find(".text_box").val())
						var num = all.eq(i).find(".shop-cart").find(".text_box").val();
						num--;
						//alert(num)
						all.eq(i).find(".shop-cart").find(".text_box").val(num)
						if(num==0){
							all.eq(i).find(".shop-cart").find(".text_box").hide();
							all.eq(i).find(".shop-cart").find(".text_box").parent().find(".decrease").hide();
						}
					}
				}
			 //--------------查找原来所有的物品 改变上边物品的数量end-----------// 
      		if(map.size()>0){
	    		$(".tqfooter").css("display","block");
	    	}else{
	    		$(".tqfooter").css("display","none");
	    	}
      	}
        
        //购物车加
         function jiajia(id,name,price,canhefei,num,weight){
        	num= parseInt(num)+1;
        	var myvalues = name+","+price+","+canhefei+","+num+","+weight; 
        	map.put(id,myvalues);
        	renderGouwuche();
        	total();
        	var sname =name;
      		//--------------查找原来所有的物品 改变上边物品的数量begin-----------// 
			    var all = $(".foodlist_box .shop_style");
				for(var i=0;i<all.length;i++){
					//console.log(all.eq(i).find("h3").html());
					if(all.eq(i).find("h3").html()==sname){
						//console.log(all.eq(i).find(".shop-cart").find(".text_box").val())
						var num = all.eq(i).find(".shop-cart").find(".text_box").val();
						num++;
						//alert(num)
						all.eq(i).find(".shop-cart").find(".text_box").val(num)
					}
				} 
			 //--------------查找原来所有的物品 改变上边物品的数量end-----------// 
        }
        
        
        //计算购物车合计
        function total(){
            var price=0;
            var carNum = 0;
            for(var i=0;i<map.arr.length;i++){
       	 		var rsArr = map.arr[i].value.split(",");
       	 		//rsArr[0]=商品名字 rsArr[1]=价格，2=餐盒费 3=数量
        	 	for(var y=0;y<1;y++){
        	 		price+= rsArr[1]*rsArr[3];
        	 		carNum = parseInt(carNum)+parseInt(rsArr[3]);
        	 	}
       	 	}
            if(price.toFixed(2)==0){
            	$(".ft-lt").css("width","100%");
                $(".ft-rt").fadeOut();
                //$(".ft").fadeOut();//by zjh 注释 2017-9-4 09:52:07
                $(".font6").css("margin-top","13px").fadeIn();
                $(".font6").css("font-size","16px");
                $(".peis").fadeOut();
                $(".cart-num").fadeOut().html("");
            }else{
            	$(".cart-num").fadeIn().html(carNum);
            	$("#total").html(price.toFixed(2));
            }
          	//商家起送金额//by zjh 添加 2017-9-4 09:52:07
            var deliveryAmount="${shangjiaData.deliveryAmount}";
            if(price>deliveryAmount){
            	$(".ft").css("background-color","#43E365");
            	$(".ft").attr("onclick","goTotol()");
            	$("#jiesuan").html("去结算");
            }else{
            	$(".ft").css("background-color","#ddd");
            	$(".ft").attr("onclick","");
            	if(price==0){
                    //$(".gouwuche").css("display","none");
                    $(".mask").hide();
            		$(".gouwuche").hide();
                    $(".ft-lt").css("width","75%");
                    $(".ft").fadeIn();
            		$("#jiesuan").html(deliveryAmount+"元起送");
            	}else{
            		var temp=deliveryAmount-price;
                	$("#jiesuan").html("还差    "+temp);
            	}
            }
            
        }
    </script>
<script type="text/javascript">
    var a=$('[id^="st"]');
    var arr1=[];
    var arr=[];
    var hei=$('body>div:first-child').height();
    for(var i=0;i<a.length;i++){
        var l=$(a[i]).offset().top;
        arr1.push(l);
        var m=$(a[i]).position().top;
        arr.push(m);
    }
    $('li.foodsort').click(function(){
        $('#scroll_food').scrollTop(arr[$(this).index()]-10);
        $(this).addClass('hover').siblings().removeClass('hover');
        $(this).find("a").addClass('curr').parent().siblings().find("a").removeClass('curr');
    });
</script>
  <script type="text/javascript">
        $(function(){
			onloadss();            
        });
        
         //获取定位坐标经纬度  by yym
		function onloadss(){
		//定位
		 	var geolocation  = new BMap.Geolocation;
			geolocation.getCurrentPosition(function(position){
			//geolocation.getCurrentPosition(function(position) {
				latitude = position.latitude;//经度
				longitude = position.longitude;//纬度
				console.log("----position是：---"); 
				console.log(position.address.city); 
				console.log(position); 
				console.log("latitude:"+latitude); 
				console.log("longitude:"+longitude); 
				
				$(".dizhi").text(position.address.city);
				
			    var gpsPoint = new BMap.Point(longitude, latitude);
			    //转换坐标  
			    BMap.Convertor.translate(gpsPoint, 0, function (point){  
				    var geoc = new BMap.Geocoder();  
				    geoc.getLocation(point, function (rs){ 
				   	 console.log(rs); 
				         var addComp = rs.addressComponents; 
				         if(addComp.city==""){
				            $(".location").text("北京"); 
				         }else{
				           	$(".location").text(addComp.city); 
				         }
				         console.log("地址是："+addComp.province + ", " + addComp.city + ", " + addComp.district + ", " + addComp.street + ", " + addComp.streetNumber);  
				    });  
				});  
			} ); 
		
	}	
    </script>
</body>
</html>