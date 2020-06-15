<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>豌豆租车</title>
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
    <nav class="navbar navbar-inverse">
    	<!-- 图标 -->
		<a class="navbar-brand" href="#">
            <img alt="豌豆" src="">
        </a>
    	<!-- 首页 -->
        <ul class="nav navbar-nav">
          <li><a href="#">首页</a></li>
        </ul>
		<!-- 电话邮箱 -->
        <ul class="nav navbar-nav navbar-right">
          <li class=""><a class="glyphicon glyphicon-phone" href="#"> 电话：15733190670</a></li>
        <li class=""><a class="glyphicon glyphicon-envelope" href="#"> 邮箱:731355053@qq.com</a></li>
        </ul>
    </nav>
    <div id="div1">
    <ul class="col-md-3 nav nav-pills nav-stacked">
      <li role="presentation" class="active"><a href="#">我的</a></li>
      <li role="presentation"><a href="#">租车</a></li>
      <li role="presentation" class="active"><a href="#">续租</a></li>
      <li role="presentation" class="active"><a href="#">归还</a></li>
      <li role="presentation" class="active"><a href="#">审核</a></li>
    </ul>
    </div>

    
</body>
</html>