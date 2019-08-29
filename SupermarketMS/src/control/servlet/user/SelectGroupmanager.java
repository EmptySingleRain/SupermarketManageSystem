package control.servlet.user;

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

public class SelectGroupmanager extends HttpServlet {


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
        this.doPost(request, response);
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
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>��ѯ�����Ϣ</TITLE><link rel='stylesheet' type='text/css' href='../admin/css/table.css'><script type='text/javascript' src='../admin/js/jquery-3.3.1.min.js'></script><script src='../js/page.js' charset='utf-8'></script></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc' onload='goPage(1,15);'>  ");
		out.println("<label>��ѯ�����Ϣ</label>");
		out.println("<table border='1' class='table' style='position:absolute;width:99%;'>");
		out.println("<thead><tr><th align='center'>ID</th><th align='center'>�����</th><th align='center'>������</th></tr></thead><tbody id='adminTbody'>");
		try {


			UserMethod um = new UserMethod();

			ResultSet rs = um.selectGroupmanager();

			while (rs.next()) {
				
				out.print("<tr><td>" + rs.getString("groupid")
						+ "</td><td>" + rs.getString("groupname")
						+ "</td><td>" + rs.getString("groupinfo")
						+ "</td></tr>");
			}
		} catch (SQLException e) {
			out.print("<script language='javascript'>alert('û�в�ѯ���κ�����');</script>");
		}
		out.println("</tbody></table>");
		
		out.println("<div id='barcon' style='position:absolute;bottom:0px;left:20px;'></div>");
	    out.println("<table class='table' style='position:absolute;width:50%;bottom:0px;left:25%;'><tr><td align='center' style='width:20%'><a href='###' id='firstPage'>��ҳ</a></td><td align='center' style='width:20%'><a href='###' id='prePage'>��һҳ</a></td><td align='center' style='width:20%'><a href='###' id='nextPage'>��һҳ</a></td><td align='center' style='width:20%'><a href='###' id='lastPage'>βҳ</a></td><td align='center' style='width:20%'><select id='jumpWhere' style='margin-right:5px;'></select><a href='###' id='jumpPage' onclick='jumpPage()'>��ת</a></td>");
	    
		out.println("</tr></table></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}