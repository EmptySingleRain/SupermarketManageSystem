package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class RUpdateGroupmanager extends HttpServlet {


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
		out.println("  <HEAD><TITLE>���������Ϣ������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");

		int id =Integer.parseInt(request.getParameter("xz"));
        String zbm=request.getParameter("zbm");
        String zbxx =request.getParameter("zbxx");

        user.setGroupid(id);
        user.setGroupname(zbm);
        user.setGroupinfo(zbxx);

        
        um.updateGroupmanager(user);
        

            response.addHeader("refresh","5;url=\"../admin/groupmanager/UpdateDeleteGroupmanager.jsp\"");
            out.print("�޸����ɹ���<br>��5��δ��ת������<a href=../admin/groupmanager/UpdateDeleteGroupmanager.jsp>��ת����ǰҳ��</a>");

		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
