<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>We</title>
    <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
    <link rel="stylesheet" href="assets/css/style.css">
    <link rel="stylesheet" href="assets/css/login.css">
    <link rel="stylesheet" href="assets/css/we.css">
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
        <div class="advtxt">前端組員</div>
        <div class="wecon">
            <div class="card">
                <div class="pic">
                  <img src="assets/img/wang.jpg" >
                </div>
                <div class="content">
                  <h2>王美淑<br>資管二乙</h2>
                  <p class="advtxt3">
                    經過這次的前端網頁製作，了解到網頁如何排版，在網頁上的配色、擺放位置，都考驗到審美及CSS和JavaScript的使用能力。特別是在看到許多網頁利用SVG做動畫或3D模型等運用，所呈現的精美網頁。透過這次的專題實作，不僅奠定了基礎能力，也讓我認識到細節在網頁設計中的重要性。希望未來能進一步提升自己的技術，創作出更具互動性和視覺吸引力的網頁作品。
                  </p>
                </div>
            </div>
        
            <div class="card">
                <div class="pic">
                  <img src="assets/img/julie.jpg" >
                </div>
                <div class="content">
                  <h2>陳怡甄<br>資管二乙</h2>
                  <p class="advtxt3">
                    透過這學期製作前端網頁的部分，我因而了解到一個網頁的畫面是如何組成的，另外，我也了解到我們所看到許多製作很精美的網頁背後需要付出的過程，我認為通過這次學習的經驗我掌握了基礎的實力，但還是需要更多的練習與實作才能將畫面做得更精美與流暢。
                  </p>
                </div>
            </div>
            
            <div class="card">
                <div class="pic">
                  <img src="assets/img/jane.jpg" >
                </div>
                <div class="content">
                  <h2>蘇英禎<br>資管二乙</h2>
                  <p>
                    這學期我們負責的是前端的部分，藉由這次的合作我了解到一個網頁的畫面是如何去編排的，需要考量他的配色、排版、主題性等這些都很考驗審美，在過程中也瀏覽了不同的的網頁進而去讓我們的網頁更加美觀，雖然目前有一點基礎了，但我認為要做出精緻美觀的畫面我還需要多多學習。
                  </p>
                </div>
            </div>
        </div>
        
        <div class="advtxt2">後端組員</div>
        <div class="wecon">
            <div class="card">
                <div class="pic">
                  <img src="assets/img/11144120.jpg" >
                </div>
                <div class="content">
                  <h2>邱巧巧<br>資管二甲</h2>
                  <p class="advtxt3">
                    和上學期寫前端相比，我覺得這次寫後端程式的難度更高，在寫jsp的過程中要考慮很多東西，有地方程式邏輯沒寫好就一直出現錯誤，很容易讓人有挫敗感，但是經過不斷的修改，程式終於能正常運作的時候，真的覺得很開心!也很感謝乙班同學在我們遇到困難的時候給我們建議和幫助，辛苦大家了!
                  </p>
                </div>
            </div>
        
            <div class="card">
                <div class="pic">
                  <img src="assets/img/11144123 .jpg" >
                </div>
                <div class="content">
                  <h2>陳筱莓<br>資管二甲</h2>
                  <p class="advtxt3">
                    這次撰寫後端資料庫相較於上學期撰寫前端HTML我認為難度增加不少，雖然有老師的範例，但因為HTML的複雜性跟排列大不相同，因此無法完全參考，多數還是透過上網找資料並一一將程式碼更改試錯，很多時候寫了整整一天卻毫無進度的狀況也非常多，可見難度之高。
                  </p>
                </div>
            </div>
            
            <div class="card">
                <div class="pic">
                  <img src="assets/img/11144133.JPG" >
                </div>
                <div class="content">
                  <h2>彭新祐<br>資管二甲</h2>
                  <p class="advtxt3">
                    這次的課程學習的了很多能夠使網站跟加有互動性的功能，在上學期的前端課程中我們只能做出一些擁有介面但無法做出太多互動的網站。而這學期我們利用了曾經學過的前端知識和經驗陪合這學期學到的jsp 製作出了更加豐富多元的網站。
                  </p>
                </div>
            </div>
        </div>
        
        
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