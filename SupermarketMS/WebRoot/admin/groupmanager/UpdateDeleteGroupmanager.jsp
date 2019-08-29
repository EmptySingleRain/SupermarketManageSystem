<%@ page language="java" import="java.util.*,java.sql.*,module.javabean.user.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>修改删除组别</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/table.css">
	
    <script type="text/javascript" src="<%=basePath%>admin/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>js/page.js" charset="utf-8"></script>
	<script language="javascript" type="text/javascript">

function updatefm(myform) {
	if (!confirm("确认要修改？")) {
		window.event.returnValue = false;
	}
	myform.action="<%=basePath%>servlet/UpdateGroupmanager";
    myform.submit();
}

function delcfm(myform){
	if (!confirm("确认要删除？")) {
		window.event.returnValue = false;
	}
	myform.action="<%=basePath%>servlet/DeleteGroupmanager";
    myform.submit();
}


/*
$(function() {
	$(":radio[name='box']").click(function() {
		$(this).parent().siblings().each(function() {
			var text = $(this).text();
		});
	});
});*/

</script>


	
	</head>
  
  <body bgcolor='#e6f1fc' onload="goPage(1,15);">


          <label>修改删除组别信息</label>
        
        <form action="<%=basePath%>servlet/UpdateGroupmanager" method="post" class="nput_control">
       <table border="1" class="table" style="position:absolute;width:99%;">
       <thead> 
            <tr><th align='center'>序号</th><th align='center'>组别名</th><th align='center'>组别内容</th><th>操作</th></tr>
        </thead> 
        <tbody id="adminTbody">  

        <tr>
        <%  
     		UserMethod um = new UserMethod();

			ResultSet rs = um.selectGroupmanager();

			while (rs.next()) {

        %>

            <td><input name="id" size=1 class="defult" value=<%= rs.getString("groupid")%> readOnly="true"></td>
            <td><input name="zbm" size=8 class="defult" value=<%= rs.getString("groupname")%> readOnly="true"></td>
            <td><input name="zbxx" class="defult" value=<%= rs.getString("groupinfo")%> readOnly="true"></td>    
            <td><input type="radio" name="xz" value="<%=rs.getString("groupid") %>"></td></tr>

        <% } %>

          <!-- <tr><td  colspan="11"><input type="submit" name="Submit" value="修改用户" style="width:80" onclick="javascript:updatefm()">   --> 
</tbody> 
    </table>


    <div id="barcon" style="position:absolute;bottom:0px;left:20px;"></div>  
    
    <table class="table" style="position:absolute;width:50%;bottom:0px;left:25%;">
    
    <tr><td colspan="5" align='center'><input type="button" value="修改组别" style="width: 80;margin-right:40px;" onclick="javascript:updatefm(this.form)">
    <input type="button" value="删除组别" style="width: 80" onclick="javascript:delcfm(this.form)"></td></tr>
    <tr><td align='center' style="width:20%"><a href="###" id="firstPage">首页</a></td><td align='center' style="width:20%"><a href="###" id="prePage">上一页</a></td><td align='center' style="width:20%"><a href="###" id="nextPage">下一页</a></td><td align='center' style="width:20%"><a href="###" id="lastPage">尾页</a></td><td align='center' style="width:20%"><select id="jumpWhere">  
                </select>  <a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></td>
    </tr>   
    </table>
                  </form>

  </body>

</html>
