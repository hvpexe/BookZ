/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
function changeStar(item) {
    let name = item.parentElement;
    name.className = "rate-star position-relative fa-star d-inline-flex star-" + item.innerHTML;

}
function changeStar0(item) {
    let name = item.parentElement;
    name.className = "rate-star position-relative fa-star d-inline-flex star-0";
}
function rateStar(item) {
    let login = checkLogin();
    console.log(login);
    if (login) {
        document.querySelector("input[name=rate]").value = item.innerHTML;
        for (var i = 0; i < 5; i++) {
            document.querySelectorAll('#rating span div')[i].onmouseout = "";
        }
    } else {
        showLogin();
        document.getElementById("login_chat").innerHTML = "You Need To Login To Rate ";
    }
}
function checkRate() {
    let rate = document.querySelector("input[name=rate]").value;
    if (rate >= 1 && rate <= 5) {
        return true;
    }
    let warning = "You Need To Rate To Comment";
    document.getElementById('comment_warning').innerHTML = warning;
    return false;
}
function checkEnter(event, item) {
    if (event.keyCode === 13 && !event.shiftKey) {
        if (!checkLogin()) {
            showLogin();
            document.getElementById("login_chat").innerHTML = "You Need To Login To Comment";
        } else if (checkRate())
        {
            item.parentElement.submit(); //Submit your form here
        }
        return false;
    }
}

function checkReport() {
    console.log(checkLogin());
    if (!checkLogin()) {
        showLogin();
        document.getElementById("login_chat").innerHTML = "You Need To Login To Report";
    } else{
         openForm();
    }
    return false;
}

function checkEnterForEdit(event, item, name) {

    if (event.keyCode === 13 && !event.shiftKey) {
        let form = document.forms['edit' + name];
        console.log(form);
        let edit = form.elements['edit'];
        console.log(edit);
        if (edit.value.length == 0) {
            let check = confirm("Do You Want To Delete?");
            console.log(check);
            if (check) {
                document.forms['delete' + name].submit();
            }
        } else
            form.submit();
        return false;
    }

}
function show(name) {
    let form = document.getElementById(name);
    let div = form.previousElementSibling;
    let textarea = form.nextElementSibling;
    console.log(form);
    console.log(div);
    console.log(textarea);
    if (div.style.display == 'none') {
        div.style.display = 'block';
        textarea.style.display = 'none';
    } else {
        div.style.display = 'none';
        textarea.style.display = 'block';
    }
}
function checkLogin(item) {
    return document.getElementById('user') != null;
}
function downloadWarning(item) {
    let login = checkLogin(item);
    if (!login) {
        item.querySelector(".bubble").style.display = "block";
        setTimeout(() => {
            item.querySelector(".bubble").style.display = "none";
        }, 2000);
        return login;
    }
    const queryString = window.location.search;
    const urlParams = new URLSearchParams(queryString);

    document.getElementById("download_book").submit();
    return login;
}

function openForm() {
    document.getElementById("myForm").style.display = "block";
}

function closeForm() {
    document.getElementById("myForm").style.display = "none";
}