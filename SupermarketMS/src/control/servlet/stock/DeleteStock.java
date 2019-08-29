package control.servlet.stock;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import module.javabean.stock.Stock;
import module.javabean.stock.StockMethod;

public class DeleteStock extends HttpServlet {


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
		out.println("  <HEAD><TITLE>ɾ����Ʒ������</TITLE></HEAD>");
		out.println("  <BODY bgcolor='#e6f1fc'>");
		
        String []id = request.getParameterValues("xz");    
        
        for (int i = id.length-1; i >= 0; i--) {

        	//out.println(id[i]);
        	stock.setId(id[i]);
            //user.setUsername(id[i]);
			sm.delStock(stock);

        }    
        
        response.addHeader("refresh","5;url=\"../stock/DeleteStock.jsp\"");    

        out.print("ɾ���ɹ���<br>��5��δ��ת������<a href=../stock/DeleteStock.jsp>��ת����ǰҳ��</a>");
		
		out.println("  </BODY>");
		out.println("</HTML>");
		out.flush();
		out.close();
	}

}
