
package com.megacabs.bookingsystem.servlets;

import com.megacabs.bookingsystem.services.CabService;
import com.google.gson.Gson;
import com.megacabs.bookingsystem.models.Cab;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@WebServlet(name = "CabDetailsServlet", urlPatterns = {"/CabDetailsServlet"})
public class CabDetailsServlet extends HttpServlet {

 /*   private CabService cabService = new CabService();

protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Set the CORS headers to allow cross-origin requests
        response.setHeader("Access-Control-Allow-Origin", "*"); // Allow all origins (you can restrict this for security purposes)
        response.setHeader("Access-Control-Allow-Methods", "GET, POST");
        response.setHeader("Access-Control-Allow-Headers", "Content-Type");

        
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        List<Cab> cabs = cabService.fetchAvailableCabs();
        List<Map<String, Object>> filteredCabs = new ArrayList<>();

        for (Cab cab : cabs) {
            Map<String, Object> cabDetails = new HashMap<>();
            cabDetails.put("cabType", cab.getCabType());  
            cabDetails.put("model", cab.getModel());
            cabDetails.put("seats", cab.getSeats());
            cabDetails.put("description", cab.getDescription());

            // Convert image bytes to Base64
            byte[] imageData = cab.getCabImage();
            if (imageData != null && imageData.length > 0) {
                String base64Image = "data:image/jpeg;base64," + java.util.Base64.getEncoder().encodeToString(imageData);
                cabDetails.put("cabImage", base64Image);  // Corrected for JPG format
            } else {
                cabDetails.put("cabImage", "https://via.placeholder.com/150"); // Placeholder if no image
            }


            filteredCabs.add(cabDetails);
        }

        String json = new Gson().toJson(filteredCabs);
        try (PrintWriter out = response.getWriter()) {
            out.write(json);
        }
    }*/
}
