<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>服務條款</title>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/service.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.2/css/all.min.css" integrity="sha512-SnH5WK+bZxgPHs44uWIX+LLJAJ9/2PkPKZ5QiAj6Ta86w+fsb2TkcmfRyVX3pBnMFcV7oQPJkl9QevSCWr3W6A==" crossorigin="anonymous" referrerpolicy="no-referrer" />
</head>
<body>
    <header>
      <nav>
          <div class="flex">
              <div class="down flex1">
                  <ul>
                      <li>
                          <a href="product.jsp">商品瀏覽</a>
                      </li>
                  </ul>
              </div>
              <div class="down flex1">
                  <ul>
                      <li>
                          <a href="cart.jsp">購物車</a>
                      </li>
                  </ul>
              </div>
              <div class="flex1">
                  <a href="index.jsp" class="logoA">
                      <div class="logoBox">
                          <div class="logo1">
                              <img src="assets/img/logo.png" class="logo">
                          </div>
                          <div class="logo2">
                              <img src="assets/img/logo2.png" class="logo">
                          </div>
                      </div>
                  </a>
              </div>
              <div class="down flex1">
                  <ul>
                      <li class="down">
                          <a href="member.jsp">會員資訊</a>
                      </li>
                  </ul>
              </div>
              <div class="down flex1">
                  <ul>
                      <li class="down">
                          <li class="loginLi" onclick="document.getElementById('login').style.display='block'">登入/註冊</li>
                      </li>
                  </ul>
              </div>
              <form id="searchForm" action="search.jsp" method="post">
				  <div class="search">
					<label>
					  <input type="text" name="keyword" required onkeypress="return handleEnter(event)">
					  <span class="line"></span>
					</label>
				  </div>
			   </form>
          </div>
      </nav>
      
      <div id="login" class="login">
          <div class="container" id="container">
              <div class="formCon signUp">
                  <form action="checkRegister.jsp" method="post">
                        <div class="makemember">
                            <h1>建立帳戶</h1>
                            <input type="text" placeholder="姓名" name="username" />
                            <input type="date" placeholder="生日" name="birthday" />
                            <input type="text" placeholder="電話" name="telephone" />
                            <input type="email" placeholder="Email" name="email" required/>
                            <input type="password" placeholder="密碼" name="password" required/>
                        </div>
                        <button type="submit">註冊</button>
                    </form>
              </div>
              <div class="formCon signIn">
                  <form action="checkLogin.jsp" method="post">
                        <h1>登入</h1>
                        <div class="loginword">
                            <div class="logintxt1"><p>H</p></div>
                            <div class="logintxt1"><p>e</p></div>
                            <div class="logintxt1"><p>l</p></div>
                            <div class="logintxt1"><p>l</p></div>
                            <div class="logintxt1"><p>o &nbsp </p></div>
                            <div class="logintxt1"><p>W</p></div>
                            <div class="logintxt1"><p>o</p></div>
                            <div class="logintxt1"><p>r</p></div>
                            <div class="logintxt1"><p>l</p></div>
                            <div class="logintxt1"><p>d</p></div>
                        </div>    
                            <h3>welcome back</h3>

                        <div class="makemember">
                            <input type="email" placeholder="Email" name="email" required/>
                            <input type="password" placeholder="密碼" name="password" required/>
                        </div>
                        <button type="submit">登入</button>
                    </form>
              </div>
              <div class="coverCon">
                  <div class="cover">
                      <div class="coverpage coverIn">
                          <img  data-anijs="if: mouseover, do: tada animated" src="assets/img/loginJam.png" id="signIn" class="inpic">
                      </div>
                      <div class="coverpage coverUp">
                          <img  data-anijs="if: mouseover, do: tada animated" src="assets/img/loginJam.png" id="signUp" class="uppic">
                      </div>
                  </div>
              </div>
          </div>
      </div>
      <script src="assets/Javascript/login.js"></script>
  </header>
    
    <main>      
        <section class="all">
                <p class="know">服務條款</p>
                <div class="contxt">
                    <p class="welcome">歡迎使用Sundi酸甜提供的服務。在使用我們的服務之前，請仔細閱讀並同意以下條款。</p>

                    <p class="title">接受條款</p>
                    <p>
                        <i class="fa-solid fa-bell" style="color:rgb(249, 196, 51); "></i>
                        使用本公司的服務即表示您同意遵守這些條款。如果您不同意這些條款，請勿使用本公司的服務。<br>
                    </p>
                    <p class="title">用戶安全</p>
                    <p>
                        <i class="fa-solid fa-bell" style="color:rgb(249, 196, 51); "></i>
                        為了您能享有更加完整的服務，您需要創建賬戶，並提供準確且完整的信息。您有責任維護賬戶的安全，並對在您的賬戶下發生的所有活動負責。如果您發現未經授權的使用，請立即通知我們。<br>
                    </p>
                    <p class="title">用戶安全</p>
                    <p>
                        <i class="fa-solid fa-bell" style="color:rgb(249, 196, 51); "></i>
                        為了您能享有更加完整的服務，您需要創建賬戶，並提供準確且完整的信息。您有責任維護賬戶的安全，並對在您的賬戶下發生的所有活動負責。如果您發現未經授權的使用，請立即通知我們。<br>
                    </p>
                    <p class="title">免責聲明</p>
                    <p>
                        <i class="fa-solid fa-bell" style="color:rgb(249, 196, 51); "></i>
                        本店將依本服務當時既(現)有之介面、服務、系統及功能，向您提供相關服務，本店無法承諾或保證任何有關本服務之即時性、安全性、可靠性、完整性、正確性、不會斷線或不會出錯等，本店均不負任何明示或默示之擔保或保證責任，您應於會員註冊前或使用本服務前，自行判斷上述風險並自行選擇是否繼續使用本服務，如您完成註冊或繼續使用者，即視為您完全同意本服務條款內所有約定內容。
                        因本服務之使用所造成之任何直接、間接或衍生性之損害(含所失利益)，本店均不負任何賠償或補償責任，即使係本店曾明白提示注意之建議事項亦同，您應於會員註冊前或使用本服務前，自行判斷上述風險並自行選擇是否繼續使用本服務。<br>
                    </p>
                </div>    

                
        </section>      
    </main>

    <footer>
		<div class="footer">
			<div class="map">
			  <iframe src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d14469.068146818874!2d121.2435522!3d24.9570277!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x346822143c046009%3A0x63e3ef21e3beebac!2z6LOH6KiK566h55CG5a2457O7!5e0!3m2!1szh-TW!2stw!4v1703420605009!5m2!1szh-TW!2stw" width="300" height="150" style="margin-top: 15px; border: 0; border-radius: 10px;" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
			</div>
			<div class="left">
				<p><span class="title">聯絡資訊</span></p>
				<p><span class="content">信箱：<a href="mailto:sundi224@gmail.com" style="color: white;">sundi224@gmail.com</a></span></p>
				<p><span class="title">營業時間</span></p>
				<p><span class="content">Mon.-Fri. 09:00 ~ 12:00 / 13:00 ~ 18:00</span></p>
			</div>
			<div class="right">
			  <ul class="rr">
				  <li><a href="we.jsp">關於我們</a></li>
				  <li><a href="merchantlogin.jsp">賣家中心</a></li>
			  </ul>
			  <ul class="rl">
				  <li><a href="service.jsp">服務條款</a></li>
				  <li><a href="know.jsp">購買須知</a></li>
			  </ul>
			</div>
		</div>
		<div style="text-align: center; padding: 10px 0; margin: 0;">
			<span class="title">Copyright © 2024 Sundi</span>
		</div>
	</footer>
    <div class="goUp" id="goUp">
        <a href="#" class="gotop"><img src="assets/img/arrow-up.png" class="top"></a>
    </div>
    <script src="assets/Javascript/index.js"></script>
    <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
    <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>    
        
</body>
</html>