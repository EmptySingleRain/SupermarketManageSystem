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

		// 解决中文乱码
		response.setContentType("text/html;charset=utf-8");
		// 请求解决乱码
		request.setCharacterEncoding("utf-8");
		// 响应解决乱码
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();

		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>员工登录控制器</TITLE></HEAD>");
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
			
			String uyzm = request.getParameter("code");//获取JSP页面输入的验证码数字
			String yzm=request.getSession().getAttribute("yzm").toString();//拿到服务器端产生的图片上的数字
			
			if(!uyzm.equals(yzm)){                            //比较值
				
				response.addHeader("refresh","5;url=\"../index.jsp\"");
				out.print("验证码输入错误，请重新登录！ 若5秒未跳转，请点击<a href=../index.jsp>跳转至当前页面</a>");
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
			out.print("未拥有员工权限！或用户名或密码不正确，请重新输入！ 若5秒未跳转，请点击<a href=../index.jsp>跳转至当前页面</a>");
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
