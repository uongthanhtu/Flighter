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
public class TicketDTO {
     private int ticketID;
    private LocalDateTime issuedDate;
    private String ticketCode; 
    private double ticketPrice;
    private String ticketStatus; 
    private int bookingID; 
    private int seatID; 
    private String passengerName;
    private String passengerPhone;

    public TicketDTO() {
    }

    public TicketDTO(int ticketID, LocalDateTime issuedDate, String ticketCode, double ticketPrice, String ticketStatus, int bookingID, int seatID, String passengerName, String passengerPhone) {
        this.ticketID = ticketID;
        this.issuedDate = issuedDate;
        this.ticketCode = ticketCode;
        this.ticketPrice = ticketPrice;
        this.ticketStatus = ticketStatus;
        this.bookingID = bookingID;
        this.seatID = seatID;
        this.passengerName = passengerName;
        this.passengerPhone = passengerPhone;
    }

    public int getTicketID() {
        return ticketID;
    }

    public LocalDateTime getIssuedDate() {
        return issuedDate;
    }

    public void setIssuedDate(LocalDateTime issuedDate) {
        this.issuedDate = issuedDate;
    }

    public String getTicketCode() {
        return ticketCode;
    }

    public void setTicketCode(String ticketCode) {
        this.ticketCode = ticketCode;
    }

    public double getTicketPrice() {
        return ticketPrice;
    }

    public void setTicketPrice(double ticketPrice) {
        this.ticketPrice = ticketPrice;
    }

    public String getTicketStatus() {
        return ticketStatus;
    }

    public void setTicketStatus(String ticketStatus) {
        this.ticketStatus = ticketStatus;
    }

    public int getBookingID() {
        return bookingID;
    }

    public void setBookingID(int bookingID) {
        this.bookingID = bookingID;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public String getPassengerName() {
        return passengerName;
    }

    public void setPassengerName(String passengerName) {
        this.passengerName = passengerName;
    }

    public String getPassengerPhone() {
        return passengerPhone;
    }

    public void setPassengerPhone(String passengerPhone) {
        this.passengerPhone = passengerPhone;
    }

    public void setTicketID(int ticketID) {
        this.ticketID = ticketID;
    }
}
