package control.servlet.stock;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.stock.Stock;
import module.javabean.stock.StockMethod;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

public class AjaxSelectGoodsById extends HttpServlet {

	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setCharacterEncoding("UTF-8");
		PrintWriter out = response.getWriter();
		
		String checkId = request.getParameter("checkId");
		
		StockMethod sm = new StockMethod();
		

		Stock stock = new Stock();
		
		stock.setId(checkId);
		// json在这里存放的是数组信息
		JSONObject json = new JSONObject();
		JSONArray array = new JSONArray();

		int i =0;
		
		try {

			ResultSet rs = sm.selectGoodsById(stock);
			while(rs.next()){

				JSONObject temp = new JSONObject();
				
				temp.put("id", rs.getString("id"));
				temp.put("name", rs.getString("name"));
				temp.put("price", Float.parseFloat(rs.getString("price")));
				temp.put("amount", Integer.parseInt(rs.getString("amount")));

				array.put(i, temp);
				i++;

			// 添加到json中
			json.put("stock", array);
			json.put("size", i);
		
			}
			
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

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>A Servlet</TITLE></HEAD>");
		out.println("  <BODY>");
		out.print("    This is ");
		out.print(this.getClass());
		out.println(", using the POST method");
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
