/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.servlet;

import jakarta.servlet.RequestDispatcher;
import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author hp
 */
@WebServlet(name = "Server", urlPatterns = {"/Server"})
public class Server extends HttpServlet {

    private static final long serialVersionUID = 1L;
    private static List<String> messages = new ArrayList<>();

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        if (messages.isEmpty()) {
            out.print("");
        } else {
            String message = messages.remove(0);
            request.setAttribute("message", message);
            RequestDispatcher dispatcher = request.getRequestDispatcher("client.jsp");
            dispatcher.forward(request, response);
            out.print(message);
        }
        out.flush();
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String message = request.getParameter("message");
        if (message != null && !message.isEmpty()) {
            messages.add(message);
        }
        doGet(request, response);
    }
}
