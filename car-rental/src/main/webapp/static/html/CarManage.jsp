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
<title>车辆管理</title>
</head>
<body class="text-center">


	<!-- 模态框 -->
	<div class="modal fade" id="modal_tz_add" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title"></h4>
	      </div>
	      <div class="modal-body">
	        	<form class="form-horizontal">
				  <div class="form-group">
				    <div class="col-sm-10">
				      <input type="text" name="cname" id="in_cname" class="form-control" id="inputEmail3" placeholder="车名">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10">
				      <input type="text" name="cride" id="in_cride" class="form-control" id="inputEmail3" placeholder="乘坐人数">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10">
				      <input type="text" name="dayr" id="in_dayr" class="form-control" id="inputEmail3" placeholder="日租金额">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10">
				      <input type="text" name="block" id="in_block" class="form-control" id="inputEmail3" placeholder="档位">
				    </div>
				  </div>
				  <div class="form-group">
				    <div class="col-sm-10">
				      <input type="text" name="remaining" id="in_remaining" class="form-control" id="inputEmail3" placeholder="库存">
				      <input type="hidden"name="duration" id="in_duration" value="3">
				    </div>
				  </div>			
				  <div class="form-group">
				    <div class="col-sm-10">
				      <p>
				      <input type="file" name="imgadd" id="in_file_imgadd" class="form-control col-md-8">				     
				    	</p>
				    </div>
				  </div>				  
				</form>				
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" class="btn btn-primary" data-dismiss="modal" id="add_dept">新增</button>
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
                    	<div class="text-right">
	                    	<div class="row">
								<div class="col-md-11 col-md-offset-8">
									<button class="btn btn-primary" id="div_but_clas_add">新增</button>			
								</div>
							</div>
						</div>
                      	<div class="row">
							<div class="col-md-12">
								<table class="table table-hover" id="emps_table">
									<thead>
										<tr>
											<th>车辆编号</th>
											<th>车名</th>
											<th>乘坐人数</th>
											<th>日租金额</th>
											<th>图片</th>
											<th>删除</th>
										</tr>
									</thead>
									<tbody>	                     
										<c:forEach items="${cars}" var="base">
											<tr>
												<td>${base.cid}</td>
												<td>${base.cname}</td>
												<td>${base.cride}</td>
												<td>${base.dayr}</td>
												<td>${base.imgadd}</td>												
												<td><button c-id="${base.cid}" id="${base.cid}"  class="btn btn-danger btn-sm edit_but"><span class="glyphicon glyphicon-trash">删除</span></button></td>
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
		
	
		$("#div_but_clas_add").click(function(){
			//弹出模态框
			$("#modal_tz_add").modal({
				backdrop:"static"
			});
		});
		
		$("#add_dept").click(function(){       
		    //创建一个forData 
		      var formData = new FormData();
		      formData.append("ps_file",$("#in_file_imgadd")[0].files[0]);
		      formData.append("in_cname",$("#in_cname").val());
		      formData.append("in_cride",$("#in_cride").val());
		      formData.append("in_dayr",$("#in_dayr").val());
		      formData.append("in_block",$("#in_block").val());
		      formData.append("in_duration",$("#in_duration").val()); 
		      formData.append("in_remaining",$("#in_remaining").val()); 
		      $.ajax({
		          type : 'POST',
		          url : '${APP_PATH}/upload',
		          data : formData,
		          dataType:"json",
		          async: false,  
		          cache : false,
		          processData : false,
		          contentType : false,
		          success:function(result){
		        	  alert(result.msg);
		        	  window.location.reload()
		          }
		      })
		  });
		
		
		
		$(document).on("click",".delete_btn",function(){
			//首先需要获得要删除的联系人的姓名如何获得了

			});
		
		//添加删除事件
		var carsJson = '${carsJson}';
        if(carsJson != ''){
        	carsJson = JSON.parse(carsJson);
        	console.log(carsJson);
        	for(var p in carsJson){
        		var id = carsJson[p].cid;
        		$("#"+id).click(function(){
        			var empName = $(this).parents("tr").find("td:eq(1)").text();
        			if(confirm("确认删除【"+empName+"】吗？")){
        				var cid=$(this).attr("c-id");
            			$.ajax({
            				url:"${APP_PATH}/deleteCar?cid="+cid,
            				type:"POST",
            				success:function(result){
            					alert(result.msg);
            					window.location.reload()
            				}
            			})
        			}
        			
        		})
        	}
        } 
        
        
       
        
           
        
		
	</script>

</body>
</html>