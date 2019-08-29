<%@ page language="java" import="java.util.*,java.sql.*,module.javabean.stock.*" pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>

		<title>删除商品信息</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">

		<link rel="stylesheet" type="text/css" href="<%=basePath%>admin/css/table.css">
    <script type="text/javascript" src="<%=basePath%>admin/js/jquery-3.3.1.min.js"></script>
    <script src="<%=basePath%>js/page.js" charset="utf-8"></script>
		<script language="javascript" type="text/javascript">

/*function fun(myform){
 var boxes = document.getElementsByName("xz");
 for(i=0;i<boxes.length;i++){
 if(boxes[i].checked){
 tr = boxes[i].parentNode.parentNode;
 tr.parentNode.removeChild(tr);
 myform.action="admin/user/rDeleteUser.jsp";
 myform.submit();
 }
 }

 }*/

function delcfm() {
	if (!confirm("确认删除？")) {
		window.event.returnValue = false;
	}
}
</script>

	</head>

	<body bgcolor='#e6f1fc' onload="goPage(1,15);">


		<label>
			删除商品信息
		</label>
		<form action="<%=basePath%>servlet/DeleteStock" method="post">
			<table border="1" id="xz" class="table" style="position:absolute;width:99%;">
			<thead>
				<tr><th align='center'>序号</th><th align='center'>商品名</th><th align='center'>价格</th><th align='center'>数量</th><th>删除</th></tr>
			</thead>
			<tbody id="adminTbody"> 	
				<%
					Stock stock = new Stock();
					StockMethod sm = new StockMethod();
					List<Stock> list = sm.selectAllStock(stock);
					for (Stock stock1 : list) {		
			
						out.print("<tr><td>" 
						+ stock1.getId() + "</td><td>"
						+ stock1.getName() + "</td><td>"
						+ stock1.getPrice() + "</td><td>"
						+ stock1.getAmount()+ "</td><td>"

						+"<input type='checkbox' name='xz' value='"+ stock1.getId() + "'/></td>"
						+"</tr>");
					}
				%>
				</tbody>
			</table>
		


    <div id="barcon" style="position:absolute;bottom:0px;left:20px;"></div>  
    
    <table class="table" style="position:absolute;width:50%;bottom:0px;left:25%;">
    <tr><td colspan="5" align='center' style="width:20%"><input type="submit" name="Submit" value="删除商品" style="width: 80" onclick="javascript:delcfm()"></td></tr>
    <tr>
    <td align="center" style="width:20%"><a href="###" id="firstPage">首页</a></td><td align='center' style="width:20%"><a href="###" id="prePage">上一页</a></td><td align='center' style="width:20%"><a href="###" id="nextPage">下一页</a></td><td align='center' style="width:20%"><a href="###" id="lastPage">尾页</a></td><td align='center' style="width:20%"><select id="jumpWhere">  
                </select>  <a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></td></tr>   
    </table>
</form>

	</body>
</html>
