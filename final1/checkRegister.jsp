<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@page import = "java.sql.*,java.text.SimpleDateFormat" %>

<html>
    <head><title>註冊成功!</title></head>
    <body>
    <%
		String username = request.getParameter("username");
		String birthdayStr = request.getParameter("birthday");
		String telephone = request.getParameter("phone");
		String email = request.getParameter("email");
		String password = request.getParameter("password");
		String address = "";
		
		
		try { 
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
			java.util.Date birthdayUtilDate = sdf.parse(birthdayStr);
			java.sql.Date birthday = new java.sql.Date(birthdayUtilDate.getTime());
			
            Class.forName("com.mysql.cj.jdbc.Driver");	  
			String url="jdbc:mysql://localhost:3306/Sundi?serverTimezone=UTC";
			Connection con=DriverManager.getConnection(url,"root","1234");   				
			if(con.isClosed()){
				out.println("連線建立失敗");
			}
			else{
				con.createStatement().execute("use `Sundi`");
				String sql = "INSERT INTO `member` (`username`, `birthday`, `telephone`, `email`,`password`,`address`) " +
							 "VALUES ('"+username+"', '"+birthday+"', '"+telephone+"', '"+email+"','"+password+"','"+address+"')";
				int no=con.createStatement().executeUpdate(sql); 
				if (no>0){
					out.println("新增成功，點擊<a href = 'product.html'>這裏</a>回到登入界面");
				}
				con.close();
            }
		}      
		catch (SQLException sExec) {
			out.println("SQL mis:"+sExec.toString());
		} 
			
    %>

    </body>
</html>


    </body>
</html>
