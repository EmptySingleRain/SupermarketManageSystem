<%@ page language="java" import="java.util.*,java.sql.*,module.javabean.stock.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    
    <title>更新商品信息</title>
    
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
	var table = document.getElementById("goods");
	var form = document.getElementById("goodsform");
	//这样获取的是一个数组
		var ci = document.getElementsByName("ckb");
		var JSONObject=null;
		var JSONArray = new Array();

	//遍历复选框数组  如果被选中ci[i].checked的值就是true
		for(var i = 0;i < ci.length;i++){
			if(ci[i].checked==true){
			      
			    JSONObject = {"id":table.tBodies[0].rows[i].cells[0].getElementsByTagName("INPUT")[0].value,"name":table.tBodies[0].rows[i].cells[1].getElementsByTagName("INPUT")[0].value,"price":table.tBodies[0].rows[i].cells[2].getElementsByTagName("INPUT")[0].value,"amount":table.tBodies[0].rows[i].cells[3].getElementsByTagName("INPUT")[0].value};
			    JSONArray.push(JSONObject);
				
				
			}
		}
		var stringjson = encodeURI(JSON.stringify(JSONArray));
		if(JSONObject!=null){
				form.action="<%=basePath%>servlet/UpdateStock?jsonarray="+stringjson+"";
				form.submit();
		}
		else
		alert("如果要修改，请选中所在行");
	
	}

}

</script>


	
	</head>
  
  <body bgcolor='#e6f1fc' onload="goPage(1,10);">


          <label>更新商品信息</label>
        
<form id="goodsform" action="<%=basePath%>servlet/UpdateStock" method="post">
       <table border="1" id="goods" class="table" style="position:absolute;width:99%;">
       <thead> 
            <tr><th align='center'>序号</th><th align='center'>商品名</th><th align='center'>价格</th><th align='center'>数量</th><th>选择</th></tr>
        </thead> 
        <tbody id="adminTbody">  
        <%  
        Stock stock = new Stock();
        StockMethod um = new StockMethod();
        
        List<Stock> list = um.selectAllStock(stock);
        for(Stock stock1:list)
        {      				     			
        %>  
        <tr>
            <td><input name="id"  class="defult" value="<%= stock1.getId()%>" readOnly="true"></td>
            <td><input type="text" name="spm" onfocus="myFocus(this,'#f4eaf1','<%= stock1.getName().trim()%>')" onblur="myblur(this,'#e6f1fc','<%= stock1.getName().trim()%>')" value="<%= stock1.getName().trim()%>" ></td>
            <td><input type="text" name="jg" onfocus="myFocus(this,'#f4eaf1','<%= stock1.getPrice()%>')" onblur="myblur(this,'#e6f1fc','<%=stock1.getPrice()%>')" value="<%= stock1.getPrice()%>" ></td>    
            <td><input type="text" name="sl" onfocus="myFocus(this,'#f4eaf1','<%= stock1.getAmount()%>')" onblur="myblur(this,'#e6f1fc','<%= stock1.getAmount()%>')" value="<%=stock1.getAmount()%>" ></td>

            <td><input type="checkbox" name="ckb" value="修改"></td></tr>
         
        <% } %>
        </tbody> 
    </table>
 </form>

    <div id="barcon" style="position:absolute;bottom:0px;left:20px;"></div>  
    
    <table class="table" style="position:absolute;width:50%;bottom:0px;left:25%;">
    <tr><td colspan="5" align='center' style="width:20%"><input type="button" name="xg" value="修改商品" style="width: 80" onclick="updatefm()"></td></tr>
    <tr>
    <td align='center' style="width:20%"><a href="###" id="firstPage">首页</a></td><td align='center' style="width:20%"><a href="###" id="prePage">上一页</a></td><td align='center' style="width:20%"><a href="###" id="nextPage">下一页</a></td><td align='center' style="width:20%"><a href="###" id="lastPage">尾页</a></td><td align='center' style="width:20%"><select id="jumpWhere">  
                </select>  <a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></td>
    </tr>   
    </table>



  </body>

</html>
