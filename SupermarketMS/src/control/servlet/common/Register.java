package control.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class Register extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		//解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		//请求解决乱码
		request.setCharacterEncoding("utf-8");
		//响应解决乱码
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		User user = new User();
		UserMethod um = new UserMethod();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>会员注册控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
        try {   
		
    		String uyzm = request.getParameter("code");//获取JSP页面输入的验证码数字
			String yzm=request.getSession().getAttribute("yzm").toString();//拿到服务器端产生的图片上的数字
			
			if(!uyzm.equals(yzm)){                            //比较值
				
				response.addHeader("refresh","5;url=\"../index.jsp\"");
				out.print("验证码输入错误，请重新登录！ 若5秒未跳转，请点击<a href=../index.jsp>跳转至当前页面</a>");
				}
			else{
          //System.out.print(a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);
        	
          user.setUsername(request.getParameter("yhm").trim());
          user.setPassword(request.getParameter("mm"));
          
          user.setBdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
          
          user.setTruename(request.getParameter("zsxm"));
          user.setSex(request.getParameter("xb"));
          user.setBirthday(request.getParameter("csrq"));
          user.setMobile(request.getParameter("lxfs"));
          user.setEmail(request.getParameter("yx"));

		  um.insertUser(user);
			
			request.getSession().setAttribute("username",request.getParameter("yhm").trim());
			request.getSession().setAttribute("truename",request.getParameter("zsxm"));
			
	          response.addHeader("refresh","5;url=\"../mall/index.jsp\"");    

	          out.print("帐号注册成功<br>"+"用户名为:"+request.getParameter("yhm")+"<br>密码为:"+request.getParameter("mm")+",若5秒未跳转，请点击<a href=../mall/index.jsp>跳转至当前页面</a>");
				
			}
		} catch (SQLException e1) {
			out.print("<script language='javascript'>alert('"+request.getParameter("yhm")+"已存在,添加用户失败');window.location.href='../admin/user/InsertUser.jsp';</script>");	
		}   
          

   
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}

}
