<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>搜尋結果</title>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/product.css">
	<script src="assets/Javascript/search.js"></script>
</head>
<body>
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
                  <form action="checkRegister.jsp" method="post">
                        <div class="makemember">
                            <h1>建立帳戶</h1>
                            <input type="text" placeholder="姓名" name="username" />
                            <input type="date" placeholder="生日" name="birthday" />
                            <input type="text" placeholder="電話" name="telephone" />
                            <input type="email" placeholder="Email" name="email" required/>
                            <input type="password" placeholder="密碼" name="password" required/>
                        </div>
                        <button type="submit">註冊</button>
                    </form>
              </div>
              <div class="formCon signIn">
                  <form action="checkLogin.jsp" method="post">
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
                            <input type="email" placeholder="Email" name="email" required/>
                            <input type="password" placeholder="密碼" name="password" required/>
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
<%
    String keyword = request.getParameter("keyword");
    if(keyword != null && !keyword.isEmpty()) {
        Connection con = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;
        ResultSet imgRs = null;
		boolean hasResults = false; // 追踪是否有結果
        try {
            String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
            con = DriverManager.getConnection(url, "root", "1234");
            String sql = "SELECT * FROM product WHERE productName LIKE ?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, "%" + keyword + "%");
            rs = pstmt.executeQuery();
            
            String imgSql = "SELECT img_url FROM product_images WHERE productID = ?";
            PreparedStatement imgPstmt = con.prepareStatement(imgSql);
%>
            <div id="searchResults" class="tabcontent" style="display:block;">
                <h2 align='center'>搜尋結果</h2>
                <div style="display: flex; flex-direction: column;">
                    <div class="pro_flex">
<%
                        while (rs.next()) {
							hasResults = true;
                            int productId = rs.getInt("productID");
                            imgPstmt.setInt(1, productId);
                            imgRs = imgPstmt.executeQuery();
                            if (imgRs.next()) {
%>
                            <a href="products.jsp?productID=<%= productId %>" class="pro_boxout">
                                <div class="pro_box">
                                    <div class="pro_boxin">
                                        <img src="<%= imgRs.getString("img_url") %>" alt="<%= rs.getString("productName") %>" class="pro_img">
                                        <div>
                                            <div class="pro"><%= rs.getString("productName") %></div>
                                            <div class="price">NT. <%= rs.getInt("price") %></div>
                                        </div>
                                    </div>
                                </div>
                            </a>
<%
                            }
                            imgRs.close();
                        }
                        if (!hasResults) { // 如果沒有結果
%>
                            <h3 align='center'>查無此商品</h3>
<%
                        }
%>
                    </div>
                </div>
            </div>
<%
            imgPstmt.close();
        } catch (SQLException e) {
            out.println("資料庫錯誤：" + e);
        } finally {
            try {
                if (rs != null) rs.close();
                if (pstmt != null) pstmt.close();
                if (con != null) con.close();
            } catch (SQLException e) {
                out.println("資料庫連接關閉錯誤：" + e);
            }
        }
    } else {
%>		
		<h2 align='center'>請輸入搜尋關鍵字</h2>
        
<%
    }
%>

<footer>
        <div class="footer">
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
        <div style="text-align: center; padding-bottom: 10px; margin: 0;">
            <span class="title">Copyright © 2024 Sundi</span>
        </div>
    </footer>
    <div class="goUp" id="goUp">
        <a href="#" class="gotop"><img src="assets/img/arrow-up.png" class="top"></a>
    </div>
    <script src="assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>
</body>
</html>