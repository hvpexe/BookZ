function showLogin() {
    let login = document.getElementById("login");
    let greyBox = login.querySelector("div");

    if (login.style.display != "block") {
        login.style.display = 'block';
        
        greyBox.style.height= document.querySelector('body').clientHeight + 'px';
    }
    else
        login.style.display = "none";
}
function activeLogin() {
    let login = document.querySelector(".login-btn");
    let register = document.querySelector(".register-btn");
    if(login.className != this.className) {
        register.className = "register-btn active";
        login.className = "login-btn";
        document.getElementById("login_form").style.display= "none";
        document.getElementById("register_form").style.display= "block";
    }
    if(register.className != this.className) {
        login.className = "login-btn active";
        register.className = "register-btn";
        document.getElementById("login_form").style.display ="block";
        document.getElementById("register_form").style.display= "none";
    }
    console.log(this.className);
} 
function showClearBtn(item){
    let btn = document.querySelector('.clear-btn');
    btn.style.display = "none";
    let inp = document.querySelector(".input_text");
    if(inp.value.length > 0) btn.style.display="block";
}
function clearSearch(){
    let inp = document.querySelector(".input_text");
    inp.value= '';
    showClearBtn(document.querySelector('.clear-btn'));
}
function showAnchorInfomation(item){
    item.parentElement.className = 'col nav-anchor';
    
}
function hideAnchorInfomation(item){
    item.parentElement.className = 'col';

}
