<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
    
<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());

//获取信息cid=1&username=admin&rday=2
//	int cid =Integer.parseInt(request.getParameter("cid"));
//	int rday =Integer.parseInt(request.getParameter("rday"));
 //   String username = request.getParameter("username");

%>

<!DOCTYPE html>
<html>
<head>

	<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
	<!-- 引入bootStrap-->
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	

    <!--样式层-->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/lib/css/index.css">

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
    
    <div class="row" >
		<div class="col-md-11" style="margin-left:50px;margin-top:20px;">
			<table class="table table-bordered">
				<thead>
					<tr>
						<th>订单编号</th>
						<th>车名</th>
						<th>图片</th>
						<th>到期时间</th>
						<th>续租时间</th>
						<th>续租</th>
						<th>停租</th>
						
					</tr>
				</thead>
			    <tbody>	                     
				<c:forEach items="${account}" var="base">
					<tr>
						<td><h3>${base.aid}</h3></td>
						<td><h3>${base.cname}</h3></td>
						<td>
						<div id="c3chart_category">
							<img alt="" src="/images/${base.imgp}"  width="100" height="75">
	                    </div>
						</td>
						<td><h3>${base.etime}</h3></td>
						<td>
							<input type="text" class="form-control col-md-1" id="input_day" placeholder="续租天数">
						</td>
						<td>
							<button type="submit" id="xuzu" x-id="${base.aid}" class="btn btn-primary">续租</button>
						</td>
						<td>
							<button type="submit" id="tingzu" data-id="${base.aid}" class="btn btn-danger ${base.aid}">停租</button>
						</td>
					</tr>	
				</c:forEach>
				</tbody>
			</table>
		</div>			
	</div>
    
	<div class="below" style="margin-top:400px;"></div>
    
	
	<script type="text/javascript">
		//停租
		$(document).on("click","#tingzu",function(){
			
			var aid = $(this).attr("data-id");
       		var r = confirm("确认提交？")
       		if(r==true){
				//退车修改车
				$.ajax({
					url:"Return?aid="+aid,
					type:"POST",
					success:function(result){
						window.location.reload()
					}
				});
				
       		}
			
		})

		//隐藏登录注册页面li_span
		if($("#li_span").text()!=""){
			$("#a_zhice").css('visibility', 'hidden');
			$("#a_denglu").css('visibility', 'hidden');
		}else{
			$("#li_yonghu").css('display','none'); 
		}
	

	//给button按钮绑定事件(编辑)
	
	//$(document).on("click",".edit_but",function(){
		
	
	//});
	
	//续租
	$(document).on("click","#xuzu",function(){
			
		var aid = $(this).attr("x-id");
   		var rday = $("#input_day").val();
   		if(confirm("确认续租?")){
   			$.ajax({
       			url:"Renewal?aid="+aid+"&rday="+rday,
       			type:"GET", 
       			success:function(){                  				
       					alert("已成功提交！");
           				window.location.reload()                   				
       			}
       		})
   		}	
	})
	

	

			
	</script>

</body>
</html>