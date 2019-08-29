<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>ZeroLight SuperMarket</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
	<meta http-equiv="description" content="This is my page">

  <link rel="stylesheet" href="mall/css/bootstrap.min.css" type="text/css"></link>
  <link rel="stylesheet" type="text/css" href="mall/css/style.css">
  
  
  
  <script type="text/javascript" src="admin/js/jquery-3.3.1.min.js"></script>
  <script type="text/javascript" src="mall/js/bootstrap.min.js"></script>
 </head>
  
  <body>
    <!-- start header -->
		<header>
			<div class="top center">
				<div class="left fl">
					<ul>
						<li><a href="mall/index.jsp" target="_blank">零光超市</a></li>
						<li><a href="index.jsp" target="_blank">返回</a></li>
						<div class="clear"></div>
					</ul>
				</div>
				
				<div class="right fr">
					<div class="gouwuche fr"><a href="">购物车</a></div>
					
					<div class="fr">
						<ul>
						<%
						String username = (String)session.getAttribute("username");
						if(username==null||username==""){
						username="";
						%>
						<li><a href="mall/login.jsp">登录</a></li>
						<%
						}
						else{
						%>
						<li class="dropdown">
						<a href="#" class="dropdown-toggle" data-toggle="dropdown">
					您好，<%=username %>，欢迎光临ZL商城
					<b class="caret"></b>
					</a>	
					<ul class="dropdown-menu">
					<li ><a href="#">积分查询</a></li>
					<li ><a href="#">订单查询</a></li>
					<li class="divider" ></li>
					<li ><a href="UpdatePersonalInfo.jsp">个人设置</a></li>

					
					<li class="divider" ></li>
					<li ><a href="mall/ChangeUser.jsp">更换账户</a></li>

				    </ul>
					</li>
						
						<li><a href="mall/logout.jsp">注销</a></li>
						<% 
						}
						%>	
							<li>|</li>
							<li><a href="Register.jsp">注册</a></li>
						</ul>
					</div>
					<div class="clear"></div>
				</div>
				
				<div class="clear"></div>
			</div>
		</header>
	<!--end header -->

<!-- start banner_x -->
		<div class="banner_x center">
			<a href="mall/index.jsp" target="_blank"><div class="logo fl"></div></a>
			<a href=""><div class="ad_top fl"></div></a>
			<div class="nav fl">
				<ul>
					<li><a href="./liebiao.html" target="_blank">所有商品</a></li>
					<li><a href="">包装食品</a></li>
					<li><a href="">生活用品</a></li>
					<li><a href="">服装</a></li>
					<li><a href="">家电</a></li>
                    <li><a href="">肉食水产</a></li>
					<li><a href="">蔬菜水果</a></li>
				</ul>
			</div>
			<div class="search fr">
				<form action="" method="post">
					<div class="text fl">
						<input type="text" class="shuru"  placeholder="家电全场9折6&nbsp;会员享折上折">
					</div>
					<div class="submit fl">
						<input type="submit" class="sousuo" value="搜索"/>
					</div>
					<div class="clear"></div>
				</form>
				<div class="clear"></div>
			</div>
		</div>
<!-- end banner_x -->

	<!-- start banner_y -->
	<div class="banner_y center">
			<div class="nav">				
				<ul>
					<li>
						<a href="">零食</a>
						<a href="">饮料</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/lingshi_bg.jpg" alt=""></div>
											<span class="fl">纳宝帝</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="./xiangqing.html" target="_blank">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/lingshi_cb.jpg" alt=""></div>
											<span class="fl">立顿奶茶</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/lingshi_cj.jpg" alt=""></div>
											<span class="fl">雀巢咖啡</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/lingshi_gz.jpg" alt=""></div>
											<span class="fl">洽洽瓜子</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/lingshi_mgg.jpg" alt=""></div>
											<span class="fl">芒果干</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shipin_bbz.jpg" alt=""></div>
											<span class="fl">八宝粥</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>								
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shipin_fbm.jpg" alt=""></div>
											<span class="fl">方便面</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/yinliao_kl.jpg" alt=""></div>
											<span class="fl">百事可乐</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/yinliao_nn.jpg" alt=""></div>
											<span class="fl">安慕希</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/yinliao_gmcnn.jpg" alt=""></div>
											<span class="fl">光明牛奶</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
							
						</div>
					</li>
					<li>
						<a href="">家电</a>
						<a href="">厨具</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/chuju_bwp.jpg" alt=""></div>
											<span class="fl">暖水瓶</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/chuju_guo.jpg" alt=""></div>
											<span class="fl">双层蒸锅</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_zdq.jpg" alt=""></div>
											<span class="fl">蒸蛋器</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_wbl.jpg" alt=""></div>
											<span class="fl">格兰仕微波炉</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_mbj.jpg" alt=""></div>
											<span class="fl">面包机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_hebx.jpg" alt=""></div>
											<span class="fl">海尔冰箱</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>								
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_glkt.jpg" alt=""></div>
											<span class="fl">格力空调</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_dfb.jpg" alt=""></div>
											<span class="fl">电饭煲</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_dcl.jpg" alt=""></div>
											<span class="fl">电磁炉</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/jiadian_cfj.jpg" alt=""></div>
											<span class="fl">吹风机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/chuju_ccg.jpg" alt=""></div>
											<span class="fl">炒菜锅</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
                                <div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/chuju_dj.jpg" alt=""></div>
											<span class="fl">刀具</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
							
							<div class="clear"></div>
						</div>
					</li>
					<li>
						<a href="">服饰</a>
						<a href="">鞋包</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_nskb.jpg" alt=""></div>
											<span class="fl"> 女士挎包</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_wsbsq.jpg" alt=""></div>
											<span class="fl">短裙</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_mxie.jpg" alt=""></div>
											<span class="fl">air Jordan</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_msb.jpg" alt=""></div>
											<span class="fl">劳力士手表</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_nslyq.jpg" alt=""></div>
											<span class="fl">香奈儿连衣裙</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_wsy.jpg" alt=""></div>
											<span class="fl">女士毛衣</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>								
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_msy.jpg" alt=""></div>
											<span class="fl">男式衬衣</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_wkz.jpg" alt=""></div>
											<span class="fl">女士牛仔裤</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_nb.jpg" alt=""></div>
											<span class="fl">丹尼尔惠灵顿手表</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_nx.jpg" alt=""></div>
											<span class="fl">女士AJ1</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_nsy.jpg" alt=""></div>
											<span class="fl">西装</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/fsxb_mkz.jpg" alt=""></div>
											<span class="fl">男士牛仔裤</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="">文具</a>
						<a href="">生活用品</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_ljt.jpg" alt=""></div>
											<span class="fl">垃圾桶</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_mj.jpg" alt=""></div>
											<span class="fl">毛巾</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_xfs.jpg" alt=""></div>
											<span class="fl">清扬洗发水</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_xyy.jpg" alt=""></div>
											<span class="fl">汰渍洗衣液</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_bj.jpg" alt=""></div>
											<span class="fl">扫地二件套</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_yg.jpg" alt=""></div>
											<span class="fl">黑人牙膏</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>								
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_zj.jpg" alt=""></div>
											<span class="fl">洁柔卷纸</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shyp_jz.jpg" alt=""></div>
											<span class="fl">化妆镜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="">水果</a>
						<a href="">蔬菜</a>
						<a href="">生鲜</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shuiguo_pg.jpg" alt=""></div>
											<span class="fl">进口红富士</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shengxian_np.jpg" alt=""></div>
											<span class="fl">冷冻牛排</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shengxian_yu.jpg" alt=""></div>
											<span class="fl">海鱼切片</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shuiguo_cm.jpg" alt=""></div>
											<span class="fl">草莓</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shuiguo_xj.jpg" alt=""></div>
											<span class="fl">香蕉</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shuiguo_jz.jpg" alt=""></div>
											<span class="fl">橘子</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>								
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shucai_hc.jpg" alt=""></div>
											<span class="fl">花菜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shucai_qc.png" alt=""></div>
											<span class="fl">芹菜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shucai_qc.jpg" alt=""></div>
											<span class="fl">青菜</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shengxian_zlt.jpg" alt=""></div>
											<span class="fl">猪肋条</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shengxian_jt.jpg" alt=""></div>
											<span class="fl">鸡腿</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/shengxian_xzr.jpg" alt=""></div>
											<span class="fl">鲜猪肉</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</li>
					<li>
						<a href="">数码</a>
						<a href="">电子产品</a>
						<div class="pop">
							<div class="left fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_iphoneX.jpg" alt=""></div>
											<span class="fl">iPhoneX</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_xayx.jpg" alt=""></div>
											<span class="fl">小爱智能音箱</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_oppofindx.jpg" alt=""></div>
											<span class="fl">OPPO FindX</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_mac.jpg" alt=""></div>
											<span class="fl">Mac一体机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_ipad.jpg" alt=""></div>
											<span class="fl">iPad Air</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_hwP20.jpg" alt=""></div>
											<span class="fl">华为P20</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
							<div class="ctn fl">
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_xmM3.jpg" alt=""></div>
											<span class="fl">小米Mix3</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_jnxj.jpg" alt=""></div>
											<span class="fl">佳能相机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_zuiniubidevivonex.jpg" alt=""></div>
											<span class="fl">Vivo Nex</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_snxj.jpg" alt=""></div>
											<span class="fl">索尼相机</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
								<div>
									<div class="xuangou_left fl">
										<a href="">
											<div class="img fl"><img src="mall/image/dzcp_SGS9.jpg" alt=""></div>
											<span class="fl">Samsung Galaxy S9</span>
											<div class="clear"></div>
										</a>
									</div>
									<div class="xuangou_right fr"><a href="">购买</a></div>
									<div class="clear"></div>
								</div>
							</div>
						</div>
					</li>
				</ul>
			</div>
		
		</div>	

		<div class="sub_banner center">
			<div class="sidebar fl">
				<div class="fl"><a href=""><img src="mall/image/tangguo.jpg"></a></div>
				<div class="fl"><a href=""><img src="mall/image/qiaokeli.jpg"></a></div>
				<div class="fl"><a href=""><img src="mall/image/guantou.jpg"></a></div>
				<div class="fl"><a href=""><img src="mall/image/guwuchongyin.jpg"></a></div>
				<div class="fl"><a href=""><img src="mall/image/fengmi.jpg"></a></div>
				<div class="fl"><a href=""><img src="mall/image/kafei.jpg"></a></div>
				<div class="clear"></div>
			</div>
			<div class="datu fl"><a href=""><img src="mall/image/maiermianyi.jpg" alt=""></a></div>
			<div class="datu fl"><a href=""><img src="mall/image/liangjianwuzhe.jpg" alt=""></a></div>
			<div class="datu fr"><a href=""><img src="mall/image/dizhi.jpg" alt=""></a></div>
			<div class="clear"></div>


		</div>
        
		<div class="danpin center">
			
			<div class="biaoti center">今日优惠</div>
			<div class="main center">
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="mall/image/pinpai1.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">波士顿龙虾</a></div>
					<div class="youhui">海鲜水产 熟冻龙虾 熟冻波龙 波龙</div>
					<div class="jiage">88元起</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="mall/image/pinpai2.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">家庭牛排分享装</a></div>
					<div class="youhui">冷冻新鲜牛扒牛排套餐黑椒</div>
					<div class="jiage">168元</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="mall/image/pinpai3.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">张小泉刀具套装</a></div>
					<div class="youhui">不锈钢家用菜刀切片刀水果刀7件套厨房工具</div>
					<div class="jiage">179元</div>
				</div>
				<div class="mingxing fl"> 	
					<div class="sub_mingxing"><a href=""><img src="mall/image/pinpai4.jpg" alt=""></a></div>
					<div class="pinpai"><a href="">九阳 K15-F626 电热水壶</a></div>
					<div class="youhui">304不锈钢家用烧水壶保温</div>
					<div class="jiage">79元</div>
				</div>
				<div class="mingxing fl">
					<div class="sub_mingxing"><a href=""><img src="mall/image/pinpai5.png" alt=""></a></div>
					<div class="pinpai"><a href="">小米笔记本</a></div>
					<div class="youhui">更轻更薄，像杂志一样随身携带</div>
					<div class="jiage">3599元起</div>
				</div>
				<div class="clear"></div>
			</div>
		</div>
		<div class="peijian w">
			<div class="biaoti center">配件</div>
			<div class="main center">
				<div class="content">
					<div class="remen fl"><a href=""><img src="mall/image/peijian1.jpg"></a>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span>新品</span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian3.jpg"></a></div>
						<div class="miaoshu"><a href="">苹果耳机</a></div>
						<div class="jiage">89元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>发货速度很快！很配苹果X！</span>
								<span>来自黎俊均的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian2.jpg"></a></div>
						<div class="miaoshu"><a href="">英特尔 i9-7900X</a></div>
						<div class="jiage">7399元</div>
						<div class="pingjia">372人评价</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:red">享6折</span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian4.jpg"></a></div>
						<div class="miaoshu"><a href="">米兔儿童手表</a></div>
						<div class="jiage">529元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>孩子用着很好</span>
								<span>来自叶苏韵的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian5.jpg"></a></div>
						<div class="miaoshu"><a href="">RTX 2080Ti</a></div>
						<div class="jiage">9499元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>打游戏特别快</span>
								<span>来自朱富强的评价</span>
							</a>
						</div>
					</div>
					<div class="clear"></div>
				</div>
				<div class="content">
					<div class="remen fl"><a href=""><img src="mall/image/peijian6.png"></a>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian6.jpg"></a></div>
						<div class="miaoshu"><a href="">爱国者U盘</a></div>
						<div class="jiage">39元</div>
						<div class="pingjia">372人评价</div>
						<div class="piao">
							<a href="">
								<span>U盘传输速度飞快</span>
								<span>来自应自力的评价</span>
							</a>
						</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian8.jpg"></a></div>
						<div class="miaoshu"><a href="">米家随身风扇</a></div>
						<div class="jiage">19.9元</div>
						<div class="pingjia">372人评价</div>
					</div>
					<div class="remen fl">
						<div class="xinpin"><span style="background:#fff"></span></div>
						<div class="tu"><a href=""><img src="mall/image/peijian9.jpg"></a></div>
						<div class="miaoshu"><a href="">蓝牙音箱</a></div>
						<div class="jiage">259元</div>
						<div class="pingjia">775人评价</div>
					</div>
					<div class="remenlast fr">
						<div class="hongmi"><a href=""><img src="mall/image/hongmin4.png" alt=""></a></div>
						<div class="liulangengduo"><a href=""><img src="mall/image/liulangengduo.png" alt=""></a></div>					
					</div>
					<div class="clear"></div>
				</div>				
			</div>
		</div>
		<footer class="mt20 center">			
			<div class="mt20">零光超市|加盟|合作|天猫旗舰店|门店地址|隐私政策|Select Region</div>
			<div>zlmarket.com</div> 
			<div>制作者电话：12138</div>
		</footer>
  </body>
</html>
