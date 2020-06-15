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
<!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <!-- Bootstrap CSS -->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/vendor/bootstrap/css/bootstrap.min.css">
    <link href="${APP_PATH}/static/assets/vendor/fonts/circular-std/style.css" rel="stylesheet">
    <!--样式层-->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/libs/css/style.css">
    <!--图标-->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/vendor/fonts/fontawesome/css/fontawesome-all.css">
<title>用户管理</title>
</head>
<body>

		<!-- 模态框 -->
	<div class="modal fade" id="modal_xg" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"></h4>
	      </div>
	      <div class="modal-body">
	           <form class="form-horizontal" id="modal_xg_from">
	           
	           <input type="hidden" name="id" id="user_id">
	           
			  <div class="form-group">
			    <label class="col-sm-2 control-label">用户:</label>
			    <div class="col-sm-10">
			      <p class="form-control-static" id="buttonModal_edit_p"></p>
			      <input type="hidden" name="username" id="user_name">
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">密码:</label>
			    <div class="col-sm-10">
			      <input type="text" name="password" class="form-control" id="user_password" placeholder="123456">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			   <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">手机号:</label>
			    <div class="col-sm-10">
			      <input type="text" name="phone" class="form-control" id="user_phone" placeholder="157********">
			      <span class="help-block"></span>	
			    </div>
			  </div>
			  
			  <div class="form-group">
			    <label class="col-sm-2 control-label">性别:</label>
			    <input type="hidden" name="gender" id="user_gender">
			    <div class="col-sm-10">
			      <p class="form-control-static" id="buttonModal_edit_sex"></p>
			    </div>
			  </div>
			    <div class="form-group">
				    <label for="inputEmail3"  class="col-sm-2 control-label">年龄:</label>
				    <div class="col-sm-10">
			        <input type="text" name="age" class="form-control" id="user_age" placeholder="**">
			        <span class="help-block"></span>	
			    </div>
			  </div>
			  
			</form>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_top_up" class="btn btn-primary">修改</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->



    <div class="dashboard-main-wrapper">

        <!--我的导航栏-->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="${APP_PATH}/CarManage?username=${suser.username}">豌豆主页</a>
                <div class="collapse navbar-collapse " id="navbarSupportedContent">
                    <ul class="navbar-nav ml-auto navbar-right-top">
                        <li class="nav-item dropdown nav-user">
                            <a class="nav-link nav-user-img" href="#" id="navbarDropdownMenuLink2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <!--我的图片-->
                                <img src="${APP_PATH}/static/assets/images/avatar-1.jpg" alt="" class="user-avatar-md rounded-circle"></a>
                            <div class="dropdown-menu dropdown-menu-right nav-user-dropdown" aria-labelledby="navbarDropdownMenuLink2">
                                <!--我的链接-->
                                <a class="dropdown-item" href="${APP_PATH}/index.jsp"><i class="fas fa-user mr-2"></i>退出豌豆</a>
                            </div>
                        </li>
                    </ul>
                </div>
            </nav>
        </div>
        <!--我的竖状导航-->
        <div class="nav-left-sidebar sidebar-dark">
            <div class="menu-list">
                <nav class="navbar navbar-expand-lg navbar-light">
                    <a class="d-xl-none d-lg-none" href="#">豌豆出行</a>
                    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                        <span class="navbar-toggler-icon"></span>
                    </button>
                    <div class="collapse navbar-collapse" id="navbarNav">
                        <ul class="navbar-nav flex-column">



                            <!--树状导航-->
                            <li id="li_span" style="font-size:30px" class="nav-divider">管家:${suser.username}</li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/CarManage?username=${suser.username}">车辆管理</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${APP_PATH}/UserManage?username=${suser.username}">用户管理</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/AuditManage?username=${suser.username}">审核管理</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/DepositManage?username=${suser.username}">充值审核</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/userAuditManage?username=${suser.username}">驾证审核</a>
                            </li>                    
                        </ul>
                    </div>
                </nav>
            </div>
        </div>
        <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="ecommerce-widget">
                    	
                      		<div class="row">
                      			<div class="col-md-8">
                      			  <form class="form-inline">
									  <div class="form-group">
									    <label for="inputPassword2" class="sr-only">姓名</label>
									    <input id="in_serch" type="test" class="form-control" id="inputPassword2" placeholder="姓名">&nbsp&nbsp&nbsp&nbsp&nbsp
									  	
									  	<input id="but_serch" type="button" class="btn btn-danger" value="搜索">
									  </div>
									  </form>
									  

								</div>
							<div class="col-md-12">
								<table class="table table-hover" id="emps_table">
									<thead>
										<tr>
											<th>用户编号</th>
											<th>用户名</th>
											<th>用户密码</th>
											<th>性别</th>
											<th>年龄</th>											
											<th>删除</th>
											<th>修改</th>
										</tr>
									</thead>
									<tbody id="tbody_data">                     
										<c:forEach items="${users}" var="base">
											<tr>
												<td>${base.id}</td>
												<td>${base.username}</td>
												<td>${base.password}</td>
												<td>${base.gender}</td>
												<td>${base.age}</td>												
												<td><button c-id="${base.id}" class="btn btn-danger btn-sm edit_but but_delete"><span class="glyphicon glyphicon-trash">删除</span></button></td>
												<td><button x-id="${base.id}" class="btn btn-primary btn-sm edit_but but_update"><span class="glyphicon glyphicon-trash">修改</span></button></td>
											</tr>	
										</c:forEach>
									</tbody>
								</table>
							</div>			
						</div>
                    </div>
                </div>
            </div>
        </div>
        
    </div>
<!--引入bootstrap和jquery-->
    <script src="${APP_PATH}/static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>
    <!-- bootstap bundle js -->
    <script src="${APP_PATH}/static/assets/vendor/bootstrap/js/bootstrap.bundle.js"></script>
    <!-- slimscroll js -->
    <script src="${APP_PATH}/static/assets/vendor/slimscroll/jquery.slimscroll.js"></script>
    <!-- main js -->
    <script src="${APP_PATH}/static/assets/libs/js/main-js.js"></script>
    <!-- chart chartist js -->
    <script src="${APP_PATH}/static/assets/vendor/charts/chartist-bundle/chartist.min.js"></script>
    <!-- sparkline js -->
    <script src="${APP_PATH}/static/assets/vendor/charts/sparkline/jquery.sparkline.js"></script>


	<script type="text/javascript">
	
	
	
	
	//搜索  in_serch   but_serch、
	$("#but_serch").click(function(){
		
		var data = $("#in_serch").val();
		if(data!=''){
			$("#tbody_data").empty();
			sreack(data);
		}
		
	})
	
	function sreack(data){
		$.ajax({
			url:"${APP_PATH}/AsearchUser?date="+data,
			type:"GET",
			success:function(result){
				forEach(result);
				
			}
		})
	}

	function forEach(result){
		//搜索需要的用户
		var emps = result.extend.cars;
		$.each(emps,function(index,item){
			//在<td></td>中装载数据
			var id = $("<td></td>").append(item.id);
			var username = $("<td></td>").append(item.username);
			var password = $("<td></td>").append(item.password);
			var gender = $("<td></td>").append(item.gender=='M'?"男":"女");			
			var age = $("<td></td>").append(item.age);
			//append方法执行完成之后返回的还是原来的元素
			var edittBtn = $("<button></button>").addClass("btn btn-danger btn-sm edit_but but_delete")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash ")).append("删除");
			//给edittBtn按钮新增一个属性以表示唯一性
			edittBtn.attr("c-id",item.id);
			var delBtn = $("<button></button>").addClass("btn btn-primary btn-sm edit_but but_update")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash ")).append("修改");
			//给delBtn按钮新增一个属性以表示唯一性 but_delete  but_update
			delBtn.attr("x-id",item.id);
			var butsc = $("<td></td>").append(edittBtn);
			var butxg = $("<td></td>").append(delBtn);
			$("<tr></tr>")
			.append(id)  
			.append(username)
			.append(password)
			.append(gender)
			.append(age)
			.append(butsc)
			.append(butxg)
			.appendTo("#tbody_data");
		});
	}	
	
	//给删除button按钮绑定事件
	$(document).on("click",".but_delete",function(){
		var id = $(this).attr("c-id");
		var username = $(this).parents("tr").find("td:eq(1)").text();
		if(confirm("确认删除?")){
			$.ajax({
				url:"${APP_PATH}/DeleteUser?id="+id+"&username="+username,
				type:"POST",
				success:function(result){
					alert(result.msg);
					window.location.reload()
				}
			})
		}

	});
	
	//给修改button按钮绑定事件   model:modal_xg
	$(document).on("click",".but_update",function(){
		
		edit_search_emp($(this).attr("x-id"));
		
		//显示模态框
		$("#modal_xg").modal({
			backdrop:"static"
		});
		
	});
	
	function edit_search_emp(edit_id){
		
			$("#buttonModal_edit_sex").text("");
			$("#buttonModal_edit_p").text("");
			$.ajax({
				url:"${APP_PATH}/searchUser?id="+edit_id,
				type:"GET",
				success:function(result){
					edit_show(result);
				}
			});
		}
	
	function edit_show(result){
		
		$("#user_id").attr("value",result.extend.user.id);
		
		$("#buttonModal_edit_p").append(result.extend.user.username);
		$("#user_name").attr("value",result.extend.user.username);
		
		$("#user_password").attr("value",result.extend.user.password);
		
		$("#buttonModal_edit_sex").append(result.extend.user.gender==1?"男":"女");
		$("#user_gender").attr("value",result.extend.user.gender);
		
		$("#user_phone").attr("value",result.extend.user.phone);
		$("#user_age").attr("value",result.extend.user.age);
	
	}
	
	
	$("#but_top_up").click(function(){
		alert($("#user_id").val());
		$.ajax({
			url:"${APP_PATH}/updateUser",
			type:"GET",
			data:$("#modal_xg form").serialize(),
			success:function(result){
				alert(result.msg);
				window.location.reload()
			}
		});
	});
	
	
	
	</script>

	</body>

</html>