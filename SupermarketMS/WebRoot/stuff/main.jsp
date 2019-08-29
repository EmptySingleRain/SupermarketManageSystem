<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,module.javabean.user.*,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="admin/css/style.css">

  </head>
  
  <body>
    <jsp:useBean id="formatetime" class="mybean.DateFormatTransform"></jsp:useBean>
    <div class="mainindex">
    
    <div class="welinfo">
    <span><img src="admin/images/sun.png" alt="天气" /></span>
    <b style="font-weight:bold; font-size:16px;text-transform:capitalize"><%=session.getAttribute("truename")%>早上好，欢迎使用信息管理系统</b>
    <a href="#">帐号设置</a>
    </div>
    
    <div class="welinfo">
    <span><img src="admin/images/time.png" alt="时间" /></span>
    <i>您上次登录的时间：<%=session.getAttribute("lastlogintime") %></i> （不是您登录的？<a href="#">请点这里</a>）
    <br><i style="margin-left:31px;">您的身份是：<%=session.getAttribute("groupname") %>,享有<font color="#BBBB00">XXX</font>权限(时间问题权限管理未全完成)</i>
    </div> </div>
    <div class="xline">
    <br><i style="margin-left:31px;">您登录的帐号名称是：<%=session.getAttribute("username") %></i>
    <br><i style="margin-left:31px;">您的注册时间是：<%=session.getAttribute("bdate") %></i>
    <br><i style="margin-left:31px;">您的登录次数为：<%=session.getAttribute("login_num") %></i>
    <br><i style="margin-left:31px;">您的上线时间是：<%=formatetime.format(new Timestamp(System.currentTimeMillis())) %></i>
    <br><i style="margin-left:31px;">检测到的本地IP地址为：<%=request.getRemoteAddr() %></i>
    </div>

  </body>
</html>
