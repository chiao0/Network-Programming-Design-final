<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>賣家登入</title>
    <link rel="stylesheet" href="assets/css/merchantlogin.css">
</head>
<body>
    <main>
        <div>
            <img src="assets/img/member.png" class="bear">
        </div>
        <div>
            <img src="assets/img/member.png" class="bear6">
        </div>
        <div class="merlogcon">
            <form action="mlogin.jsp" method="post">                                       
                <div class="merlog">
                    <p>賣家登入</p>
                    <input type="email" name="email" placeholder="Email" required/><br>
                    <input type="password" name="password" placeholder="密碼" required/><br>                   
                </div>
                <div class="setbutton">
                    <button type="submit">登入</button>
                    <button type="button" onclick="window.location.href='index.jsp'">取消</button>
                </div>
            </form>
        </div>
    </main>
</body>
</html>