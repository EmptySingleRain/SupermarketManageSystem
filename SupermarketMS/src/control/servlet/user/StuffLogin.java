package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;
import mybean.DateFormatTransform;
import conn.LoadDriver;

public class StuffLogin extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
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
		out.println("  <HEAD><TITLE>Ա����¼������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");

		try {
			LoadDriver mydriver = new LoadDriver();
			
			User user = new User();
			UserMethod um = new UserMethod();
			DateFormatTransform dft = new DateFormatTransform();

			mydriver.LoadDriver();

			ResultSet rs = null;
			
			String a = request.getParameter("username").trim();
			String b = request.getParameter("password");
			
			String uyzm = request.getParameter("code");//��ȡJSPҳ���������֤������
			String yzm=request.getSession().getAttribute("yzm").toString();//�õ��������˲�����ͼƬ�ϵ�����
			
			if(!uyzm.equals(yzm)){                            //�Ƚ�ֵ
				
				response.addHeader("refresh","5;url=\"../index.jsp\"");
				out.print("��֤��������������µ�¼�� ��5��δ��ת������<a href=../index.jsp>��ת����ǰҳ��</a>");
				}
			else{
			user.setUsername(a);
			user.setPassword(b);
			
			rs = um.selectStuff(user);
			
			if (rs.next()) {
				
				ResultSet rs2 = um.selectGroupid(rs.getInt("id"));	
				
				String groupname="";
				
	            if(rs2.next()){
	            	int groupid =Integer.parseInt(rs2.getString("groupid"));

	            	groupname= um.selectGroupname(groupid);

	            }

				
				
				
				um.increaseNumLogins(user);
				
				request.getSession().setAttribute("lastlogintime",dft.format(Timestamp.valueOf(rs.getString("last_login_time"))));
				um.lastLoginTime();
				
				request.getSession().setAttribute("username",rs.getString("name").trim());
				request.getSession().setAttribute("truename",rs.getString("truename").trim());
				request.getSession().setAttribute("bdate",rs.getString("bdate"));
				request.getSession().setAttribute("login_num",rs.getInt("login_num") + 1);
				
				request.getSession().setAttribute("id",rs.getInt("id"));
				
				request.getSession().setAttribute("groupid",rs2.getString("groupid"));
				request.getSession().setAttribute("groupname",groupname);
				
				
				
				
				response.sendRedirect("../stuff/index.jsp");

			} else
				
			response.addHeader("refresh","5;url=\"../index.jsp\"");
			out.print("δӵ��Ա��Ȩ�ޣ����û��������벻��ȷ�����������룡 ��5��δ��ת������<a href=../index.jsp>��ת����ǰҳ��</a>");
			}
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();

	}

}
