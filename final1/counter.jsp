<%@ page import="java.sql.*" %>
<%
    //建立資料庫連線
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    int counter = 0; // 初始化計數器值為 0
    boolean isCounterUpdated = false; // 紀錄計數器是否已更新

    try {
        //註冊 JDBC 驅動程式
        Class.forName("com.mysql.cj.jdbc.Driver");

        //建立連線
        String url = "jdbc:mysql://localhost/Sundi?serverTimezone=UTC";
        String user = "root";
        String password = "1234";
        conn = DriverManager.getConnection(url, user, password);

        //檢查計數器值是否存在
        String sql = "SELECT * FROM counter"; // 使用 counter 資料表
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        if (rs.next()) {
            //讀取目前計數器值
            counter = rs.getInt("count"); // 從 count 欄位讀取計數器值
        } else {
            //插入初始計數器值
            sql = "INSERT INTO counter (count) VALUES (0)"; // 在 counter 資料表的 count 欄位插入初始值
            pstmt = conn.prepareStatement(sql);
            pstmt.executeUpdate();
        }

        //檢查是否為新訪客
        boolean isNewVisitor = session.isNew() || session.getAttribute("counted") == null;

        if (isNewVisitor) {
            counter++;
            isCounterUpdated = true; // 標記計數器已更新
            session.setAttribute("counted", true); //標記該 session 已計數
        }

    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        //關閉資源
        if (rs != null) rs.close();
        if (pstmt != null) pstmt.close();
        if (conn != null) {
            // 如果計數器已更新,則將更新後的值寫回資料庫
            if (isCounterUpdated) {
                String sql = "UPDATE counter SET count = ?"; // 更新 counter 資料表的 count 欄位
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, counter);
                pstmt.executeUpdate();
            }
            conn.close();
        }
    }
%>