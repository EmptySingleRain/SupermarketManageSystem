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

public class RevokeGroupmanager extends HttpServlet {

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

		//�����������
		response.setContentType("text/html;charset=utf-8");
		//����������
		request.setCharacterEncoding("utf-8");
		//��Ӧ�������
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		
		User user = new User();
		UserMethod um = new UserMethod();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>������������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
        try {   
        	
          user.setUsername(request.getParameter("username").trim());
          user.setGroupname(request.getParameter("xz").trim());
          
		  um.revokeGroupmanager(user);
			
		} catch (SQLException e1) {
			//out.print("<script language='javascript'>alert('������ʧ��');window.location.href='../admin/groupmanager/GrantGroupmanager.jsp';</script>");	
			e1.printStackTrace();
		}   
          
          response.addHeader("refresh","5;url=\"../admin/groupmanager/RevokeGroupmanager.jsp\"");    

          out.print("�������ɹ���<br>��5��δ��ת������<a href=../admin/groupmanager/RevokeGroupmanager.jsp>��ת����ǰҳ��</a>");
			
   
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
