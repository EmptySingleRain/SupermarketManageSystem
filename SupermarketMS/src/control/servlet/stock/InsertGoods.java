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

public class InsertGoods extends HttpServlet {

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
		
		Stock stock = new Stock();
		StockMethod sm =new StockMethod();
		
		String name = request.getParameter("spm");
		String price = request.getParameter("jg");
		String zl = request.getParameter("zl");

		String zwzl ="";
		
		if(zl.equals("fz")) zwzl="服装";
		if(zl.equals("smcp")) zwzl="数码产品";
		if(zl.equals("jd")) zwzl="家电";
		if(zl.equals("sx")) zwzl="生鲜";
		if(zl.equals("ryp")) zwzl="日用品";
		if(zl.equals("ls")) zwzl="零食";

		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>添加商品控制器</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
        try {   
    		

            //System.out.print(a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);
            
            stock.setName(request.getParameter("spm").trim());
            stock.setPrice(Float.parseFloat(request.getParameter("jg")));


  		    sm.insertStock(stock,zl);
  			
  		} catch (SQLException e1) {
  			e1.printStackTrace();
  		} catch (NumberFormatException e2){
  			out.print("<script language='javascript'>alert('没有输入,请输入!');window.location.href='../stock/InsertStock.jsp';</script>");
  		}
            
            response.addHeader("refresh","5;url=\"../stock/InsertStock.jsp\"");    

            out.print("添加商品成功,您添加的商品名为:"+name+",价格为:"+price+",种类为:"+zwzl+"<br>请前往修改商品界面，对其数量进行更进，否则无法正常出售！<br>若5秒未跳转，请点击<a href=../stock/InsertStock.jsp>跳转至当前页面</a>");
  			
     
  		
  		out.println("  </BODY>");
  		out.println("</HTML>");
  		out.flush();
  		out.close();
	}

}
