<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://" + request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>超市管理系统</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="css/supersized.css">
<link rel="stylesheet" type="text/css" href="css/login.css">

<script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
<script type="text/javascript" src="js/Validform_v5.3.2_min.js"></script>
<script type="text/javascript" src="js/jquery.SuperSlide.js"></script>
<script type="text/javascript" src="js/custom.tab.js"></script>
<script type="text/javascript" src="js/custom.form.js"></script>
<script type="text/javascript" src="js/supersized.3.2.7.min.js"></script>
<script type="text/javascript" src="js/supersized-init.js"></script>

</head>

<body>

	<div id="tab">
		<ul class="tab_menu">
			<li class="selected">商城登录</li>
			<li>员工登录</li>
			<li>管理员登录</li>
		</ul>
		<div class="tab_box">
			<!-- 商城登录开始 -->
			<div>
				<div class="customer_error_box"></div>
				<form action="servlet/MallLogin?origin=startlogin" method="post" class="customer_login_error">
					<div id="username">
						<label> 会员号： </label> <input type="text" name="username" placeholder="输入您的会员编号" nullmsg="编号不能为空！"
							datatype="s5-18" errormsg="编号范围在5~18个字符之间！" sucmsg="编号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label> 密&nbsp;&nbsp;&nbsp;码： </label> <input type="password" name="password" placeholder="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label> 验证码： </label> <input type="text" name="code" placeholder="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="验证码验证通过！" /> 
							<img src="ImageServlet" title="点击更换" alt="验证码占位图" onclick="this.src='ImageServlet?'+Math.random();"/>
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>
							记住密码 </label>
						<a href="Register.jsp" style="margin-left:60px;">注册</a>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 商城登录结束-->
			<!-- 员工登录开始-->
			<div class="hide">
				<div class="staff_error_box"></div>
				<form action="servlet/StuffLogin" method="post" class="staff_login_error">
					<div id="username">
						<label> 员工号： </label> <input type="text" name="username" placeholder="输入员工号" nullmsg="员工号不能为空！" datatype="s5-18"
							errormsg="员工号范围在5~18个字符之间！" sucmsg="员工号验证通过！" />
					</div>
					<div id="password">
						<label> 密&nbsp;&nbsp;&nbsp;码： </label> <input type="password" name="password" placeholder="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label> 验证码： </label> <input type="text" name="code" placeholder="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="验证码验证通过！" /> 
							<img src="ImageServlet" title="点击更换" alt="验证码占位图" onclick="this.src='ImageServlet?'+Math.random();"/>
					</div>
					<div id="remember">
						<input type="checkbox" name="remember"> <label>
							记住密码 </label>
						<a style="margin-left:60px;"></a>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 员工登录结束-->
			<!-- 管理员登录开始-->
			<div class="hide">
				<div class="admin_error_box"></div>
				<form action="servlet/AdminLogin"  method="post" class="admin_login_error">
					<div id="username">
						<label> 账&nbsp;&nbsp;&nbsp;号： </label> <input type="text" name="username" placeholder="输入账号"
							nullmsg="账号不能为空！" datatype="s5-18" errormsg="账号范围在5~18个字符之间！"
							sucmsg="账号验证通过！" />
						<!--ajaxurl="demo/valid.jsp"-->
					</div>
					<div id="password">
						<label> 密&nbsp;&nbsp;&nbsp;码： </label> <input type="password" name="password" placeholder="输入密码"
							nullmsg="密码不能为空！" datatype="*6-16" errormsg="密码范围在6~16位之间！"
							sucmsg="密码验证通过！" />
					</div>
					<div id="code">
						<label> 验证码： </label> <input type="text" name="code" placeholder="输入验证码" nullmsg="验证码不能为空！" datatype="*4-4"
							errormsg="验证码有4位数！" sucmsg="验证码验证通过！"  onfocus="yzm()"/> 
							<img src="ImageServlet" title="点击更换" alt="验证码占位图" onclick="this.src='ImageServlet?'+Math.random();"/>
					</div>
					
					<div class="center" id="yzm_img" style="display:none">
					<img src="ImageServlet" height="50px" id="yzm_img_real" title="点击更换" alt="验证码占位图" />
					</div>
					
					<div id="remember">
						<input type="checkbox" name="remember"> <label>
							记住密码 </label>
					<a style="margin-left:60px;"></a>
					</div>
					<div id="login">
						<button type="submit">登录</button>
					</div>
				</form>
			</div>
			<!-- 管理员登录结束-->
		</div>
	</div>

	<div class="bottom">copyright © 2018 软件项目管理小组
		翟宇恒-应自力-黎俊均-叶苏韵-郭含祺-刘函寅-朱富强</div>
		

</body>
</html>
