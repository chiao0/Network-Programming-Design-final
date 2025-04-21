<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%
    String email = request.getParameter("email");
    String password = request.getParameter("password");
    Connection con = null;
    PreparedStatement pstmt = null;
    ResultSet dataset = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
        con = DriverManager.getConnection(url, "root", "1234");
        if (con.isClosed()) {
            out.println("連線建立失敗");
        } else {
            String sql = "SELECT * FROM `admin` WHERE `email`=? AND `password`=?";
            pstmt = con.prepareStatement(sql);
            pstmt.setString(1, email);
            pstmt.setString(2, password);
            dataset = pstmt.executeQuery();
            if (dataset.next()) {
                // 如果查詢到管理員資料,重定向到 merchant.jsp
                response.sendRedirect("merchant.jsp");
            } else {
                // 如果未查詢到管理員資料,顯示彈跳視窗和重定向到登入頁面
                String redirectURL = "merchantlogin.jsp";
%>
<script>
    alert("登入失敗");
    window.location.href = "<%= redirectURL %>";
</script>
<%
            }
            con.close();
        }
    } catch (SQLException e) {
        out.println("資料庫錯誤: " + e.getMessage());
    } catch (Exception e) {
        out.println("錯誤: " + e.getMessage());
    } finally {
        try {
            if (dataset != null) dataset.close();
            if (pstmt != null) pstmt.close();
            if (con != null) con.close();
        } catch (SQLException e) {
            out.println("關閉資源時出錯: " + e.getMessage());
        }
    }
%>