var modal = document.getElementById('login');
window.onclick = function(event) {
    if (event.target == modal) {
        modal.style.display = "none";
    }
}

const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');


signUpButton.addEventListener('click', () => {
    container.classList.add("move");
});

signInButton.addEventListener('click', () => {
    container.classList.remove("move");
});

//登入
function loginForm(event) {
    event.preventDefault();

    var email = document.getElementById("loginemail").value;
    var user_password = document.getElementById("loginpassword").value;

    if (!email || !user_password) {
        alert("欄位不可空白！");
    } else {
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "./checkLogin.jsp", true);
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    var response = xhr.responseText.trim();

                    if (response === 'success') {
                        alert("登入成功！");
                        window.location.href = "member.jsp";
                    } else if (response === 'failure') {
                        alert("登入失敗：帳號或密碼不正確");
                    } else {
                        alert("未知錯誤：" + response);
                    }
                } else {
                    alert("請求失敗：" + xhr.status);
                }
            }
        };

        xhr.send("loginemail=" + encodeURIComponent(email) + "&loginpassword=" + encodeURIComponent(user_password));
    }
}

//註冊
function signupForm(event) {
    event.preventDefault();  

    var username = document.getElementById("username").value;
    var birthday = document.getElementById("birthday").value;
    var phone = document.getElementById("phone").value;
    var email = document.getElementById("email").value;
    var user_password = document.getElementById("password").value;
    var comfirm_password = document.getElementById("comfirm_password").value;

    if (!username || !birthday || !phone || !email || !user_password || !comfirm_password) {
        alert("欄位不可空白！");
    } else if (user_password !== comfirm_password) {
        alert("密碼和確認密碼不一致！");
    } else {
        
        var xhr = new XMLHttpRequest();
        xhr.open("POST", "./checkRegister.jsp", true);  // post資料到後端，填收註冊資料檔
        xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        xhr.onreadystatechange = function () {
            if (xhr.readyState == 4) {
                if (xhr.status == 200) {
                    var response = xhr.responseText;

                    if (response.trim() === '註冊失敗') {
                        alert("註冊失敗！");
                    } else {
                        alert("註冊成功！");
                        container.classList.remove("move");
                    }
                } else {
                    alert("請求失敗：" + xhr.status);
                }
            }
        };

        xhr.send("username=" + encodeURIComponent(username) + 
                 "&birthday=" + encodeURIComponent(birthday) + 
                 "&phone=" + encodeURIComponent(phone) + 
                 "&email=" + encodeURIComponent(email) + 
                 "&password=" + encodeURIComponent(user_password));
    }
};