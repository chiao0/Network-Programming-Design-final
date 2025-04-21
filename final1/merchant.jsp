<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Merchant</title>
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/merchant.css">
    <script src="assets/Javascript/merchant.js"></script>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
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
                    <form action="#">
                        <div class="makemember">
                            <h1>建立帳戶</h1>
                            <input type="text" placeholder="姓名" />
                            <input type="date" placeholder="生日" />
                            <input type="text" placeholder="電話" />
                            <input type="email" placeholder="Email" required/>
                            <input type="password" placeholder="密碼" required/>
                        </div>
                        <button>註冊</button>
                    </form>
                </div>
                <div class="formCon signIn">
                    <form action="#">
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
                            <input type="email" placeholder="Email" required/>
                            <input type="password" placeholder="密碼" required/>
                        </div>
                        <button>登入</button>
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
            <label for="1">商品</label>
            <div class="merContent">
                <%
                String[] categories = {"果醬", "果乾", "禮盒"};
                Connection conn = null;
                try {
                    Class.forName("com.mysql.jdbc.Driver");
                    conn = getConnection();
                    for (String category : categories) {
                %>
                <div class="goods1">
                    <h2><%= category %></h2>
                    <table class="goods_history">
                        <tr>
                            <th>商品</th>
                            <th>單價</th>
                            <th>總數</th>
                            <th>修改</th>
                        </tr>
                        
						<%
						String sql = "SELECT p.*, ANY_VALUE(pi.img_url) as img_url " +
									"FROM product p " +
									"LEFT JOIN product_images pi ON p.productID = pi.productID " +
									"WHERE category = ? " +
									"GROUP BY p.productID, p.productName, p.price, p.inventory";
						try (PreparedStatement stmt = conn.prepareStatement(sql)) {
							stmt.setString(1, category);
							ResultSet rs = stmt.executeQuery();
							while (rs.next()) {
						%>
                        <tr>	
                            <td>
                                <div class="goods_and_img">
                                    <img src="<%= rs.getString("img_url") %>" alt="<%= rs.getString("productName") %>" class="goods_img">
                                    <%= rs.getString("productName") %>
                                </div>
                            </td>
                            <td>NT. <%= rs.getInt("price") %></td>
                            <td><%= rs.getInt("inventory") %></td>
                            <td>
                                <form action="updatestock.jsp" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="add">
                                    <input type="hidden" name="productID" value="<%= rs.getInt("productID") %>">
									<input type="number" name="quantity" value="1" min="1" style="width: 50px;">
                                    <input type="submit" value="新增" class="button addButton">
                                </form><br>
                                <!--&nbsp;-->
								<form action="updatestock.jsp" method="post" style="display:inline;">
									<input type="hidden" name="action" value="remove">
									<input type="hidden" name="productID" value="<%= rs.getInt("productID") %>">
									<input type="number" name="quantity" value="1" min="1" style="width: 50px;">
									<input type="submit" value="減少" class="button removeButton">
								</form><br>
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
								
								<input type="button" value="刪除" name="revise" class="button deleteButton">
                                
                            </td>
                        </tr>
                        <%  } %>
                        <tr>
                            <td colspan="4" style="text-align: right;">
                                <input type="button" value="+" name="revise" class="add" onclick="showAddForm(this, '<%= category %>')">
                            </td>
                        </tr>
                    </table>
                    <div class="addForm" style="display:none;">
                        <h3>新增<%= category %>商品</h3>
                        <form action="addProduct.jsp" method="post">
                            <input type="hidden" name="category" value="<%= category %>">
                            <input type="text" name="imgUrl" placeholder="商品圖片URL" required>
                            <input type="text" name="productName" placeholder="商品名稱" required>
                            <input type="text" name="description1" placeholder="描述1" required>
                            <input type="text" name="description2" placeholder="描述2" required>
                            <input type="text" name="description3" placeholder="描述3" required>
                            <input type="number" name="price" placeholder="單價" min="0" required>
                            <input type="number" name="inventory" placeholder="庫存數" min="0" required>
                            <input type="submit" value="確認新增">
                            <input type="button" value="取消" onclick="hideAddForm(this)">
                        </form>
                    </div>
                </div>
						<%}
						} } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("資料庫錯誤: " + e.getMessage());
    } finally {
        try {
            if (conn != null) conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }%>   
               
            </div>
            
            <input id="2" type="radio" name="choice" class="noIn"/>
            <label for="2">訂單</label>
            <div class="merContent">
                <div class="order">
                    <table class="order_history">
                        <tr>
                            <th>訂單編號</th>
                            <th>產品名稱</th>
                            <th>購買數量</th>
                            <th>金額</th>
                        </tr>
				<%
			try {	
    Class.forName("com.mysql.cj.jdbc.Driver");
    try {
        String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC"; 
        Connection con = DriverManager.getConnection(url, "root", "1234"); 
        if(con.isClosed()) {
            out.println("連線建立失敗！"); 
        } else { 
            String sql5 = "SELECT * FROM orders_detail";
            Statement stmt = con.createStatement(); // Create statement here
            ResultSet rs1 = stmt.executeQuery(sql5);
            
            while (rs1.next()) {
                String detailID = rs1.getString("detailID");
                String productName = rs1.getString("productName");
                String orderQ = rs1.getString("orderQ");
                String tm = rs1.getString("tm");
                out.print("<tr>");
                out.print("<td>" + detailID + "</td>");
                out.print("<td>" + productName + "</td>");
                out.print("<td>" + orderQ + "</td>");
                out.print("<td>NT. " + tm + "</td>");
                out.print("</tr>");
            }
            rs1.close(); // Close ResultSet here
            stmt.close(); // Close Statement here
            con.close();
        }
    } catch (SQLException sExec) {
        out.println("MySQL 錯誤！" + sExec.toString());
    }
} catch (ClassNotFoundException err) {
    out.println("class 錯誤！" + err.toString()); 
}
			
			 %>
					</table>
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