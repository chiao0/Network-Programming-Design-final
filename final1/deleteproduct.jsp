<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%
String productID = request.getParameter("productID");
if (productID == null || productID.trim().isEmpty()) {
%>
    <html><body>
    <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
        <h3>錯誤：缺少商品ID</h3>
        <p>請確保您是通過正確的方式嘗試刪除商品。</p>
        <p><a href="merchant.jsp">返回商品管理頁面</a></p>
    </div>
    </body></html>
<%
} else {
    Connection conn = null;
    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = getConnection();

        // 首先，獲取商品名稱以供後續顯示
        String selectSql = "SELECT productName FROM product WHERE productID = ?";
        String productName = "";
        try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
            selectStmt.setInt(1, Integer.parseInt(productID));
            ResultSet rs = selectStmt.executeQuery();
            if (rs.next()) {
                productName = rs.getString("productName");
            } else {
                throw new Exception("找不到指定的商品");
            }
        }

        // 然後，刪除商品（因為有ON DELETE CASCADE，所以相關的圖片也會被刪除）
        String deleteSql = "DELETE FROM product WHERE productID = ?";
        try (PreparedStatement deleteStmt = conn.prepareStatement(deleteSql)) {
            deleteStmt.setInt(1, Integer.parseInt(productID));
            int rowsAffected = deleteStmt.executeUpdate();
            if (rowsAffected == 0) {
                throw new Exception("刪除操作未影響任何行，可能商品已被刪除");
            }
        }
%>
        <html><body>
        <div style="color: green; padding: 20px; background-color: #e6ffe6; border: 1px solid green; margin: 20px;">
            <h3>成功：商品已刪除</h3>
            <p>商品「<%= productName %>」已成功從系統中移除。</p>
            <p><a href="merchant.jsp">返回商品管理頁面</a></p>
        </div>
        </body></html>
<%
    } catch (Exception e) {
%>
        <html><body>
        <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
            <h3>錯誤：無法刪除商品</h3>
            <p>具體錯誤信息：<%= e.getMessage() %></p>
            
            <p><a href="merchant.jsp">返回商品管理頁面</a></p>
        </div>
        </body></html>
<%
    } finally {
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
}
%>