<%@ page import = "java.sql.*, java.util.*"%>
<%@ page language="java" contentType="text/html" pageEncoding="UTF-8"%>

<%
	String email="";
	    Cookie cookies[] = request.getCookies();
    if (cookies != null) {
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("email")) {
                email = cookie.getValue();
                break;
            }
        }
    }

    // 如果 email 不存在，重新定向到登錄頁面
    if (email.isEmpty()) {
%>
        <script>
        alert("尚未登入！");
        window.location.href = "index.jsp";
	</script>
<%
	}
	try {
			Class.forName("com.mysql.jdbc.Driver");
			try {	
				String url="jdbc:mysql://localhost/?serverTimezone=UTC";
				Connection con=DriverManager.getConnection(url,"root","1234");
				if(con.isClosed())
				   out.println("連線建立失敗！");
				else{
					String sql="USE `Sundi`";
					con.createStatement().execute(sql);
					request.setCharacterEncoding("UTF-8"); 
					
					String productid=request.getParameter("product_id");
					String number=request.getParameter("orderQ");
					
					
					
					if(number==null)
						number="1";
					String sql1="INSERT into `cart`(`email`,`productID`,`orderQ`)";//寫入購物車
					sql1+="VALUES('"+email+"','"+productid+"','"+number+"')";      
					
					con.createStatement().execute(sql1);
				
					con.close();
					%>
					<script>
					alert("加入購物車成功!!");
					window.location.href = "products.jsp";
					</script>
					<%
					//response.sendRedirect("showcart.jsp");//這邊要設計顯示購物車
				}
			}
				
			catch (SQLException sExec) {
				out.println("MySQL 錯誤！"+sExec.toString()); 
			}
		}
		catch (ClassNotFoundException err) {
		  out.println("class 錯誤！"+err.toString()); 
		}
	
%>