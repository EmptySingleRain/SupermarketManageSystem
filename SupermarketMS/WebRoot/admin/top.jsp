<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>TOP</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

<link rel="stylesheet" type="text/css" href="admin/css/style.css">
<script type="text/javascript">
//获取系统时间
function showTime() {
nowtime = new Date();
year = nowtime.getFullYear();//年
month = nowtime.getMonth() + 1;//月
day = nowtime.getDate();//日
hour = nowtime.getHours();//时
minutes = nowtime.getMinutes(); //分
seconds = nowtime.getSeconds(); //秒
//文字增加空格
document.getElementById("div_timer").style = "white-space:pre;font-size:20px;";
//显示时间
document.getElementById("div_timer").innerText = year + "." + p(month) + "." + p(day) + " " + p(hour) + ":" + p(minutes) + ":" + p(seconds);
}
setInterval("showTime()", 1000);
//月日时分秒小于10补0
function p(s) {
return s < 10 ? '0' + s : s;
}
</script>
  </head>
<body style="background:url(admin/images/topbg.gif) repeat-x;">

  <jsp:useBean id="formatetime" class="mybean.DateFormatTransform"></jsp:useBean>
  
<table cellSpacing=0 cellPadding=0 width="100%" 
background="admin/images/header_bg.jpg" border=0>
  <tr height=56>
    <td width=260>
    <div class="topleft">
    <a href="admin/main.jsp" target="_parent"><img src="admin/images/logo.png" title="系统首页" /></a>
    </div>
    </td>
    
    <td style="font-weight: bold; color: #d1d2e0; padding-top:0px;text-transform:capitalize" <%//转换大小写，capiyalize首字母大写 %>
      align=middle>当前用户：<%=session.getAttribute("adminname") %> &nbsp;&nbsp; <A style="COLOR: #d1d2e0" 
      href="admin/updateLoginPwd.jsp" target=main>修改口令</A>
      <div id="div_timer" style="font-size:20px;" >实时时间</div>
       
    </td>
 
    <td align=center width=268>
      
    <div class="topright">    
    <ul>
    <li><span><img src="admin/images/help.png" title="帮助"  class="helpimg"/></span><a href="#">帮助</a></li>
    <li><a href="#">关于</a></li>
    <li><a onclick="if (confirm('确定要退出吗？')) return true; else return false;" href="admin/logout.jsp" target="_parent">退出</a></li>
    </ul>
    <div class="user">
    <span><%=session.getAttribute("adminname") %></span>
    <i>消息</i>
    <b>5</b>
    </div></div>    
        
        
      </td>
      </tr>
      </table>


            

</body>
</html>
