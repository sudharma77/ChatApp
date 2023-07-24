/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package com.servlet;

/**
 *
 * @author hp
 */
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;  

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String email = request.getParameter("username");
        String password = request.getParameter("password");
        HttpSession session = request.getSession();
        Connection connection = null;
        RequestDispatcher  dispatcher = null;
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","sudharma");
           PreparedStatement pst = connection.prepareStatement("select * from users where emailAdress = ? and loginPassword = ?");
           pst.setString(1, email);
           pst.setString(2, password);
           
           ResultSet result = pst.executeQuery();
           //dispatcher = request.getRequestDispatcher("signupPage.jsp");
           
           if(result.next()){
               
                request.setAttribute("name", result.getString("firstName"));
                dispatcher = request.getRequestDispatcher("chatJspPage.jsp");
           }else{
                request.setAttribute("status", "failed");
                dispatcher = request.getRequestDispatcher("loginPage.jsp");
           }    
           dispatcher.forward(request, response);
           
        }catch(Exception e){
             dispatcher = request.getRequestDispatcher("login-success.jsp");
             dispatcher.forward(request, response);
           // e.printStackTrace();
        }

        // Perform login authentication logic here
        // Example: Check username and password against a database
        /*if (username.equals("admin") && password.equals("pass")) {
            request.setAttribute("username", username);
            request.getRequestDispatcher("login-success.jsp").forward(request, response);
        } else {
            response.sendRedirect("loginPage.jsp");
        }*/
    }
   
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String data = "Hello from servlet";
        request.setAttribute("message", data);

        RequestDispatcher dispatcher = request.getRequestDispatcher("chatHtml.html");
        dispatcher.forward(request, response);
    }

}
