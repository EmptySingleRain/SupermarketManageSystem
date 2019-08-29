<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>左页面</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css"
	href="admin/css/style.css">
<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript">
	$(function() {
		//导航切换
		$(".menuson li").click(function() {
			$(".menuson li.active").removeClass("active")
			$(this).addClass("active");
		});

		$('.title').click(function() {
			var $ul = $(this).next('ul');
			$('dd').find('ul').slideUp();
			if ($ul.is(':visible')) {
				$(this).next('ul').slideUp();
			} else {
				$(this).next('ul').slideDown();
			}
		});
	})
</script>
</head>

<body style="background:#f0f9fd;">
	<div class="lefttop">
		<span></span>通讯录(未制作)
	</div>

	<dl class="leftmenu">

		<dd>
			<div class="title">
				<span><img src="admin/images/i12.png" /></span>组别管理
			</div>
			<ul class="menuson">				
			    <li><cite></cite><a href="servlet/SelectGroupmanager" target="rightFrame">查询组别</a><i></i></li>
			    <li><cite></cite><a href="admin/groupmanager/UpdateDeleteGroupmanager.jsp" target="rightFrame">改删组别</a><i></i></li>
				<li><cite></cite><a href="admin/groupmanager/InsertGroupmanager.jsp" target="rightFrame">添加组别</a><i></i></li>
				<li><cite></cite><a href="admin/groupmanager/GrantGroupmanager.jsp" target="rightFrame">赋予组别</a><i></i></li>
				<li><cite></cite><a href="admin/groupmanager/RevokeGroupmanager.jsp" target="rightFrame">撤销组别</a><i></i></li>
			</ul>
		</dd>

		<dd>
			<div class="title">
				<span><img src="admin/images/i11.png" /></span>权限管理
			</div>
			<ul class="menuson">				
				<li><cite></cite><a href="#" target="rightFrame">查询权限</a><i></i></li>
				<li><cite></cite><a href="#" target="rightFrame">改删权限</a><i></i></li>
				<li><cite></cite><a href="#" target="rightFrame">添加权限</a><i></i></li>
				<li><cite></cite><a href="#" target="rightFrame">赋予权限</a><i></i></li>
			</ul>
		</dd>
		
		<dd>
			<div class="title">
				<span><img src="admin/images/i13.png" /></span>用户管理
			</div>
			<ul class="menuson">
			    <li><cite></cite><a href="servlet/SelectAllUser" target="rightFrame">所有用户</a><i></i></li>
				<li><cite></cite><a href="admin/user/SelectUser.jsp" target="rightFrame">查询用户</a><i></i></li>
				<li><cite></cite><a href="admin/user/InsertUser.jsp" target="rightFrame">增加用户</a><i></i></li>
				<li><cite></cite><a href="admin/user/UpdateUser.jsp" target="rightFrame">修改用户</a><i></i></li>
				<li><cite></cite><a href="admin/user/DeleteUser.jsp" target="rightFrame">删除用户</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img src="admin/images/i04.png" /></span>库存管理
			</div>
			<ul class="menuson">
			    <li><cite></cite><a href="servlet/SelectAllStock" target="rightFrame">查询所有库存</a><i></i></li>
				<li><cite></cite><a href="stock/SelectStock.jsp" target="rightFrame">查询库存</a><i></i></li>
				<li><cite></cite><a href="stock/InsertStock.jsp" target="rightFrame">增加商品</a><i></i></li>
				<li><cite></cite><a href="stock/DeleteStock.jsp" target="rightFrame">删除商品</a><i></i></li>
				<li><cite></cite><a href="stock/UpdateStock.jsp" target="rightFrame">修改商品</a><i></i></li>
			</ul>
		</dd>


		<dd>
			<div class="title">
				<span><img src="admin/images/i07.png" /></span>个人管理
			</div>
			<ul class="menuson">
				<li><cite></cite><a href="admin/updateLoginPwd.jsp" target="rightFrame">修改口令</a><i></i></li>
				<li><cite></cite><a href="UpdatePersonalInfo.jsp" target="rightFrame">个人信息修改</a><i></i></li>
				<li><cite></cite><a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="admin/logout.jsp" target=_top>退出系统</a><i></i></li>
			</ul>

		</dd>

	</dl>
</body>
</html>
