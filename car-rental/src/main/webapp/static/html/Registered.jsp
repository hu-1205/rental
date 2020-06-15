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
			    <label for="inputEmail3"  class="col-sm-2 control-label">密码:</label>
			    <div class="col-sm-10">
			      <input type="text" name="password" class="form-control" id="user_password_add" placeholder="123456">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">手机号:</label>
			    <div class="col-sm-10">
			      <input type="text" name="phone" class="form-control" id="user_phone_add" placeholder="157********">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">性别:</label>
			    <div class="col-sm-10">
			    <label class="radio-inline">
				  <input type="radio" name="gender" id="gender_edit" value="1" checked>男
				</label>
				<label class="radio-inline">
				  <input type="radio" name="gender" id="gender_edit" value="0">女
				</label>
				 </div>
			  </div>
			    <div class="form-group">
				    <label for="inputEmail3"  class="col-sm-2 control-label">年龄:</label>
				    <div class="col-sm-10">
			        <input type="text" name="age" class="form-control" id="user_age_add" placeholder="**">
			        <span class="help-block"></span>	
			    </div>
			  </div>
			  <div class="form-group">
				    <label for="inputEmail3"  class="col-sm-2 control-label">驾驶证(前):</label>
				    <div class="col-sm-10">
			        <input type="file" name="age" class="form-control" id="in_file_imgadd1" placeholder="**">
			        <span class="help-block"></span>	
			    	</div>
			  </div>
			  <div class="form-group">
				    <label for="inputEmail3"  class="col-sm-2 control-label">驾驶证(后):</label>
				    <div class="col-sm-10">
			        <input type="file" name="age" class="form-control" id="in_file_imgadd2" placeholder="**">
			        <span class="help-block"></span>	
			    	</div>
			  </div>
			  
	      </div>
	      <div class="modal-footer">
	        <button type="button" id="add_dept" class="btn btn-primary btn-lg active">注册</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
		</form>
    </div>
    
    
    <script type="text/javascript"> 
    
    $("#add_dept").click(function(){       
	    //创建一个forData 
	      var formData = new FormData();
	      formData.append("ps_file1",$("#in_file_imgadd1")[0].files[0]);
	      formData.append("ps_file2",$("#in_file_imgadd2")[0].files[0]);
	      formData.append("in_cname",$("#user_name_add").val());
	      formData.append("in_password",$("#user_password_add").val());
	      formData.append("in_phone",$("#user_phone_add").val());
	      formData.append("in_gender",$("input[id='gender_edit']:checked").val());
	      formData.append("in_age",$("#user_age_add").val());  
	      $.ajax({
	          type : 'POST',
	          url : '${APP_PATH}/Registered',
	          data : formData,
	          dataType:"json",
	          async: false,  
	          cache : false,
	          processData : false,
	          contentType : false,
	          success:function(result){
	        	  alert("注册成功！");
	          }
	      })
	  });
    
    
  //验证用户名
	$("#user_name_add").blur(function(){
		var username = $("#user_name_add").val();
		
		$.ajax({
			url:"${APP_PATH}/countName",
			data:"username="+username,
			type:"GET",
			success:function(result){
				
				show_validate_msg("#user_name_add",result.code,"名字重复")
			}
			
		})
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
	
    </script>

</body>
</html>