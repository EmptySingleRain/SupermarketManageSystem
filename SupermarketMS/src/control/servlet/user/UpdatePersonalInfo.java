package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.User;
import module.javabean.user.UserMethod;
public class UpdatePersonalInfo extends HttpServlet {

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

		//解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		//请求解决乱码
		request.setCharacterEncoding("utf-8");
		//响应解决乱码
		response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		User user = new User();
		UserMethod um = new UserMethod();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>更新用户个人信息控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");


		int id =Integer.parseInt(request.getParameter("id"));
        String yhm=request.getParameter("yhm");
        String mm =request.getParameter("mm");
        String zsxm =request.getParameter("zsxm");
        
        String xb=request.getParameter("xb");
        
        String zcrq=request.getParameter("zcrq");
        String csrq=request.getParameter("csrq");
        String lxfs=request.getParameter("lxfs");
        String yx=request.getParameter("yx");
        
        user.setMasterid(id);
        user.setUsername(yhm);
        user.setPassword(mm);
        user.setTruename(zsxm);
        user.setSex(xb);
        user.setBdate(zcrq);
        user.setBirthday(csrq);
        user.setMobile(lxfs);
        user.setEmail(yx);
        
        um.updateUser(user);
		

		response.addHeader("refresh", "5;url=\"../UpdatePersonalInfo.jsp\"");
		out.print("修改成功！用户组别请前往组别管理修改。<br>若5秒未跳转，请点击<a href=../UpdatePersonalInfo.jsp>跳转至当前页面</a>");

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
