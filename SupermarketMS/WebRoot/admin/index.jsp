<%@ page language="java" import="java.util.*,java.sql.Timestamp" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>主页面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<link rel="stylesheet" type="text/css" href="admin/css/style.css">
	<link rel="stylesheet" href="admin/css/jquery.hoverclock.css" media="screen" type="text/css" />

    <script type="text/javascript" src="admin/js/jquery-3.3.1.min.js"></script>
    <script type="text/javascript" src="admin/js/jquery.hoverclock.js"></script>
  </head>
  
  <body>
  <jsp:useBean id="formatetime" class="mybean.DateFormatTransform"></jsp:useBean>

<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    <div class="welinfo">
    <span><img src="admin/images/sun.png" alt="天气" /></span>
    <b style="font-weight:bold; font-size:16px;text-transform:capitalize"><%=session.getAttribute("adminname")%>早上好，欢迎使用信息管理系统</b>
    <a href="#">帐号设置</a>
    </div>
    
    <div class="welinfo">
    <span><img src="admin/images/time.png" alt="时间" /></span>
    <i>您上次登录的时间：<%=session.getAttribute("lastlogintime") %></i> （不是您登录的？<a href="#">请点这里</a>）
    </div> </div>
    <div class="xline"></div>
    <table align=center>
  <tr>
    <td align=right width=100>登陆帐号：</td>
    <td style="COLOR: #880000"><%=session.getAttribute("adminname") %></td></tr>
  <tr>
    <td align=right>真实姓名：</td>
    <td style="COLOR: #880000"><%=session.getAttribute("truename") %></td></tr>
  <tr>
    <td align=right>注册时间：</td>
    <td style="COLOR: #880000"><%=session.getAttribute("bdate") %></td></tr>
  <tr>
    <td align=right>登陆次数：</td>
    <td style="COLOR: #880000"><%=session.getAttribute("login_num") %></td></tr>
  <tr>
    <td align=right>上线时间：</td>
    <td style="COLOR: #880000">  <%=formatetime.format(new Timestamp(System.currentTimeMillis())) %></td></tr>
  <tr>
    <td align=right>IP地址：</td>
    <td style="COLOR: #880000"><%=request.getRemoteAddr() %></td>
    </tr>
     <!-- 
    <tr>
    <td align=right>网站开发QQ：</td>
    <td style="COLOR: #880000">231483490</td></tr>
    --> 
    </table>
    
    
    
    <table align=right style="position:absolute;bottom:65px;right:50px">
    <tr><td>
         <div id="hoverclock"></div>
          <script>
          $("#hoverclock").hoverclock({ });
          </script>    
    </td></tr>
    </table> 
      



  <!-- 

    
    <ul class="iconlist">
    
    <li><img src="admin/images/ico01.png" /><p><a href="#">管理设置</a></p></li>
    <li><img src="admin/images/ico02.png" /><p><a href="#">发布文章</a></p></li>
    <li><img src="admin/images/ico03.png" /><p><a href="#">数据统计</a></p></li>
    <li><img src="admin/images/ico04.png" /><p><a href="#">文件上传</a></p></li>
    <li><img src="admin/images/ico05.png" /><p><a href="#">目录管理</a></p></li>
    <li><img src="admin/images/ico06.png" /><p><a href="#">查询</a></p></li> 
            
    </ul>
    
    <div class="ibox"><a class="ibtn"><img src="admin/images/iadd.png" />添加新的快捷功能</a></div>
    
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="admin/images/dp.png" alt="提醒" /></span>
    <b>信息管理系统使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以快速进行文章发布管理操作</span><a class="ibtn">发布或管理文章</a></li>
    <li><span>您可以快速发布产品</span><a class="ibtn">发布或管理产品</a></li>
    <li><span>您可以进行密码修改、账户设置等操作</span><a class="ibtn">账户管理</a></li>
    </ul>
    
    <div class="xline"></div>
   
    <ul class="umlist">
    <li><a href="#">如何发布文章</a></li>
    <li><a href="#">如何访问网站</a></li>
    <li><a href="#">如何管理广告</a></li>
    <li><a href="#">后台用户设置(权限)</a></li>
    <li><a href="#">系统设置</a></li>
    </ul>

    </div>
     --> 
    
  </body>
</html>
