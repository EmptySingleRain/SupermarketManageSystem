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


		// �����������
		response.setContentType("text/html;charset=utf-8");
		// ����������
		request.setCharacterEncoding("utf-8");
		// ��Ӧ�������
		response.setCharacterEncoding("utf-8");
		PrintWriter out = response.getWriter();
		
		Stock stock = new Stock();
		StockMethod sm =new StockMethod();
		
		String name = request.getParameter("spm");
		String price = request.getParameter("jg");
		String zl = request.getParameter("zl");

		String zwzl ="";
		
		if(zl.equals("fz")) zwzl="��װ";
		if(zl.equals("smcp")) zwzl="�����Ʒ";
		if(zl.equals("jd")) zwzl="�ҵ�";
		if(zl.equals("sx")) zwzl="����";
		if(zl.equals("ryp")) zwzl="����Ʒ";
		if(zl.equals("ls")) zwzl="��ʳ";

		out.println("<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\">");
		out.println("<HTML>");
		out.println("  <HEAD><TITLE>�����Ʒ������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
        try {   
    		

            //System.out.print(a+" "+b+" "+c+" "+d+" "+e+" "+f+" "+g);
            
            stock.setName(request.getParameter("spm").trim());
            stock.setPrice(Float.parseFloat(request.getParameter("jg")));


  		    sm.insertStock(stock,zl);
  			
  		} catch (SQLException e1) {
  			e1.printStackTrace();
  		} catch (NumberFormatException e2){
  			out.print("<script language='javascript'>alert('û������,������!');window.location.href='../stock/InsertStock.jsp';</script>");
  		}
            
            response.addHeader("refresh","5;url=\"../stock/InsertStock.jsp\"");    

            out.print("�����Ʒ�ɹ�,����ӵ���Ʒ��Ϊ:"+name+",�۸�Ϊ:"+price+",����Ϊ:"+zwzl+"<br>��ǰ���޸���Ʒ���棬�����������и����������޷��������ۣ�<br>��5��δ��ת������<a href=../stock/InsertStock.jsp>��ת����ǰҳ��</a>");
  			
     
  		
  		out.println("  </BODY>");
  		out.println("</HTML>");
  		out.flush();
  		out.close();
	}

}
