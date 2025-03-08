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
public class AirportDTO {
    private int airportID ;
    private int airportName;
    private int city;
    private int country;

    public AirportDTO() {
    }

    public AirportDTO(int airportID, int airportName, int city, int country) {
        this.airportID = airportID;
        this.airportName = airportName;
        this.city = city;
        this.country = country;
    }

    public int getAirportID() {
        return airportID;
    }

    public void setAirportID(int airportID) {
        this.airportID = airportID;
    }

    public int getAirportName() {
        return airportName;
    }

    public void setAirportName(int airportName) {
        this.airportName = airportName;
    }

    public int getCity() {
        return city;
    }

    public void setCity(int city) {
        this.city = city;
    }

    public int getCountry() {
        return country;
    }

    public void setCountry(int country) {
        this.country = country;
    }

    

}
