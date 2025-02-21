
package com.megacabs.bookingsystem.servlets;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import com.megacabs.bookingsystem.db.DatabaseConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;


@WebServlet(name = "SubmitQueryServlet", urlPatterns = {"/SubmitQueryServlet"})
public class SubmitQueryServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Retrieve form parameters
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String message = request.getParameter("message");

        Connection conn = null;
        PreparedStatement pstmt = null;

        try {
            // Get database connection
            conn = DatabaseConnection.getConnection();

            // SQL query to insert user query
            String sql = "INSERT INTO Query (SenderName, Email, QueryText) VALUES (?, ?, ?)";
            pstmt = conn.prepareStatement(sql);
            pstmt.setString(1, name);
            pstmt.setString(2, email);
            pstmt.setString(3, message);

            // Execute query
            int rowsInserted = pstmt.executeUpdate();

            if (rowsInserted > 0) {
                response.sendRedirect("help.jsp?success=Your query has been submitted successfully.");
            } else {
                response.sendRedirect("help.jsp?error=Failed to submit your query.");
            }

        } catch (SQLException e) {
            e.printStackTrace();
            response.sendRedirect("help.jsp?error=Database error! Please try again later.");
        } finally {
            try {
                if (pstmt != null) pstmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
