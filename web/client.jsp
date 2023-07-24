<%-- 
    Document   : client
    Created on : 14-Jul-2023, 8:32:59 am
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html>
<head>
    <title>Client</title>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script>
        // Function to send a message
        function sendMessage() {
            var message = $('#message').val();
            if (message !== '') {
                $.post('Client', {message: message}, function (response) {
                    $('#chatArea').append('<p>You: ' + message + '</p>');
                    $('#message').val('');
                });
            }
        }

        // Function to receive messages
        function receiveMessages() {
            $.get('Client', function (response) {
                $('#chatArea').append('<p>Friend: ' + response + '</p>');
               // setTimeout(receiveMessages, 3000); // Polling for new messages every second
            });
        }

        $(document).ready(function () {
            receiveMessages(); // Start receiving messages
        });
    </script>
</head>
<body>
    <h1>Chat Application</h1>
    <div id="chatArea"></div>
    <input type="text" id="message" />
    <button onclick="sendMessage()">Send</button>
</body>
</html>

