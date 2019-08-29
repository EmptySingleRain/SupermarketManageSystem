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
		out.println("  <HEAD><TITLE>���̳��ʺſ�����</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");


	    try {   

	    	  
	          user.setUsername(request.getSession().getAttribute("username").toString());
	          
	          
	          user.setGroupname(um.selectGroupname(5));
	          
			  um.grantGroupmanager(user);
				
			} catch (SQLException e1) {
				response.addHeader("refresh", "5;url=\"../UpdatePersonalInfo.jsp\"");
				out.print("��ʧ�ܣ���֪ͨ����Ա,���������ƺ�id���޸ġ�<br>��5��δ��ת������<a href=../UpdatePersonalInfo.jsp>��ת����ǰҳ��</a>");
			}   
		

		response.addHeader("refresh", "5;url=\"../UpdatePersonalInfo.jsp\"");
		out.print("�󶨳ɹ����������������������̳��ˡ�<br>��5��δ��ת������<a href=../UpdatePersonalInfo.jsp>��ת����ǰҳ��</a>");

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
