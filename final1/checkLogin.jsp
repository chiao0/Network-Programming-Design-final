<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<%
	String email = request.getParameter("loginemail");
	String password = request.getParameter("loginpassword");

	Connection con = null;
	PreparedStatement pstmt = null;
	ResultSet dataset = null;

	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
		con = DriverManager.getConnection(url, "root", "1234");

		if (con.isClosed()) {
			out.println("連線建立失敗");
		} else {
			String sql = "SELECT * FROM `member` WHERE `email`=? AND `password`=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, email);
			pstmt.setString(2, password);

			dataset = pstmt.executeQuery();
			
			if (dataset.next()) {
				// 創建 cookie 存儲 email
				Cookie emailCookie = new Cookie("email", email);
				emailCookie.setMaxAge(-1); // 瀏覽器關閉時刪除 cookie
				response.addCookie(emailCookie);
				con.close();
				
				// 返回成功
				out.print("success");
			} else {
				// 返回失敗
				out.print("failure");
			}
		}
	} catch (SQLException e) {
		out.println("SQL錯誤：" + e.toString());
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
