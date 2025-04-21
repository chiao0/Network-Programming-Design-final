<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.text.SimpleDateFormat" %>

<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/cart.css">
	<script src="assets/Javascript/search.js"></script>
    <title>Member</title>
</head>
<body>
<%
	String email = "";
	String img_url = "";
	String productName = "";
	String orderQ = "";
	String tm = "";
	String username = "";
    String telephone = "";
    String address = "";
	String cartid = "";
	String totalPrice = "";
	
	Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
	
    // 從 cookies 中獲取 email
    Cookie cookies[] = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                email = cookie.getValue();
                break;
            }
        }
    }

    // 如果 email 不存在，重新定向到登錄頁面
    if (email.isEmpty()) {
        %>
        <script>
        alert("尚未登入！");
        window.location.href = "index.jsp";
        </script>
        <%
    } else {
        request.setAttribute("email", email);

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
                    <form action="#" id="signupForm" onsubmit="signupForm(event)">
                        <div class="makemember">
                            <h1>建立帳戶</h1>
                            <input type="text" id="username" placeholder="姓名"/>
                            <input type="date" id="birthday" placeholder="生日"/>
                            <input type="text" id="phone" placeholder="電話"/>
                            <input type="email" id="email" placeholder="Email" required/>
                            <input type="password" id="password" placeholder="密碼" required/>
                            <input type="password" id="comfirm_password" placeholder="確認密碼" required/>
                        </div>
                        <button type="submit">註冊</button>
                    </form>
                </div>
                <div class="formCon signIn">
                    <form  action="#" id="loginForm" onsubmit="loginForm(event)">
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
                            <input type="email" id="loginemail" placeholder="Email" required/>
                            <input type="password" id="loginpassword" placeholder="密碼" required/>
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

    <main>
        <section class="all">
            <div class="cartleft">
                <div class="cartTitle">
                    <img src="assets/img/shopping-cart.png" alt="購物車">
                    <p>購物車</p>
                </div>
                <div class="productContainer">
<%
					
					try {
						Class.forName("com.mysql.cj.jdbc.Driver");
						String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
						con = DriverManager.getConnection(url, "root", "1234");

						String sql = "SELECT * FROM cart_view WHERE `email`=?";
						pstmt = con.prepareStatement(sql);
						pstmt.setString(1, email);
						rs = pstmt.executeQuery();

						while (rs.next()) 
						{
							cartid = rs.getString("cartID");
							img_url = rs.getString("img_url");
							productName = rs.getString("productName");
							orderQ = rs.getString("orderQ");
							tm = rs.getString("tm");
							
							
							out.print("<form action='Delcart.jsp' method='post' id='Delform'>");
							out.print("<input type='hidden' value='"+cartid+"' name='cartid'>");
							out.print("<div class='pro'>");
							out.print("<img  class='itemImg' src="+img_url+" alt='sb'>");
							out.print("<div class='itemInfo'>");
							out.print("<div class='up'>");
							out.print("<p class='proName'>"+productName+"</p>");
							out.print("<img src='assets/img/x-mark.png' alt='刪除' class='deleteButton'>");
							out.print("</div>");
							out.print("<div class='down'>");
							out.print("<div class='counter'>");
							out.print("<span class='proNum'>數量</span>");
							out.print("<select class='quantitySelect'>");
							out.print("<option>"+orderQ+"</option>");
							out.print("</select>");
							out.print("</div>");
							out.print("<div class='money'>");
							out.print("<span class='word'>小計</span>");
							out.print("<span class='num'>NT. "+tm+"</span>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("</div>");
							out.print("</form>");
							
						}
						
						String sql1 = "SELECT * FROM `member` WHERE `email`=?";
						pstmt = con.prepareStatement(sql1);
						pstmt.setString(1, email);
						rs = pstmt.executeQuery();

						if (rs.next()) {
							username = rs.getString("username");
							telephone = rs.getString("telephone");
							address = rs.getString("address");
						}
						
						String sql2 = "SELECT tm FROM cart_view WHERE `email`=?";
						pstmt = con.prepareStatement(sql2);
						pstmt.setString(1, email);
						rs = pstmt.executeQuery();
						int total = 0;
						
						while (rs.next()) {
							int getP = rs.getInt("tm");
							total = total + getP;
						} 
						
						totalPrice = String.valueOf(total);
						
						
						
					} catch (SQLException e) {
						out.println("資料庫錯誤: " + e.getMessage());
					} catch (ClassNotFoundException e) {
						out.println("錯誤: " + e.getMessage());
					} finally {
						try {
							if (rs != null) rs.close();
							if (pstmt != null) pstmt.close();
							if (con != null) con.close();
						} catch (SQLException e) {
							out.println("關閉資源時出錯: " + e.getMessage());
						}
					}
				}
				
				
					
						
%>
                </div>
            </div>
            <div class="cartright">
                <form action="inorder.jsp" method="post" id="checkoutForm" >
					<div class="step">
						<span>STEP</span>
						<div id="stepNumber" class="num">1</div>
						<span>/ 3</span>
					</div>
					<div class="checkInfo">
						<span class="InfoTitle">會員資訊</span>
						<p>收件人姓名：
							<input type="text" value="<%=username%>" name="username">
						</p>
						<p>電話：
							<input type="text" value="<%=telephone%>" name="telephone">
						</p>
						<p>地址：
							<input type="text" value="<%=address%>" name="address">
						</p>
				
						<div class="ship">
							<span class="InfoTitle">取貨方式</span>
							<div class="mutilchoice">
								<div class="choice">
									<input type="radio" name="ship" id="ship1" value="7-11超商取貨" checked>
									<label for="ship1">7-11超商取貨</label>
								</div>
								<div class="choice">
									<input type="radio" name="ship" id="ship2" value="全家超商取貨">
									<label for="ship2">全家超商取貨</label>
								</div>
								<div class="choice">
									<input type="radio" name="ship" id="ship3" value="宅配到府">
									<label for="ship3">宅配到府</label>
								</div>
							</div>
						</div>
					</div>
					<div class="checkPay">
						<span class="Title">付款方式</span>
						<div class="choFir">
							<div class="cho">
								<input type="radio" name="pay" id="pay1" value="信用卡線上刷卡" checked>
								<label for="pay1">信用卡線上刷卡</label>
							</div>
						</div>
						<div class="cho">
							<input type="radio" name="pay" id="pay2" value="貨到付款（超商）">
							<label for="pay2">貨到付款（超商）</label>
						</div>
						<div class="cho">
							<input type="radio" name="pay" id="pay3" value="貨到付款（宅配）">
							<label for="pay3">貨到付款（宅配）</label>
						</div>
						<div class="cho">
							<input type="radio" name="pay" id="pay4" value="超商代碼繳費">
							<label for="pay4">超商代碼繳費</label>
						</div>
						<div class="choLas">
							<div class="cho">
								<input type="radio" name="pay" id="pay5" value="銀聯卡">
								<label for="pay5">銀聯卡</label>
							</div>
						</div>
						<span class="Title">優惠券代碼</span>
						<div class="choFL">
							<div class="cho">
								<input type="radio" name="coupon" id="coupon">
								<label for="coupon"><input type="text" class="coupon" value="請輸入優惠券代碼" onfocus="clearPlaceholder(this)"></label>
							</div>
						</div>
					</div>
					<div class="checkAll">
						<div class="checkUp">
							<span class="Title">確認結帳資訊</span>
							<span class="TotalPrice">NT. <%=totalPrice%></span>
							<input type="hidden" value="<%=totalPrice%>" name="totalPrice">
						</div>
						<ul class="area">
							<li class="subtitle">收件人資料</li>
							<ul class="subArea">
								<li>姓名：<%=username%></li>
								<li>電話：<%=telephone%></li>
								<li>地址：<%=address%></li>
							</ul>
						</ul>
						<ul class="area">
							<li class="subtitle">取貨方式</li>
							<ul class="subArea">
								<li id="shippingDisplay"></li>
							</ul>
						</ul>
						<ul class="area">
							<li class="subtitle">付款方式</li>
							<ul class="subArea">
								<li id="paymentDisplay"></li>
							</ul>
						</ul>
					</div>
					<div class="buttonContainer">
						<button id="prevButton" type="button">上一步</button>
						<button id="nextButton" type="button"  data-url="inorder.jsp" onclick="updateDisplay()">下一步</button>
					</div>
				</form>
            </div>
        </section>
    </main>
    
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
    <script src="assets/Javascript/cart.js"></script>
    <script src="assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>
</body>
</html>