<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户组别</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/table.css">

  </head>
  
  <body bgcolor='#e6f1fc'>
    <label>添加组别信息</label>
      <form name="tianjia" action="servlet/InsertGroupmanager" method="post" onsubmit="return checkForma();">
        <table border="1" class="table">
          <tr><th>组别名:</th><td colspan="2"><input type="text" name="zbm"/></td></tr>
          <tr><th>组别信息:</th><td colspan="2"><input type="text" name="zbxx"/></td></tr>

          <tr><th>操&nbsp;&nbsp;&nbsp;作:</th><td colspan="2"><input type="submit" value="添加" style="margin-right:40px;"/><input type="reset" value="重写"/></td></tr>
        </table>
      </form>
  </body>
</html>
