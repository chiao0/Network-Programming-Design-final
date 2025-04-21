<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="connection.jsp" %>
<%
String productID = request.getParameter("productID");
String action = request.getParameter("action");
String quantityStr = request.getParameter("quantity");
int quantity = 1; // 默認值
try {
    quantity = Integer.parseInt(quantityStr);
    if (quantity < 1) quantity = 1; // 確保數量至少為1
} catch (NumberFormatException e) {
    // 如果解析失敗，保持默認值1
}

String actionText = "add".equals(action) ? "增加" : "減少";
String productName = "未知商品";

if (productID == null || productID.trim().isEmpty() || action == null || action.trim().isEmpty()) {
%>
    <html><body>
    <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
        <h3>錯誤：缺少必要的參數</h3>
        <p>請確保您是通過正確的方式嘗試更新庫存。</p>
        <p><a href="merchant.jsp">返回商品管理頁面</a></p>
    </div>
    </body></html>
<%
} else {
    Connection conn = null;
    int currentStock = 0;
    int change = 0;
    boolean operationSuccess = false;

    try {
        Class.forName("com.mysql.jdbc.Driver");
        conn = getConnection();
        conn.setAutoCommit(false); 

        change = "add".equals(action) ? quantity : -quantity;

        // 首先，獲取商品名稱和當前庫存
        String selectSql = "SELECT productName, inventory FROM product WHERE productID = ? FOR UPDATE";
        try (PreparedStatement selectStmt = conn.prepareStatement(selectSql)) {
            selectStmt.setInt(1, Integer.parseInt(productID));
            ResultSet rs = selectStmt.executeQuery();
            if (rs.next()) {
                productName = rs.getString("productName");
                currentStock = rs.getInt("inventory");
            } else {
                throw new Exception("找不到指定的商品");
            }
        }

        // 檢查庫存
        if ("add".equals(action) || ("remove".equals(action) && currentStock >= quantity)) {
            String updateSql = "UPDATE product SET inventory = inventory + ? WHERE productID = ?";
            try (PreparedStatement updateStmt = conn.prepareStatement(updateSql)) {
                updateStmt.setInt(1, change);
                updateStmt.setInt(2, Integer.parseInt(productID));
                updateStmt.executeUpdate();
            }
            conn.commit(); 
            operationSuccess = true;
        }
%>
<html><body>
    <% if (operationSuccess) { %>
        <div style="color: green; padding: 20px; background-color: #e6ffe6; border: 1px solid green; margin: 20px;">
            <h3>成功：庫存已更新</h3>
            <p>商品「<%= productName %>」的庫存已成功<%= actionText %>。</p>
            <p>當前庫存：<%= currentStock + change %></p>
            <p><a href="merchant.jsp">返回商品管理頁面</a></p>
        </div>
    <% } else if ("remove".equals(action) && currentStock == 0) { %>
        <div style="color: orange; padding: 20px; background-color: #fff3e6; border: 1px solid orange; margin: 20px;">
            <h3>警告：無法減少庫存</h3>
            <p>很抱歉，商品「<%= productName %>」目前庫存為0，無法再減少。</p>
            <p><a href="merchant.jsp">返回商品管理頁面</a></p>
        </div>
    <% } else { %>
        <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
            <h3>錯誤：無法更新庫存</h3>
            <p>操作：嘗試<%= actionText %>庫存</p>
            <p>商品：「<%= productName %>」（ID: <%= productID %>）</p>
            <p><a href="merchant.jsp">返回商品管理頁面</a></p>
        </div>
    <% } %>
</body></html>
<%
    } catch (Exception e) {
        if (conn != null) try { conn.rollback(); } catch (SQLException ex) {}
%>
<html><body>
    <div style="color: red; padding: 20px; background-color: #ffe6e6; border: 1px solid red; margin: 20px;">
        <h3>錯誤：無法更新庫存</h3>
        <p>操作：嘗試<%= actionText %>庫存</p>
        <p>商品：「<%= productName %>」（ID: <%= productID %>）</p>
        <p>錯誤信息：<%= e.getMessage() %></p>
        <p><a href="merchant.jsp">返回商品管理頁面</a></p>
    </div>
</body></html>
<%
    } finally {
        if (conn != null) try { conn.close(); } catch (SQLException e) {}
    }
}
%>