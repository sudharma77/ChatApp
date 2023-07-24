<%-- 
    Document   : signupPage
    Created on : 03-Jul-2023, 11:53:08 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Sign Up</title>
        <link rel="stylesheet" type="text/css" href="styles.css">
        <style>
            html {
                background: url("images/signup8.jpg") no-repeat center center fixed; 
                background-size: cover;
                height: 100%;
                overflow: hidden;
            }
            
            .container {
                max-width: 400px;
                margin: 0 auto;
                padding: 20px;
                color: #fff;
                background-color: none;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            h2 {
                text-align: center;
                margin-bottom: 20px;
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }
            
            input[type="firstName"],
            input[type="lastName"],
            input[type="text"],
            input[type="email"],
            input[type="password"] {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
                background-color: transparent;
                color: #fff;
            }

            input[type="submit"] {
                display: block;
                width: 100%;
                padding: 10px;
                background-color: transparent;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
            }

            input[type="submit"]:hover {
                background-color: #fff;
                color: #000;
            }
            .Log{
                text-decoration: none;
                color: aqua;
            }

        </style>
    </head>
    <body>
        <input type="hidden" id="status" value="<%=   request.getAttribute("status")%>">
        <div class="container">
            <h2>Sign Up</h2>
            <form action="SignUpServlet" method="POST">
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required><br>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required><br>

                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required><br>

                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required><br>
                <p>By clicking Register, you agree on our <a href="loginPage.jsp" class="Log In">Privacy Policy</a></p>                
                <input type="submit" value="Sign Up">
            </form>
        </div>
        <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
        <script type="text/javascript">
            var status = document.getElementById("status").value;
            if(status === "success"){
                swal("Good job!", "You clicked the button!", "success");
            }
        </script>
    </body>
    
</html>

