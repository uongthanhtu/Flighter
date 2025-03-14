/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.FlightDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class FlightDAO {
    Connection conn = DBUtils.getConnection();
    public boolean insertFlight (FlightDTO flight) {
        try {
            String sql = " INSERT INTO flight "
                    + "(airline, departureId, arrivalId, departuretTime, arrivalTime, totalSeats, businessPrice, economyPrice, aircraftType, baggageAllow ,flightStatus, adminID) "
                    + "VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )  ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, flight.getAirline());
            ps.setInt(2, flight.getArrivalID());
            ps.setInt(3, flight.getDepartureID());
            ps.setTimestamp(4, Timestamp.valueOf(flight.getDepartureTime()));
            ps.setTimestamp(5, Timestamp.valueOf(flight.getArrivalTime()));
            ps.setInt(6, flight.getTotalSeats());
            ps.setDouble(7, flight.getBusinessPrice());
            ps.setDouble(8, flight.getEconomyPrice());
            ps.setString(9, flight.getAircraftType());
            ps.setFloat(10, flight.getBaggageAllow());
            ps.setString(11, flight.getFlightStatus());
            ps.setInt(12, flight.getAdminID());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Insert Flight Error, Details:" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public int getMaxFlightID(){
        int maxID = 0;
        try {
            String sql = " SELECT MAX(flightID) FROM flight ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(!rs.wasNull()){
                    maxID = rs.getInt(1);
                }
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Get Max FlightID Errors , Details: " + ex.getMessage());
        }
        return maxID;
    }
    
    
    
}
