<%@ page language="java" import="java.util.*,java.sql.*,module.javabean.user.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更新用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equihadoopv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/table.css">
    
    <script type="text/javascript" src="<%=basePath%>admin/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>js/page.js" charset="utf-8"></script>
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

function updatefm() {
if (!confirm("确认要修改？")) {
		window.event.returnValue = false;
	}
	else{
	
	//获取表的对象
	var table = document.getElementById("usertable");
	var form = document.getElementById("userform");
	//这样获取的是一个数组
		var ci = document.getElementsByName("ckb");
		var JSONObject=null;
		var JSONArray = new Array();

	//遍历复选框数组  如果被选中ci[i].checked的值就是true
		for(var i = 0;i < ci.length;i++){
			if(ci[i].checked==true){
			      
			    JSONObject = {"id":table.tBodies[0].rows[i].cells[0].getElementsByTagName("INPUT")[0].value,"yhm":table.tBodies[0].rows[i].cells[1].getElementsByTagName("INPUT")[0].value,
			    "mm":table.tBodies[0].rows[i].cells[2].getElementsByTagName("INPUT")[0].value,"zsxm":table.tBodies[0].rows[i].cells[3].getElementsByTagName("INPUT")[0].value,"xb":table.tBodies[0].rows[i].cells[4].getElementsByTagName("INPUT")[0].value,
			    "zcrq":table.tBodies[0].rows[i].cells[5].getElementsByTagName("INPUT")[0].value,"csrq":table.tBodies[0].rows[i].cells[7].getElementsByTagName("INPUT")[0].value,"lxfs":table.tBodies[0].rows[i].cells[8].getElementsByTagName("INPUT")[0].value,"yx":table.tBodies[0].rows[i].cells[9].getElementsByTagName("INPUT")[0].value};
			    JSONArray.push(JSONObject);

			}
		}
		var stringjson = encodeURI(JSON.stringify(JSONArray));
		//alert(JSON.stringify(JSONArray));
		if(JSONObject!=null){
				form.action="<%=basePath%>servlet/UpdateUser?test=UpdateUser&jsonarray="+stringjson+"";
				form.submit();
		}
		else
		alert("如果要修改，请选中所在行");
	
	}
}

</script>


	
	</head>
  
  <body bgcolor='#e6f1fc' onload="goPage(1,10);">


          <label>更新用户信息</label>
        
<form id="userform" action="<%=basePath%>servlet/UpdateUser?test=UpdateUser" name="tianjia" method="post" class="nput_control">
       <table id="usertable" border="1" class="table" style="position:absolute;width:99%;">
       <thead> 
            <tr><th align='center'>序号</th><th align='center'>用户名</th><th align='center'>密码</th><th align='center'>真实姓名</th><th align='center'>性别</th><th align='center'>注册日期</th><th align='center'>用户组别</th><th align='center'>出生日期</th><th align='center'>联系方式</th><th align='center'>邮箱</th><th>操作</th></tr>
        </thead> 
        <tbody id="adminTbody">  
        <%  
        User user = new User();
        UserMethod um = new UserMethod();
        List<User> list = um.selectAllUser(user);
        for(User user1:list)
        {      				
        			ResultSet rs = um.selectGroupid(user1.getMasterid());		
					String groupname="";
		            while(rs.next()){
		            	int groupid =Integer.parseInt(rs.getString("groupid"));
		            	groupname = groupname + um.selectGroupname(groupid)+" ";
		            }
					if(groupname==""){
						groupname="未设置";
					}
        %>
        
        <tr>
            <td><input name="id" size=1 class="defult" value=<%= user1.getMasterid()%> readOnly="true"></td>
            <td><input name="yhm" size=8 class="defult" value=<%= user1.getUsername()%> readOnly="true"></td>
            <td><input name="mm" class="defult" value=<%= user1.getPassword()%> readOnly="true"></td>    
            <td><input name="zsxm" size=3 class="defult" value=<%=user1.getTruename()%> readOnly="true"></td>
            <td><input name="xb" size=1 class="defult" value=<%= user1.getSex()%> readOnly="true"></td>
            <td><input name="zcrq" class="defult" value=<%= user1.getBdate()%> readOnly="true"></td>
            <td><input name="yhzb" class="defult" value="<%=groupname.trim()%>" readOnly="true"></td>
            <!--<td><input type="text" name="zcrq" onfocus="myFocus(this,'#f4eaf1','<%= user1.getBdate()%>')" onblur="myblur(this,'#e6f1fc','<%= user1.getBdate()%>')" value=<%= user1.getBdate()%>></td>-->
            <td><input type="date" name="csrq" onfocus="myFocus(this,'#f4eaf1','<%= user1.getBirthday()%>')" onblur="myblur(this,'#e6f1fc','<%= user1.getBirthday()%>')" size=25 value=<%= user1.getBirthday()%> ></td>
            <td><input type="text" name="lxfs" onfocus="myFocus(this,'#f4eaf1','<%= user1.getMobile()%>')" onblur="myblur(this,'#e6f1fc','<%= user1.getMobile()%>')" size=18 value=<%=user1.getMobile()%>></td>
            <td><input type="text" name="yx" onfocus="myFocus(this,'#f4eaf1','<%= user1.getEmail()%>')" onblur="myblur(this,'#e6f1fc','<%= user1.getEmail()%>')" size=28 value=<%=user1.getEmail()%>></td>

            <!-- <td><select name="sflx" class="dropdown"><option value="<%=user1.getGroupname()%>" selected hidden><%=user1.getGroupname()%></option><option value="系统管理员">系统管理员</option><option value="超市经理">超市经理</option><option value="仓管员">仓管员</option><option value="收银员">收银员</option><option value="顾客">顾客</option></select></td> -->
            <!-- <td><input type="radio" name="xg" value="<%=user1%>"/></td> -->
            <td><input type="checkbox" name="ckb" value="修改"></td></tr>
         
        <% } %>
          <!-- <tr><td  colspan="11"><input type="submit" name="Submit" value="修改用户" style="width:80" onclick="javascript:updatefm()">   --> 
</tbody> 
    </table>
     </form>


    <div id="barcon" style="position:absolute;bottom:0px;left:20px;"></div>  
    
    <table class="table" style="position:absolute;width:50%;bottom:0px;left:25%;">
    <tr><td colspan="5" align='center' style="width:20%"><input type="button" name="xg" value="修改用户" style="width: 80" onclick="updatefm()"></td></tr>
    <tr>
    <td align='center' style="width:20%"><a href="###" id="firstPage">首页</a></td><td align='center' style="width:20%"><a href="###" id="prePage">上一页</a></td><td align='center' style="width:20%"><a href="###" id="nextPage">下一页</a></td><td align='center' style="width:20%"><a href="###" id="lastPage">尾页</a></td><td align='center' style="width:20%"><select id="jumpWhere">  
                </select>  <a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></td>
    </tr>   
    </table>



  </body>

</html>
