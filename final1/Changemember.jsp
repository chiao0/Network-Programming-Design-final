<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*,java.text.SimpleDateFormat" %>

<html>
<head>
<title>changemember</title>
<style>
</style>
</head>
<body>
<%
	String username = request.getParameter("chusername");
	String birthday = request.getParameter("chbirthday");
	String telephone = request.getParameter("chtelephone");
	String email = request.getParameter("chemail");
	String address = request.getParameter("chaddress");
	
	
	try {
			// 加載 MySQL JDBC 驅動
			Class.forName("com.mysql.cj.jdbc.Driver");

			// 連接到數據庫
			String url = "jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC"; // 確保數據庫名稱為 "Sundi"
			Connection con = DriverManager.getConnection(url, "root", "1234");

			if (con.isClosed()) {
				out.println("連線建立失敗");
			} else {

				String sql = "UPDATE `member` set `username` = '"+username+"' ,`birthday` = '"+birthday+"' ,`telephone` = '"+telephone+"' ,`address` = '"+address+"' where `email` = '"+email+"';";
				con.createStatement().executeUpdate(sql);
				con.close();
				response.sendRedirect("member.jsp");
				
			}
		}
		
		catch (SQLException sExec) {
			out.println("SQL mis:"+sExec.toString());
		} 
%>

</form>

</body>
</html>