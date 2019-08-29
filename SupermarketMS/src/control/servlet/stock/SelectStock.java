package control.servlet.stock;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.stock.Stock;
import module.javabean.stock.StockMethod;

public class SelectStock extends HttpServlet {


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
		
		String zl = request.getParameter("zl");
		
		String zwzl ="";
		
		if(zl.equals("fz")) zwzl="服装";
		if(zl.equals("smcp")) zwzl="数码产品";
		if(zl.equals("jd")) zwzl="家电";
		if(zl.equals("sx")) zwzl="生鲜";
		if(zl.equals("ryp")) zwzl="日用品";
		if(zl.equals("ls")) zwzl="零食";
		
		
		
		
		
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>查询指定库存信息控制器</TITLE><link rel='stylesheet' type='text/css' href='../admin/css/table.css'><script type='text/javascript' src='../admin/js/jquery-3.3.1.min.js'></script><script src='../js/page.js' charset='utf-8'></script></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc' onload='goPage(1,15);'>  ");
		out.println("<label>查询"+zwzl+"库存信息</label>");
		out.println("<table border='1' class='table' style='position:absolute;width:99%;'>");
		out.println("<thead><tr><th align='center'>ID</th><th align='center'>产品名</th><th align='center'>产品价格</th><th align='center'>数量</th></tr></thead><tbody id='adminTbody'>");
		try {


			StockMethod sm = new StockMethod();
			List<Stock> list;

			list = sm.selectStock(zl);

			for (Stock stock1 : list) {
				
				out.print("<tr><td>" + stock1.getId()
						+ "</td><td>" + stock1.getName()
						+ "</td><td>" + stock1.getPrice()
						+ "</td><td>" + stock1.getAmount()
						+ "</td></tr>");
			}
		} catch (SQLException e) {
			out.print("<script language='javascript'>alert('没有查询到任何数据');window.location.href='../stock/SelectStock.jsp';</script>");
		}
		out.println("</tbody></table>");
		
		out.println("<div id='barcon' style='position:absolute;bottom:0px;left:20px;'></div>");
	    out.println("<table class='table' style='position:absolute;width:50%;bottom:0px;left:25%;'><tr><td align='center' style='width:20%'><a href='###' id='firstPage'>首页</a></td><td align='center' style='width:20%'><a href='###' id='prePage'>上一页</a></td><td align='center' style='width:20%'><a href='###' id='nextPage'>下一页</a></td><td align='center' style='width:20%'><a href='###' id='lastPage'>尾页</a></td><td align='center' style='width:20%'><select id='jumpWhere'></select><a href='###' id='jumpPage' onclick='jumpPage()'>跳转</a></td>");
	    
		out.println("</tr></table></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
