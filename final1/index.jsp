<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ include file="counter.jsp" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Sundi</title>
  <link rel="stylesheet" href="assets/css/index.css">
  <link rel="stylesheet" href="https://anijs.github.io/lib/anicollection/anicollection.css">
  <link rel="stylesheet" href="assets/css/login.css">
  <script src="assets/Javascript/search.js"></script>
</head>
<body>
  <div class="con">
    <div class="image-container">
      <img src="assets/img/logo2.png" alt="logo2">
    </div>
    <div class="text-wrapper">
      <span class="text first-text">Welcome to &nbsp;</span>
      <span class="text2 sec-text"></span>
    </div>
    <img src="assets/img/skip.png" alt="skip" id="skipButton" class="skip-button">
  </div>

  <main>
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
                  <form action="checkRegister.jsp" method="post" id="signupForm" onsubmit="signupForm(event)">
                      <div class="makemember">
                          <h1>建立帳戶</h1>
                          <input type="text" id="username" placeholder="姓名" name="username"/>
                          <input type="date" id="birthday" placeholder="生日" name="birthday"/>
                          <input type="text" id="phone" placeholder="電話" name="phone"/>
                          <input type="email" id="email" placeholder="Email" name="email" required/>
                          <input type="password" id="password" placeholder="密碼" name="password" required/>
                          <input type="password" id="comfirm_password" placeholder="確認密碼" required/>
                      </div>
                      <button type="submit">註冊</button>
                  </form>
              </div>
              <div class="formCon signIn">
                  <form  action="checkLogin.jsp" method="post" id="loginForm" onsubmit="loginForm(event)">
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
                          <input type="email" id="loginemail" placeholder="Email" name="loginemail" required/>
                          <input type="password" id="loginpassword" placeholder="密碼" name="loginpassword" required/>
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

      <div class="advertise_container">
        <div class="ad_container">
          <div class="ad">
            <div>
              <img src="assets/img/one.png" alt="ad1" class="adimg" height="700px">
            </div>
            <div>
              <a href="products.jsp?productID=6"><img src="assets/img/two.png" alt="ad2" class="adimg" height="700px"></a>
            </div>
            <div>
              <a href="products.jsp?productID=9"><img src="assets/img/three.png" alt="ad3" class="adimg" height="700px"></a>
            </div>
            <div>
              <a href="index.jsp"><img src="assets/img/four.png" alt="ad4" class="adimg" height="700px"></a>
            </div>
            <div>
              <a href="products.jsp?productID=5"><img src="assets/img/five.png" alt="ad5" class="adimg" height="700px"></a>
            </div>
            <div>
              <a href="products.jsp?productID=2"><img src="assets/img/six.png" alt="ad6" class="adimg" height="700px"></a>
            </div>
          </div>
        </div>
      </div>

      <div class="hot_container">
        <div class="hot">
          <div class="hot_left">
            <span>熱<br></span>
            <span>銷</span>
          </div>
          <div class="hot_right">
            <span class="hot_right_up">品質源自用心，每一件商品都乘載著我們的情感和努力，希望能夠溫暖到您的心。<br></span>
            <span class="hot_right_down">"Quality stems from dedication, each product embodies our passion and effort, hoping to warm your heart."</span>
          </div>
        </div>
        <div class="rank">
          <p>Top <span>1</span></p>
          <p>Top <span>2</span></p>
          <p>Top <span>3</span></p>
          <p>Top <span>4</span></p>
          <p>Top <span>5</span></p>
        </div>
        <div class="hot_down">
          <a href="products.jsp?productID=9"><img src="assets/img/mango2.jpg" alt="mango"></a>
          <a href="products.jsp?productID=10"><img src="assets/img/happy2.jpg" alt="happynut"></a>
          <a href="products.jsp?productID=15"><img src="assets/img/nutbox3.jpg" alt="nutbox"></a>
          <a href="products.jsp?productID=1"><img src="assets/img/apple.jpg" alt="applejam"></a>
          <a href="products.jsp?productID=2"><img src="assets/img/lychee.jpg" alt="lycheejam"></a>
        </div>
      </div>

      <div class="bkContainer">
        <div class="bk_left">
            <a href=""><img src="assets/img/we1.jpg" alt="nutbox" class="sticky st1"></a>
            <a href=""><img src="assets/img/we3.jpg" alt="lychee" class="sticky st2"></a>
        </div>
    
        <div class="bk_center">
            <p>品質源自於用心 <br>我們希望帶給你最好的</p>
            <img src="assets/img/bk_logo.png" alt="bk_logo">
            <button class="bk_button" onclick="location.href='we.html'">關於我們</button>
        </div>
    
        <div class="bk_right">
            <a href=""><img src="assets/img/we4.jpg" alt="jambox" class="sticky st3"></a>
            <a href=""><img src="assets/img/we2.jpg" alt="hu" class="sticky st4"></a>
        </div>
      </div>

      <div class="skuBox">
        <div class="skuTitle">
          <hr>人氣推薦<hr>
        </div>
        <!-- <p class="ptop">果醬系列</p> -->
        <div class="sku_top">
          <div class="skuCon skuCon1">
            <a href="products.jsp?productID=13">
              <img src="assets/img/jambox1.jpg" class="skuImg topimg1" style="width:100%">
              <div class="skuIn topIn1">
                <p>豐作雙果茶醬禮盒</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
          <div class="skuCon skuCon2">
            <a href="products.jsp?productID=3">
              <img src="assets/img/pome3.jpg" class="skuImg topimg2" style="width:100%">
              <div class="skuIn topIn2">
                <p>紅石榴果醬</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
        </div>

        <!-- <p class="pmid">果乾系列</p> -->
        <div class="sku_mid">
          <div class="skuCon skuCon3">
            <a href="products.jsp?productID=8">
              <img src="assets/img/man3.jpg" class="skuImg midimg1" style="width:100%">
              <div class="skuIn midIn1">
                <p>有機蔓越莓乾</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
          <div class="skuCon skuCon4">
            <a href="products.jsp?productID=7">
              <img src="assets/img/losanflower.jpg" class="skuImg midimg2" style="width:100%">
              <div class="skuIn midIn2">
                <p>乾燥洛神花乾</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
        </div>

        <!-- <p class="pdown">堅果系列</p> -->
        <div class="sku_down"> 
          <div class="skuCon skuCon5">
            <a href="products.jsp?productID=10">
              <img src="assets/img/happy3.jpg" class="skuImg downimg1" style="width:100%">
              <div class="skuIn downIn1">
                <p>珍珠開心果</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
          <div class="skuCon skuCon6">
            <a href="products.jsp?productID=12">
              <img src="assets/img/nut3.jpg" class="skuImg downimg2" style="width:100%">
              <div class="skuIn downIn2">
                <p>低溫烘培原味腰果</p>
                <iconify-icon icon="ooui:next-ltr"  style="color: #f5f5f5; margin-bottom: 10px;" width="30px"></iconify-icon>
              </div>
            </a>
          </div>
        </div>
      </div>
    
    <div class="goUp" id="goUp">
        <a href="#" class="gotop"><img src="assets/img/arrow-up.png" class="top"></a>
        <div class="view">瀏覽數：<%=counter%></div>
      </div>
  </main>
  <script src="assets/Javascript/index.js"></script>
  <script src="https://anijs.github.io/lib/anijs/anijs-min.js"></script> 
  <script src="https://anijs.github.io/lib/anijs/helpers/dom/anijs-helper-dom-min.js"></script>

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

<script src="https://code.iconify.design/iconify-icon/2.1.0/iconify-icon.min.js"></script>
</body>
</html>