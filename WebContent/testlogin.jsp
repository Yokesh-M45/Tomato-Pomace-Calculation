<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Tomato Pomace Login And Register</title>
      <!-- Meta tags -->
      <meta name="viewport" content="width=device-width, initial-scale=1" />
      <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
      <meta name="keywords" content="Grass login & Sign up Form Responsive Widget, Audio and Video players, Login Form Web Template, Flat Pricing Tables, Flat Drop-Downs, Sign-Up Web Templates, Flat Web Templates, Login Sign-up Responsive Web Template, Smartphone Compatible Web Template, Free Web Designs for Nokia, Samsung, LG, Sony Ericsson, Motorola Web Design" />
      <script>
         addEventListener("load", function() { setTimeout(hideURLbar, 0); }, false); 
         function hideURLbar() { window.scrollTo(0,1); }
      </script>
      <!-- Meta tags -->
      <!-- font-awesome icons -->
      <link href="wre/css/fontawesome-all.min.css" rel="stylesheet" type="text/css" media="all">
      <!--stylesheets-->
      <link href="wre/css/style.css" rel='stylesheet' type='text/css' media="all">
      <link href="//fonts.googleapis.com/css?family=Barlow:300,400,500" rel="stylesheet">
      <style>
         /* Ensure the buttons stay on the same line and align the additional button to the right */
         .btnn {
            display: flex;
            align-items: center;
            justify-content: space-between; /* Distribute space to push the additional button to the right */
         }

         /* Default button styling */
         .btnn button {
            padding: 10px 20px;
            border: none;
            color: #fff; /* White text */
            background-color: #f68f1e; /* Orange color for the button */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s; /* Smooth transition for background and text color */
         }

         /* Hover effect for buttons */
         .btnn button:hover {
            background-color: #000; /* Black background on hover */
            color: #fff; /* White text on hover */
         }

         /* Additional CSS for the Another Button */
         .another-btn-custom {
            padding: 10px 20px;
            border: none;
            color: #fff;
            background-color: #007bff; /* Different color */
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s, color 0.3s;
         }
         .another-btn-custom:hover {
            background-color: #0056b3; /* Darker shade */
            color: #fff;
         }

         /* Style for password visibility toggle */
         .password-container {
            position: relative;
            width: 100%;
         }

         .password-container input {
            width: 100%;
            color: #000;
            outline: none;
            font-size: 14px;
            padding: .8em .7em;
            margin: 0px 0px 23px;
            border: none;
            display: inline-block;
            background: #fff;
            transition: all 0.5s ease-in-out;
            box-sizing: border-box;
         }

         .toggle-password {
            position: absolute;
            right: 15px; /* Adjust position as needed */
            top: 35%;
            transform: translateY(-50%);
            color: #999;
            cursor: pointer;
            z-index: 1;
         }
      </style>
   </head>
   <body>
      <h1 class="header-w3ls">
        TESTING EMPLOYEE LOGIN AND REGISTER
      </h1>
      <div class="art-bothside">
         <div class="sap_tabs">
            <div id="horizontalTab">
               <ul class="resp-tabs-list">
                  <li class="resp-tab-item"><span>Login</span></li>
                  <li class="resp-tab-item"><span>Sign Up</span></li>
               </ul>
               <div class="clearfix"> </div>
               <div class="resp-tabs-container">
                  <div class="tab-1 resp-tab-content">
                     <div class="swm-right-w3ls">
                        <form action="TestingLogin" method="post"> <!-- Replace action with your servlet URL -->
                           <div class="main">
                              <div class="icon-head-wthree">
                                 <h2>Login Here</h2>
                              </div>
                              <div class="form-left-w3l">
                                 <input type="email" name="email" autocomplete="off" placeholder="Email" required="">
                              </div>
                              <div class="password-container">
                                 <input type="password" id="logpassword" autocomplete="off" name="password" placeholder="Password" required="">
                                 <i class="fas fa-eye toggle-password" id="toggleLogPasswordBtn" onclick="togglePassword('logpassword', 'toggleLogPasswordBtn')"></i>
                              </div>
                              <div class="btnn">
                                 <button type="submit">LogIn</button>
                                 <button type="button" class="another-btn-custom" onclick="redirectToAnotherPage()">View Status</button>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
                  <div class="tab-1 resp-tab-content">
                     <div class="swm-left-w3ls">
                        <form action="TestingRegister" method="post"> <!-- Replace action with your servlet URL -->
                           <div class="main">
                              <div class="icon-head-wthree">
                                 <h2>Register Here</h2>
                              </div>
                              <div class="form-left-to-w3l">
                                 <input type="text" name="tname" autocomplete="off" placeholder="Name" required="">
                              </div>
                              <div class="form-left-w3l">
                                 <input type="email" name="temail" autocomplete="off" placeholder="Email" required="">
                              </div>
                               <div class="form-left-to-w3l">
                                 <input type="text" name="tnumber" autocomplete="off"  placeholder="Mobile Number" required="">
                              </div>
                               <div class="form-left-to-w3l">
                                 <input type="text" name="tid" autocomplete="off" placeholder="Employee ID" required="">
                              </div>
                              <div class="btnn">
                                 <button type="submit">Sign Up</button><br>
                              </div>
                           </div>
                        </form>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
      <script src='wre/js/jquery-2.2.3.min.js'></script>
      <!--//js working-->
      <script src="wre/js/easyResponsiveTabs.js"></script>
      <script>
         $(document).ready(function () {
            $('#horizontalTab').easyResponsiveTabs({
               type: 'default', //Types: default, vertical, accordion           
               width: 'auto', //auto or any width like 600px
               fit: true // 100% fit in a container
            });
         });

         // Function to handle redirection
         function redirectToAnotherPage() {
            window.location.href = 'teststatuscheck.jsp'; 
         }

         // JavaScript for toggling password visibility
         function togglePassword(fieldId, iconId) {
            var field = document.getElementById(fieldId);
            var icon = document.getElementById(iconId);

            if (field.type === 'password') {
                field.type = 'text';
                icon.classList.remove('fa-eye');
                icon.classList.add('fa-eye-slash');
            } else {
                field.type = 'password';
                icon.classList.remove('fa-eye-slash');
                icon.classList.add('fa-eye');
            }
        }
      </script>
   </body>
</html>
