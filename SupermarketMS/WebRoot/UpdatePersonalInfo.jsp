<%@ page language="java" import="java.util.*,java.sql.*,java.text.SimpleDateFormat,module.javabean.user.*,java.util.Date" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>个人信息修改</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/table.css">
  <script type="text/javascript" src="admin/js/updateuser.js" charset="utf-8"></script>
  
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
  
  		<script language="javascript" type="text/javascript">
function myFocus(obj, color, str) {

	//判断文本框中的内容是否是默认内容

	if (obj.value == str) {
		obj.value = "";
	}

	//设置文本框获取焦点时候背景颜色变换
	obj.style.backgroundColor = color;
}

function myblur(obj, color, str) {

	//当鼠标离开时候改变文本框背景颜色
	if (obj.value == "") {
		obj.value = str;
	}
	obj.style.background = color;
}

</script>
</head>
  <body bgcolor='#e6f1fc'>
  <label>修改个人信息</label>
          <%  
			User user = new User();
			UserMethod um = new UserMethod();	
			//Timestamp timestamp;
			

					
			int id = Integer.parseInt(session.getAttribute("id").toString());
			
			user.setMasterid(id);
			ResultSet rs = um.selectUserById(user);
			if(rs.next()){
			
			SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd");
			Date csrq = dateformat.parse(rs.getString("birthday"));
			Date zcrq = dateformat.parse(rs.getString("bdate"));
			
        			ResultSet rs2 = um.selectGroupid(id);		
					String groupname="";
					boolean mallMember = true;
		            while(rs2.next()){
		            	int groupid =Integer.parseInt(rs2.getString("groupid"));
		            	
		            	if(um.selectGroupname(groupid).equals("商城会员")){
		            	mallMember = false;
		            	}
		            	
		            	groupname = groupname + um.selectGroupname(groupid)+" ";
		            }
					if(groupname==""){
						groupname="未设置";
					}			

        %>
      <form name="xiugai" action="servlet/UpdatePersonalInfo" method="post" onsubmit="return checkForma();">
        <table border="1" class="table">     
          <tr><th>用户名:</th><td style="width: 180px"><input type="text" name="yhm" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("name").trim() %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("name").trim()%>')" value="<%= rs.getString("name").trim()%>"/></td><td style="width: 80px"><span id="msg">请输入用户名</span></td></tr>
          <tr><th>当前密码:</th><td colspan="2"><%=rs.getString("password") %></td></tr>
          <tr><th>修改密码:</th><td colspan="2"><input type="password" name="mm" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("password") %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("password")%>')" value="<%= rs.getString("password")%>"/></td></tr>
          <tr><th>确认密码:</th><td colspan="2"><input type="password" name="qrmm" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("password") %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("password")%>')" value="<%= rs.getString("password")%>"/></td></tr>
          <tr><th>真实姓名:</th><td colspan="2"><input type="text" name="zsxm" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("truename").trim() %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("truename").trim()%>')" value="<%= rs.getString("truename").trim()%>"/></td></tr>
         
         <%if(rs.getString("sex").equals("男")){%> 
          <tr><th>性别:</th><td colspan="2"><a>男</a><input type="radio" name="xb" value="男" checked=true/><input name="id" value="<%=rs.getString("id").trim()%>" style="visibility:hidden;width:0%"/><a>女</a><input type="radio" name="xb" value="女" /></tr>
      <%   } else{%>
          <tr><th>性别:</th><td colspan="2"><a>男</a><input type="radio" name="xb" value="男"/><input name="id" value="<%=rs.getString("id").trim()%>" style="visibility:hidden;width:0%"/><a>女</a><input type="radio" name="xb" value="女" checked=true/></tr>
        <%}%> 
        
        
          <tr><th>出生日期:</th><td colspan="2"><input type="date" name="csrq" value=<%=dateformat.format(csrq)%> /></td></tr>
          <tr><th>联系方式:</th><td colspan="2"><input type="text" name="lxfs" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("mobile").trim() %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("mobile").trim()%>')" value="<%= rs.getString("mobile").trim()%>"/></td></tr>
          <tr><th>E-mail:</th><td colspan="2"><input type="text" name="yx" onfocus="myFocus(this,'#f4eaf1','<%=rs.getString("email").trim() %>')" onblur="myblur(this,'#e6f1fc','<%= rs.getString("email").trim()%>')" value="<%= rs.getString("email").trim()%>"/></td></tr>
          <tr><th>注册日期:</th><td colspan="2"><input name="zcrq" class="defult" value="<%=dateformat.format(zcrq)%>" readOnly="true"/></td></tr>
          <tr><th>用户组别:</th><td colspan="2"><%=groupname %><%if(mallMember){ %>
          <a href="servlet/BindAccount">绑定商城帐号</a>
          
          <%} %></td></tr>
          <tr><th>操&nbsp;&nbsp;&nbsp;作:</th><td colspan="2"><input type="submit" value="修改"  style="margin-right:60px;" /><input type="reset" value="重写"/></td></tr>
        </table>
      </form>

      <%}
      else{%>
      
      <script language='javascript'>alert('没有查询本地数据？！请通知管理员');window.location.href='../admin/main.jsp';</script>
      <%
      }    
      %>
  </body>
</html>
