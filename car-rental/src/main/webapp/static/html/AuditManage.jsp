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
<title>车辆审核</title>
</head>
<body>


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
                      		<!-- 显示车辆信息 -->
                      		<tbody>		
                     
							<c:forEach items="${account}" var="base">
							<div class="row">
	                            <div class="col-xl-12 col-lg-12 col-md-12 col-sm-12 col-12">
	                               <div class="card">
	                                    <h4 class="card-header">用户:${base.suser}&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp待审核车辆:${base.cname};
											<p id="order_time_${base.aid}" data-id="${base.aid}" data-starttime="${base.date}"  data-endtime="${base.etime}"  class="remain-time"></p>
										</h4>
	                                    <div class="card-body">
	                                        <div id="c3chart_category" style="height: 320px;">
												<img alt="" src="/images/${base.imgp}">
	                                        </div>
	                                        <div class="text-right">      
                                        	<button type="button" c-id="${base.aid}" id="but_order" class="btn btn-danger">
                                        		审核通过
                                        	</button>
                                        </div>                                 
	                                    </div>
	                                </div>
	                            </div>
	                        </div> 
						    </c:forEach>
							</tbody>
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


	</body>
	
	<script type="text/javascript">
//给button按钮绑定事件(编辑)
	
	$(document).on("click","#but_order",function(){
		var aid = $(this).attr("c-id");
		if(confirm("确认通过?")){
			$.ajax({
				url:"${APP_PATH}/Change?aid="+aid,
				type:"POST",
				success:function(result){
					window.location.reload()
				}
			})
		}

	});
	
	</script>

</html>