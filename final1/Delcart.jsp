<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.text.SimpleDateFormat" %>

<html>
<head>
<title>DELETE</title>
<style>
</style>
</head>
<body>
<%
	String cartID = request.getParameter("cartid");
	try {
			// 加載 MySQL JDBC 驅動
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 連接到數據庫
			String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC"; // 確保數據庫名稱為 "Sundi"
			Connection con = DriverManager.getConnection(url, "root", "1234");

			if (con.isClosed()) {
				out.println("連線建立失敗");
			} else {

				String sql = "DELETE FROM cart WHERE cartID = '"+cartID+"';";
				con.createStatement().executeUpdate(sql);
				con.close();
				%>
				<script>
				alert("已從購物車中刪除!");
				window.location.href = "cart.jsp";
				</script>
				<%
				//response.sendRedirect("cart.jsp");
				
			}
		}
		
		catch (SQLException sExec) {
			out.println("SQL mis:"+sExec.toString());
		} 
%>

</form>

</body>
</html>