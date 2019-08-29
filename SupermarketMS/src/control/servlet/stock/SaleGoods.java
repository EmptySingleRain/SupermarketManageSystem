package control.servlet.stock;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.json.JSONArray;
import org.json.JSONException;
import org.json.JSONObject;

import module.javabean.stock.Stock;
import module.javabean.stock.StockMethod;

public class SaleGoods extends HttpServlet {


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
		
		
		try {		
		
			
			String param = request.getParameter("jsonarray");
			
			String jsonarray = new String(param.getBytes("iso-8859-1"),"utf-8");		
		
		
		StockMethod sm = new StockMethod();	
		
		JSONArray array = new JSONArray(jsonarray);

		

		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>出售商品控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
		for(int i=0;i<array.length();i++){
			String id = array.getJSONObject(i).get("id").toString();
			String name = array.getJSONObject(i).get("name").toString();
			float price = Float.parseFloat(array.getJSONObject(i).get("price").toString());
			int saleAmount = Integer.parseInt(array.getJSONObject(i).get("saleAmount").toString());
			float totalprice= Float.parseFloat(array.getJSONObject(i).get("totalprice").toString());
			
			sm.reduceGoodsAmount(id, saleAmount);
			sm.insertSaleRecord(id, name, price, saleAmount, totalprice);
		}
      	} catch (JSONException e) {
			e.printStackTrace();
		}	
		
		response.addHeader("refresh", "5;url=\"../stock/SaleGoods.jsp\"");
		
		out.print("出售成功！<br>若5秒未跳转，请点击<a href=../stock/SaleGoods.jsp>跳转至当前页面</a>");

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
