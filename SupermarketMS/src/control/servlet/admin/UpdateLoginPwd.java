package control.servlet.admin;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.admin.Admin;
import module.javabean.admin.AdminMethod;

public class UpdateLoginPwd extends HttpServlet {




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

		// �����������
		response.setContentType("text/html;charset=utf-8");
		// ����������
		request.setCharacterEncoding("utf-8");
		// ��Ӧ�������
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>����Ա�����޸�</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");

		Admin admin = new Admin();
		AdminMethod am = new AdminMethod();
		
		String name=request.getSession().getAttribute("adminname").toString();
	    String password=request.getParameter("mm");
	    
	    admin.setName(name);
	    admin.setPassword(password);
	    am.updateAdminPassword(admin);
	       
	    response.addHeader("refresh","5;url=\"../admin/updateLoginPwd.jsp\"");    

	    out.print(name+",��������޸ĳɹ������ס��������룺"+password+",��5��δ��ת������<a href=../admin/updateLoginPwd.jsp>��ת����ǰҳ��</a>");
	       

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


	public void init() throws ServletException {
		// Put your code here
	}

}
