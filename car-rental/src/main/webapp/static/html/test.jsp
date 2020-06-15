<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
<title>首页</title>
</head>
<body>


	<!-- 模态框 -->
	<div class="modal fade" id="modal_zc" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">请充值:</h4>
	      </div>
	      <div class="modal-body">
	          <div class="form-group">
			    <label class="sr-only" for="exampleInputAmount">输入充值</label>
			    <div class="input-group">
			      <div class="input-group-addon">$</div>
			      <input type="text" id="in_money" class="form-control" placeholder="500">
			      <div class="input-group-addon">豌豆</div>
			    </div>
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_top_up" class="btn btn-primary">确认充值</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->



    <div class="dashboard-main-wrapper">

        <!--我的导航栏-->
        <div class="dashboard-header">
            <nav class="navbar navbar-expand-lg bg-white fixed-top">
                <a class="navbar-brand" href="${APP_PATH}/list?username=${suser.username}">首页</a>
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
                            <li id="li_span" style="font-size:30px" class="nav-divider">${suser.username}</li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/list?username=${suser.username}">车辆</a>
                            </li>
                            <li class="nav-item">
                                <a class="nav-link" href="${APP_PATH}/Renew?username=${suser.username}">续租车辆</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/Audit?username=${suser.username}">审核车辆</a>
                            </li>
                            <li class="nav-item ">
                                <a class="nav-link" href="${APP_PATH}/Account?username=${suser.username}">我的豌豆</a>
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
                        <div class="jumbotron">
						  <h1>账户概括</h1>
						  <h4>剩余豌豆：${suser.money}</h4>
						  <input type="hidden" id="in_username" value="${suser.username}">
						  <p><button type="submit" id="but_top" class="btn btn-primary">充值</button></p>
						</div>
						<div class="row">
							<div class="col-md-4 col-md-offset-8">
								<button class="btn btn-danger" id="div_but_select">查询订单</button>
							</div>
						</div>
						<div class="row">
						<div class="col-md-12">
						<table class="table table-hover" id="emps_table">
							<thead>
								<tr>
									<th>订单号</th>
									<th>车名</th>
									<th>订单天数</th>
									<th>金额</th>
									<th>起始时间</th>
									<th>终止时间</th>
									<th>订单状态</th>
								</tr>
							</thead>
							<tbody id="t_body1">
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
	
	//查询订单
	$("#div_but_select").click(function(){
		var att1 = $("#li_span").text();
		to_select(att1);
	})
	function to_select(ad){
		$.ajax({
			url:"${APP_PATH}/selectNA",
			data:"username="+ad,
			type:"GET",
			//回调函数
			success:function(result){
				build_emps_tables(result)
			}
		});
	}
	
	function build_emps_tables(result){
		//清空原有数据
		$("#t_body1").empty();
		//所有的员工数据
		var emps = result.extend.account;
		$.each(emps,function(index,item){
			//在<td></td>中装载数据
			var accCid = $("<td></td>").append(item.aid);
			var accCname = $("<td></td>").append(item.cname);
			var accRday = $("<td></td>").append(item.rday);
			var accConsumption = $("<td></td>").append(item.consumption);
			var accDate = $("<td></td>").append(item.date);
			var accEtime = $("<td></td>").append(item.etime);
			//0代表正在租用，1代表订单停止，2代表正在审核
			var accStatus = $("<td></td>").append(item.status=="1"?"订单已停止":item.status=="2"?"正在审核":"正在租用");
			//给delBtn按钮新增一个属性以表示唯一性
			$("<tr></tr>")
			.append(accCid)
			.append(accCname)
			.append(accRday)
			.append(accConsumption)
			.append(accDate)
			.append(accEtime)
			.append(accStatus)
			.appendTo("#t_body1");
		});
	}	
	
	
	//充值 充值金额：$("in_money").val   $("but_top_up").click  username
	$("#but_top").click(function(){
		var username = $("#in_username").val();
		if(username==""){
			alert("请登录后在充值！");
		}else{
			$("#modal_zc").modal({
				backdrop:"static"
			});
		}
		
	});
	
	$("#but_top_up").click(function(){
		var money = $("#in_money").val();
		
		var username = $("#in_username").val();
		$.ajax({
			url:"Topup?username="+username+"&money="+money,
			type:"POST",
			success:function(result){
				alert("充值成功！");
				window.location.reload()
			}
		})
	});	
	</script>

</body>
</html>


















