<%@ page language="java" import="java.util.*,java.sql.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
String str;
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>查询指定用户信息</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/table.css">
	
	<script language="javascript" type="text/javascript">
	
	function chaxun(myform){
    
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
         myform.action="servlet/SelectStock?zl=fz";
         
         if(selectedText=="数码产品")
         myform.action="servlet/SelectStock?zl=smcp";
         
         if(selectedText=="家电")
         myform.action="servlet/SelectStock?zl=jd";
         
         if(selectedText=="生鲜")
         myform.action="servlet/SelectStock?zl=sx";
         
         if(selectedText=="日用品")
         myform.action="servlet/SelectStock?zl=ryp";

         if(selectedText=="零食")
         myform.action="servlet/SelectStock?zl=ls";
         
         myform.submit();
         }
       
 </script>
  </head>
  
  <body bgcolor='#e6f1fc'>

    <label>查询指定库存信息</label>
  
        <form action="servlet/SelectAllStock" method="post" >
        <table border="1" class="table">
         <tr><th colspan="3">请在下方选择您要查询的指定库存信息</th></tr>
         <tr><td colspan="2">
         
         <select id="zl" style="background: rgba(0,0,0,0);width:180px;height:20px;">
         <option value="1">服装</option>
         <option value="2">数码产品</option>
         <option value="3">家电</option>
         <option value="4">生鲜</option>
         <option value="5">日用品</option>
         <option value="6">零食</option>
         </select>
    </td><td><input type="button" value="查询"  onclick="return chaxun(this.form)"/></td></tr>
         <tr><th colspan="3">点击按钮，即可查询所有库存信息:<input type="submit" value="查询所有库存信息"/></th></tr>

          </table>
       </form>    

  </body>
</html>
