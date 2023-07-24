/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.Socket;

/**
 *
 * @author hp
 */
@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServlet extends HttpServlet {
    Socket socket;
    PrintWriter printOut;
     BufferedReader buReader;
    boolean flag = false;
    ChatServlet(){
        try{
            System.out.println("Sending Request to server");
            socket = new Socket("127.0.0.1",8889);
            System.out.println("Connection Done");
            
           buReader = new BufferedReader(new InputStreamReader(socket.getInputStream()));
           printOut = new PrintWriter(socket.getOutputStream());
        }catch(Exception e){
            flag = true;
            e.getStackTrace();
        }
        
        
    }
    private static final long serialVersionUID = 1L;
    private static List<String> messages = new ArrayList<>();

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = request.getParameter("message");
        if (message != null && !message.isEmpty()) {
            messages.add(message);
        }
        doGet(request, response); // Call doGet to redisplay the page with updated messages
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        out.println("<html>");
         for (String message : messages) {
            out.println("<li>" + message + "</li>");
        }
        out.println("<head><title>Chat Application</title></head>");
        out.println("<body>");
        out.println("<h1>Chat Application</h1>");
        if(flag){
            out.println("<h1>something wrong...</h1>");
        }
        out.println("<form action=\"ChatServlet\" method=\"post\">");
        out.println("<input type=\"text\" name=\"message\" placeholder=\"Enter your message\" />");
        out.println("<input type=\"submit\" value=\"Send\" />");
        out.println("</form>");
        out.println("<h2>Chat History</h2>");
        out.println("<ul>");
        for (String message : messages) {
            out.println("<li>" + message + "</li>");
        }
        out.println("</ul>");
        out.println("</body>");
        out.println("</html>");
        out.close();
    }
}
