package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.db.DatabaseConnection;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import com.google.gson.JsonArray;
import com.google.gson.JsonObject;

@WebServlet(name = "GetCabModelsServlet", urlPatterns = {"/GetCabModelsServlet"})
public class GetCabModelsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        
        response.setHeader("Access-Control-Allow-Origin", "*"); // Allow all origins (you can restrict this for security purposes)
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        JsonObject jsonResponse = new JsonObject();
        JsonArray cabModelArray = new JsonArray();
        
        // Retrieve the cab models from the database
        try (Connection conn = DatabaseConnection.getConnection()) {
            String sql = "SELECT CabID, Model FROM Cab"; 
            PreparedStatement stmt = conn.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();
            
            while (rs.next()) {
                JsonObject cabModelObj = new JsonObject();
                cabModelObj.addProperty("CabID", rs.getInt("CabID"));
                cabModelObj.addProperty("Model", rs.getString("Model"));
                cabModelArray.add(cabModelObj);
            }

            // Set the response status and the array of cab models
            if (cabModelArray.size() > 0) {
                jsonResponse.addProperty("status", "success");
                jsonResponse.add("models", cabModelArray);
            } else {
                jsonResponse.addProperty("status", "error");
                jsonResponse.addProperty("message", "No cab models found.");
            }
        } catch (SQLException e) {
            jsonResponse.addProperty("status", "error");
            jsonResponse.addProperty("message", "Database error: " + e.getMessage());
            e.printStackTrace();
        }

        // Send the response as JSON
        PrintWriter out = response.getWriter();
        out.print(jsonResponse.toString());
        out.flush();
    }
}

