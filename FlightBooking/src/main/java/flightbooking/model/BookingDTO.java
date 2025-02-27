/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.model;

import java.sql.Date;

/**
 *
 * @author ADMIN
 */
public class BookingDTO {
    private int bookingID;
    private String bookingStatus;
    private Date bookingDate;
    private double totalPrice;
    private int customerID;

    public BookingDTO() {
    }

    public BookingDTO( String bookingStatus, Date bookingDate, double totalPrice, int customerID) {
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

    public Date getBookingDate() {
        return bookingDate;
    }

    public void setBookingDate(Date bookingDate) {
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

}
