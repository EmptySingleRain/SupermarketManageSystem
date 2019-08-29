package control.servlet.common;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class Register extends HttpServlet {


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
		
		User user = new User();
		UserMethod um = new UserMethod();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>��Աע�������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
        try {   
		
    		String uyzm = request.getParameter("code");//��ȡJSPҳ���������֤������
			String yzm=request.getSession().getAttribute("yzm").toString();//�õ��������˲�����ͼƬ�ϵ�����
			
			if(!uyzm.equals(yzm)){                            //�Ƚ�ֵ
				
				response.addHeader("refresh","5;url=\"../index.jsp\"");
				out.print("��֤��������������µ�¼�� ��5��δ��ת������<a href=../index.jsp>��ת����ǰҳ��</a>");
				}
			else{
          //System.out.print(a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);
        	
          user.setUsername(request.getParameter("yhm").trim());
          user.setPassword(request.getParameter("mm"));
          
          user.setBdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
          
          user.setTruename(request.getParameter("zsxm"));
          user.setSex(request.getParameter("xb"));
          user.setBirthday(request.getParameter("csrq"));
          user.setMobile(request.getParameter("lxfs"));
          user.setEmail(request.getParameter("yx"));

		  um.insertUser(user);
			
			request.getSession().setAttribute("username",request.getParameter("yhm").trim());
			request.getSession().setAttribute("truename",request.getParameter("zsxm"));
			
	          response.addHeader("refresh","5;url=\"../mall/index.jsp\"");    

	          out.print("�ʺ�ע��ɹ�<br>"+"�û���Ϊ:"+request.getParameter("yhm")+"<br>����Ϊ:"+request.getParameter("mm")+",��5��δ��ת������<a href=../mall/index.jsp>��ת����ǰҳ��</a>");
				
			}
		} catch (SQLException e1) {
			out.print("<script language='javascript'>alert('"+request.getParameter("yhm")+"�Ѵ���,����û�ʧ��');window.location.href='../admin/user/InsertUser.jsp';</script>");	
		}   
          

   
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
		
	}

}
