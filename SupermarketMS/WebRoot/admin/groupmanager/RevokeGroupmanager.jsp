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
    <base href="<%=basePath%>">
    
    <title>撤销组别界面</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
<link rel="stylesheet" type="text/css" href="admin/css/table.css">

    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

		<script type="text/javascript">
		
function shanchufm() {
	if (!confirm("请确定要撤销该用户的该组别")) {
		window.event.returnValue = false;
	}
}

function groupmanager() {

//jQuery实现清空table表格除首行以外的数据
  $("#zb tr:not(:first)").empty("");
  
  document.getElementById("zb").style.display = "block"; // 显示

	$.ajax( {
		dataType : "json", //数据类型为json格式
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		type : "GET",
		url : "servlet/AjaxGetGroupnameByUsername",
		data : {
			"username" : document.getElementById("username").value
		},
		error: function() {
		    alert("未查询到数据");
        },
		statusCode : {
			404 : function() {
				alert('page not found');
			}
		},
		success : function(data, textStatus) {
		
			var Tb = document.getElementById("tab").lastChild;
			
			for ( var i = 0; i < data.size; i++) {
			
			    var Tr = document.createElement("tr");
			    var Td1 = document.createElement("td");
			    var Td2 = document.createElement("td");
			    var txtNode1 =document.createTextNode(data.groupmanager[i].groupname);
			    
			    
			    Td1.appendChild(txtNode1);
			    Td2.innerHTML = "<input type='radio' name='xz' value='"+data.groupmanager[i].groupname+"'/>";
			    Tr.appendChild(Td1);
			    Tr.appendChild(Td2);
			    Tb.appendChild(Tr);
			}
			var Tr = document.createElement("tr");
			var Td = document.createElement("td");
			Td.colSpan="2";
			Td.innerHTML="<input type='submit' name='delete' value='撤销' onclick='javascript:shanchufm()'/>";
			Tr.appendChild(Td);
			Tb.appendChild(Tr);
		}

	});



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

    <label>撤销组别信息</label>
       	
        <form action="servlet/RevokeGroupmanager" method="post" >
        <table border="1" class="table">
         <tr><th colspan="3">请在下方输入您要撤销组别的用户</th></tr>
         <tr><td colspan="2"><input type="text" name="username" id="username" onfocus="myFocus(this,'#f4eaf1','请输入用户名')" onblur="myblur(this,'#e6f1fc','请输入用户名')" value="请输入用户名"/></td><td><input type="button" value="查询组别" onclick="groupmanager();"/></td></tr>
         <!-- <tr><td colspan="2"><input type="text" name="truename" id="truename" onfocus="myFocus(this,'#f4eaf1','请输入真实姓名')" onblur="myblur(this,'#e6f1fc','请输入真实姓名')" value="请输入真实姓名"/></td><td><input type="button" value="查询" onclick="return chaxun1(this.form)"/></td></tr> -->
          </table>

        <div id="zb" style="display: none;margin-top: 50px;">
        	<table border="1" class="table" id="tab">
        	<tr><th align="center">组别</th><th align="center">选择</th>
        	</table>
        </div>
       </form>    

  </body>
</html>
