var Switch1 = document.querySelector(".Switch1");
var Switch2 = document.querySelector(".Switch2");

var Login = document.querySelector(".Login");
var SignUp = document.querySelector(".Signup");

Switch1.addEventListener('click',function() {
    Login.style.display="none";
    SignUp.style.display="block";
});

Switch2.addEventListener('click',function() {
    Login.style.display="block";
    SignUp.style.display="none";
});

