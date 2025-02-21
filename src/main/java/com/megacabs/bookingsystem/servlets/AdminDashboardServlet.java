
package com.megacabs.bookingsystem.servlets;

import java.io.IOException;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author USER
 */
@WebServlet(name = "AdminDashboardServlet", urlPatterns = {"/AdminDashboardServlet"})
public class AdminDashboardServlet extends HttpServlet {
   protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        // Check if session exists and admin is logged in
        boolean isAuthenticated = (session != null && session.getAttribute("admin") != null);

        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Return authentication status
        response.getWriter().write("{\"authenticated\": " + isAuthenticated + "}");
    }
}
