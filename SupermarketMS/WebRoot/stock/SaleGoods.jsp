<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>出售商品</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

	<link rel="stylesheet" type="text/css" href="admin/css/table.css">
	
	
	
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>

		<script type="text/javascript">

function chaxunzl() {


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
        
        var zl="";
        
         if(selectedText=="服装")
         zl="fz";
         
         if(selectedText=="数码产品")
         zl="smcp";
         
         if(selectedText=="家电")
         zl="jd";
         
         if(selectedText=="生鲜")
         zl="sx";
         
         if(selectedText=="日用品")
         zl="ryp";

         if(selectedText=="零食")
         zl="ls";

//jQuery实现清空table表格除首行以外的数据
  $("#zlcx tr:not(:first)").empty("");
  
  document.getElementById("zlcx").style.visibility = "visible"; // 显示查询结果
  document.getElementById("qdhz").style.visibility = "visible"; // 显示清单汇总
	$.ajax( {
		dataType : "json", //数据类型为json格式
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		type : "GET",
		url : "servlet/AjaxSelectStock",
		data : {
			"zl" : zl
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
		
			var Tb = document.getElementById("tab");
			
			for ( var i = 0; i < data.size; i++) {
			
			    var Tr = document.createElement("tr");
			    var Td1 = document.createElement("td");
			    var Td2 = document.createElement("td");
			    var Td3 = document.createElement("td");
			    var Td4 = document.createElement("td");
			    var Td5 = document.createElement("td");
			    
			    var txtNode1 =document.createTextNode(data.stock[i].id);
			    var txtNode2 =document.createTextNode(data.stock[i].name);
			    var txtNode3 =document.createTextNode(data.stock[i].price.toFixed(2));
			    var txtNode4 =document.createTextNode(data.stock[i].amount);
			    
			    
			    Td1.appendChild(txtNode1);
			    Td2.appendChild(txtNode2);
			    Td3.appendChild(txtNode3);
			    Td4.appendChild(txtNode4);
			    Td5.innerHTML = "<input type='radio' name='xz' value='"+data.stock[i].id+"'/>";
			    Tr.appendChild(Td1);
			    Tr.appendChild(Td2);
			    Tr.appendChild(Td3);
			    Tr.appendChild(Td4);
			    Tr.appendChild(Td5);
			    Tb.appendChild(Tr);
			}
			var Tr = document.createElement("tr");
			var Td = document.createElement("td");
			Td.colSpan="5";
			Td.innerHTML="<input type='button' name='insert' value='添加' onclick='javascript:tianjia()'/>";
			Tr.appendChild(Td);
			Tb.appendChild(Tr);
		}

	});
}


function tianjia(){

  var checkId = $('input[name="xz"]:checked').val(); 
  if(checkId){
  var gmsl=prompt("请输入要购买的数量","");
    if(gmsl)
    {
      if(!isNaN(gmsl)){
        $.ajax( {
		dataType : "json", //数据类型为json格式
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		type : "GET",
		url : "servlet/AjaxSelectGoodsById",
		data : {
			"checkId" : checkId
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

			var Tb = document.getElementById("qd");
					/*	
			var caption = document.createElement('caption');
			caption.appendChild(document.createTextNode('清单汇总'));
			Tb.appendChild(caption);	
			var thead = document.createElement('thead');
			var tr = document.createElement('tr');
			var th1 = document.createElement('th');		
			var th2 = document.createElement('th');	
			var th3 = document.createElement('th');		
			var th4 = document.createElement('th');		
			var th5 = document.createElement('th');						
			th1.appendChild(document.createTextNode('ID'));
			tr.appendChild(th1);			
			th2.appendChild(document.createTextNode('商品名'));
			tr.appendChild(th2);			
			th3.appendChild(document.createTextNode('单价')); 
			tr.appendChild(th3); 			
			th4.appendChild(document.createTextNode('购买数量'));  
			tr.appendChild(th4);		
			th5.appendChild(document.createTextNode('总价'));  
			tr.appendChild(th5);		
			thead.appendChild(tr);
			Tb.appendChild(thead);
            document.body.appendChild(Tb);
       */
            var Tbodies = document.getElementById("tt");
            
			for ( var i = 0; i < data.size; i++) {
			
			    var Tr = document.createElement("tr");
			    
			    var Td1 = document.createElement("td");
			    var Td2 = document.createElement("td");
			    var Td3 = document.createElement("td");
			    var Td4 = document.createElement("td");
			    var Td5 = document.createElement("td");
			    
			    var txtNode1 =document.createTextNode(data.stock[i].id);
			    var txtNode2 =document.createTextNode(data.stock[i].name);
			    var txtNode3 =document.createTextNode(data.stock[i].price.toFixed(2));
			    
			    if(gmsl>data.stock[i].amount)
			    {
			    alert("库存不足,超过剩余数量,添加失败!");
			    break;
			    }
			    
			    var txtNode4 =document.createTextNode(gmsl);
			    
			    var txtNode5 = document.createTextNode((data.stock[i].price*gmsl).toFixed(2));
			    
			    Td1.appendChild(txtNode1);
			    Td2.appendChild(txtNode2);
			    Td3.appendChild(txtNode3);
			    Td4.appendChild(txtNode4);
			    Td5.appendChild(txtNode5);
			   
			    Tr.appendChild(Td1);
			    Tr.appendChild(Td2);
			    Tr.appendChild(Td3);
			    Tr.appendChild(Td4);
			    Tr.appendChild(Td5);
			    
			    Tbodies.appendChild(Tr);
			    //Tb.insertBefore(Tr,Tb.lastChild.previousSibling);
			}
			    Tb.appendChild(Tbodies);
		}

	  });
	  
	  }else alert("请输入数字！");
	  
	  }
   }
	  else
	  alert("请选择!");
}

function sale(myform){

var test = 1;

var table = document.getElementById("qd");

var row=table.tBodies[0].rows.length;
var col=table.tBodies[0].rows[0].cells.length;
//var test=table.rows.length;

var totalprice=0.0;
var JSONObject;
var JSONArray=new Array();

for(var i=0;i<row;i++){

JSONObject = {"id":table.tBodies[0].rows[i].cells[0].innerHTML,"name":table.tBodies[0].rows[i].cells[1].innerHTML,"price":table.tBodies[0].rows[i].cells[2].innerHTML,"saleAmount":table.tBodies[0].rows[i].cells[3].innerHTML,"totalprice":table.tBodies[0].rows[i].cells[4].innerHTML};
JSONArray.push(JSONObject);
}


for(var i in JSONArray){
        //表示遍历数组，而i表示的是数组的下标值，
        //result[i]表示获得第i个json对象即JSONObject
        //result[i]通过.字段名称即可获得指定字段的值
        totalprice += parseFloat(JSONArray[i].totalprice);
    }

if (!confirm("请确认核对完毕订单,总计消费"+totalprice.toFixed(2)+"元")) {
		window.event.returnValue = false;
	}
else{
    var stringjson = encodeURI(JSON.stringify(JSONArray));
    
	myform.action="servlet/SaleGoods?jsonarray="+stringjson+"";
    myform.submit();
}	

}

</script>
	
	
	  <style type="text/css">
        div{
            padding:20px;
            margin:0px;
        }
        .head{
            height:60px;
            width:360px;
            text-align:center;
            //border-bottom:2px solid black;
        }
        .left{
            width:360px;
            //min-height:1000px;
            
            float:left;
            //border-right:2px solid black;
             
        }
        .right{
            //min-height:1000px;
            float:left;
            width:85%;
            text-align:left;
        }
         
    </style>
  </head>
  
  <body bgcolor='#e6f1fc'>


    <label>出售商品</label>
  <div class="head">
        <form action="servlet/SelectAllStock" method="post" >
        <table border="1" class="table">
         <tr><th colspan="3">请在下方选择您要出售商品的种类</th></tr>
         <tr><td colspan="2">
         
         <select id="zl" style="background: rgba(0,0,0,0);width:180px;height:20px;">
         <option value="1">服装</option>
         <option value="2">数码产品</option>
         <option value="3">家电</option>
         <option value="4">生鲜</option>
         <option value="5">日用品</option>
         <option value="6">零食</option>
         </select>
    </td><td><input type="button" value="查询"  onclick="chaxunzl();"/></td></tr>

          </table>
       </form>    
</div>
        <div class="left" id="zlcx" style="visibility: hidden;">
       
        	<table border="1" class="table" id="tab">
        	<caption>查询结果</caption>
        	<thead>
        	<tr><th align="center">ID</th><th align="center">商品名</th><th align="center">价格</th><th align="center">剩余数量</th><th align="center">选择</th></tr>
        	</thead>
        	</table>
        </div>
        
        <div class="left" id="qdhz" style="visibility: hidden;">
        
        <form action="servlet/SaleGoods" method="post">
        <table border="1" class="table" id="qd">
         <caption>清单汇总</caption>
        <thead>
        <tr><th align="center">ID</th><th align="center">商品名</th><th align="center">单价</th><th align="center">购买数量</th><th align="center">总价</th></tr>
        </thead>
        <tbody id="tt">
        
        </tbody>
        <tfoot>
        <tr><td colspan="5"><input type="button" value="出售" onclick="return sale(this.form);"></tr>
        </tfoot>
        </table>
        </form>
        </div>
        
  </body>
</html>
