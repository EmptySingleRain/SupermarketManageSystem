package control.servlet.user;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.user.UserMethod;

public class TestingUsername extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		PrintWriter pw = response.getWriter();
		String name = request.getParameter("name");
		
		UserMethod um = new UserMethod();
		
		if(name.equals("")){
			pw.print("empty");
			return;
		}
	try{	
		
		ResultSet rs = um.selectUsername();
		
		while(rs.next()){
			
			// 判断昵称是否已被使用
			if (rs.getString("name").trim().equals(name)) {
				pw.print(false);
			} 
		}
		
		pw.print(true);

		
	}
	catch(SQLException e){
		e.printStackTrace();
	}
		
		

	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

}
