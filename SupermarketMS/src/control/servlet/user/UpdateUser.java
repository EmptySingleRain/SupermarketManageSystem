package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class UpdateUser extends HttpServlet {

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
		out.println("  <HEAD><TITLE>更新用户信息控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
    	String param = request.getParameter("jsonarray");
		
		String jsonarray = new String(param.getBytes("iso-8859-1"),"utf-8");	
		
		try {
			JSONArray array = new JSONArray(jsonarray);
	
			for(int i=0;i<array.length();i++){
				
				int id =Integer.parseInt(array.getJSONObject(i).get("id").toString());
		        String yhm=array.getJSONObject(i).get("yhm").toString();
		        String mm =array.getJSONObject(i).get("mm").toString();
		        String zsxm =array.getJSONObject(i).get("zsxm").toString();
		        String xb=array.getJSONObject(i).get("xb").toString();
		        String zcrq=array.getJSONObject(i).get("zcrq").toString();
		        String csrq=array.getJSONObject(i).get("csrq").toString();
		        String lxfs=array.getJSONObject(i).get("lxfs").toString();
		        String yx=array.getJSONObject(i).get("yx").toString();
				
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
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
/*
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
        */
		
        if(request.getParameter("test").equals("UpdatePersonalInfo")){
            response.addHeader("refresh","5;url=\"../UpdatePersonalInfo.jsp\"");
            out.print("修改成功！用户组别请前往组别管理修改。<br>若5秒未跳转，请点击<a href=../UpdatePersonalInfo.jsp>跳转至当前页面</a>");
        }
        
        if(request.getParameter("test").equals("UpdateUser")){
            response.addHeader("refresh","5;url=\"../admin/user/UpdateUser.jsp\"");
            out.print("修改成功！用户组别请前往组别管理修改。<br>若5秒未跳转，请点击<a href=../admin/user/UpdateUser.jsp>跳转至当前页面</a>");
        }
		
        if(request.getParameter("test").equals("UpdateStuff")){
        	response.addHeader("refresh","5;url=\"../stuff/stuff/UpdateStuff.jsp\"");
            out.print("修改成功！用户组别请前往组别管理修改。<br>若5秒未跳转，请点击<a href=../stuff/stuff/UpdateStuff.jsp>跳转至当前页面</a>");
        }
        
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
