<%-- 
    Document   : check
    Created on : 15-Jul-2023, 1:30:03 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <title>Message App</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <!-- Compiled and minified CSS -->
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

        <!-- Compiled and minified JavaScript -->
        <script src="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/js/materialize.min.js"></script>
        <script defer src="http://localhost:3000/socket.io/socket.io.js"></script>
        <script defer src="client.js"></script>
        <style>
            .containerOne{
                padding-top: 10px;
                max-width: 800px;
                height: 480px;
                overflow-y: auto;

                margin: auto;
            }
            .navBar{
                background-color: #fff;
            }
            .containerSecond{
                margin-top: 0px;
                max-width: 800px;
                margin: auto;
            }
            .message{

                border-radius: 50px;
                min-width: 0px;
                max-width: 60%;
                padding: 10px;
                margin: 8px 12px;
                border: 2px solid transparent;
            }
            .left{
                float: left;
                background-color: lightgray;
                clear: both;
            }
            

            .right{
                float: right;
                background-color: #1F71FE;
                color: #fff;
                clear: both;
            }
            .navBar{
                margin-top: 10px;
            }
            .container{
                background-color: #00134d;


            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="">
                <nav>
                    <div class="nav-wrapper" >
                        <label class="brand-logo ">Welcome&nbsp;
                            <a href="#" class="brand-logo" id="userName" >${name}</a>
                        </label> 

                        <ul id="nav-mobile" class="right hide-on-med-and-down" style="background-color:#ee6e73">
                            <li><a href="sass.html">Profile</a></li>
                            <li><a href="badges.html">Logout</a></li>
                        </ul>
                    </div>
                </nav>
            </div>
            <div class="containerOne navBar">
                <div class="left message"> Left</div>
                <div class="right message">Right</div>
            </div>
            <div class="row center-align containerSecond">
                <form class="col s12 " id="form-cont">
                    <div class="row">
                        <div class="input-field col s12">
                            <textarea id="icon_prefix2" class="materialize-textarea" style="color:#ffffff"></textarea>
                            <label for="icon_prefix2">Message</label>
                        </div>
                    </div>
                    <div class="row">
                        <button class="btn waves-effect waves-light" type="submit" name="action">Submit
                        </button>
                    </div>
                </form>
            </div>

        </div>
        
    </body>
</html>
