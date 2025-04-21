<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<html>
<head>
<title>inorder</title>
<style>
</style>
</head>
<body>
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
	
    String username = request.getParameter("username");
    String telephone = request.getParameter("telephone");
    String address = request.getParameter("address");
    String delivery = request.getParameter("ship");
    String payment = request.getParameter("pay");
    String total = request.getParameter("totalPrice");    
    String dcode = request.getParameter("coupon");


    java.util.Date now = new java.util.Date();
    java.sql.Timestamp orderDate = new java.sql.Timestamp(now.getTime());

    Connection con = null;
    PreparedStatement pstmt = null;
	ResultSet rs = null;


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
        con = DriverManager.getConnection(url, "root", "1234");

        // Insert order into the orders table
        String sql = "INSERT INTO orders (username, telephone, address, delivery, payment, total, dcode, order_date) VALUES (?, ?, ?, ?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, username);
        pstmt.setString(2, telephone);
        pstmt.setString(3, address);
        pstmt.setString(4, delivery);
        pstmt.setString(5, payment);
        pstmt.setString(6, total);
        pstmt.setString(7, dcode);
        pstmt.setTimestamp(8, orderDate); 

        pstmt.executeUpdate();
        pstmt.close();

        String productName = "";
        String orderQ = "";
        String tm = "";

        String sql2 = "SELECT * FROM cart_view WHERE email = ?;";
        pstmt = con.prepareStatement(sql2);
        pstmt.setString(1, email);
        rs = pstmt.executeQuery();

        while (rs.next()) {
            productName = rs.getString("productName");
            orderQ = rs.getString("orderQ");
            tm = rs.getString("tm");

            String sql3 = "INSERT INTO orders_detail (email, productName, orderQ, tm, order_date) VALUES (?, ?, ?, ?, ?);";
            PreparedStatement Pstmt = con.prepareStatement(sql3);
            Pstmt.setString(1, email);
            Pstmt.setString(2, productName);
            Pstmt.setString(3, orderQ);
            Pstmt.setString(4, tm);
            Pstmt.setTimestamp(5, orderDate);
            Pstmt.executeUpdate();
            Pstmt.close();

            String sql5 = "SELECT * FROM product WHERE productName = ?;";
            PreparedStatement pstmt1 = con.prepareStatement(sql5);
            pstmt1.setString(1, productName);
            ResultSet rs1 = pstmt1.executeQuery();

            if (rs1.next()) {
				String nm = rs1.getString("productName");
                int inventory = rs1.getInt("inventory");
                int oQ = Integer.parseInt(orderQ);
                int newInventory = inventory - oQ;
				
				if(newInventory < 0){
					%>
					<script>
					alert("訂單已記錄，但庫存數量不足!補貨完成將為您寄出~  商品:<%=nm%>");
					</script>
					<%
				} 
                String sql6 = "UPDATE product SET inventory = ? WHERE productName = ?;";
                PreparedStatement pstmt2 = con.prepareStatement(sql6);
                pstmt2.setInt(1, newInventory);
                pstmt2.setString(2, productName);
                pstmt2.executeUpdate();
                pstmt2.close();
				
            }
            rs1.close();
            pstmt1.close();
        }
        rs.close();
        pstmt.close();


        String sql1 = "DELETE FROM cart WHERE email = ?;";
        pstmt = con.prepareStatement(sql1);
        pstmt.setString(1, email);
        pstmt.executeUpdate();
        pstmt.close();
		
		
		
		
		
		
		

        %>
				<script>
				alert("訂單已成功送出!!");
				window.location.href = "member.jsp";
				</script>
				<%
		
    } catch (SQLException | ClassNotFoundException e) {
        e.printStackTrace();
        out.println("資料庫錯誤: " + e.getMessage());
    } finally {
        try {
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
%>
</body>
</html>