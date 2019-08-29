<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>员工事务处理系统</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
		<meta name="renderer" content="webkit">
		
		<link rel="stylesheet" href="stuff/css/pintuer.css">
		<link rel="stylesheet" href="stuff/css/admin.css">
		
		<script src="stuff/js/base-loading.js"></script>
	    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
	    <script type="text/javascript" src="stuff/js/shouye.js"></script>

	</head>	
	<body style="background-color: #f2f9fd;">
	
		<div class="header bg-main">
			<div class="logo margin-big-left fadein-top">
				<h1>
					员工事务处理系统
				</h1>
			</div>
			<div class="head-l">
				<a class="button button-little bg-green" href="stuff/logout.jsp" ><span
					class="icon-home"></span> 退出登录</a> &nbsp;&nbsp;
				<a href="stuff/logout.jsp" class="button button-little bg-blue"><span
					class="icon-wrench"></span> 清除缓存</a> &nbsp;&nbsp;
			</div>
		</div>
		
		
		
		<div class="leftnav">
			<div class="leftnav-title">
				<strong><span class="icon-list"></span>菜单列表</strong>
			</div>



			<%
			if(session.getAttribute("groupid").equals("4")||session.getAttribute("groupid").equals("2")){
			%>
			<h2>
				<span class="icon-glass"></span>商品管理
			</h2>
			<ul>
				<li>
					<a href="stock/SaleGoods.jsp" target="right"><span
						class="icon-caret-right"></span>出售商品</a>
				</li>
				<li>
					<a href="servlet/SelectAllStock" target="right"><span
						class="icon-caret-right"></span>查询商品信息</a>
				</li>
				<li>
					<a href="servlet/SaleRecord" target="right"><span
						class="icon-caret-right"></span>历史销售情况</a>
				</li>
			</ul>
			<%
			}
			%>
			
			
			
			<%
			if(session.getAttribute("groupid").equals("3")||session.getAttribute("groupid").equals("2")){
			%>
			
			<h2>
				<span class="icon-shopping-cart"></span>库存管理
			</h2>
			<ul>
				<li>
					<a href="servlet/SelectAllStock" target="right"><span
						class="icon-caret-right"></span>查询所有库存</a><i></i>
				</li>
				<li>
					<a href="stock/SelectStock.jsp" target="right"><span
						class="icon-caret-right"></span>查询库存</a><i></i>
				</li>
				<li>
					<a href="stock/InsertStock.jsp" target="right"><span
						class="icon-caret-right"></span>增加商品</a><i></i>
				</li>
				<li>
					<a href="stock/DeleteStock.jsp" target="right"><span
						class="icon-caret-right"></span>删除商品</a><i></i>
				</li>
				<li>
					<a href="stock/UpdateStock.jsp" target="right"><span
						class="icon-caret-right"></span>修改商品</a><i></i>
				</li>
			</ul>
			
			<%
			}
			%>
			
			
			


			<%
			if(session.getAttribute("groupid").equals("2")){
			%>
			<h2>
				<span class="icon-users"></span>员工管理
			</h2>
			<ul>
				<li>
					<a href="servlet/SelectAllStuff" target="right"><span
						class="icon-caret-right"></span>所有员工</a>
				</li>
				<li>
					<a href="stuff/stuff/SelectStuff.jsp" target="right"><span
						class="icon-caret-right"></span>查询员工</a>
				</li>
				<li>
					<a href="stuff/stuff/InsertStuff.jsp" target="right"><span
						class="icon-caret-right"></span>添加员工</a>
				</li>
				<li>
					<a href="stuff/stuff/RemoveStuff.jsp" target="right"><span
						class="icon-caret-right"></span>革职员工</a>
				</li>
				<li>
					<a href="stuff/stuff/ResumeStuff.jsp" target="right"><span
						class="icon-caret-right"></span>复职员工</a>
				</li>
				<li>
					<a href="stuff/stuff/UpdateStuff.jsp" target="right"><span
						class="icon-caret-right"></span>更新员工信息</a>
				</li>
			</ul>
			<%
			}
			%>




			<h2>
				<span class="icon-user-md"></span>个人管理
			</h2>
			<ul>
				<li>
					<a href="UpdatePersonalInfo.jsp" target="right"><span
						class="icon-caret-right"></span>修改个人信息</a>
				</li>
				<li>
					<a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="stuff/logout.jsp" target="_top"><span
						class="icon-caret-right"></span>退出系统</a>
				</li>
			</ul>



		</div>

		<ul class="bread">
			<li>
				<a href="stuff/main.jsp" target="right" >首页</a>
			</li>
			<li>
				<a>网站信息</a>
			</li>
			<li>
				<b>当前语言：</b><span style="color: red;">中文&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span>
				<img src="stuff/img/time.png" alt="" />
				<span id="time" style="float: right"></span>
				<span id="hours"></span>
			</li>
		</ul>

		<div class="admin">
			<iframe scrolling="auto" rameborder="0" src="stuff/main.jsp"
				name="right" width="100%" height="100%"></iframe>
		</div>
		
		<div style="text-align: center;">
		</div>
	</body>
			<script src="stuff/js/time.js"></script>
</html>
