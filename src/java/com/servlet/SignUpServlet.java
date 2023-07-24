/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.jakarta to edit this template
 */
package com.servlet;

/**
 *
 * @author hp
 */
import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
@WebServlet("/SignUpServlet")
public class SignUpServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Retrieve form data
        String firstName = request.getParameter("firstName");
        String lastName = request.getParameter("lastName");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        Connection connection = null;
        RequestDispatcher  dispatcher = null;
        try{
           Class.forName("com.mysql.cj.jdbc.Driver");
           connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/practice","root","sudharma");
           PreparedStatement pst = connection.prepareStatement("insert into users(firstName,lastName, emailAdress, loginPassword) values(?,?,?,?)");
           pst.setString(1, firstName);
           pst.setString(2, lastName);
           pst.setString(3, email);
           pst.setString(4, password);
           
           
           int rowCount = pst.executeUpdate();
           dispatcher = request.getRequestDispatcher("signupPage.jsp");
           if(rowCount > 0){
               request.setAttribute("status", "success");
           }else{
               request.setAttribute("status", "failed");
           }
           dispatcher.forward(request, response);
           //dispatcher = request.getRequestDispatcher("loginPage.jsp");
        }catch(Exception e){
            e.printStackTrace();
        }

    }
}
