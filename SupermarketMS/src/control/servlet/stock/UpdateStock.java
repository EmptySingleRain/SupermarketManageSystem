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

public class UpdateStock extends HttpServlet {


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
		Stock stock = new Stock();
		StockMethod sm = new StockMethod();
		
		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>������Ʒ��Ϣ������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
		
		String param = request.getParameter("jsonarray");
		
		String jsonarray = new String(param.getBytes("iso-8859-1"),"utf-8");	
		
		try {
			JSONArray array = new JSONArray(jsonarray);
	
			for(int i=0;i<array.length();i++){
				
				String id = array.getJSONObject(i).get("id").toString();
				String name = array.getJSONObject(i).get("name").toString();
				float price = Float.parseFloat(array.getJSONObject(i).get("price").toString());
				int amount = Integer.parseInt(array.getJSONObject(i).get("amount").toString());
				
		        stock.setId(id);
		        stock.setName(name);
		        stock.setPrice(price);
		        stock.setAmount(amount);
		        
		        sm.updateStock(stock);
			}
		} catch (JSONException e) {
			e.printStackTrace();
		}
		response.addHeader("refresh", "5;url=\"../stock/UpdateStock.jsp\"");
		out.print("�޸ĳɹ���<br>��5��δ��ת������<a href=../stock/UpdateStock.jsp>��ת����ǰҳ��</a>");

		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
