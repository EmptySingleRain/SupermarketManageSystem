package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class UpdateGroupmanager extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

        this.doPost(request, response);
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
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>���������Ϣ������</TITLE><link rel='stylesheet' type='text/css' href='../admin/css/table.css'></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		out.println("<label>���������Ϣ</label>");
		out.println("<form name='tianjia' action='RUpdateGroupmanager?xz="+request.getParameter("xz")+"' method='post' onsubmit='return checkForma();'><table border='1' class='table'><tr><th>�����:</th><td colspan='2'><input type='text' name='zbm'/></td></tr>");
        out.println("<tr><th>�����Ϣ:</th><td colspan='2'><input type='text' name='zbxx'/></td></tr><tr><th>��&nbsp;&nbsp;&nbsp;��:</th><td colspan='2'><input type='submit' value='ȷ��' style='margin-right:60px;'/><input type='reset' value='��д'/></td></tr></table></form>");  

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
