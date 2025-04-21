<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%
Connection conn = null;
try {
    Class.forName("com.mysql.jdbc.Driver");
    conn = getConnection();
    conn.setAutoCommit(false); 
    
    // 插入商品訊息
    String sql1 = "INSERT INTO product (category, productName, description1, description2, description3, price, inventory) VALUES (?, ?, ?, ?, ?, ?, ?)";
    try (PreparedStatement stmt1 = conn.prepareStatement(sql1, Statement.RETURN_GENERATED_KEYS)) {
        stmt1.setString(1, request.getParameter("category"));
        stmt1.setString(2, request.getParameter("productName"));
        stmt1.setString(3, request.getParameter("description1"));
        stmt1.setString(4, request.getParameter("description2"));
        stmt1.setString(5, request.getParameter("description3"));
        stmt1.setInt(6, Integer.parseInt(request.getParameter("price")));
        stmt1.setInt(7, Integer.parseInt(request.getParameter("inventory")));
        stmt1.executeUpdate();

        // 獲取新插入的商品ID
        try (ResultSet rs = stmt1.getGeneratedKeys()) {
            if (rs.next()) {
                int productID = rs.getInt(1);
                
                // 插入商品圖片
                String sql2 = "INSERT INTO product_images (productID, img_url) VALUES (?, ?)";
                try (PreparedStatement stmt2 = conn.prepareStatement(sql2)) {
                    stmt2.setInt(1, productID);
                    stmt2.setString(2, request.getParameter("imgUrl"));
                    stmt2.executeUpdate();
                    
                    conn.commit(); 
                }
            }
        }
    }
    response.sendRedirect("merchant.jsp");
} catch (Exception e) {
    if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
    %>
    <html><body>
    <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
        <h3>錯誤：新增商品時出錯</h3>
        <p>具體錯誤信息：<%= e.getMessage() %></p>
        <p><a href="merchant.jsp">返回商品管理頁面</a></p>
    </div>
    </body></html>
    <%
} finally {
    if (conn != null) try { conn.close(); } catch (SQLException e) {}
}
%>