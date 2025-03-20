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
public class FlightDTO {
    private int flightID;
    private String flightNumber;
    private String airline;
    private int departureID;
    private int arrivalID;
    private LocalDateTime departureTime;
    private LocalDateTime arrivalTime;
    private int totalSeats;
    private double businessPrice;
    private double economyPrice;
    private String aircraftType;
    private float baggageAllow;
    private String flightStatus;
    private int adminID;

    public FlightDTO() {
    }

    public FlightDTO(int flightID, String flightNumber, String airline, int departureID, int arrivalID, LocalDateTime departureTime, LocalDateTime arrivalTime, int totalSeats, double businessPrice, double economyPrice, String aircraftType, float baggageAllow, String flightStatus, int adminID) {
        this.flightID = flightID;
        this.flightNumber = flightNumber;
        this.airline = airline;
        this.departureID = departureID;
        this.arrivalID = arrivalID;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.totalSeats = totalSeats;
        this.businessPrice = businessPrice;
        this.economyPrice = economyPrice;
        this.aircraftType = aircraftType;
        this.baggageAllow = baggageAllow;
        this.flightStatus = flightStatus;
        this.adminID = adminID;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    public String getFlightNumber() {
        return flightNumber;
    }

    public void setFlightNumber(String flightNumber) {
        this.flightNumber = flightNumber;
    }

    public String getAirline() {
        return airline;
    }

    public void setAirline(String airline) {
        this.airline = airline;
    }

    public int getDepartureID() {
        return departureID;
    }

    public void setDepartureID(int departureID) {
        this.departureID = departureID;
    }

    public int getArrivalID() {
        return arrivalID;
    }

    public void setArrivalID(int arrivalID) {
        this.arrivalID = arrivalID;
    }

    public LocalDateTime getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(LocalDateTime departureTime) {
        this.departureTime = departureTime;
    }

    public LocalDateTime getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(LocalDateTime arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public int getTotalSeats() {
        return totalSeats;
    }

    public void setTotalSeats(int totalSeats) {
        this.totalSeats = totalSeats;
    }

    public double getBusinessPrice() {
        return businessPrice;
    }

    public void setBusinessPrice(double businessPrice) {
        this.businessPrice = businessPrice;
    }

    public double getEconomyPrice() {
        return economyPrice;
    }

    public void setEconomyPrice(double economyPrice) {
        this.economyPrice = economyPrice;
    }

    public String getAircraftType() {
        return aircraftType;
    }

    public void setAircraftType(String aircraftType) {
        this.aircraftType = aircraftType;
    }

    public float getBaggageAllow() {
        return baggageAllow;
    }

    public void setBaggageAllow(float baggageAllow) {
        this.baggageAllow = baggageAllow;
    }

    public String getFlightStatus() {
        return flightStatus;
    }

    public void setFlightStatus(String flightStatus) {
        this.flightStatus = flightStatus;
    }

    public int getAdminID() {
        return adminID;
    }

    public void setAdminID(int adminID) {
        this.adminID = adminID;
    }

    

}
