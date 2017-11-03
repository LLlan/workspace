<!--城市查找-->

$(function(){
    /*手机版*/
    $(".phone_ban").click(function(){
        if($(this).hasClass("hhh")){
            $(this).removeClass("hhh");
            $(".erm").hide();
            $(this).css("color","#7f7f7f");
        }else{
            $(this).addClass("hhh");
            $(".erm").show();
            $(this).css("color","#ed1b24");
        }
    });
    $(".header li").click(function(){
        $(this).children("a").css("color","#ed1b24");
        $(this).siblings().children("a").css("color","#7f7f7f");
    });
    $(".address").click(function(){
        if($(this).hasClass("red1")){
            $(this).removeClass("red1");
            $(this).children("span").css("color","#000");
            $(".addressBox").css("display","none");
        }else{
            $(this).addClass("red1");
            $(this).children("span").css("color","#fff");
            $(".addressBox").css("display","block");
        }
    });
    $(".city>ul>li").click(function(){
        $(this).children("a").addClass("red2");
        $(this).siblings().children("a").removeClass("red2");
        var check=$(this).index();
        $(".city01").children("p").eq(check).css("display","block");
        $(".city01").children("p").eq(check).siblings().css("display","none");
    });
    $(".city01>p>a").click(function(){
        $(this).css("color","#ed1b24");
        $(this).siblings().css("color","#000");
        $(".address").text($(this).html());
        $(".address").css("text-align","center");
    });
    $(".wotixian>ul>li>a").click(function(){
        $(this).addClass("bor");
        $(this).parent().siblings().children().removeClass("bor");
    });
    $(".vipleft>ul>li").click(function(){
        $(this).css("border","1px solid #ee1b24");
        $(this).css("border-radius","5px");
        $(this).siblings().css("border","#fff");
        $(this).children().css("color","#ee1b24");
        $(this).siblings().children().css("color","#747474");
    });
    /*获取验证码*/
    function clickButton(obj){
        var obj = $(obj);
        obj.attr("disabled","disabled");/*按钮倒计时*/
        var time = 60;
        var set=setInterval(function(){
            obj.val(--time+"(s)");
        }, 1000);/*等待时间*/
        setTimeout(function(){
            obj.attr("disabled",false).val("重新获取");/*倒计时*/
            clearInterval(set);
        }, 60000);
    }
    /*手风琴效果*/
    $(".f1").click(function(){
        $(".submit1").hide();
        $(".submit2").hide();
        if($(this).hasClass("ff")){
            $(this).removeClass("ff");
            $(".f2").removeClass("ff");
            $(".f3").removeClass("ff");
            $(".submit").hide();

        }else{
            $(this).addClass("ff");
            $(".f2").removeClass("ff");
            $(".f3").removeClass("ff");
            $(".submit").show();
        }

    });
    $(".f2").click(function(){
        $(".submit").hide();
        $(".submit2").hide();
        if($(".f2").hasClass("ff")){
            $(this).removeClass("ff");
            $(".f1").removeClass("ff");
            $(".f3").removeClass("ff");
            $(".submit1").hide().siblings("m_submit").hide();
        }else{
            $(this).addClass("ff");
            $(".f1").removeClass("ff");
            $(".f3").removeClass("ff");
            $(".submit1").show();
        }

    });
    $(".f3").click(function(){
        $(".submit").hide();
        $(".submit1").hide();
        if($(".f3").hasClass("ff")){
            $(this).removeClass("ff");
            $(".f2").removeClass("ff");
            $(".f1").removeClass("ff");
            $(".submit2").hide();
        }else{
            $(this).addClass("ff");
            $(".f2").removeClass("ff");
            $(".f1").removeClass("ff");
            $(".submit2").show();
        }
    });
    /*右侧订单详情*/
    $(".tuijianhead>li").click(function(){
        var n=$(this).index();
        $(this).addClass("back").siblings().removeClass("back");
        $(this).find("a").addClass("cor").parent().siblings().find("a").removeClass("cor");
        $(".aa").eq(n).show().siblings(".aa").hide()
    });
    /*选择银行卡*/
    $(".online ul li").click(function(){
        $(this).addClass("active").siblings().removeClass("active")
    });

});

/*获取验证码*/
function Button(obj){
    var obj = $(obj);
    obj.attr("disabled","disabled");/*按钮倒计时*/
    var time = 60;
    var set=setInterval(function(){
        obj.val(--time+"(s)");
    }, 1000);/*等待时间*/
    setTimeout(function(){
        obj.attr("disabled",false).val("重新获取");/*倒计时*/
        clearInterval(set);
    }, 60000);
}