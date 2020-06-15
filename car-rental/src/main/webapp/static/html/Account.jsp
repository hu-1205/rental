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
<meta charset="UTF-8">

	<script type="text/javascript" src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/jquery-3.2.1.min.js"></script>
	<!-- 引入bootStrap-->
	<link href="${APP_PATH}/static/bootstrap-3.3.7-dist/css/bootstrap.min.css" rel="stylesheet">
	<script src="${APP_PATH}/static/bootstrap-3.3.7-dist/js/bootstrap.min.js"></script>
	

    <!--样式层-->
    <link rel="stylesheet" href="${APP_PATH}/static/assets/lib/css/index.css">


<title>我的账户</title>
</head>
<body>

	<!-- 模态框 -->
	<div class="modal fade" id="modal_jiazhao" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">请填写信息:</h4>
	      </div>
	      	 <div class="form-group">
			    <label for="inputEmail3"  class="col-sm-2 control-label">名称:</label>
			    <div class="col-sm-10">
			      <input type="text" name="username" class="form-control" id="user_name_add" placeholder="song">
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
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_Upload" class="btn btn-primary">上传</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	
	<!-- 模态框 -->
	<div class="modal fade" id="modal_cz" tabindex="-1" role="dialog">
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
	
	<!-- 提现 -->
	<!-- 模态框 -->
	<div class="modal fade" id="modal_tye" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">请输入:</h4>
	      </div>
	      <div class="modal-body">
	          <div class="form-group">
			    <label class="sr-only" for="exampleInputAmount">输入提现金额</label>
			    <div class="input-group">
			      <div class="input-group-addon">$</div>
			      <input type="text" id="in_txmoney" class="form-control" placeholder="500">
			      <div class="input-group-addon">豌豆</div>
			    </div>
			  </div>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_top_yetx" class="btn btn-primary">确认提现</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 充押金 -->
	<!-- 模态框 -->
	<div class="modal fade" id="modal_czyj" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">确认充值押金500元?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_top_czyz" class="btn btn-primary">确认充值</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->
	<!-- 退押金 -->
	<!-- 模态框 -->
	<div class="modal fade" id="modal_txyj" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">确认退出押金500元?</h4>
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
	        <button type="button" id="but_top_txyj" class="btn btn-primary">确认提现</button>
	      </div>
	    </div><!-- /.modal-content -->
	  </div><!-- /.modal-dialog -->
	</div><!-- /.modal -->

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
    
    <div class="cars" style="margin-left:-15px">
	       <div class="dashboard-wrapper">
            <div class="dashboard-ecommerce">
                <div class="container-fluid dashboard-content ">
                    <div class="ecommerce-widget">
                        <div class="jumbotron">
						  <h3 style="margin-left:50%;margin-top:5px;">账户概括</h3>						 
						</div>
							<div style=";margin-bottom:50px;">
							 <div style="width:500px; float:left;margin-left:50px;">
						  	  <h4>剩余豌豆：${suser.money}</h4><br>
							  <input type="hidden" id="in_username" value="${suser.username}">
							  <p><button type="button" id="but_chongzhi" class="btn btn-primary">充值</button>
							  <button type="button" id="but_tixian" class="btn btn-danger">提现</button></p>
						  </div>
						  <div style="width:400px;float:left;">
						  	  <h4>押金（500）：${suser.deposit}</h4><br>
							  <input type="hidden" id="in_username" value="${suser.username}">
							  <!-- Indicates a successful or positive action -->
							  <button type="button" id="but_zhifu" class="btn btn-success">支付押金</button>
								
							  <!-- Contextual button for informational alert messages -->
								<button type="button" id="but_tuichu" class="btn btn-info">退出押金</button>
						  </div>
						  <div style="width:200px;float:left;">
						  	  <h4>驾照审核情况<br><br>
						  	  <input id="in_sh" type="hidden" value="${driver.flag}">
						  	  <span id="shenhe3" class="label label-default" >请重新提交</span>
						  	  <button type="button" id="shenhe4" class="btn btn-info">上传</button>
							  <span id="shenhe1" class="label label-default" >待审核</span>
							  <span id="shenhe2" class="label label-default" >审核通过</span>
						  	  </h4>
						  </div>	
							<div class="clear"></div>
						</div>	
											
							<div>								
							  	<div class="panel panel-default">
								  <!-- Default panel contents -->
								  <div class="panel-heading"><h3>待支付信息</h3></div>
								
								  <!-- Table -->
								  <table class="table">
								  	<tr>
								    	<th>用户</th>
								    	<th>车名</th>						    									    	
								    	<th>取车时间</th>
								    	<th>还车时间</th>
								    	<th>租用天数</th>
								    	<th>租用金额</th>
								    	<th>汽车编号</th>
								    	<th>操作</th>
								  	</tr>
								  <c:forEach items="${uaudits}" var="base">
								    <tr>
								    	<th>${base.username}</th>
								    	<th>${base.cname}</th>
								    	<th>${base.starttime}</th>
								    	<th>${base.endtime}</th>
								    	<th>${base.day}</th>
								    	<th>${base.dmoney}</th>
								    	<th>${base.cid}</th>
								    	<th>
										<button z-id="${base.uid}" type="button" class="btn btn-danger edit_but">支付</button>
										</th>
								  	</tr>
								  </c:forEach> 
								  </table>
								</div>
								 <div class="clear"></div>
							</div>
							<div class="col-md-4 col-md-offset-10">
								<button  class="btn btn-danger" id="div_but_select">历史订单</button>
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
	      <div class="clear"></div>
	    </div>
    
    

	<div class="below">
			
	</div>
	
	
	
    <script type="text/javascript">
    
   
    
	//隐藏登录注册页面li_span
	if($("#in_sh").val()==="0"){
		$("#shenhe2").css('visibility', 'hidden');
		$("#shenhe3").css('visibility','hidden');
		$("#shenhe4").css('visibility', 'hidden');
	}else if($("#in_sh").val()==="1"){
		$("#shenhe1").css('visibility','hidden');
		$("#shenhe3").css('visibility','hidden');
		$("#shenhe4").css('visibility','hidden'); 
	}else if($("#in_sh").val()==="2"){
		$("#shenhe1").css('visibility','hidden');
		$("#shenhe2").css('visibility','hidden'); 
	}else{
		$("#shenhe1").css('visibility','hidden');
		$("#shenhe2").css('visibility','hidden');
		$("#shenhe3").css('visibility','hidden');
		$("#shenhe4").css('visibility','hidden');
		
	}
	
	//显示审核
	if($("#li_span").text()!=""){
		$("#a_zhice").css('visibility', 'hidden');
		$("#a_denglu").css('visibility', 'hidden');
	}else{
		$("#li_yonghu").css('display','none'); 
	}
	
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
		var username = $("#li_span").text();
		alert(username);
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
				alert("待审核！");
				window.location.reload()
			}
		})
	});
	
	
	//给支付按钮绑定事件
	$(document).on("click",".edit_but",function(){
		var zid = $(this).attr("z-id");
		if(confirm("确认支付?")){
			$.ajax({
				url:"Pay?zid="+zid,
				type:"POST",
				success:function(result){
					window.location.reload()
				}
			})
		}
	})

	//充值余额but_chongzhi  but_tixian   but_zhifu   but_tuichu
	//提现余额
	//支付押金
	//退出押金
	$("#but_chongzhi").click(function(){
		var username = $("#li_span").text();
		if(username==""){
			alert("请登录后在充值！");
		}else{
			$("#modal_cz").modal({
				backdrop:"static"
			});
		}
	})
	
	//提现余额
	$("#but_tixian").click(function(){  
		var username = $("#li_span").text();
	if(username==""){
		alert("请登录！");
	}else{
		$("#modal_tye").modal({
			backdrop:"static"
		});
	}
	});
	
	$("#but_top_yetx").click(function(){
		var money = $("#in_txmoney").val();
		
		var username = $("#in_username").val();
		$.ajax({
			url:"Retreat?username="+username+"&money="+money,
			type:"POST",
			success:function(result){
				alert("待审核！");
				window.location.reload()
			}
		})
	});	
	//modal_tye  modal_czyj modal_txyj
	//but_top_yetx  but_top_tye  but_top_thyj
	
	//支付押金but_top_czyz but_top_txyj
	$("#but_zhifu").click(function(){
		var username = $("#li_span").text();
		if(username==""){
			alert("请登录！");
		}else{
			$("#modal_czyj").modal({
				backdrop:"static"
			});
		}
	})
	$("#but_top_czyz").click(function(){		
		var username = $("#in_username").val();
		$.ajax({
			url:"Deposit?username="+username,
			type:"POST",
			success:function(result){
				alert("待审核！");
				window.location.reload()
			}
		})
	});	
	//提现押金
	$("#but_tuichu").click(function(){
		var username = $("#li_span").text();
		if(username==""){
			alert("请登录！");
		}else{
			$("#modal_txyj").modal({
				backdrop:"static"
			});
		}
	})
	$("#but_top_txyj").click(function(){
		var username = $("#in_username").val();
		$.ajax({
			url:"Depositrefund?username="+username,
			type:"POST",
			success:function(result){
				alert("待审核！");
				window.location.reload()
			}
		})
	});
	
	//驾照模态框
	$("#shenhe4").click(function(){
		
			$("#modal_jiazhao").modal({
				backdrop:"static"
			});
		
	})
	
	 $("#but_Upload").click(function(){       
		    //创建一个forData 
		      var formData = new FormData();
		      formData.append("ps_file1",$("#in_file_imgadd1")[0].files[0]);
		      formData.append("ps_file2",$("#in_file_imgadd2")[0].files[0]);
		      formData.append("in_cname",$("#user_name_add").val());
		   
		      $.ajax({
		          type : 'POST',
		          url : '${APP_PATH}/UploadDriver',
		          data : formData,
		          dataType:"json",
		          async: false,  
		          cache : false,
		          processData : false,
		          contentType : false,
		          success:function(result){
		        	  alert("上传成功！");
		        	  window.location.reload()
		          }
		      })
		  });
	
	
	</script>

	

</body>
</html>