package com.megacabs.bookingsystem.models;

import java.sql.Timestamp;

public class BookingConfirmation {

    private int bookingConfirmID;
    private int userID;
    private String pickupLocation;
    private String dropLocation;
    private int cabID;
    private Timestamp bookingTime;
    private String offerCode;
    private String status;

    // Getters and Setters
    public int getBookingConfirmID() {
        return bookingConfirmID;
    }

    public void setBookingConfirmID(int bookingConfirmID) {
        this.bookingConfirmID = bookingConfirmID;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getPickupLocation() {
        return pickupLocation;
    }

    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }

    public String getDropLocation() {
        return dropLocation;
    }

    public void setDropLocation(String dropLocation) {
        this.dropLocation = dropLocation;
    }

    public int getCabID() {
        return cabID;
    }

    public void setCabID(int cabID) {
        this.cabID = cabID;
    }

    public Timestamp getBookingTime() {
        return bookingTime;
    }

    public void setBookingTime(Timestamp bookingTime) {
        this.bookingTime = bookingTime;
    }

    public String getOfferCode() {
        return offerCode;
    }

    public void setOfferCode(String offerCode) {
        this.offerCode = offerCode;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }
}
