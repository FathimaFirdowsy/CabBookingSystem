package com.megacabs.bookingsystem.services;

import com.megacabs.bookingsystem.dao.CabDAO;
import com.megacabs.bookingsystem.models.Cab;
import java.util.List;

public class CabService {
    private CabDAO cabDAO = new CabDAO();

    public List<Cab> fetchAvailableCabs() {
        return cabDAO.getAvailableCabs();
    }
}