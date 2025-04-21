<%@ page import="java.sql.*" %>
<%@page contentType="text/html"%>
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.text.SimpleDateFormat"%>

<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <script src="https://code.iconify.design/iconify-icon/1.0.7/iconify-icon.min.js"></script>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/mango.css">
    <script src="assets/Javascript/search.js"></script>
    <title>Sundi_商品詳細頁面</title>
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
  </header>
<%
	String email = "";
	Cookie cookies[] = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                email = cookie.getValue();
                break;
            }
        }
    }
    // 取得 productID 參數
    String productIDStr = request.getParameter("productID");
    int productID = 0;
    try {
        productID = Integer.parseInt(productIDStr);
    } catch (NumberFormatException e) {
        response.sendRedirect("product.jsp");
        return;
    }

    // 資料庫連線資訊
    String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
    String user = "root";
    String password = "1234";

    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;

    String productName = "";
    String description2 = "";
    String description3 = "";
    int price = 0;
    int inventory = 0;
    String defaultImgUrl = "";
    String descriptionImgUrl = "";
    String[] thumbnailUrls = new String[3];

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // 查詢商品資料
        String sql = "SELECT * FROM product WHERE productID = ?";
        stmt = conn.prepareStatement(sql);
        stmt.setInt(1, productID);
        rs = stmt.executeQuery();

        if (rs.next()) {
            productName = rs.getString("productName");
            description2 = rs.getString("description2");
            description3 = rs.getString("description3");
            price = rs.getInt("price");
            inventory = rs.getInt("inventory");

            // 查詢商品圖片
            sql = "SELECT img_url FROM product_images WHERE productID = ? ORDER BY image_id";
            stmt = conn.prepareStatement(sql);
            stmt.setInt(1, productID);
            rs = stmt.executeQuery();

            int imageCount = 0;
            while (rs.next()) {
                String imgUrl = rs.getString("img_url");
                if (imageCount == 0) {
                    defaultImgUrl = imgUrl;
                }
                if (imageCount < 3) {
                    thumbnailUrls[imageCount] = imgUrl;
                } else if (imageCount == 3) {
                    descriptionImgUrl = imgUrl;
                    break;  // 我們只需要前四張圖片
                }
                imageCount++;
            }

            // 如果沒有足夠的圖片，用默認圖片填充
            for (int i = imageCount; i < 3; i++) {
                thumbnailUrls[i] = defaultImgUrl;
            }
            if (descriptionImgUrl == null || descriptionImgUrl.isEmpty()) {
                descriptionImgUrl = defaultImgUrl;
            }
        } else {
            response.sendRedirect("product.jsp");
            return;
        }
     
%>

		<main>
            <div class="productPro">
                <div class="productContainer">
                    <div class="thumbnails">
                        <button id="upButton"><iconify-icon icon="icon-park-solid:up-one" style="color: white"></iconify-icon></button>
                        <div id="thumbnailContainer">
                            <%
                            for (int i = 0; i < 3; i++) {
                                if (thumbnailUrls[i] != null) {
                                    out.println("<img src=\"" + thumbnailUrls[i] + "\" alt=\"商品" + (i + 1) + "\" class=\"thumbnail\" onclick=\"changeMainImage(this)\">");
                                }
                            }
                            %>
                        </div>
                        <button id="downButton"><iconify-icon icon="icon-park-solid:down-one" style="color: white"></iconify-icon></button>
                    </div>
                    <div class="main-image">
                        <img id="mainImage" src="<%=defaultImgUrl%>" alt="大圖顯示商品">
                    </div>
				</div>
              
                <div class="productWord">
				<form action="tocart.jsp" method="post">
					<input type='hidden' name='product_id' value='<%=productIDStr%>'>
                    <p class="title"><%=productName%></p>
                    <div class="info">
                        <%=description2%><hr>
                    </div>
                    <div class="detail">
                        <p class="money">NT. <span><%=price%></span></p>
                        <p class="stock">庫存數量：<span><%=inventory%></span></p>
                    </div>
                    <div class="add">
                        <div class="up">
                            <button id="minus"><iconify-icon icon="icon-park:minus"></iconify-icon></button>
                            <input id="iquantity" type="text" name="orderQ" value="1"/>
                            <button id="plus"><iconify-icon icon="icon-park:plus"></iconify-icon></button>
                        </div>
                        <div class="down">
							<button type="submit" class="add"><iconify-icon icon="mdi-light:cart"></iconify-icon>&nbsp;加入購物車</button>  
							<button type="" class="fav"><iconify-icon icon="ph:hand-heart"></iconify-icon>&nbsp;加入追蹤清單</button>   
						</div>
					</form>
					</div>
				</div>
			</div>
            
			<div class="productDescription">
				<ul class="tabChange"></ul>
                <div id="product-description-content" class="tab-content active">
                    <p class="describeTitle"><%=productName%></p><hr class="colorful">
                    <p class="midDescribe"><%=description2%></p>
                    <p class="lastDescribe"><%=description3%></p>
                    <img src="<%=descriptionImgUrl%>" alt="底部大圖" class="describeImg">
					<div id="product-reviews-content" class="tab-content">
					
						<div class="CommentBox">
						<p class="describeTitle">評論紀錄</p><hr class="colorful">
						
						<div class="showComment">
                            <div><img src="assets/img/member.png" alt="memberImg" class="CommentHead"></div>
                            <div class="words">
                                <p class="one">太有料了</p>
                                <p class="two">吃得出來是很好的品質！</p>
                                <p class="three">1998-02-23</p>
                            </div>
                            <div class="star">
                                <p class="four">評價5星</p>
                                <div class="staralign">
                                    <p class="five">對您有幫助嗎?</p>
                                    <p class="check">✔</p>
                                    <p class="cross">X</p>
                                </div>
                            </div>
                        </div>
						
<%


	
	String title = "";
	String content = "";
	String time = "";
	String rating = "";
	
	
	try{
		Class.forName("com.mysql.jdbc.Driver");
        conn = DriverManager.getConnection(url, user, password);

        // 查詢商品資料
        String sql1 = "SELECT * FROM product_reviews WHERE product_id = ?";
        stmt = conn.prepareStatement(sql1);
        stmt.setInt(1, productID);
        rs = stmt.executeQuery();

        while (rs.next()) {
            title = rs.getString("title");
            content = rs.getString("content");
            time = rs.getDate("review_date").toString();
            rating = rs.getString("rating");
            
			out.print("<div class='showComment'>");
			out.print("<div><img src='assets/img/member.png' alt='memberImg' class='CommentHead'></div>");
			out.print("<div class='words'>");
			out.print("<p class='one'>"+title+"</p>");
			out.print("<p class='two'>"+content+"</p>");
			out.print("<p class='three'>"+time+"</p>");
			out.print("</div>");
			out.print("<div class='star'>");
			out.print("<p class='four'>評價"+rating+"星</p>");
			out.print("<div class='staralign'>");
			out.print("<p class='five'>對您有幫助嗎?</p>");
			out.print("<p class='check'>✔</p>");
			out.print("<p class='cross'>X</p>");
			out.print("</div>");
			out.print("</div>");
			out.print("</div>");
		
		}
		
	} catch (ClassNotFoundException | SQLException e) {
        e.printStackTrace();
    } 
	
	}finally {
        try {
            if (rs != null) rs.close();
            if (stmt != null) stmt.close();
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
	
						
%>
						</div>
					
					
                    <div class="WriteBox">
                        <p class="describeTitle">我要評論</p><hr class="colorful">
                        <div class="WriteComment">
                            <form action="review.jsp" method="post">
								<input type = "hidden" name="email" value="<%=email%>" >
								<input type = "hidden" name="product_id" value="<%=productID%>" >
                                <input id="title" type="text" name="title" placeholder="給它個標題吧！"><br>
                                <p>寫下你的想法：</p><textarea id="content" name="content" placeholder=""></textarea>
                                <div class="starPoint" name="starPoint">
                                    <input type="radio" name="rating" value="5" id="star1"><label for="star1"></label>
                                    <input type="radio" name="rating" value="4" id="star2"><label for="star2"></label>
                                    <input type="radio" name="rating" value="3" id="star3"><label for="star3"></label>
                                    <input type="radio" name="rating" value="2" id="star4"><label for="star4"></label>
                                    <input type="radio" name="rating" value="1" id="star5"><label for="star5"></label>
                                </div>
                                <button type="submit">送出</button>
                            </form>
                        </div>
                    </div>
                </div>

					<div class="more">
						<p class="describeTitle">推薦產品</p><hr class="colorful">
						<div class="moreImg">
							<div class="moreImgCon">
								<a href="products.jsp?productID=2"><img src="assets/img/lychee4.jpg" alt="pro1" class="image-front"></a>
								<a href="products.jsp?productID=2"><img src="assets/img/lychee.jpg" alt="pro1-back" class="image-back"></a>
								<p class="name">手工荔枝果醬</p>
								<p class="price">NT. 250</p>
							</div>
							<div class="moreImgCon">
								<a href="products.jsp?productID=15"><img src="assets/img/nutbox1.jpg" alt="pro2" class="image-front"></a>
								<a href="products.jsp?productID=15"><img src="assets/img/nutbox2.jpg" alt="pro1-back" class="image-back"></a>
								<p class="name">綜合堅果禮盒</p>
								<p class="price">NT. 480</p>
							</div>
							<div class="moreImgCon">
								<a href="products.jsp?productID=4"><img src="assets/img/choco4.jpg" alt="pro3" class="image-front"></a>
								<a href="products.jsp?productID=4"><img src="assets/img/choco.jpg" alt="pro1-back" class="image-back"></a>
								<p class="name">香濃巧克力抹醬</p>
								<p class="price">NT. 200</p>
							</div>
							<div class="moreImgCon">
								<a href="products.jsp?productID=13"><img src="assets/img/jambox3.jpg" alt="pro4" class="image-front"></a>
								<a href="products.jsp?productID=13"><img src="assets/img/jambox2.jpg" alt="pro1-back" class="image-back"></a>
								<p class="name">豐作雙果茶醬禮盒</p>
								<p class="price">NT. 760</p>
							</div>
						</div>
					</div>
				</div>
			</div>			 
        </div>
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
    <script src="../assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>
    <script src="../assets/Javascript/mango.js"></script>


</body>
</html> 