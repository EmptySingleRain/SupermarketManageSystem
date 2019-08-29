<%@ page language="java" import="java.util.*,java.sql.*,module.javabean.user.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>革职员工</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/table.css">
    <script type="text/javascript" src="<%=basePath%>admin/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>js/page.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript">


function delcfm() {
	if (!confirm("确认要革职？会保留其所有信息，后悔的话，还可以复职的噢~")) {
		window.event.returnValue = false;
	}
}
</script>

	</head>

	<body bgcolor='#e6f1fc' onload="goPage(1,15);">


		<label>
			革职员工
		</label>
<!-- 	
		<form action="<%=basePath%>servlet/DeleteUser" method="post">
			<table border="1" id="xz" class="table" style="position:absolute;width:99%;">
			<thead>
				<tr><th align='center'>序号</th><th align='center'>用户名</th><th align='center'>密码</th><th align='center'>真实姓名</th><th align='center'>性别</th><th align='center'>注册日期</th><th align='center'>用户组别</th><th align='center'>出生日期</th><th align='center'>联系方式</th><th align='center'>邮箱</th><th>删除</th></tr>
			</thead>
			<tbody id="adminTbody"> 	
				<%
					User user = new User();
					UserMethod um = new UserMethod();
					List<User> list = um.selectAllUser(user);
					for (User user1 : list) {
					
					ResultSet rs = um.selectGroupid(user1.getMasterid());		
					String groupname="";
		            while(rs.next()){
		            	int groupid =Integer.parseInt(rs.getString("groupid"));

		            	groupname+= um.selectGroupname(groupid)+" ";

		            }
					if(groupname==""){
						groupname="未设置";
					}

						out.print("<tr><td>" 
						+ user1.getMasterid() + "</td><td>"
						+ user1.getUsername() + "</td><td>"
						+ user1.getPassword() + "</td><td>"
						+ user1.getTruename()+ "</td><td>"
						+ user1.getSex()+ "</td><td>"
						+ user1.getBdate()+ "</td><td>"
						+ groupname + "</td><td>"
						+ user1.getBirthday()+ "</td><td>"
						+ user1.getMobile()+ "</td><td>"
						+ user1.getEmail()+ "</td><td>"
						+"<input type='checkbox' name='xz' value='"+ user1.getMasterid() + "'/></td>"
						+"</tr>");
					}
				%>
				</tbody>
			</table>
		


    <div id="barcon" style="position:absolute;bottom:0px;left:20px;"></div>  
    
    <table class="table" style="position:absolute;width:50%;bottom:0px;left:25%;">
    <tr><td colspan="5" align='center' style="width:20%"><input type="submit" name="Submit" value="删除用户" style="width: 80" onclick="javascript:delcfm()"></td></tr>
    <tr>
    <td align="center" style="width:20%"><a href="###" id="firstPage">首页</a></td><td align='center' style="width:20%"><a href="###" id="prePage">上一页</a></td><td align='center' style="width:20%"><a href="###" id="nextPage">下一页</a></td><td align='center' style="width:20%"><a href="###" id="lastPage">尾页</a></td><td align='center' style="width:20%"><select id="jumpWhere">  
                </select>  <a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></td></tr>   
    </table>
</form>
 -->	有待完善
	</body>
</html>
