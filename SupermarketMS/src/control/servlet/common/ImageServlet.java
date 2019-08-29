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
	
response.setHeader("Pragma", "No-cache");// 设置页面不缓存
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);
int width = 60, height = 20;
BufferedImage image = new BufferedImage(width, height,
BufferedImage.TYPE_INT_RGB);// 在内存中创建图象
Graphics g = image.getGraphics();// 获取图形上下文
Random random = new Random();// 创建随机数对象
g.setColor(new Color(255,255, 255));// 设定背景色
g.fillRect(0, 0, width, height);// 设定字体
g.setFont(new Font("Times New Roman", Font.PLAIN, 18));
// 随机产生干扰线，使图象中的认证码不易被其它程序探测到
g.setColor(Color.red);//这里的Color设置的是干扰线的颜色，可随意更改
for (int i = 0; i < 20; i++) {
int x = random.nextInt(width);
int y = random.nextInt(height);
int xl = random.nextInt(12);
int yl = random.nextInt(12);
g.drawLine(x, y, x + xl, y + yl);
}//这里的循环的i=20，是设置的干扰线的条数，太大的话会造成验证码的数字看不清楚
String sRand = "";
for (int i = 0; i < 4; i++) {
String rand = String.valueOf(random.nextInt(10));
sRand += rand;// 取随机产生的认证码(4位数字)
g.setColor(new Color(30 + random.nextInt(160), 40 + random
.nextInt(170), 40 + random.nextInt(180)));
g.drawString(rand, 13 * i + 6, 16);// 将认证码显示到图象中
} 
request.getSession().setAttribute("yzm", sRand);// 将认证码存入SESSION
g.dispose(); 
ImageIO.write(image, "JPEG", response.getOutputStream());// 输出图象到页面
}
public void doPost(HttpServletRequest req, HttpServletResponse resp)
throws ServletException, IOException {
doGet(req, resp);
}
}
