<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<%
	int cid =Integer.parseInt(request.getParameter("cid"));
    String username = request.getParameter("username");
    String imgadd = request.getParameter("imgadd");
    String name = request.getParameter("name");
    String dayr = request.getParameter("dayr");
    String block = request.getParameter("block");
    
%>

<!DOCTYPE html>
<html>
<head>
	<!--引入bootstrap和jquery
		<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/zzsc.css">
	-->
 	<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
	<!-- 引入bootStrap-->
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
    <link rel="stylesheet" href="${APP_PATH}/static/assets/lib/css/Order.css">
	
	
	<link rel="stylesheet" href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/dcalendar.picker.css"/>

<title>车辆查看</title>
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
                <li style="float: right;"><a id="a_zhice"  href="${APP_PATH}/index.jsp">注册</a></li>
                <li style="float: right;"><a id="a_denglu" href="${APP_PATH}/index.jsp">登录</a></li>
                
            </ul>
        </div>
        <div class="clear"></div>
    </div>
 	<div class="cars ">
 		<div class="carInfo" style="margin-right:30px;">
 			<div class="img"><img alt="" src="/images/<%=imgadd%>"></div>
 			   
 		</div>
 		 <div class="search">
 		 <form action="" id="day_from">
 		 <span style="display:block; height:40px; line-height:40px;    width: 400px;
    margin-top: 55px; color:#f00;"></span>
    	<input type="hidden" id="cid" name="cid" value="<%=cid%>" /> 
    	<input type="hidden" name="username" value="<%=username%>"/>
		<table border="0" class="table-class">
			<tr>
				<td><input type="text" id="start" name="starttime" placeholder="拿车时间" /> </td>
			</tr>
			<tr>
    			<td><input type="text" id="end" name="endtime" placeholder="还车时间" /> </td>
			</tr>
			<tr><td><button type="button" style="margin-left:10px;" id="but_order" class="btn btn-danger">
            	提交订单
            </button></td></tr>
		</table>
    	
        </form>
        <div class="clear"></div>
    </div> 

	<div id="footer">husong@0670 </div>
 

	<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/dcalendar.picker.js"></script>
	<script type="text/javascript" src="${APP_PATH}/static/assets/lib/js/laydate.js"></script>
	<script type="text/javascript">
	//隐藏登录注册页面li_span
	if($("#li_span").text()!=""){
		$("#a_zhice").css('visibility', 'hidden');
		$("#a_denglu").css('visibility', 'hidden');
	}else{
		$("#li_yonghu").css('display','none'); 
	}
	
	
	
		$("#but_order").click(function(){
			var username = $("#li_span").text();
			var time1 = $("#start").val();
			var time2 = $("#end").val();
			if(${sUser2.deposit}!=500){
				alert("请提交押金！");
			}else if(${driver.flag}!="1"){
				alert("请通过驾照审核！");
			}else if(username==""){
				
			}else{
				if(time1==""||time2==""){
					alert("请输入时间");
				}else{
					if(confirm("确认提交订单?")){
						$.ajax({
							url:"${APP_PATH}/Iday",
							data:$("#day_from").serialize(),
							type:"POST",
							success:function(result){
								if(result.code===100){
									alert("订单提交成功");
								}else{
									alert("请充值余额");
								}
							}
						})
					}					
				}				
			}			
		})
		//获取日历
		$('#mydatepicker2').dcalendarpicker({
		format:'yyyy-mm-dd'
		}); 
		$('#mydatepicker1').dcalendarpicker({
			format:'yyyy-mm-dd'
		}); 
		//在区域中显示日历
		$('#mycalendar').dcalendar();
		
		//日期范围限制
		var start = {
		    elem: '#start',
		    format: 'YYYY-MM-DD hh:mm:ss',
		    min: laydate.now(), //设定最小日期为当前日期
		    max: '2099-06-16', //最大日期
		    istime: true,
		    istoday: false,
		    choose: function(datas){
		         end.min = datas; //开始日选好后，重置结束日的最小日期
		         end.start = datas //将结束日的初始值设定为开始日
		    }
		};

		var end = {
		    elem: '#end',
		    format: 'YYYY-MM-DD hh:mm:ss',
		    min: laydate.now(),
		    max: '2099-06-16',
		    istime: true,
		    istoday: false,
		    choose: function(datas){
		        start.max = datas; //结束日选好后，充值开始日的最大日期
		    }
		};
		laydate(start);
		laydate(end);

	
	</script>

</body>
</html>