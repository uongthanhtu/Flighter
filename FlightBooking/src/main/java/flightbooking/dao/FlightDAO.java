/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.FlightDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.util.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class FlightDAO {
    
    public boolean insertFlight (FlightDTO flight) {
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " INSERT INTO flight "
                    + "(airline, departureId, arrivalId, departuretTime, arrivalTime, totalSeats, businessPrice, economyPrice, aircraftType, baggageAllow ,flightStatus, flightNumber , adminID, flightID) "
                    + " VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? , ? )  ";
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
            ps.setString(12, flight.getFlightNumber());
            ps.setInt(13, flight.getAdminID());
            ps.setInt(14, flight.getFlightID());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Insert Flight Error, Details:" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public int getMaxFlightID(){
        Connection conn = DBUtils.getConnection();
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
    
    public boolean updateFlight (FlightDTO flight) {
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " UPDATE flight SET airline = ? , departureId = ? , "
                    + " arrivalId = ?, departuretTime = ? , arrivalTime = ?, "
                    + " totalSeats = ?, businessPrice = ? , economyPrice = ?, "
                    + " aircraftType = ?, baggageAllow = ? , flightStatus = ? , "
                    + " flightNumber = ? , adminID = ? WHERE flightID = ? ";
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
            ps.setString(12, flight.getFlightNumber());
            ps.setInt(13, flight.getAdminID());
            ps.setInt(14, flight.getFlightID());
            ps.executeUpdate();
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Insert Flight Error, Details:" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public FlightDTO loadFlightById (int flightId){
        Connection conn = DBUtils.getConnection();
        FlightDTO flight = null;
        try {
            String sql = " SELECT * FROM flight WHERE flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, flightId);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                flight = new FlightDTO();
                flight.setFlightID(rs.getInt("flightID"));
                flight.setAirline(rs.getString("airline"));
                flight.setDepartureTime(rs.getTimestamp("departuretTime").toLocalDateTime());
                flight.setArrivalTime(rs.getTimestamp("arrivalTime").toLocalDateTime());
                flight.setTotalSeats(rs.getInt("totalSeats"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setAircraftType(rs.getString("aircraftType"));
                flight.setBaggageAllow(rs.getFloat("baggageAllow"));
                flight.setFlightStatus(rs.getString("flightStatus"));
                flight.setDepartureID(rs.getInt("departureId"));
                flight.setArrivalID(rs.getInt("arrivalId"));
                flight.setFlightNumber(rs.getString("flightNumber"));
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Load the flight by id is error, Details:" + ex.getMessage());
            return null;
        }
        return flight;
    }
    
    public List<FlightDTO> loadAllFlightList (){
        Connection conn = DBUtils.getConnection();
        List<FlightDTO> listFlight = new ArrayList<FlightDTO>();
        FlightDTO flight = null;
        try {
            String sql = " SELECT * FROM flight ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                flight = new FlightDTO();
                flight.setFlightID(rs.getInt("flightID"));
                flight.setAirline(rs.getString("airline"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureTime(rs.getTimestamp("departuretTime").toLocalDateTime());
                flight.setArrivalTime(rs.getTimestamp("arrivalTime").toLocalDateTime());
                flight.setTotalSeats(rs.getInt("totalSeats"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setAircraftType(rs.getString("aircraftType"));
                flight.setBaggageAllow(rs.getFloat("baggageAllow"));
                flight.setFlightStatus(rs.getString("flightStatus"));
                flight.setDepartureID(rs.getInt("departureId"));
                flight.setArrivalID(rs.getInt("arrivalId"));
                listFlight.add(flight);
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Load all flight is error, Details:" + ex.getMessage());
            return null;
        }
        return listFlight;
    }
    
    public List<FlightDTO> loadAllFlightListByAirportIDAndTime (int departureID
                                    , int arrivalID, Date departurtime){
        Connection conn = DBUtils.getConnection();
        List<FlightDTO> listFlight = new ArrayList<FlightDTO>();
        FlightDTO flight = null;
        int counindex = 1;
        try {
            
            String sql = " SELECT * FROM flight WHERE 1=1 ";
            if(departureID > 0){
                sql += " AND departureId = ? ";
            }
            if(arrivalID > 0 ){
                sql += " AND arrivalId = ? ";
            }
            if(departurtime != null){
                sql += " AND CONVERT(DATE, departuretTime) = ? " ;
            }
            PreparedStatement ps = conn.prepareStatement(sql);
            if(departureID > 0){
                ps.setInt(counindex++, departureID);
            }
            if(arrivalID > 0 ){
                ps.setInt(counindex++, arrivalID);
            }
            if(departurtime != null){
                ps.setDate(counindex++,(java.sql.Date) departurtime);
            }
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                flight = new FlightDTO();
                flight.setFlightID(rs.getInt("flightID"));
                flight.setAirline(rs.getString("airline"));
                flight.setFlightNumber(rs.getString("flightNumber"));
                flight.setDepartureTime(rs.getTimestamp("departuretTime").toLocalDateTime());
                flight.setArrivalTime(rs.getTimestamp("arrivalTime").toLocalDateTime());
                flight.setTotalSeats(rs.getInt("totalSeats"));
                flight.setBusinessPrice(rs.getDouble("businessPrice"));
                flight.setEconomyPrice(rs.getDouble("economyPrice"));
                flight.setAircraftType(rs.getString("aircraftType"));
                flight.setBaggageAllow(rs.getFloat("baggageAllow"));
                flight.setFlightStatus(rs.getString("flightStatus"));
                flight.setDepartureID(rs.getInt("departureId"));
                flight.setArrivalID(rs.getInt("arrivalId"));
                listFlight.add(flight);
            }
            conn.close();
        } catch (Exception ex) {
            System.out.println("Load all flight is error, Details:" + ex.getMessage());
            return null;
        }
        return listFlight;
    }
    
    public boolean deleteFlight (int flightID){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " DELETE FROM flight WHERE flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, flightID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            e.getMessage();
            return false;
        }
        return true;
    }
   
}
