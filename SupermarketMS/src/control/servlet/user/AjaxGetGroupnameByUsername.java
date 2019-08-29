package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import module.javabean.user.User;
import module.javabean.user.UserMethod;

public class AjaxGetGroupnameByUsername extends HttpServlet {


	private static final long serialVersionUID = 1L;
/*
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		try {
			UserMethod um = new UserMethod();
			User user = new User();
			user.setUsername(request.getParameter("username"));
			ResultSet rs1 = um.selectUserByName(user);
			
			// json在这里存放的是数组信息
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			
			rs1.next();

				ResultSet rs2 = um.selectGroupid(rs1.getInt("id"));
				String groupname = "";
				
				//改为了if改回去while
				if (rs2.next()) {
					
					int groupid = Integer.parseInt(rs2.getString("groupid"));
					//groupname += um.selectGroupname(groupid) + " ";
					groupname = um.selectGroupname(groupid);
					// 两个数据
					
					
					JSONObject temp1 = new JSONObject();
					JSONObject temp2 = new JSONObject();
					
					// 第一个name和sex
					temp1.put("id", 1);
					temp1.put("name", "张三");
					temp1.put("age", "23");
					array.put(0, temp1);

					// 第二个name和sex
					temp2.put("id", 2);
					temp2.put("name", "李四");
					temp2.put("age", "33");
					array.put(1, temp2);

					// 添加到json中
					json.put("people", array);
				}

				// 向前台的页面输出结果
				out.println(json);
				out.close();
	
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			out.print("<script language='javascript'>alert('没有查询到任何数据');window.location.href='../admin/groupmanager/RevokeGroupmanager.jsp';</script>");
		}catch (JSONException e) {
			e.printStackTrace();
		}
		

	}*/
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		UserMethod um = new UserMethod();
		User user = new User();
		user.setUsername(request.getParameter("username"));
	
		
		// json在这里存放的是数组信息
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();

		int i =0;
		String groupname = "";
		
		try {
			
			ResultSet rs1 = um.selectUserByName(user);
			
			rs1.next();
			
			ResultSet rs2 = um.selectGroupid(rs1.getInt("id"));
			
			
			
			//改为了if改回去while
			
			while(rs2.next()){
				
				JSONObject temp = new JSONObject();
				
				int groupid = Integer.parseInt(rs2.getString("groupid"));
				//groupname += um.selectGroupname(groupid) + " ";
				groupname = um.selectGroupname(groupid);

				
			// 第一个name和sex

			temp.put("groupname", groupname);

			
			array.put(i, temp);
			i++;
			}
			// 添加到json中
			json.put("groupmanager", array);
			
			json.put("size", i);
			
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// 向前台的页面输出结果
		
		out.println(json);
		out.close();
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text");
		PrintWriter out = response.getWriter();
		out.flush();
		out.close();
	}

}
