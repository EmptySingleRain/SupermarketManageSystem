<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>添加商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	
	<link rel="stylesheet" type="text/css" href="admin/css/table.css">

  </head>

	<script language="javascript" type="text/javascript">
	
	function tianjia(myform){
    
        //首先获得下拉框的节点对象；
        var select = document.getElementById("zl");
        
        //1.如何获得当前选中的值？：
        var value = select.value;
        
        //2.如何获得该下拉框所有的option的节点对象
        var options = select.options;
        //注意：得到的options是一个对象数组
        
        //3.如何获得第几个option的value值?比如我要获取第一option的value,可以这样：
       // var value1 = options[0].value;
        //4.如何获得第几个option的文本内容?比如我要获取第一option的文本,可以这样：
       // var text1 = options[0].text;
        
        //5.如何获得当前选中的option的索引？
        var index = select.selectedIndex;
        
        //6.如何获得当前选中的option的文本内容？
        //从第2个问题，我们已经获得所有的option的对象数组options了
        //又从第5个问题，我们获取到了当前选中的option的索引值
        //所以我们只要同options[index]下标的方法得到当前选中的option了
        var selectedText = options[index].text;

         if(selectedText=="服装")
         myform.action="servlet/InsertGoods?zl=fz";
         
         if(selectedText=="数码产品")
         myform.action="servlet/InsertGoods?zl=smcp";
         
         if(selectedText=="家电")
         myform.action="servlet/InsertGoods?zl=jd";
         
         if(selectedText=="生鲜")
         myform.action="servlet/InsertGoods?zl=sx";
         
         if(selectedText=="日用品")
         myform.action="servlet/InsertGoods?zl=ryp";

         if(selectedText=="零食")
         myform.action="servlet/InsertGoods?zl=ls";
         
         myform.submit();
         }
       
 </script>
   
  <body bgcolor='#e6f1fc'>

  
  <label>添加商品</label>
      <form action="servlet/InsertGoods" method="post">
        <table border="1" class="table">
          <tr><th>商品名:</th><td colspan="2"><input type="text" name="spm"/></td></tr>
          <tr><th>价格</th><td><input type="text" name="jg"/></td></tr>
          <tr><th>种类</th><td>
         <select id="zl" style="background: rgba(0,0,0,0);width:100px;height:20px;">
         <option value="1">服装</option>
         <option value="2">数码产品</option>
         <option value="3">家电</option>
         <option value="4">生鲜</option>
         <option value="5">日用品</option>
         <option value="6">零食</option>
         </select>
         </td></tr>
          <tr><th>操&nbsp;&nbsp;&nbsp;作:</th><td colspan="2"><input type="button" value="添加" style="margin-right:45px;" onclick="return tianjia(this.form)"/><input type="reset" value="重写"/></td></tr>
        </table>
      </form>


      </body>
</html>
