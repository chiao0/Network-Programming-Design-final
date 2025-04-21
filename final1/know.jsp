<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>購買須知</title>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/know.css">
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
                <p class="know">購買須知</p>
                <div class="contxt">
                    <p class="">歡迎來到Sundi酸甜，為了保障雙方的權益，購買前請仔細閱讀以下購買須知，當您使用本平台時即同意以下說明，如有疑問請先洽詢客服。</p>

                    <p class="title">配送說明</p>
                    <p>
                        (1) 訂單成立後1-3個工作天出貨，寄出後約3個工作天可收到商品(實際情形配送時間依物流狀況而定)<br>
                        (2) 出貨順序依下單時間陸續發貨，如欲本店訂單量較大時請見諒<br>
                        (3) 本店假日及國定假日公休，商品將於收假後第一個工作日陸續處理<br>
                    </p>
                    <p class="title">退換貨說明</p>
                    <p>
                        (1) 本店產品經嚴格品質控管，不添加防腐劑，請於有效期限內食用完畢。<br>
                        (2) 為維護食品的衛生安全，食品經拆封後，除非品質有異，恕不接受退換貨。<br>
                        (3) 為保障您的權益，請於收到物品後立即開啟檢視是否正確與完整，若有問題請立即與客服人員聯繫。7日內無立即反應恕不接受退貨。<br>
                        (4) 網路商店目前尚不提供換貨服務，若商品不合或未符期望，得於七日鑑賞期內請將原先購買的商品進行退貨，再重新購買您想要的商品。<br>
                        (5) 退貨商品須回復原狀，並保持產品、配件、標籤和包裝的完整。<br>
                        (6) 若產品因運送過程導致瑕疵，請直接向宅配人員反應、務必請拍照存證以保障自身權益，並請立即聯絡本公司客服人員。<br>
                        (7) 本公司收到退貨後，信用卡交易者將於3個工作天內辦理信用卡交易取消手續。<br>
                        (8) 如需協助，請致信客服信箱：sundi224@gmail.com  服務時間：週一至週五09:00-12:00、13:00-18:00(國定假日與例假日除外)。<br>
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