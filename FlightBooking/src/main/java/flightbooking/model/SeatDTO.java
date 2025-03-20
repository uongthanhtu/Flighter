/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.model;

/**
 *
 * @author ADMIN
 */
public class SeatDTO {
    private int seatID;
    private String seatNumber;
    private String fareClass;
    private String seatStatus;
    private int flightID;

    public SeatDTO() {
    }

    public SeatDTO( String seatNumber, String fareClass, String seatStatus, int flightID) {
        this.seatNumber = seatNumber;
        this.fareClass = fareClass;
        this.seatStatus = seatStatus;
        this.flightID = flightID;
    }

    public int getSeatID() {
        return seatID;
    }

    public void setSeatID(int seatID) {
        this.seatID = seatID;
    }

    public String getSeatNumber() {
        return seatNumber;
    }

    public void setSeatNumber(String seatNumber) {
        this.seatNumber = seatNumber;
    }

    public String getFareClass() {
        return fareClass;
    }

    public void setFareClass(String fareClass) {
        this.fareClass = fareClass;
    }

    public String getSeatStatus() {
        return seatStatus;
    }

    public void setSeatStatus(String seatStatus) {
        this.seatStatus = seatStatus;
    }

    public int getFlightID() {
        return flightID;
    }

    public void setFlightID(int flightID) {
        this.flightID = flightID;
    }

    
}
