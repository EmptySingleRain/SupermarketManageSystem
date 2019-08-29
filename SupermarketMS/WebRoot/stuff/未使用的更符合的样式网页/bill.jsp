<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>   

  <link rel="stylesheet" href="../stuff/css/fenye.css">
  
</head>  
    <body>
    <body onload="goPage(1,6);">  
    <table width="950" cellpadding="0" cellspacing="0" class="table2" align="center">  
    <thead>  
    <tr>  
    <td colspan="6" height="33" class="td0"> </td>  
    </tr>  
    <tr align="center"> 
    	<th width="150" height="33" class="td2">卡号</th>
        <th width="300" class="td2">姓名</th>       
        <th width="300" class="td2">银行卡额度</th>
        <th width="300" class="td2">需归还金额</th>      
        <th width="300" class="td2">账单日</th>    
    </tr>  
    </thead>  
    <tbody id="adminTbody">  
    
    <%/*
           CardService dao=new CardService();
           List<CardBean> list =dao.readFirstTitle();    
           for(CardBean tl:list)
           {*/%>
          
          <tr>
              <td class="td2" height="33" width="150">123</td>	              
              <td class="td2">123</td>
              <td class="td2">123</td>
              <td class="td2">123</td>
              <td class="td2">123</td>
          </tr>
        
            <%/*}*/
       %>
    </tbody>  
</table>  
<div id="barcon" class="barcon" >  
    <div id="barcon1" class="barcon1"></div>  
        <div id="barcon2" class="barcon2">  
            <ul>  
                <li><a href="###" id="firstPage">首页</a></li>  
                <li><a href="###" id="prePage">上一页</a></li>  
                <li><a href="###" id="nextPage">下一页</a></li>  
                <li><a href="###" id="lastPage">尾页</a></li>  
                <li><select id="jumpWhere">  
                </select></li>  
                <li><a href="###" id="jumpPage" onclick="jumpPage()">跳转</a></li>  
            </ul>  
        </div>  
</div> 
</body>
  <script src="../admin/js/jquery-3.3.1.min.js"></script>
  <script src="../stuff/js/page.js" charset="utf-8"></script>
</body>   
</html>