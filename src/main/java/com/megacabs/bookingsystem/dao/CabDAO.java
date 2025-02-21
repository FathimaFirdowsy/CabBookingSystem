
package com.megacabs.bookingsystem.dao;

import com.megacabs.bookingsystem.models.Cab;
import com.megacabs.bookingsystem.db.DatabaseConnection;
import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CabDAO {
    public List<Cab> getAvailableCabs() {
        List<Cab> cabs = new ArrayList<>();
        String query = "SELECT * FROM Cab WHERE Status = 'Available'";

        try (Connection conn = DatabaseConnection.getConnection()) {
            if (conn == null) {
                throw new SQLException("Database connection is null!");
            }
            try (PreparedStatement stmt = conn.prepareStatement(query);
                 ResultSet rs = stmt.executeQuery()) {

                while (rs.next()) {
                   // Cab cab = new Cab(
                    //    rs.getInt("CabID"),
                    //    rs.getString("CabType"),
                      //  rs.getString("Model"),
                      //  rs.getString("Seats"),
                      //  rs.getDouble("FarePerKm"),
                     //   rs.getString("Description"),
                    //    rs.getString("CabImage"), 
                    //    rs.getString("Status")
                  //  );
                  //  cabs.add(cab);
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("Error fetching available cabs", e);
        }
        return cabs;
    }
}
