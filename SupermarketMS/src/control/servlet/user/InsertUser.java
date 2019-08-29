package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class InsertUser extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the GET method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
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
		out.println("  <HEAD><TITLE>添加用户控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
        try {   
		

          //System.out.print(a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);
          
          user.setUsername(request.getParameter("yhm").trim());
          user.setPassword(request.getParameter("mm"));
          user.setBdate(request.getParameter("zcrq"));
          user.setTruename(request.getParameter("zsxm"));
          user.setSex(request.getParameter("xb"));
          user.setBirthday(request.getParameter("csrq"));
          user.setMobile(request.getParameter("lxfs"));
          user.setEmail(request.getParameter("yx"));

		  um.insertUser(user);
			
		} catch (SQLException e1) {
			out.print("<script language='javascript'>alert('"+request.getParameter("yhm")+"已存在,添加用户失败');window.location.href='../admin/user/InsertUser.jsp';</script>");	
		}   
          
          response.addHeader("refresh","5;url=\"../admin/user/InsertUser.jsp\"");    

          out.print("添加用户成功,请前往组别管理，对其进行分组和权限安排，否则无法正常使用！<br>"+"用户名为:"+request.getParameter("yhm")+"<br>密码为:"+request.getParameter("mm")+",若5秒未跳转，请点击<a href=../admin/user/InsertUser.jsp>跳转至当前页面</a>");
			
   
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
