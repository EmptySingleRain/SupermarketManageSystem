package control.servlet.common;

import java.awt.*;
import java.awt.image.*;
import javax.imageio.*;
import java.io.*;
import java.util.Random;
import javax.servlet.*;
import javax.servlet.http.*;
public class ImageServlet extends HttpServlet {
public void doGet(HttpServletRequest request, HttpServletResponse response)
throws ServletException, IOException {
	
response.setHeader("Pragma", "No-cache");// ����ҳ�治����
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
int width = 60, height = 20;
BufferedImage image = new BufferedImage(width, height,
BufferedImage.TYPE_INT_RGB);// ���ڴ��д���ͼ��
Graphics g = image.getGraphics();// ��ȡͼ��������
Random random = new Random();// �������������
g.setColor(new Color(255,255, 255));// �趨����ɫ
g.fillRect(0, 0, width, height);// �趨����
g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
// ������������ߣ�ʹͼ���е���֤�벻�ױ���������̽�⵽
g.setColor(Color.red);//�����Color���õ��Ǹ����ߵ���ɫ�����������
for (int i = 0; i < 20; i++) {
int x = random.nextInt(width);
int y = random.nextInt(height);
int xl = random.nextInt(12);
int yl = random.nextInt(12);
g.drawLine(x, y, x + xl, y + yl);
}//�����ѭ����i=20�������õĸ����ߵ�������̫��Ļ��������֤������ֿ������
String sRand = "";
for (int i = 0; i < 4; i++) {
String rand = String.valueOf(random.nextInt(10));
sRand += rand;// ȡ�����������֤��(4λ����)
g.setColor(new Color(30 + random.nextInt(160), 40 + random
.nextInt(170), 40 + random.nextInt(180)));
g.drawString(rand, 13 * i + 6, 16);// ����֤����ʾ��ͼ����
} 
request.getSession().setAttribute("yzm", sRand);// ����֤�����SESSION
g.dispose(); 
ImageIO.write(image, "JPEG", response.getOutputStream());// ���ͼ��ҳ��
}
public void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
doGet(req, resp);
}
}
