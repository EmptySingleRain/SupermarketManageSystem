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

public class InsertStuff extends HttpServlet {

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
		out.println("  <HEAD><TITLE>���Ա��������</TITLE></HEAD>");
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
          
          user.setGroupname(request.getParameter("zb"));

		  um.insertStuff(user);
			
		} catch (SQLException e1) {
			out.print("<script language='javascript'>alert('"+request.getParameter("yhm")+"�Ѵ���,���Ա��ʧ��');window.location.href='../stuff/stuff/InsertStuff.jsp';</script>");	
		}   
          
          response.addHeader("refresh","5;url=\"../stuff/stuff/InsertStuff.jsp\"");    

          out.print("���Ա���ɹ���<br>"+"�û���Ϊ:"+request.getParameter("yhm")+"<br>����Ϊ:"+request.getParameter("mm")+",��5��δ��ת������<a href=../stuff/stuff/InsertStuff.jsp>��ת����ǰҳ��</a>");
			
   
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
