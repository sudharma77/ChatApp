<%-- 
    Document   : firstJsp
    Created on : 30-Jun-2023, 4:08:41 pm
    Author     : hp
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Survey Form</title>
        <style>


            body {
                display: flex;
                justify-content: center;
                align-items: center;
                height: 200vh;
                background-color: #f1f1f1;
                font-family: Arial, sans-serif;
            }

            form {
                width: 400px;
                padding: 20px;
                background-color: #fff;
                border-radius: 5px;
                box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            }

            label {
                display: block;
                margin-bottom: 10px;
                font-weight: bold;
            }

            input[type="text"],
            input[type="email"],
            textarea,
            select {
                width: 100%;
                padding: 8px;
                border: 1px solid #ccc;
                border-radius: 4px;
                box-sizing: border-box;
                margin-bottom: 10px;
            }

            select {
                height: 32px;
            }

            input[type="submit"] {
                margin-top: 20px;
                display: block;
                width: 100%;
                padding: 10px;
                background-color: #4CAF50;
                color: #fff;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
            }

            input[type="submit"]:hover {
                margin-top: 32px;
                background-color: #45a049;
            }


        </style>
    </head>
    <body>
        <div class =" cont">
            <form action="PracticeClassOne" method="POST">
                <h1> Survey Form</h1>
                <label for="firstName">First Name:</label>
                <input type="text" id="firstName" name="firstName" required><br>

                <label for="secondName">Second Name:</label>
                <input type="text" id="secondName" name="secondName" required><br>

                <label for="lastName">Last Name:</label>
                <input type="text" id="lastName" name="lastName" required><br>

                <label for="fatherName">Father's Name:</label>
                <input type="text" id="fatherName" name="fatherName" required><br>

                <label for="motherName">Mother's Name:</label>
                <input type="text" id="motherName" name="motherName" required><br>

                <label for="place">Place:</label>
                <input type="text" id="place" name="place" required><br>

                <label for="address">Permanent Address:</label>
                <textarea id="address" name="address" required></textarea><br>

                <label for="pinCode">Pin Code:</label>
                <input type="text" id="pinCode" name="pinCode" required><br>

                <label for="state">State:</label>
                <input type="text" id="state" name="state" required><br>

                <label for="country">Country:</label>
                <input type="text" id="country" name="country" required><br>

                <label for="email">Email Address:</label>
                <input type="email" id="email" name="email" required><br>

                <label for="mobile">Mobile Contact:</label>
                <input type="text" id="mobile" name="mobile" required><br>

                <label for="sex">Sex:</label>
                <select id="sex" name="sex" required>
                    <option value="male">Male</option>
                    <option value="female">Female</option>
                    <option value="other">Other</option>
                </select><br>

                <label for="maritalStatus">Marital Status:</label>
                <select id="maritalStatus" name="maritalStatus" required>
                    <option value="single">Single</option>
                    <option value="married">Married</option>
                    <option value="divorced">Divorced</option>
                    <option value="widowed">Widowed</option>
                </select><br>

                <label for="employeeStatus">Employee Status:</label>
                <select id="employeeStatus" name="employeeStatus" required>
                    <option value="employed">Employed</option>
                    <option value="unemployed">Unemployed</option>
                    <option value="selfEmployed">Self-Employed</option>
                </select><br>

                <label for="workExperience">Work Experience (in years):</label>
                <input type="number" id="workExperience" name="workExperience" required><br>

                <input type="submit" value="Submit">
            </form>
        </div>
    </body>
</html>
