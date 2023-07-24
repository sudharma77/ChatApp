<%-- 
    Document   : loginPage
    Created on : 03-Jul-2023, 11:51:59 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <title>Login</title>
  <style>
      html {
        background: url("images/nice.jpg") no-repeat center center fixed; 
        background-size: cover;
        height: 100%;
        
        overflow: hidden;
    }
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
   
/*      background-color: #f1f1f1;
      background-image: url("images\images(1).jpg");*/
      font-family: Arial, sans-serif;
    }

    .login-container {
      width: 300px;
      padding: 20px;
      font-family: 'Montserrat',sans-serif;
      background-color: none;
      border-radius: 5px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      opacity: 100%;
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

    input[type="text"],
    input[type="password"] {
      width: 100%;
      padding: 8px;
      border: 1px solid #ccc;
      border-radius: 4px;
      box-sizing: border-box;
      margin-bottom: 10px;
      background-color: transparent;
    }

    input[type="submit"] {
    
      display: block;
      width: 100%;
      padding: 10px;
      background-color: transparent;
      color: #000;
      border: none;
      border-radius: 4px;
      cursor: pointer;
      font-weight: bold;
    }

    input[type="submit"]:hover,input[type="submit"]:focus {
      box-shadow: 
          
    inset -3.5em 0 0 0 var(--hover),
    inset 3.5em 0 0 0 var(--hover); 
      color:#fff;
    }
    
    input[type="submit"]:hover {
        background-color: #3c3c3c;
    }

   

    .error-message {
      color: red;
      margin-top: 10px;
    }
    
    .signup{
        text-align: center;
        font-style: none;
        text-decoration: none;
        color: #000;
    }
  </style>
</head>
<body>
   <input type="hidden" id="status" value="<%=   request.getAttribute("status")%>">
  <div class="login-container">
    <h2>Login</h2>
    <form action="LoginServlet" method="POST">
      <label for="username">Email</label>
      <input type="text" id="username" name="username" required><br>

      <label for="password">Password:</label>
      <input type="password" id="password" name="password" required><br>
      <p>Not a member?&nbsp;&nbsp;<a href="signupPage.jsp" class="signup">Register</a></p>
      <input type="submit" value="Login">
    </form>
    <p class="error-message">${errorMessage}</p>
  </div>
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
<script type="text/javascript">
    var status = document.getElementById("status").value;
    if(status === "success"){
        swal("Good job!", "You clicked the button!", "success");
    }else if(status === "failed"){
        swal("Something Wrong!", "You clicked the button!", "error");
    }
</script>
</body>
</html>

