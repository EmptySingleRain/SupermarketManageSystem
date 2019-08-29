<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加用户</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="admin/css/table.css">

  <script type="text/javascript" src="admin/js/insertuser.js" charset="utf-8"></script>
  
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
                msg.innerHTML="<font color='green'>可以使用</font>";
              }else{
                msg.innerHTML="<font color='red'>该昵称已注册</font>";
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
    
</script>
 
  </head>
  
  <body bgcolor='#e6f1fc'>

  
  <label>添加用户</label>
      <form name="tianjia" action="servlet/InsertUser" method="post" onsubmit="return checkForma();">
        <table border="1" class="table">
          <tr><th>用户名:</th><td style="width: 180px"><input type="text" name="yhm"/></td><td><span id="msg">请输入用户名</span></td></tr>
          <tr><th>密&nbsp;&nbsp;&nbsp;码:</th><td colspan="2"><input type="password" name="mm"/></td></tr>
          <tr><th>确认密码:</th><td colspan="2"><input type="password" name="qrmm"/></td></tr>
          <tr><th>真实姓名:</th><td colspan="2"><input type="text" name="zsxm"/></td></tr>
          <tr><th>性&nbsp;&nbsp;&nbsp;别:</th><td colspan="2"><a>男</a><input type="radio" name="xb" value="男" checked=true/>  &nbsp;  <a>女</a><input type="radio" name="xb" value="女" /></td></tr>
          <tr><th>出生日期:</th><td colspan="2"><input type="date" name="csrq" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(1970-01-01)%>"/></td></tr>
          <tr><th>联系方式:</th><td colspan="2"><input type="text" name="lxfs"/></td></tr>
          <tr><th>E-mail:</th><td colspan="2"><input type="text" name="yx"/></td></tr>
         <!-- <tr><th>注册日期:</th><td colspan="2"><input type="date" name="zcrq" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" disabled/></td></tr> -->
          <tr><th>注册日期:</th><td colspan="2"><input name="zcrq" class="defult" value="<%=new SimpleDateFormat("yyyy-MM-dd").format(new Date())%>" readOnly="true"/></td></tr>
          <tr><th>用户组别:</th><td colspan="2">请进入组别管理板块对其进行分组以及相关权限的分配</td></tr>
          <tr><th>操&nbsp;&nbsp;&nbsp;作:</th><td colspan="2"><input type="submit" value="注册" style="margin-right:60px;"/><input type="reset" value="重写"/></td></tr>
        </table>
      </form>


      </body>
</html>
