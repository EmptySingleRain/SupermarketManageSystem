<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>账户修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
	<meta http-equiv="X-UA-Compatible" content="IE=edge">
	<meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
	<meta name="renderer" content="webkit">
	<title></title>
	
	<link rel="stylesheet" href="stuff/css/pintuer.css">
	<link rel="stylesheet" href="stuff/css/admin.css">
    <link rel="stylesheet" href="layui/css/layui.css"> 
    
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="stuff/js/pintuer.js"></script>
    <script src="layui/layui.js"></script> 

  </head>
  
  <body>
   <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-key"></span> 手机号更改</strong></div>
  <div class="body-content">

    <form method="post" class = "layui-form" action="Passchg">
      <div class="form-group">
      </div> 
      <div class="layui-form-item">
        <label class="layui-form-label">姓名：</label>
        <div class="field">
          <input type="text" class="input w50" name="u_ser" size="50" placeholder="请输入姓名" " />          
        </div>
      </div>         
       <div class="layui-form-item">
        <label class="layui-form-label">电话：</label>
        <div class="field">
          <input type="text" class="input w50"  name="tel" size="50" lay-verify="phone" />
        </div>
      </div>
           
      <div class="layui-form-item">  
                            <div class="layui-input-block">  
                              <button class="button bg-main icon-check-square-o" lay-filter="demo2" lay-submit="" type="submit" >提交</button>  
                              <button class="button bg-main icon-check-square-o" type="reset">重置</button>  
                            </div>  
                          </div>    
    </form>
  </div>
</div>
  </body>
</html>
