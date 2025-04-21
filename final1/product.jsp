<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>


<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>商品陳列</title>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/product.css">
    <script src="assets/Javascript/product.js"></script>
	<script src="assets/Javascript/search.js"></script>
</head>
<script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
<body>
<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
        conn = DriverManager.getConnection(url, "root", "1234");
        
        String query = "SELECT p.productID, p.productName, p.price, pi.img_url FROM product p JOIN product_images pi ON p.productID = pi.productID WHERE p.category = ? AND pi.image_id = (SELECT MIN(image_id) FROM product_images WHERE productID = p.productID)";
        pstmt = conn.prepareStatement(query);
    } catch (ClassNotFoundException e) {
        out.println("找不到 JDBC 驅動程序: " + e.getMessage());
    } catch (SQLException e) {
        out.println("資料庫錯誤: " + e.getMessage());
    }
%>
    <header>
      <nav>
          <div class="flex">
              <div class="down flex1">
                  <ul>
                      <li>
                          <a href="product.jsp">商品瀏覽</a>
                      </li>
                  </ul>
              </div>
              <div class="down flex1">
                  <ul>
                      <li>
                          <a href="cart.jsp">購物車</a>
                      </li>
                  </ul>
              </div>
              <div class="flex1">
                  <a href="index.jsp" class="logoA">
                      <div class="logoBox">
                          <div class="logo1">
                              <img src="assets/img/logo.png" class="logo">
                          </div>
                          <div class="logo2">
                              <img src="assets/img/logo2.png" class="logo">
                          </div>
                      </div>
                  </a>
              </div>
              <div class="down flex1">
                  <ul>
                      <li class="down">
                          <a href="member.jsp">會員資訊</a>
                      </li>
                  </ul>
              </div>
              <div class="down flex1">
                  <ul>
                      <li class="down">
                          <li class="loginLi" onclick="document.getElementById('login').style.display='block'">登入/註冊</li>
                      </li>
                  </ul>
              </div>
              <form id="searchForm" action="search.jsp" method="post">
				  <div class="search">
					<label>
					  <input type="text" name="keyword" required onkeypress="return handleEnter(event)">
					  <span class="line"></span>
					</label>
				  </div>
			   </form>
          </div>
      </nav>
      
      <div id="login" class="login">
          <div class="container" id="container">
              <div class="formCon signUp">
                  <form action="checkRegister.jsp" method="post" id="signupForm" onsubmit="signupForm(event)">
                      <div class="makemember">
                          <h1>建立帳戶</h1>
                          <input type="text" id="username" placeholder="姓名" name="username"/>
                          <input type="date" id="birthday" placeholder="生日" name="birthday"/>
                          <input type="text" id="phone" placeholder="電話" name="phone"/>
                          <input type="email" id="email" placeholder="Email" name="email" required/>
                          <input type="password" id="password" placeholder="密碼" name="password" required/>
                          <input type="password" id="comfirm_password" placeholder="確認密碼" required/>
                      </div>
                      <button type="submit">註冊</button>
                  </form>
              </div>
              <div class="formCon signIn">
                  <form  action="checkLogin.jsp" method="post" id="loginForm" onsubmit="loginForm(event)">
                      <h1>登入</h1>
                      <div class="loginword">
                          <div class="logintxt1"><p>H</p></div>
                          <div class="logintxt1"><p>e</p></div>
                          <div class="logintxt1"><p>l</p></div>
                          <div class="logintxt1"><p>l</p></div>
                          <div class="logintxt1"><p>o &nbsp </p></div>
                          <div class="logintxt1"><p>W</p></div>
                          <div class="logintxt1"><p>o</p></div>
                          <div class="logintxt1"><p>r</p></div>
                          <div class="logintxt1"><p>l</p></div>
                          <div class="logintxt1"><p>d</p></div>
                      </div>    
                          <h3>welcome back</h3>

                      <div class="makemember">
                          <input type="email" id="loginemail" placeholder="Email" name="loginemail" required/>
                          <input type="password" id="loginpassword" placeholder="密碼" name="loginpassword" required/>
                      </div>
                      <button type="submit">登入</button>
                  </form>
              </div>
              <div class="coverCon">
                  <div class="cover">
                      <div class="coverpage coverIn">
                          <img  data-anijs="if: mouseover, do: tada animated" src="assets/img/loginJam.png" id="signIn" class="inpic">
                      </div>
                      <div class="coverpage coverUp">
                          <img  data-anijs="if: mouseover, do: tada animated" src="assets/img/loginJam.png" id="signUp" class="uppic">
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <script src="assets/Javascript/login.js"></script>
	  <div>
            <img src="assets/img/ad.png" alt="apple" style="height: 450px; width: 100%;"></img>
        </div>
  </header>
    
	
	
    <main class="card">
    <aside class="left_pro">
        <div style="color: #000000; text-align: center; font-weight: bold; padding:30px 0px 20px 0px; border-bottom: 3px solid black;">
            商品分類
        </div>
        <div class="tab">
            <div class="box">
                <button class="tablinks" onclick="openTab(event, 'tab1')">果醬</button>
            </div>
            <div class="box">
                <button class="tablinks" onclick="openTab(event, 'tab2')">果乾</button>
            </div>
            <div class="box">
                <button class="tablinks" onclick="openTab(event, 'tab3')">禮盒</button>
            </div>
        </div>
    </aside>
    <article class="right_pro">
    <div id="tab1" class="tabcontent">
		<h2>果醬系列</h2>
		<div style="display: flex; flex-direction: column;">
				<%
					pstmt.setString(1, "果醬");
					rs = pstmt.executeQuery();
					int countJam = 0;
					while (rs.next()) {
						if (countJam % 3 == 0) {
							if (countJam > 0) out.println("</div>");
							out.println("<div class=\"pro_flex\">");
						}
				%>
				<a href="products.jsp?productID=<%= rs.getInt("productID") %>" class="pro_boxout">
							<div class="pro_box">
								<div class="pro_boxin">
									<img src="<%= rs.getString("img_url") %>" alt="product" class="pro_img">
									<div class="info">
										<div class="pro"><%= rs.getString("productName") %></div>
										<div class="price">NT. <%= rs.getInt("price") %></div>
										<div class="stars hidden">
											<div class="star">★★★★☆</div>
										</div>
									</div>
								</div>
							</div>
				</a>
				<%
					countJam++;
					}
					if (countJam > 0) {
						if (countJam % 3 != 0) out.println("</div>");
					} else {
						out.println("<p>暫無商品</p>");
					}
				%>
				</div>
		</div>
	</div>
    
	




    <div id="tab2" class="tabcontent">
		<h2>果乾系列</h2>
		<div style="display: flex; flex-direction: column;">
				<%
					pstmt.setString(1, "果乾");
					rs = pstmt.executeQuery();
					int countDry = 0;
					while (rs.next()) {
						if (countDry % 3 == 0) {
							if (countDry > 0) out.println("</div>");
							out.println("<div class=\"pro_flex\">");
						}
				%>
				<a href="products.jsp?productID=<%= rs.getInt("productID") %>" class="pro_boxout">
							<div class="pro_box">
								<div class="pro_boxin">
									<img src="<%= rs.getString("img_url") %>" alt="product" class="pro_img">
									<div class="info">
										<div class="pro"><%= rs.getString("productName") %></div>
										<div class="price">NT. <%= rs.getInt("price") %></div>
										<div class="stars hidden">
											<div class="star">★★★★☆</div>
										</div>
									</div>
								</div>
							</div>
				</a>
				<%
					countDry++;
					}
					if (countDry > 0) {
						if (countDry % 3 != 0) out.println("</div>");
					} else {
						out.println("<p>暫無商品</p>");
					}
				%>
				</div>
		</div>
	</div>
    
	
	

    <div id="tab3" class="tabcontent">
		<h2>禮盒系列</h2>
		<div style="display: flex; flex-direction: column;">
				<%
					pstmt.setString(1, "禮盒");
					rs = pstmt.executeQuery();
					int countGift = 0;
					while (rs.next()) {
						if (countGift % 3 == 0) {
							if (countGift > 0) out.println("</div>");
							out.println("<div class=\"pro_flex\">");
						}
				%>
				<a href="products.jsp?productID=<%= rs.getInt("productID") %>" class="pro_boxout">
							<div class="pro_box">
								<div class="pro_boxin">
									<img src="<%= rs.getString("img_url") %>" alt="product" class="pro_img">
									<div class="info">
										<div class="pro"><%= rs.getString("productName") %></div>
										<div class="price">NT. <%= rs.getInt("price") %></div>
										<div class="stars hidden">
											<div class="star">★★★★☆</div>
										</div>
									</div>
								</div>
							</div>
				</a>
				<%
					countGift++;
					}
					if (countGift > 0) {
						if (countGift % 3 != 0) out.println("</div>");
					} else {
						out.println("<p>暫無商品</p>");
					}
				%>
				</div>
		</div>
	</div>
    
</article>
</main>

    <div class="clearfix"></div>
    <footer>
    <div class="footer">
        <div class="map">
          <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14469.068146818874!2d121.2435522!3d24.9570277!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346822143c046009%3A0x63e3ef21e3beebac!2z6LOH6KiK566h55CG5a2457O7!5e0!3m2!1szh-TW!2stw!4v1703420605009!5m2!1szh-TW!2stw" width="300" height="150" style="margin-top: 15px; border: 0; border-radius: 10px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
        </div>
        <div class="left">
            <p><span class="title">聯絡資訊</span></p>
            <p><span class="content">信箱：<a href="mailto:sundi224@gmail.com" style="color: white;">sundi224@gmail.com</a></span></p>
            <p><span class="title">營業時間</span></p>
            <p><span class="content">Mon.-Fri. 09:00 ~ 12:00 / 13:00 ~ 18:00</span></p>
        </div>
        <div class="right">
          <ul class="rr">
              <li><a href="we.jsp">關於我們</a></li>
              <li><a href="merchantlogin.jsp">賣家中心</a></li>
          </ul>
          <ul class="rl">
              <li><a href="service.jsp">服務條款</a></li>
              <li><a href="know.jsp">購買須知</a></li>
          </ul>
        </div>
    </div>
    <div style="text-align: center; padding: 10px 0; margin: 0;">
        <span class="title">Copyright © 2024 Sundi</span>
    </div>
	</footer>
    <div class="goUp" id="goUp">
        <a href="#" class="gotop"><img src="assets/img/arrow-up.png" class="top"></a>
    </div>
    <script src="assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>
	<%
    if (rs != null) try { rs.close(); } catch (SQLException e) {}
    if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
    if (conn != null) try { conn.close(); } catch (SQLException e) {}
    %>
	
</body>
</html>
