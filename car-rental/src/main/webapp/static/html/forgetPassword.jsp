<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
   
    
<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
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
                <li style="margin-left: 50px;"><a href="#">用户注册</a></li>
                
                <li style="float: right;margin-right: 50px;"><a href="${APP_PATH}/index.jsp">登录</a></li>
                
            </ul>
        </div>
        <div class="clear"></div>
    </div>
    
    <div class="container" style="padding-top: 20px;">
    	<form class="form-horizontal">
		  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	       
	        <h4 class="modal-title">注册</h4>
	      </div>
	      <div class="modal-body">
	        <form class="form-horizontal" id="modal_zc_from">
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">名称:</label>
			    <div class="col-sm-10">
			      <input type="text" name="username" class="form-control" id="user_name_add" placeholder="song">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">新密码:</label>
			    <div class="col-sm-10">
			      <input type="password" name="password" class="form-control" id="user_password" placeholder="123456">
			      <span class="help-block"></span>	
			    </div>
	      	  </div>
	      	  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">确认密码:</label>
			    <div class="col-sm-10">
			      <input type="password" name="password" class="form-control" id="confirm_password" placeholder="123456">
			      <span class="help-block"></span>	
			    </div>
	      	  </div>
	      <div class="modal-footer">
	        <button type="button" id="add_dept" class="btn btn-primary btn-lg active">修改密码</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
		</form>
    </div>
    
    
    <script type="text/javascript"> 
    	$("#confirm_password").blur(function(){
    		var password = $("#user_password").val();
    		var confirm = $("#confirm_password").val();
    		if(password != confirm){
    			show_validate_msg("#confirm_password",200,"密码错误")
    		}
    	});
    	
    	//输入错误返回信息
    	function show_validate_msg(ele,status,msg){
    		//清除当前元素校验状态
    		$(ele).parent().removeClass("has-success has-error");
    		$(ele).next("span").text("");
    		if(100==status){
    			$(ele).parent().addClass("has-success");
    			$(ele).next("span").text("");
    		}else if(200==status){
    			$(ele).parent().addClass("has-error");
    			$(ele).next("span").text(msg)

    		}
    	}
    	
    	//修改密码
    	$("#add_dept").click(function(){
    		var username = $("#user_name_add").val();
    		var password = $("#user_password").val();
    		
    		$.ajax({
    			url:"${APP_PATH}/changePassword?username="+username+"&password="+password,
    			
    			type:"GET",
    			success:function(result){
    				alert("修改成功！");
    			}
    			
    		})
    	});
    </script>

</body>
</html>