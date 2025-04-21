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
    <link rel="stylesheet" href="assets/css/member.css">
    <link rel="stylesheet" href="assets/css/login.css">
	<script src="assets/Javascript/search.js"></script>
    <title>Member</title>
</head>
<body>
<%
    String username = "";
    String birthday = "";
    String telephone = "";
    String address = "";
    String email = "";
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

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
            con = DriverManager.getConnection(url, "root", "1234");

            String sql = "SELECT * FROM `member` WHERE `email`=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                username = rs.getString("username");
                birthday = rs.getDate("birthday").toString();
                telephone = rs.getString("telephone");
                address = rs.getString("address");
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
    </header>

    <main>
        
        <section class="all">
            <input id="1" type="radio" name="choice" checked="checked" class="noIn"/>
            <label for="1"><img src="assets/img/member.png" alt="member" class="bear"></label>
            <div class="memContent">
                <div class="all">
                    <div class="profilePic">
                        <canvas id="canvas">
                            <img src="assets/img/sundi4.png" id="imageId" style="display: none;">
                        </canvas>
                        <script src="assets/Javascript/pic.js"></script>
                    </div>
                    <div class="profile" id="profile">
                        <div class="words">
                            <p>姓名：&nbsp; <span id="name"><%=username%></span></p>
                            <p>生日：&nbsp; <span id="birth"><%=birthday%></span></p>
                            <p>電話：&nbsp; <span id="phone"><%=telephone%></span></p>
                            <p>地址：&nbsp; <span id="address"><%=address%></span></p>
                            <p>Email：&nbsp; <span id="email"><%=email%></span></p>
                            <button onclick="toggleEditMode()">修改資料</button>
                        </div>
                    </div>
                    <form class="editForm"  id="editForm" action="Changemember.jsp" method="post">
                        <div>
                            <p>姓名：&nbsp;&nbsp;<input type="text" id="editName" class="editIn" name="chusername" ></p>
                            <p>生日：&nbsp;&nbsp;<input type="date" id="editBirth" class="editIn" name="chbirthday" ></p>
                            <p>電話：&nbsp;&nbsp;<input type="text" id="editPhone" class="editIn" name="chtelephone" ></p>
                            <p>地址：&nbsp;&nbsp;<input type="text" id="editAddress" class="editIn" name="chaddress" ></p>
                            <p>Email：&nbsp;&nbsp;<input type="email" id="editEmail" class="editIn" name="chemail" ></p>
                            <button  type="submit" >儲存修改</button>
                        </div>
                    </form>
                </div>
            </div>
            <script src="assets/Javascript/member.js"></script>
            
            <input id="2" type="radio" name="choice" class="noIn"/>
            <label for="2"><img src="assets/img/shopbag.png" alt="buy" class="bear"></label>
            <div class="memContent">
                <div class="buyBox">
                    <table class="buytable">
                        <tr>
                            <th>購買日期</th>
                            <th>產品名稱</th>
                            <th>購買數量</th>
                            <th>小計</th>
                        </tr>
				<%
						String sql1 = "SELECT * FROM `orders_detail` WHERE `email`=?";
						pstmt = con.prepareStatement(sql1);
						pstmt.setString(1, email);
						rs = pstmt.executeQuery();
						
						String productName = "";
						String orderQ = "";
						String orderD = "";
						String tm = "";

						while (rs.next()) {
							productName = rs.getString("productName");
							orderQ = rs.getString("orderQ");
							orderD = rs.getDate("order_date").toString();
							tm = rs.getString("tm");
							
							out.print("<tr>");
							out.print("<td>"+orderD+"</td>	");
							out.print("<td>"+productName+"</td>");
							out.print("<td>"+orderQ+"</td>");
							out.print("<td>NT. "+tm+"</td>");
							out.print("</tr>");
							
						}	
							
						rs.close();
						pstmt.close();
				
							
							
						%>					
                    </table>
                </div>
            </div>
			<input id="3" type="radio" name="choice" class="noIn"/>
            <label for="3"><img src="assets/img/comment.png" alt="comment" class="bear"></label>
            <div class="memContent">
                <div class="ccBox">
                    <div class="commentBox">
			
			
				<%
						String sql6 = "SELECT * FROM `product_reviews_view` WHERE `email`=?";
						pstmt = con.prepareStatement(sql6);
						pstmt.setString(1, email);
						rs = pstmt.executeQuery();
						
						String productname = "";
						String content = "";
						String rating = "";
						String review_Date = "";
						
						while(rs.next()){
							productname = rs.getString("productName");
							content = rs.getString("content");
							rating = rs.getString("rating");
							review_Date = rs.getDate("review_date").toString();
							%>
							
							<div class="box">
                            <div class="comment">
                                <div class="words">
                                    <p class="one"><%=productname%></p>
                                    <p class="two"><%=content%></p>
                                    <p class="three"><%=review_Date%></p>
                                </div>
                                <div class="star">
                                    <p class="four">評價<%=rating%>星</p>
                                    <p class="point"></p>
                                </div>
                            </div>
                        </div>
						<%
						}
			
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
%>				</div>
                    <div class="contactBox">
                        <a class="contactmes" href="javascript:void(0);" onclick="openForm()">
                            <div class="mes">
                                <p>有任何建議？</p>
                                <p>
                                    歡迎留言，感謝您的指教
                                </p>
                            </div>
                        </a>
                        <!-- 隱藏 -->
                        <div id="hiddenForm" style="display:none;">
                            <form class="mesForm">
                                <textarea class="mesarea" name="content" rows="10" placeholder="我認為……"></textarea><br>
                                <input class="mesIn" type="submit" value="送出" />
                            </form>
                            <div class="mesWord">
                                ※客服時間：Mon.-Fri 09:00-18:00(中午休息時間12:00-13:00)
                            </div>
                        </div>
                    </div>
                </div>
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
    <script src="assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>
</body>
</html>