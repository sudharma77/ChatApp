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

/**
 *
 * @author hp
 */
@WebServlet(name = "ChatServlet", urlPatterns = {"/ChatServlet"})
public class ChatServletServer extends HttpServlet {
    ChatServletServer(){
        
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
