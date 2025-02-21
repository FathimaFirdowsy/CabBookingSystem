
package com.megacabs.bookingsystem.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import com.google.gson.Gson;

@WebServlet(name = "AdminLoginServlet", urlPatterns = {"/AdminLoginServlet"})
public class AdminLoginServlet extends HttpServlet {

    private static final String ADMIN_USERNAME = "admin";
    private static final String ADMIN_PASSWORD = "admin123"; 

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Get the username and password parameters from the login form
        String username = request.getParameter("username");
        String password = request.getParameter("password");

        // Validate the credentials (use secure validation in production)
        boolean isValid = username.equals(ADMIN_USERNAME) && password.equals(ADMIN_PASSWORD);

        // If valid credentials, create a session and redirect
        if (isValid) {
            HttpSession session = request.getSession();
            session.setAttribute("admin", username);  // Store the username in the session for later use

            // Redirect to the admin dashboard
            response.sendRedirect("Admin/admin_dashboard.jsp");  // Redirecting after successful login
        } else {
            // If invalid credentials, send an error response
            response.sendRedirect("Admin/admin_login.jsp?error= Invalid username or password");
        }
    }

}