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

		// �����������
		response.setContentType("text/html;charset=utf-8");
		// ����������
		request.setCharacterEncoding("utf-8");
		// ��Ӧ�������
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		String zl = request.getParameter("zl");
		
		String zwzl ="";
		
		if(zl.equals("fz")) zwzl="��װ";
		if(zl.equals("smcp")) zwzl="�����Ʒ";
		if(zl.equals("jd")) zwzl="�ҵ�";
		if(zl.equals("sx")) zwzl="����";
		if(zl.equals("ryp")) zwzl="����Ʒ";
		if(zl.equals("ls")) zwzl="��ʳ";
		
		
		
		
		
		out
				.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>��ѯָ�������Ϣ������</TITLE><link rel='stylesheet' type='text/css' href='../admin/css/table.css'><script type='text/javascript' src='../admin/js/jquery-3.3.1.min.js'></script><script src='../js/page.js' charset='utf-8'></script></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc' onload='goPage(1,15);'>  ");
		out.println("<label>��ѯ"+zwzl+"�����Ϣ</label>");
		out.println("<table border='1' class='table' style='position:absolute;width:99%;'>");
		out.println("<thead><tr><th align='center'>ID</th><th align='center'>��Ʒ��</th><th align='center'>��Ʒ�۸�</th><th align='center'>����</th></tr></thead><tbody id='adminTbody'>");
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
			out.print("<script language='javascript'>alert('û�в�ѯ���κ�����');window.location.href='../stock/SelectStock.jsp';</script>");
		}
		out.println("</tbody></table>");
		
		out.println("<div id='barcon' style='position:absolute;bottom:0px;left:20px;'></div>");
	    out.println("<table class='table' style='position:absolute;width:50%;bottom:0px;left:25%;'><tr><td align='center' style='width:20%'><a href='###' id='firstPage'>��ҳ</a></td><td align='center' style='width:20%'><a href='###' id='prePage'>��һҳ</a></td><td align='center' style='width:20%'><a href='###' id='nextPage'>��һҳ</a></td><td align='center' style='width:20%'><a href='###' id='lastPage'>βҳ</a></td><td align='center' style='width:20%'><select id='jumpWhere'></select><a href='###' id='jumpPage' onclick='jumpPage()'>��ת</a></td>");
	    
		out.println("</tr></table></BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
