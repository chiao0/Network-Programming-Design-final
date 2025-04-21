// 預設打開第一個 tab
document.addEventListener("DOMContentLoaded", function() {
    document.querySelector(".tablinks").click();
});
function openTab(event, tabName) {
    var i, tabcontent, tablinks;
    // 隱藏tabcontent
    tabcontent = document.getElementsByClassName("tabcontent");
    for (i = 0; i < tabcontent.length; i++) {
        tabcontent[i].style.display = "none";
    }
    tablinks = document.getElementsByClassName("tablinks");
    for (i = 0; i < tablinks.length; i++) {
        tablinks[i].className = tablinks[i].className.replace(" active", "");
    }
    document.getElementById(tabName).style.display = "block";
    event.currentTarget.className += " active";
}