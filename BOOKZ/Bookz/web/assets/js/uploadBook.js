/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
var setup = function () {
    let title = document.querySelector('label[for=title]');
    let author = document.querySelector('label[for=author]');
    var data1 = "Title of book cannot be blank";
    var data2 = "Author cannot be blank. \n\
    If author is author is unknown then enter 'unknown' ";
    title.dataset.info = data1;
    author.dataset.info = data2;
    check();
//    console.log("Welcome to upload Book" + title + author);
}
var loadFile = function (event) {
    var output = document.getElementById('output');
    var coverImg = document.querySelector('input[name=coverimg]');
    output.src = URL.createObjectURL(event.target.files[0]);
    coverImg.value = URL.createObjectURL(event.target.files[0]);
    output.onload = function () {
        URL.revokeObjectURL(output.src) // free memory
    }
};

function check() {
    console.log("check");
    var file1 = document.querySelector('input[name=filepdf]');
    var file2 = document.querySelector('input[name=fileepub]');
    var button = document.querySelector('#submit_button');
    if (file1.value != '') {
        document.getElementById('FilePDF_File').innerHTML = file1.files[0].name;
        file2.required = false;
    }
    if (file2.value != '') {
        document.getElementById('FileEPUB_File').innerHTML = file2.files[0].name;
        file1.required = false;
    }s
    if (button.innerHTML == 'UPDATE')
        return;
    if (file1.value == "" && file2.value == "") {
        file1.required = true;
        file2.required = true;
        return;
    }

    return;
}

window.onload = function () {
    setup();
};