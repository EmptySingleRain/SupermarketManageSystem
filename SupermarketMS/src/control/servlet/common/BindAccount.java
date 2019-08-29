package control.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class BindAccount extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
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
		out.println("  <HEAD><TITLE>绑定商城帐号控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");


	    try {   

	    	  
	          user.setUsername(request.getSession().getAttribute("username").toString());
	          
	          
	          user.setGroupname(um.selectGroupname(5));
	          
			  um.grantGroupmanager(user);
				
			} catch (SQLException e1) {
				response.addHeader("refresh", "5;url=\"../UpdatePersonalInfo.jsp\"");
				out.print("绑定失败！请通知管理员,检查组别名称和id的修改。<br>若5秒未跳转，请点击<a href=../UpdatePersonalInfo.jsp>跳转至当前页面</a>");
			}   
		

		response.addHeader("refresh", "5;url=\"../UpdatePersonalInfo.jsp\"");
		out.print("绑定成功！现在您可以正常登入商城了。<br>若5秒未跳转，请点击<a href=../UpdatePersonalInfo.jsp>跳转至当前页面</a>");

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

	this.doGet(request, response);
	}

}
