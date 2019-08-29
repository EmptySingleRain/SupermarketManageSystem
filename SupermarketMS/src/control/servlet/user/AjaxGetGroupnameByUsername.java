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
			
			// json�������ŵ���������Ϣ
			JSONObject json = new JSONObject();
			JSONArray array = new JSONArray();
			
			rs1.next();

				ResultSet rs2 = um.selectGroupid(rs1.getInt("id"));
				String groupname = "";
				
				//��Ϊ��if�Ļ�ȥwhile
				if (rs2.next()) {
					
					int groupid = Integer.parseInt(rs2.getString("groupid"));
					//groupname += um.selectGroupname(groupid) + " ";
					groupname = um.selectGroupname(groupid);
					// ��������
					
					
					JSONObject temp1 = new JSONObject();
					JSONObject temp2 = new JSONObject();
					
					// ��һ��name��sex
					temp1.put("id", 1);
					temp1.put("name", "����");
					temp1.put("age", "23");
					array.put(0, temp1);

					// �ڶ���name��sex
					temp2.put("id", 2);
					temp2.put("name", "����");
					temp2.put("age", "33");
					array.put(1, temp2);

					// ��ӵ�json��
					json.put("people", array);
				}

				// ��ǰ̨��ҳ��������
				out.println(json);
				out.close();
	
		} catch (NumberFormatException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			out.print("<script language='javascript'>alert('û�в�ѯ���κ�����');window.location.href='../admin/groupmanager/RevokeGroupmanager.jsp';</script>");
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
	
		
		// json�������ŵ���������Ϣ
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();

		int i =0;
		String groupname = "";
		
		try {
			
			ResultSet rs1 = um.selectUserByName(user);
			
			rs1.next();
			
			ResultSet rs2 = um.selectGroupid(rs1.getInt("id"));
			
			
			
			//��Ϊ��if�Ļ�ȥwhile
			
			while(rs2.next()){
				
				JSONObject temp = new JSONObject();
				
				int groupid = Integer.parseInt(rs2.getString("groupid"));
				//groupname += um.selectGroupname(groupid) + " ";
				groupname = um.selectGroupname(groupid);

				
			// ��һ��name��sex

			temp.put("groupname", groupname);

			
			array.put(i, temp);
			i++;
			}
			// ��ӵ�json��
			json.put("groupmanager", array);
			
			json.put("size", i);
			
		} catch (JSONException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		// ��ǰ̨��ҳ��������
		
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
