<%@ page language="java" import="java.util.*,module.javabean.user.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>赋予组别界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="admin/css/table.css">

  </head>
<script>
window.onload=function()
    {
      var nameElement=document.getElementsByName("yhm")[0];
      
      //为昵称选项注册onblur事件
      nameElement.onblur=function()
      {
        var name=this.value.trim();
        
        //1.获取XMLHttpRequest对象
        var req=getXMLHttpRequest();
        
        //4.处理响应结果
        req.onreadystatechange=function(){
          if(req.readyState==4){//XMLHttpRequest对象读取成功
            if(req.status==200){//服务器相应正常
              var msg=document.getElementById("msg");
              //根据返回的结果显示不同的信息
              if(req.responseText=="empty"){
              msg.innerHTML="请输入用户名";
              }
              else if(req.responseText=="true"){
                msg.innerHTML="<font color='red'>用户不存在</font>";
              }else{
                msg.innerHTML="<font color='green'>用户存在</font>";
              }
            }
          }
        }
        
        //2.建立一个连接
        req.open("get","${pageContext.request.contextPath}/servlet/TestingUsername?name="+name);
        
        //3.发送get请求
        req.send(null);
      }
    }
    
    function getXMLHttpRequest(){
    var xmlhttp;
    if (window.XMLHttpRequest) {// code for IE7+, Firefox, Chrome, Opera, Safari
      xmlhttp = new XMLHttpRequest();
    } else {// code for IE6, IE5
      xmlhttp = new ActiveXObject("Microsoft.XMLHTTP");
    }
    return xmlhttp;
}

function tianjiafm() {
	if (!confirm("请确定用户存在,组别名为下拉菜单的内容")) {
		window.event.returnValue = false;
	}
}
    
</script>

  <body bgcolor='#e6f1fc'>
  <% 
  UserMethod um = new UserMethod();
  ResultSet rs = um.selectGroupmanager();
  %>
      <datalist id="groupnamelist">
      <% 
      String str="";
      int j=0;
      while(rs.next()){
      %>
      <option>  
      <%=rs.getString("groupname").trim()%>
      </option>
      <%
      if(j==0)
      str+=rs.getString("groupname").trim();
      else
      str= str + "|" +rs.getString("groupname").trim();
      j++;
      } %>
      </datalist>
          
  <label>赋予组别信息</label>
<form name="fuyu" action="servlet/GrantGroupmanager" method="post" onsubmit="return checkForma();">
        <table border="1" class="table">
          <tr><th>用户名:</th><td ><input type="text" name="yhm" list="usernamelist" style="margin-bottom:10px;"/></td><td style="width:100px;"><span id="msg">请输入用户名</span></td></tr>
          <tr><th>组别名:</th><td colspan="2"><input type="text" name="zb" onchange="value=value.replace(/^((?!<%=str %>).)+$/,'')"  list="groupnamelist" style="margin-bottom:10px;"/></td></tr>
          <tr><th>操&nbsp;&nbsp;&nbsp;作:</th><td colspan="2" style="width: 280px"><input type="submit" value="添加" onclick="javascript:tianjiafm()" style="margin-right:30px;" /><input type="reset" value="重写"/></td></tr>
        </table>
      </form>
      
      

      
  </body>
</html>
