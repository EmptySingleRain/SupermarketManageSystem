<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网站信息</title> 
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">
	<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no" />
    <meta name="renderer" content="webkit">
    
	<link rel="stylesheet" href="stuff/css/pintuer.css">
	<link rel="stylesheet" href="stuff/css/admin.css">
    <link rel="stylesheet" href="layui/css/layui.css"> 
    
    <script type="text/javascript" src="js/jquery-2.1.4.min.js"></script>
    <script type="text/javascript" src="stuff/js/pintuer.js"></script>
    <script src="layui/layui.js"></script> 
  <script>
  layui.use('form',function(){
  		
        var form = layui.form;

        form.verify({
        username: function(value, item){ //value：表单的值、item：表单的DOM对象
        if(!new RegExp("^[a-zA-Z0-9_\u4e00-\u9fa5\\s·]+$").test(value)){
          return '用户名不能有特殊字符';
        }
        if(/(^\_)|(\__)|(\_+$)/.test(value)){
          return '用户名首尾不能出现下划线\'_\'';
        }
        if(/^\d+\d$/.test(value)){
          return '用户名不能全为数字';
        }
      },



      //我们既支持上述函数式的方式，也支持下述数组的形式
      //数组的两个值分别代表：[正则匹配、匹配不符时的提示文字]
      identity: [/(^\d{15}$)|(^\d{17}(x|X|\d)$)/],
      required: [/[\S]+/, "必填项不能为空"]
      ,phonenum: [/^1[3|4|5|7|8]\d{9}$/, '请输入正确的手机号！'] 
      ,pass: [
        /^[\S]{6,12}$/
        ,'密码必须6到12位，且不能出现空格'
      ] 
    });
    });
  </script>
  </head>

  <body>
   <div class="panel admin-panel">
  <div class="panel-head"><strong><span class="icon-pencil-square-o"></span> 开卡人：</strong>
  <a href="reg.jsp">删除</a></div>
  <div class="body-content">
    <form class = "layui-form" action="Acctinsert" method="post"> 
      <div class="layui-form-item">
        <label class="layui-form-label">编号</label>
        <div class="field">
		<input type="text" class="input w50" name="id" size="50" lay-verify="required" />  
          <div class="tips"></div>
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">姓名</label>
        <div class="field">
          <input type="text" class="input w50"  name="name" size="50" lay-verify="username" /> 
          <div class="tips"></div>
        </div>
      </div>
      <div class="layui-form-item">
 <label class="layui-form-label">性别</label>
 <div class="layui-input-inline">
  <select name="gender" lay-filter="province"  class="input w100" lay-verify="required" >
   <option value=""></option>
   <option value="男">男</option>
   <option value="女">女</option>
  </select>
 </div>
</div>
      <div class="layui-form-item">
        <label class="layui-form-label">电话</label>
        <div class="field">
          <input type="text" class="input w50"  name="tel" size="50" lay-verify="phonenum" />
        </div>
      </div>
      <div class="layui-form-item">
        <label class="layui-form-label">身份证</label>
        <div class="field">
          <input type="text" class="input w50"  name="idno" size="50" lay-verify="identity" /> 
        </div>
      </div>  
         
      <div class="layui-form-item">
 <label class="layui-form-label">开户行</label>
 <div class="layui-input-inline">
  <select name="khh" lay-filter="province"  class="input w50" lay-verify="required">
   <option value=""></option>
   <option value="BeiJing">北京市</option>
   <option value="TianJin">天津市</option>
   <option value="HeBei">河北省</option>
   <option value="ShanXi">山西省</option>
   <option value="NeiMengGu">内蒙古自治区</option>
   <option value="LiaoNing">辽宁省</option>
   <option value="JiLin">吉林省</option>
   <option value="HeiLongJiang">黑龙江省</option>
   <option value="ShangHai">上海市</option>
   <option value="JiangSu">江苏省</option>
   <option value="ZheJiang">浙江省</option>
   <option value="AnHui">安徽省</option>
   <option value="FuJian">福建省</option>
   <option value="JiangXi">江西省</option>
   <option value="ShanDong">山东省</option>
   <option value="HeNan">河南省</option>
   <option value="HuBei">湖北省</option>
   <option value="HuNan">湖南省</option>
   <option value="GuangDong">广东省</option>
   <option value="GuangXi">广西壮族自治区</option>
   <option value="HaiNan">海南省</option>
   <option value="ChongQing">重庆市</option>
   <option value="SiChuan">四川省</option>
   <option value="GuiZhou">贵州省</option>
   <option value="YunNan">云南省</option>
   <option value="XiZang">西藏自治区</option>
   <option value="GanSu">甘肃省</option>
   <option value="QingHai">青海省</option>
   <option value="NingXia">宁夏回族自治区</option>
   <option value="XinJiang">新疆维吾尔自治区</option>
   <option value="TaiWan">台湾省</option>
   <option value="XiangGang">香港特别行政区</option>
   <option value="AoMen">澳门特别行政区</option>
  </select>
 </div>

</div>
      <div class="layui-form-item">  
                            <div class="layui-input-block">  
                              <button class="button bg-main icon-check-square-o" lay-filter="demo2" lay-submit="" type="submit" >提交</button>  
                              <button class="button bg-main icon-check-square-o" type="reset">重置</button>  
                            </div>  
                          </div>
                          
      </form>   
                       
  </div>
</div>
  </body>
 
</html>
