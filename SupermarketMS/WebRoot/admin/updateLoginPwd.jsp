<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>管理员密码修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/table.css">

  <script type="text/javascript" src="admin/js/updatepassword.js" charset="utf-8"></script>
  </head>

  <body>
 <form name="xiugai" action="servlet/UpdateLoginPwd" method="post" onsubmit="return checkForma();">
    <label>管理员口令修改</label> <br>
    <table width="291" height="111" border="1" class="table">
          <tr><th>账 &nbsp; &nbsp;号:</th><td><%=session.getAttribute("adminname")%></td></tr>
          <tr><th>密 &nbsp; &nbsp;码:</th><td><input type="text" name="mm"/></td></tr>
          <tr><th>确认密码:</th><td><input type="text" name="qrmm"/></td></tr>
          <tr><th>操 &nbsp; &nbsp;作:</th><td>&nbsp; <input type="submit" value="修改密码"/></td></tr>
        </table>
 </form>
  </body>
</html>
