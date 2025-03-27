/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.model;

import java.time.LocalDateTime;

/**
 *
 * @author ADMIN
 */
public class TicketHistoryDTO {
    private String name;
    private LocalDateTime departureDate;
    private LocalDateTime arrivalDate;
    private String departureArrival;
    private String seatNumber;
    private String flightNumber;
    private double price;
    private String status;
    private String fareClass;
    private String ticketCode;
    
    public TicketHistoryDTO() {
    }

    public TicketHistoryDTO(String name, LocalDateTime departureDate, String departureArrival, String seatNumber, String flightNumber, double price, String status, String fareClass) {
        this.name = name;
        this.departureDate = departureDate;
        this.departureArrival = departureArrival;
        this.seatNumber = seatNumber;
        this.flightNumber = flightNumber;
        this.price = price;
        this.status = status;
        this.fareClass = fareClass;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public LocalDateTime getDepartureDate() {
        return departureDate;
    }

    public void setDepartureDate(LocalDateTime departureDate) {
        this.departureDate = departureDate;
    }

    public String getDepartureArrival() {
        return departureArrival;
    }

    public void setDepartureArrival(String departureArrival) {
        this.departureArrival = departureArrival;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getFareClass() {
        return fareClass;
    }

    public void setFareClass(String fareClass) {
        this.fareClass = fareClass;
    }

    public LocalDateTime getArrivalDate() {
        return arrivalDate;
    }

    public void setArrivalDate(LocalDateTime arrivalDate) {
        this.arrivalDate = arrivalDate;
    }

    public String getTicketCode() {
        return ticketCode;
    }

    public void setTicketCode(String ticketCode) {
        this.ticketCode = ticketCode;
    }
    
    
    
    
    
}
