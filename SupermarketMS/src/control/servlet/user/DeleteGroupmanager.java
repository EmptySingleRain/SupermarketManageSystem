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

public class DeleteGroupmanager extends HttpServlet {


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
		out.println("  <HEAD><TITLE>删除组别信息控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
        try {   
            String id = request.getParameter("xz");    
        	user.setGroupid(Integer.parseInt(id));
			um.delGroupmanager(user);
		} catch (SQLException e1) {
			out.print("<script language='javascript'>alert('删除组别失败，请选择！');window.location.href='../admin/groupmanager/UpdateDeleteGroupmanager.jsp';</script>");	
		}   
        response.addHeader("refresh","5;url=\"../admin/groupmanager/UpdateDeleteGroupmanager.jsp\"");    

        out.print("删除成功！请前往组别管理对该用户进行组别配置。<br>若5秒未跳转，请点击<a href=../admin/groupmanager/UpdateDeleteGroupmanager.jsp>跳转至当前页面</a>");
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


}
