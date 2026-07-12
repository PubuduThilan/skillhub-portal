package com.duskdev.skillhub.servlet;

import com.duskdev.skillhub.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletContext;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class LoginServlet extends HttpServlet {
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession httpSession = request.getSession(false);

        if (httpSession != null && httpSession.getAttribute("user") !=null){
            response.sendRedirect(request.getContextPath() + "/portal/dashboard");

            return;
        }

        RequestDispatcher dispatcher = request.getRequestDispatcher("/login.jsp");
        dispatcher.forward(request,response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        String email = request.getParameter("email");
        String password = request.getParameter("password");

        if(email == null || email.isBlank() || password ==null || password.isBlank()){
            request.setAttribute("error","Email and Password are required.");

            RequestDispatcher dispatcher= request.getRequestDispatcher("/login.jsp");
            dispatcher.forward(request,response);

            return;
        }

        ServletContext context = getServletContext();

        List<User> users = (List<User>) context.getAttribute("users");

        User authenticatedUser = null;

        for (User user: users){

            if (user.getEmail().equalsIgnoreCase(email.trim()) && user.getPassword().equals(password)){
                authenticatedUser = user;
                break;
            }
        }

        if (authenticatedUser == null){

            request.setAttribute(
                    "error",
                    "Invalid email address or password."
            );

            request.getRequestDispatcher("/login.jsp").forward(request,response);

            return;
        }

        HttpSession httpSession = request.getSession(true);

        httpSession.setAttribute("user",authenticatedUser);
        httpSession.setAttribute("role",authenticatedUser.getRole());

        httpSession.setMaxInactiveInterval(60*45);

        response.sendRedirect(
                request.getContextPath() + "/portal/dashboard"
        );
    }
}
