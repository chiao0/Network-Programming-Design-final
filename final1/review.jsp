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
	String email = request.getParameter("email");;
	
	if (email.isEmpty()) {
        %>
        <script>
        alert("尚未登入！請登入後再進行評論!");
        window.location.href = "index.jsp";
        </script>
        <%
    }
	String product_id = request.getParameter("product_id");
    String title = request.getParameter("title");
    String content = request.getParameter("content");
    String rating = request.getParameter("rating");  

    java.util.Date now = new java.util.Date();
    java.sql.Timestamp reviewDate = new java.sql.Timestamp(now.getTime());

    Connection con = null;
    PreparedStatement pstmt = null;
	ResultSet rs = null;


    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
        con = DriverManager.getConnection(url, "root", "1234");

        // Insert order into the orders table
        String sql = "INSERT INTO product_reviews (product_id, email, title, content, rating, review_date) VALUES (?, ?, ?, ?, ?, ?)";
        pstmt = con.prepareStatement(sql);
        pstmt.setString(1, product_id);
        pstmt.setString(2, email);
        pstmt.setString(3, title);
        pstmt.setString(4, content);
        pstmt.setString(5, rating);
        pstmt.setTimestamp(6, reviewDate); 

        pstmt.executeUpdate();
        pstmt.close();

        %>
				<script>
				alert("評論已成功送出!!");
				window.location.href = "products.jsp";
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