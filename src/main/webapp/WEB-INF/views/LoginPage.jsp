<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Page</title>
<!-- <link rel="stylesheet" href="LoginPage.css"> -->
</head>
<body>
		<h1 style="text-align:center;">Student Management System </h1>
        <div class="Main-body">
            <div class="Main-container">
                
                <div class="toggle-btn">
                    <div id="slide" class="slider"></div>
                    <button id="login" class="active" onclick="showLogin()">Login</button>
                    <button id="signup" onclick="showSignup()" >Sign Up</button>
                    <!--  -->
                </div>
                
                <div id="login-area" class="login-body">
                    <h2 class="log-head">Login to your account</h2>
                    <form action="/login/get-login-details" method="get">
                        <input type="text" name="uname" placeholder="Enter your E-mail or username" required>
                        <input type="password" name="password" placeholder="Enter your password" required>
                        <button class="login-btn" type="submit">Login</button>
                    </form>
                </div>
                
                <div id="signup-area" class="signup-body" style="display: none;">
                    <h2 class="log-head">Create a new account</h2>
                    <form action="/login/save-signup-details" method="post" id="signupform">
                        <input type="text" id="signup-email" name="email" placeholder="Enter your E-mail" required>
                        <label id="signup-email-error" style="color: red; display: none;"></label>
                        <input type="text" id="signup-username" name="username" placeholder="Enter your username" required>
                        <label id="signup-uname-error" style="color: red; display: none;"></label>
                        <input type="password" id="signup-password" name="password" placeholder="Enter your password" required>
                        <label id="signup-pass-error" style="color: red; display: none;"></label>
                        <button class="signup-btn" type="button" onclick="signup_proceed()" >Sign Up</button>
                    </form>
                </div>
                
            </div>
        </div>
        
        <!-- <script src="login.js"></script> -->
</body>
<style>
.Main-container{
    width: 350px;
    padding: 30px 20px;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    background: #65f1ea;
    border-radius: 15px;
    position: absolute;
    top: 50%;
    left: 50%;
    transform: translate(-50%, -50%);
    z-index: 0;
    label{
        margin: -9px 2px 10px;
    }
}

input{
    width : 100%;
    height: 30px;
    line-height: 1;
    margin: 10px 0;
    border-color: #2bb66e;
    border: 1px;
    border-radius: 5px;
    
}
button.login-btn,button.signup-btn{
    width: 100%;
    height: 25px;
    border-radius: 5px;
    border: none;
    font-weight: bold;
    font-size: 16px;
    background-color: #4CAF50;
    color: white;
    cursor: pointer;
    &:hover{
        background-color: #2bb66e;
    }
}
.toggle-btn{
    display: flex;
    position: relative;
    width: 100%;
    background: #d9c4c4;
    border-radius: 25px;
    margin-bottom: 20px;
    overflow: hidden;
}
.toggle-btn button{
    flex: 1;
        padding: 10px 0;
        background: none;
        border: none;
        font-size: 16px;
        cursor: pointer;
        z-index: 2;
        color: #333;
        font-weight: bold;
}
.slider{
    position: absolute;
    top: 0;
    left: 0;
    width: 50%;
    height: 100%;
    background: #65b0f1;
    border-radius: 25px;
    transition: left 0.3s ease;
    z-index: 1;
}
.toggle-btn button.active{
    color: #fff;

}
</style>
<script type="text/javascript">
console.log("Login page loaded successfully");
const loginBtn = document.getElementById("login");
const signupBtn = document.getElementById("signup");
const slider = document.getElementById("slide");
const loginArea = document.getElementById("login-area");
const signupArea = document.getElementById("signup-area");
function showLogin(){
    slider.style.left = "0";
    loginBtn.classList.add("active");
    signupBtn.classList.remove("active");
    loginArea.style.display = "block";
    signupArea.style.display = "none";
}
function showSignup(){
    slider.style.left = "50%";
    signupBtn.classList.add("active");
    loginBtn.classList.remove("active");
    signupArea.style.display = "block";
    loginArea.style.display = "none";
}

function signup_pass_check(password,errorLabel) {
    if (password.value === "") {
        console.log("Password is empty");
        errorLabel.innerText = "Password cannot be empty.";
        errorLabel.style.display = "block";
        return false; // Prevent form submission
    }
    else if (password.value.length < 8) {
        console.log("Password is too short");
        errorLabel.innerText = "Password must be at least 8 characters long.";
        errorLabel.style.display = "block";
        password.focus();
        return false; // Prevent form submission
    }
    else if (!/[A-Z]/.test(password.value) ||
               !/[a-z]/.test(password.value) ||
               !/[0-9]/.test(password.value) ||
               !/[!@#$&?]/.test(password.value)) {
        console.log("Password not satisfied the requirements");
        errorLabel.innerText = "Password must contain character [A-Z][a-z][0-9][!@#$&?].";
        errorLabel.style.display = "block";
        password.focus();
        return false; // Prevent form submission
    }
    console.log("Password is validated successfully");
    errorLabel.style.display = "none";
    return true; // Password is valid
}

function signup_uname_check(uname,errorLabel) {
    if (uname.value === "") {
        console.log("Username is empty");
        errorLabel.innerText = "Username cannot be empty.";
        errorLabel.style.display = "block";
        return false; // Prevent form submission
    }
    else if (uname.value.length < 4) {
        console.log("Username is too short");
        errorLabel.innerText = "Username must be at least 5 characters long.";
        errorLabel.style.display = "block";
        uname.focus();
        return false; // Prevent form submission
    }
    else if (!/[A-Z]/.test(uname.value) ||
               !/[a-z]/.test(uname.value) ||
               !/[0-9]/.test(uname.value) ||
               !/[._]/.test(uname.value)) {
        console.log("Username not satisfied the requirements");
        errorLabel.innerText = "Username must contain character [A-Z][a-z][0-9][._].";
        errorLabel.style.display = "block";
        uname.focus();
        return false; // Prevent form submission
    }
    console.log("Username is validated successfully");
    errorLabel.style.display = "none";
    return true; // UserName is valid
}

function signup_email_check(email,errorLabel){
    if(email.value === ""){
        console.log("Email is empty");
        errorLabel.innerText = "Email cannot be Empty.";
        errorLabel.style.display = "block";
        email.focus();
        return false;
    }
    console.log("Email is validated.");
    errorLabel.style.display = 'none';
    return true;
}

function signup_proceed() {
    const password = document.getElementById('signup-password');
    const perrorLabel = document.getElementById("signup-pass-error");

    const username = document.getElementById('signup-username');
    const unerrorLabel = document.getElementById("signup-uname-error");

    const email = document.getElementById('signup-email');
    const emerrorLabel = document.getElementById("signup-email-error");

    const pass_flag = signup_pass_check(password, perrorLabel);
    const uname_flag = signup_uname_check(username,unerrorLabel);
    const email_flag = signup_email_check(email,emerrorLabel);

    if (!pass_flag || !uname_flag || !email_flag) {
        return false; // Prevent form submission if password is invalid
    }
    console.log("Signup form submitted successfully");
    alert('SignUp successfull..');
    document.getElementById("signupform").submit(); // Allow form submission
}
</script>
</html>