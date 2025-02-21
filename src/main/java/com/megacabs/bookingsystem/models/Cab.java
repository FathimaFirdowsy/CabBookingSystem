package com.megacabs.bookingsystem.models;

public class Cab {
    private int cabID;
    private String cabType;
    private String model;
    private String seats;
    private String description;

    // Getters and Setters
    public int getCabID() { return cabID; }
    public void setCabID(int cabID) { this.cabID = cabID; }

    public String getCabType() { return cabType; }
    public void setCabType(String cabType) { this.cabType = cabType; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getSeats() { return seats; }
    public void setSeats(String seats) { this.seats = seats; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }
}
