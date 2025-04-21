<!DOCTYPE html>
<%@page contentType="text/html"%> 
<%@page pageEncoding="UTF-8"%>
<%@ page import = "java.sql.*" %>

<html>
<head>
<title>Login Successful</title>
<style>
</style>
</head>
<body>
<%
Cookie cookies[] = request.getCookies();
int count = cookies.length;
String username = "";

for(int i=0; i < count; i++){
	if(cookies[i].getName().equals("username")){
		username = cookies[i].getValue();
	}
}

%>
<h1>Welcome <%=username%></h1>
</form>

</body>
</html>