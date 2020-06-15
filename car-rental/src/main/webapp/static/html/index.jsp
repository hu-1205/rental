<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

	<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
	<!-- 引入bootStrap-->
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	

    <!--样式层-->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/lib/css/index.css">
	<style type="text/css">
        .box {
            width: 1200px;
            height: 400px;
            border: 1px solid #ccc;
            padding-left: 15px;
 
        }
        .inner{
            width: 1200px;
            height: 400px;
            position: relative;
            overflow: hidden;
        }
        .inner img{
            width: 1200px;
            height: 400px;
            
            vertical-align: top
        }
        .inner ul {
            width: 1000%;
            position: absolute;
            list-style: none;
            left:0;
            top: 0;
        }
        .inner li{
            float: left;
 
        }
 
        ol {
            position: absolute;
            height: 20px;
            right: 20px;
            bottom: 20px;
            text-align: center;
            padding: 5px;
        }
        ol li{
            display: inline-block;
            width: 20px;
            height: 20px;
            line-height: 20px;
            background-color: #fff;
            margin: 5px;
            cursor: pointer;
 
        }
        ol .current{
            background-color: red;
        }
        #arr{
            display: none;
        }
        #arr span{
            width: 40px;
            height: 40px;
            position: absolute;
            left: 5px;
            top: 50%;
            margin-top: -20px;
            background: #fff;
            cursor: pointer;
            line-height: 40px;
            text-align: center;
            font-weight: bold;
            font-family: '黑体';
            font-size: 30px;
            color: #000;
            opacity: 0.5;
            border: 1px solid #fff;
        }
        #arr #right {
            right: 5px;
            left: auto;
        }
	
	</style>

<title>首页</title>
</head>
<body>
	<div class="title">
		 <img src="${APP_PATH}/static/assets/lib/images/img3.png" />
	</div>
    <div class="nav_bg">
        <div class="nav">
            <ul>
                <li><a href="${APP_PATH}/list?username=${suser.username}">首页</a></li>
                
                <li><a href="${APP_PATH}/Renew?username=${suser.username}">车辆续租</a></li>
                <li><a href="${APP_PATH}/Audit?username=${suser.username}">车辆审核</a></li>
                <li><a href="${APP_PATH}/Account?username=${suser.username}">我的豌豆</a></li>
                <li id="li_yonghu"  style="float: right;">用户:<span id="li_span">${suser.username}</span></li>
                <li style="float: right;"><a href="${APP_PATH}/index.jsp">退出</a></li>
                <li style="float: right;"><a id="a_zhice"  href="${APP_PATH}/index.jsp">注册</a></li>
                <li style="float: right;"><a id="a_denglu" href="${APP_PATH}/index.jsp">登录</a></li>                
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    <div class="box" id="box">
    <div class="inner">
        <!--轮播图-->
        <ul>
            <li><a href="#"><img src="${APP_PATH}/static/assets/lib/images/1.jpg" alt=""></a></li>
            <li><a href="#"><img src="${APP_PATH}/static/assets/lib/images/2.jpg" alt=""></a></li>
            <li><a href="#"><img src="${APP_PATH}/static/assets/lib/images/img2.jpg" alt=""></a></li>
        </ul>
        <ol class="bar">
            	小按钮数量无法确定，由js动态生成
        </ol>
        <!--左右焦点-->
        <div id="arr">
              <span id="left"> <</span>
              <span id="right">></span>
        </div>
 
    </div>
	</div>


    <div class="search">
		<!-- 
    	<select class="select">
    		<option>全部</option>
	    	<option>越野</option>
	    	<option>suv</option>
    		<option>小轿车</option>
    	</select> -->
    	<a href="javascript:void(0)" class="search-btn" style="margin-right:30px">搜索</a>
        <input type="text" id="in_name" placeholder="请输入车名" /><span>车名：</span> 
        <div class="clear"></div>
    </div>
	
		
		<div class="cars" id="div_cars">
		  <c:forEach items="${cars}" var="base">
	       <div class="carInfo">
	           <div class="img"><img alt="" id="car_img" src="/images/${base.imgadd}"></div>
	           <div class="content">
	               <p id="car_p">${base.cname}/乘坐:${base.cride}人;</p>
	               <p id="car_p">${base.block}/剩余:${base.remaining}</p>
	               <span class="price" id="car_price">￥${base.dayr}</span>
	               
	               <c:if test="${base.remaining != 0 }">
	               <a  href="${APP_PATH}/Order?cid=${base.cid}&username=${suser.username}&imgadd=${base.imgadd}&name=${base.cname}&dayr=${base.dayr}&block=${base.block}">租 赁</a>
	           		</c:if>
	           </div>
	       </div>
	      </c:forEach>
	      <div class="clear"></div>
	    </div>
		<div class="below">
			
		</div>
    
	<script type="text/javascript">
	//隐藏登录注册页面li_span
	if($("#li_span").text()!=""){
		$("#a_zhice").css('visibility', 'hidden');
		$("#a_denglu").css('visibility', 'hidden');
	}else{
		$("#li_yonghu").css('display','none'); 
	}
	
	
	$(".search-btn").click(function(){
		
		var data = $("#in_name").val();
		if(data!=''){
			$("#div_cars").empty();
			sreack(data);
		}
	})
	
	function sreack(data){
		$.ajax({
			url:"${APP_PATH}/searchCar?date="+data,
			type:"GET",
			success:function(result){
				forEach(result);
				
			}
		})
	}
	function forEach(result){
		//所有的车辆
		var emps = result.extend.cars;
		$.each(emps,function(index,item){	
			var ht = "${APP_PATH}/Order?cid="+item.cid+"&username=${suser.username}&imgadd="+item.imgadd;
			
	       var lochtml = "";
	       lochtml +='<div class="carInfo">';
	       lochtml +='<div class="img"><img src="/images/'+item.imgadd+'"></div>';
	       lochtml +='<div class="content">';
	       lochtml +='<p id="car_p">汽车名称:'+item.cname+'乘坐:'+item.cride+'人;</p>';
	       lochtml +='<span class="price" id="car_price">￥'+item.dayr+'</span>';
	       lochtml +='<a href='+ht+'>租 赁</a></div></div>';	       			
	       lochtml += '<div class="clear"></div>';
	       $("#div_cars").append(lochtml);	    
		})
	}	
	
	 function my$(id) {
	        return document.getElementById(id);
	    }
	 
	    //获取各元素，方便操作
	    var box=my$("box");
	    var inner=box.children[0];
	    var ulObj=inner.children[0];
	    var list=ulObj.children;
	    var olObj=inner.children[1];
	    var arr=my$("arr");
	    var imgWidth=inner.offsetWidth;
	    var right=my$("right");
	    var pic=0;
	    //根据li个数，创建小按钮
	    for(var i=0;i<list.length;i++){
	        var liObj=document.createElement("li");
	 
	        olObj.appendChild(liObj);
	        liObj.innerText=(i+1);
	        liObj.setAttribute("index",i);
	 
	        //为按钮注册mouseover事件
	        liObj.οnmοuseοver=function () {
	            //先清除所有按钮的样式
	 
	            for (var j=0;j<olObj.children.length;j++){
	                olObj.children[j].removeAttribute("class");
	            }
	            this.className="current";
	            pic=this.getAttribute("index");
	            animate(ulObj,-pic*imgWidth);
	        }
	 
	    }
	 
	 
	    //设置ol中第一个li有背景颜色
	    olObj.children[0].className = "current";
	    //克隆一个ul中第一个li,加入到ul中的最后=====克隆
	    ulObj.appendChild(ulObj.children[0].cloneNode(true));
	 
	    var timeId=setInterval(onmouseclickHandle,3000);
	    //左右焦点实现点击切换图片功能
	    box.οnmοuseοver=function () {
	        arr.style.display="block";
	        clearInterval(timeId);
	    };
	    box.οnmοuseοut=function () {
	        arr.style.display="none";
	        timeId=setInterval(onmouseclickHandle,3000);
	    };
	 
	    right.οnclick=onmouseclickHandle;
	    function onmouseclickHandle() {
	        //如果pic的值是5,恰巧是ul中li的个数-1的值,此时页面显示第六个图片,而用户会认为这是第一个图,
	        //所以,如果用户再次点击按钮,用户应该看到第二个图片
	        if (pic == list.length - 1) {
	            //如何从第6个图,跳转到第一个图
	            pic = 0;//先设置pic=0
	            ulObj.style.left = 0 + "px";//把ul的位置还原成开始的默认位置
	        }
	        pic++;//立刻设置pic加1,那么此时用户就会看到第二个图片了
	        animate(ulObj, -pic * imgWidth);//pic从0的值加1之后,pic的值是1,然后ul移动出去一个图片
	        //如果pic==5说明,此时显示第6个图(内容是第一张图片),第一个小按钮有颜色,
	        if (pic == list.length - 1) {
	            //第五个按钮颜色干掉
	            olObj.children[olObj.children.length - 1].className = "";
	            //第一个按钮颜色设置上
	            olObj.children[0].className = "current";
	        } else {
	            //干掉所有的小按钮的背景颜色
	            for (var i = 0; i < olObj.children.length; i++) {
	                olObj.children[i].removeAttribute("class");
	            }
	            olObj.children[pic].className = "current";
	        }
	    }
	    left.οnclick=function () {
	        if (pic==0){
	            pic=list.length-1;
	            ulObj.style.left=-pic*imgWidth+"px";
	        }
	        pic--;
	        animate(ulObj,-pic*imgWidth);
	        for (var i = 0; i < olObj.children.length; i++) {
	            olObj.children[i].removeAttribute("class");
	        }
	        //当前的pic索引对应的按钮设置颜色
	        olObj.children[pic].className = "current";
	    };
	    
	    //设置任意的一个元素,移动到指定的目标位置
	    function animate(element, target) {
	        clearInterval(element.timeId);
	        //定时器的id值存储到对象的一个属性中
	        element.timeId = setInterval(function () {
	            //获取元素的当前的位置,数字类型
	            var current = element.offsetLeft;
	            //每次移动的距离
	            var step = 10;
	            step = current < target ? step : -step;
	            //当前移动到位置
	            current += step;
	            if (Math.abs(current - target) > Math.abs(step)) {
	                element.style.left = current + "px";
	            } else {
	                //清理定时器
	                clearInterval(element.timeId);
	                //直接到达目标
	                element.style.left = target + "px";
	            }
	        }, 10);
	    }

       
	</script>
	

</body>
</html>