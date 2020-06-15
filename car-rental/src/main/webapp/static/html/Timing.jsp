<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
//拿到本项目路径
	pageContext.setAttribute("APP_PATH",request.getContextPath());
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
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
				      <p>
				      <input type="file" name="imgadd" id="in_file_imgadd" class="form-control col-md-8">
				      <button type="button" class="btn btn-primary">上传</button>
				    	</p>
				    </div>
				  </div>
				  
				</form>
				
	      </div>
	      <div class="modal-footer">
	        <button type="button" class="btn btn-primary" id="add_dept">新增</button>
	      </div>


<script src="${APP_PATH}/static/assets/vendor/jquery/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
$("#add_dept").click(function(){       
    //创建一个forData 
      var formData = new FormData();
      formData.append("ps_file",$("#in_file_imgadd")[0].files[0]);
      formData.append("in_cname",$("#in_cname").val());
      formData.append("in_cride",$("#in_cride").val());
      formData.append("in_dayr",$("#in_dayr").val());          
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
          }
      })
  });
</script>

  
</body>
</html>