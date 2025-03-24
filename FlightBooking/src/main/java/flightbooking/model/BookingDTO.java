/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.model;

import java.sql.Date;
import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class BookingDTO {
    private int bookingID;
    private String bookingStatus;
    private LocalDateTime bookingDate;
    private double totalPrice;
    private int customerID;

    public BookingDTO() {
    }

    public BookingDTO(int bookingID, String bookingStatus, LocalDateTime bookingDate, double totalPrice, int customerID) {
        this.bookingID = bookingID;
        this.bookingStatus = bookingStatus;
        this.bookingDate = bookingDate;
        this.totalPrice = totalPrice;
        this.customerID = customerID;
    }

    

    public int getBookingID() {
        return bookingID;
    }

    public String getBookingStatus() {
        return bookingStatus;
    }

    public void setBookingStatus(String bookingStatus) {
        this.bookingStatus = bookingStatus;
    }

    public LocalDateTime getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(LocalDateTime bookingDate) {
        this.bookingDate = bookingDate;
    }

    public double getTotalPrice() {
        return totalPrice;
    }

    public void setTotalPrice(double totalPrice) {
        this.totalPrice = totalPrice;
    }

    public int getCustomerID() {
        return customerID;
    }

    public void setCustomerID(int customerID) {
        this.customerID = customerID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }
}
