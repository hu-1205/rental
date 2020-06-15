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
<title>驾照审核</title>
</head>
<body>


	<div class="modal fade text-center" id="imgZoomInModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true"> 
     <div class="modal-dialog" style="display: inline-block; width: auto;"> 
      <div class="modal-content"> 
       <div class="modal-header"> 
        <button type="button" class="close" data-dismiss="modal" aria-hidden="true"> &times; </button> 
       </div> 
       <div class="modal-body"> 
          <img src="" id="pigImg" width="400" /> 
       </div> 
      </div> 
      <!-- /.modal-content --> 
     </div> 
     <!-- /.modal --> 
    </div> 




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
							<div class="col-md-12">
								<table class="table table-hover">
									<tr>
										<td>用户名</td>
										<td>驾驶证(前)</td>
										<td>驾驶证(后)</td>
										<td>状态</td>
										<td>通过</td>
										<td>驳回</td>
										
									</tr>
									<c:forEach items="${drivers}" var="base">
								       <!-- On cells (`td` or `th`) -->
										<tr>
										  <td class="active">${base.username}</td>
										  <td class="success">
										  	<div> 
     											<img src="/drivers/${base. bdriver}" v-id="/drivers/${base. bdriver}" id="image1" value="/drivers/${base. bdriver}" width="50" height="50" /> 
    										</div>
										  </td>
										 <td class="success">
										  	<div> 
     											<img src="/drivers/${base. rdriver}" v-id="/drivers/${base. rdriver}" id="image1" value="/drivers/${base. bdriver}" width="50" height="50" /> 
    										</div>
										  </td>
										  <td class="danger">
											<span class="label label-danger">待审核</span>
										  </td>										
										  <td class="info">
										   <button type="button" x-id="${base.username}" id="but_tg" class="btn btn-primary">审核通过</button>
										  </td>
										  <td class="info">
										   <button type="button" x-id="${base.username}" id="but_bh" class="btn btn-danger">驳回</button>
										  </td>
										</tr>								       
								    </c:forEach>
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
	//给修改button按钮绑定事件   进行审核
	$(document).on("click","#but_tg",function(){
		
		var name = $(this).attr("x-id");
		$.ajax({
			url:"${APP_PATH}/changeDriver?name="+name,
			type:"GET",
			success:function(result){
				alert("审核通过");
				window.location.reload()
			}
		})
		
	});
	
	//给修改button按钮绑定事件   进行驳回
	$(document).on("click","#but_bh",function(){
		
		var name = $(this).attr("x-id");
		$.ajax({
			url:"${APP_PATH}/changeBohui?name="+name,
			type:"GET",
			success:function(result){
				alert("已驳回申请！");
				window.location.reload()
			}
		})
		
	});
	
	//点击查看原图
	$(document).on("click","#image1",function(){
		var src = $(this).attr("v-id");
		$("#pigImg").attr('src',src);
		//弹出模态框
		$("#imgZoomInModal").modal({
			backdrop:"static"
		});
	})
	
	
	</script>

	</body>

</html>