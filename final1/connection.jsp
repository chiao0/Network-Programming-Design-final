<%@ page import="java.sql.*" %>
<%!
private static Connection getConnection() throws SQLException {
    try {
        // 加載 JDBC 驅動程式
        Class.forName("com.mysql.jdbc.Driver");
        
        // 從配置檔案或環境變數中獲取數據庫連線資訊
        String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
        String username = "root";
        String password = "1234";
        
        return DriverManager.getConnection(url, username, password);
    } catch (ClassNotFoundException e) {
        e.printStackTrace();
    } catch (SQLException e) {
        e.printStackTrace();
    }
    return null;
}
%>