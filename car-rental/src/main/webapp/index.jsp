<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" session="true"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>首页</title>
 <%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>

<!-- 引入jquery -->
<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
<!-- 引入bootStrap-->
<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
<style type="text/css">

</style>
</head>
<body class="text-center">
		<form class="form-signin col-md-3 col-md-offset-4" id="log_from" ">
			
			<img class="mb-4" src="" alt="" width="72" height="72">
			<p id="from_p" class="text-danger"></p>
			<h1 class="h3 mb-3 font-weight-normal" style="margin-top:71px;">请登录</h1>
			<label class="sr-only">Username</label>
			<input id="in_dl" type="text" name="username" class="form-control" placeholder="用户" required="" autofocus="">
			<br>
			<label class="sr-only">Password</label>
			<input type="password" name="password" class="form-control" placeholder="密码" required="">
			<br>
			<select class="form-control" name="flag" id="edit_select">
				<option value="0">用户</option>
				<option value="1">管理员</option>
			</select>
			<br>
			<p style="padding-left:170px;margin-top:-15px;"><a href="${APP_PATH}/forgetPassword">忘记密码?</a></p>
			<button type="button" class="btn btn-primary btn-lg active" id="but_dl" style="margin-right:100px;">登录</button>
			
			<button type="button" class="btn btn-default btn-lg active">
			<a href="${APP_PATH}/RegisteredJsp">注册</a></button>
			
		</form>
<script type="text/javascript">
		//点击登录按钮
		$("#but_dl").click(function(){	
			var name = $("#in_dl").val();
			var select = $("#edit_select").val();
			
			if(select==="0"){
				log_in();
			}else{
				log_in_admin();
			}
			
			
		});
		
		//验证用户名密码
		function log_in(){
			$.ajax({
				url:"${APP_PATH}/login",
				//将数据序列化
				data:$("#log_from").serialize(),
				type:"GET",
				success:function(result){
					$("#from_p").empty();
					if(result.code==300){
						$("#from_p").append("请输入正确用户名！");
					}else if(result.code==200){
						$("#from_p").append("请输入正确密码！");
					}else{
						var user = $("#in_dl").val();
						window.open("${APP_PATH}/list?username="+user+"");
					}
				}
			})
		}
		
		
		//验证管理员用户名和密码
		function log_in_admin(){
			$.ajax({
				url:"${APP_PATH}/Verification",
				//将数据序列化
				data:$("#log_from").serialize(),
				type:"GET",
				success:function(result){
					$("#from_p").empty();
					if(result.code==300){
						$("#from_p").append("请输入正确管理名！");
					}else if(result.code==200){
						$("#from_p").append("请输入正确密码！");
					}else{
						var user = $("#in_dl").val();
						window.open("${APP_PATH}/CarManage?username="+user);						
					}
				}
			})
		}
		
		
</script>		
</body>
	
	
</html>