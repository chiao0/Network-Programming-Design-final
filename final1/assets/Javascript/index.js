const goUpButton = document.getElementById('goUp');
console.log("Script is running!"); 

window.addEventListener('scroll', function() {
    if (window.scrollY > window.innerHeight * 0.05) {
        goUpButton.style.display = 'block';
    } else {
        goUpButton.style.display = 'none';
    }
});

// 變換字的內容
const text = document.querySelector(".sec-text");

const textLoad = () => {
  setTimeout(() => {
    text.textContent = "Sundi";
  }, 0);
  setTimeout(() => {
    text.textContent = "酸甜";
  }, 3000);
};

textLoad();

document.addEventListener("DOMContentLoaded", function() {
  const secText = document.querySelector(".sec-text");
  const animationContainer = document.querySelector(".con");
  const mainContent = document.querySelector("main");
  const footerContent = document.querySelector("footer");
  const skipButton = document.getElementById("skipButton");

  secText.addEventListener("animationend", function() {
    animationContainer.style.display = "none";
    mainContent.style.display = "block";  // 顯示main區塊
    footerContent.style.display = "block"; // 顯示footer區塊
  });

  // 使用skip跳過
  skipButton.addEventListener("click", function() {
    animationContainer.style.display = "none";
    mainContent.style.display = "block";  
    footerContent.style.display = "block"; 
  });
});


// bk區塊的縮放
document.addEventListener('scroll', function() {
  const bkContainer = document.querySelector('.bkContainer');
  const containerRect = bkContainer.getBoundingClientRect();
  const windowHeight = window.innerHeight;
  const bkCenterP = document.querySelector('.bk_center p');
  const bkImages = document.querySelectorAll('.bk_left img, .bk_right img');
  
  // bkContainer 100%
  if (containerRect.top <= windowHeight / 2 && containerRect.bottom >= windowHeight) {
      bkContainer.style.width = '100%';
      bkCenterP.style.fontSize = '45px';

      bkImages.forEach(function(img) {
          img.style.maxWidth = '400px';
          img.style.height = '350px';
      });
  } else {
      // bkContainer 90%
      bkContainer.style.width = '90%';
      bkCenterP.style.fontSize = '30px';
      bkContainer.style.paddingBottom = '80px';

      bkImages.forEach(function(img) {
          img.style.maxWidth = '250px';
          img.style.height = '250px';
      });
  }
  
  
});






    