package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class SelectUserByTruename extends HttpServlet {


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

		// �����������
		response.setContentType("text/html;charset=utf-8");
		// ����������
		request.setCharacterEncoding("utf-8");
		// ��Ӧ�������
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		try {
			User user = new User();
			UserMethod um = new UserMethod();	
			
			String truename = request.getParameter("truename");
			
			user.setTruename(truename);
			ResultSet rs_truename;

			rs_truename = um.selectUserByTruename(user);
			if(!rs_truename.next())
				out.print("<script language='javascript'>alert('û�в�ѯ���κ�����');window.location.href='../admin/user/SelectUser.jsp';</script>");
			out
					.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
			out.println("<HTML>");
			out
					.println("  <HEAD><TITLE>ͨ����ʵ������ѯ�û���Ϣ</TITLE><link rel='stylesheet' type='text/css' href='../admin/css/table.css'></HEAD>");
			out.println("  <BODY bgcolor='#e6f1fc'>");
			out.println("<table border='1' class='table'>");
			out.println("<tr><th align='center'>ID</th><th align='center'>�û���</th><th align='center'>����</th><th align='center'>��ʵ����</th><th align='center'>�Ա�</th><th align='center'>��������</th><th align='center'>��ϵ��ʽ</th><th align='center'>����</th><th align='center'>ע������</th><th align='center'>�û����</th></tr>");

			do{
				ResultSet rs = um.selectGroupid(rs_truename.getInt("id"));
				
				int groupid=0;
				String groupname="";
	            while(rs.next()){
	            	groupid =Integer.parseInt(rs.getString("groupid"));
	            	groupname = groupname +um.selectGroupname(groupid)+" ";
	            }
				if(groupname==""){
					groupname="δ����";
				}
				
				out.print("<tr><td>" + rs_truename.getString("id")
						+ "</td><td>" + rs_truename.getString("name")
						+ "</td><td>" + rs_truename.getString("password")
						+ "</td><td>" + rs_truename.getString("truename")
						+ "</td><td>" + rs_truename.getString("sex")
						+ "</td><td>" + rs_truename.getString("birthday")
						+ "</td><td>" + rs_truename.getString("mobile")
						+ "</td><td>" + rs_truename.getString("email")
						+ "</td><td>" + rs_truename.getString("bdate")
						+ "</td><td>" + groupname
						+ "</td></tr>");
			}while (rs_truename.next());

		} catch (SQLException e) {
			out.print("<script language='javascript'>alert('û�в�ѯ���κ�����');window.location.href='../admin/user/SelectUser.jsp';</script>");
		}

		out.println("</table>");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}


}
