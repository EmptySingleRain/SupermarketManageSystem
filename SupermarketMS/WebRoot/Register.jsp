<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>用户注册</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
    
    <link rel="stylesheet" type="text/css" href="mall/css/register.css">
    
    <script type="text/javascript" src="admin/js/insertuser.js"></script> 

  </head>
  
  <body>
<form name="tianjia" method="post" action="servlet/Register" onsubmit="return checkForma();">
		<div class="regist">
			<div class="regist_center">
				<div class="regist_top">
					<div class="left fl">会员注册</div>
					<div class="right fr"><a href="mall/index.jsp" target="_self">Zero Light</a></div>
					<div class="clear"></div>
					<div class="xian center"></div>
				</div>
				<div class="regist_main center">
					<div class="username">用&nbsp;&nbsp;户&nbsp;&nbsp;名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="yhm" placeholder="请输入你的用户名"/><span>中英文数字，5~18字符</span></div>
					<div class="username">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="mm" placeholder="请输入你的密码"/><span>密码总长度不得小于6位,高于16位</span></div>
					<div class="username">确认密码:&nbsp;&nbsp;<input class="shurukuang" type="password" name="qrmm" placeholder="请确认你的密码"/><span>两次密码要输入一致哦</span></div>
					
					<div class="username">真实姓名:&nbsp;&nbsp;<input class="shurukuang" type="text" name="zsxm" placeholder="请输入你的真实姓名"/><span>姓名应该是2-4位中文</span></div>
					
					<div class="username">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:&nbsp;&nbsp;<a style="margin-left: 30px">男</a><input type="radio" name="xb" value="男" checked=true/>  &nbsp;  <a>女</a><input type="radio" name="xb" value="女" /><span style="margin-left: 140px">请选择性别</span></div>
					
					<div class="username">出生日期:&nbsp;&nbsp;<input type="date" name="csrq" value=""/><span style="margin-left: 104px">请填写出生日期</span></div>
					
					<div class="username">手&nbsp;&nbsp;机&nbsp;&nbsp;号:&nbsp;&nbsp;<input class="shurukuang" type="text" name="lxfs" placeholder="请填写正确的手机号"/><span>手机号为11位</span></div>
		
					<div class="username">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:&nbsp;&nbsp;<input class="shurukuang" type="text" name="yx" placeholder="请输入你的邮箱"/><span>请注意邮箱输入格式xxxxx.@xxx.com</span></div>
					
					<div class="username">
						<div class="left fl">验&nbsp;&nbsp;证&nbsp;&nbsp;码:&nbsp;&nbsp;<input class="yanzhengma" type="text" name="code" placeholder="请输入验证码"/></div>
						<div class="right fl"><img src="ImageServlet" title="点击更换" alt="验证码占位图" onclick="this.src='ImageServlet?'+Math.random();"/></div>
						<div class="clear"></div>
					</div>
				</div>
				<div class="regist_submit">
					<input class="submit" type="submit" name="submit" value="立即注册" >
				</div>
				
			</div>
		</div>
		</form>
  </body>
</html>
