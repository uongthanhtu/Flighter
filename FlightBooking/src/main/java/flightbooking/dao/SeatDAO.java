/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.SeatDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SeatDAO {
    public boolean insertSeat(SeatDTO seat){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " INSERT INTO seat (seatID, seatNumber, fareClass, seatStatus, flightID ) "
                + "VALUES ( ? , ? , ? , ? , ? )" ;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, seat.getSeatID());
            ps.setString(2, seat.getSeatNumber());
            ps.setString(3, seat.getFareClass());
            ps.setString(4, seat.getSeatStatus());
            ps.setInt(5, seat.getFlightID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }
    public int getMaxSeatID(){
        Connection conn = DBUtils.getConnection();
        int maxID = 0;
        try {
            String sql = " SELECT MAX(seatID) FROM seat ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                if(!rs.wasNull()){
                    maxID = rs.getInt(1);
                }
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return maxID;
    }
    
    public List<Integer> getListSeatIDByFlightID (int flightID ) {
        Connection conn = DBUtils.getConnection();
        SeatDTO seat = null;
        List<Integer> seatlistid = new ArrayList<Integer>();
        try {
            String sql = " SELECT * FROM seat WHERE flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);;
            ps.setInt(1, flightID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                seatlistid.add(rs.getInt("seatID"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return seatlistid;
    }
    
    public List<SeatDTO> getListSeatByFlightID (int flightID ) {
        Connection conn = DBUtils.getConnection();
        SeatDTO seat = null;
        List<SeatDTO> seatlist = new ArrayList<SeatDTO>();
        try {
            String sql = "SELECT s.seatID, s.seatNumber, s.fareClass, s.seatStatus, s.flightID , " +
                     "CASE WHEN s.fareClass = 'Business' THEN f.businessPrice " +
                     " WHEN s.fareClass = 'Economy' THEN f.economyPrice " +
                     " END AS price " +
                     " FROM seat s " +
                     " JOIN flight f ON s.flightID = f.flightID " +
                     " WHERE s.flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);;
            ps.setInt(1, flightID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                seat = new SeatDTO();
                seat.setSeatID(rs.getInt("seatID"))  ;
                seat.setSeatNumber(rs.getString("seatNumber"));
                seat.setFareClass(rs.getString("fareClass"));
                seat.setSeatStatus(rs.getString("seatStatus"));
                seat.setFlightID(rs.getInt("flightID"));
                seat.setPrice(rs.getDouble("price"));
                seatlist.add(seat);
                System.out.println(seat.getSeatID() + " - " + seat.getPrice());
            }
            conn.close();
        } catch (Exception e) {
            System.out.println( "Get list seat by flightID is error: " + e.getMessage());
        }
        return seatlist;
    }
    
    public SeatDTO getSeatBySeatID (int seatID ) {
        Connection conn = DBUtils.getConnection();
        SeatDTO seat = null;
        try {
            String sql = "SELECT s.seatID, s.seatNumber, s.fareClass, s.seatStatus, s.flightID , " +
                     "CASE WHEN s.fareClass = 'Business' THEN f.businessPrice " +
                     " WHEN s.fareClass = 'Economy' THEN f.economyPrice " +
                     " END AS price " +
                     " FROM seat s " +
                     " JOIN flight f ON s.flightID = f.flightID " +
                     " WHERE s.seatID = ? ";;
            PreparedStatement ps = conn.prepareStatement(sql);;
            ps.setInt(1, seatID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                seat = new SeatDTO();
                seat.setSeatID(seatID);
                seat.setSeatNumber(rs.getString("seatNumber"));
                seat.setFareClass(rs.getString("fareClass"));
                seat.setSeatStatus(rs.getString("seatStatus"));
                seat.setFlightID(rs.getInt("flightID"));
                seat.setPrice(rs.getDouble("price"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Get seat by seatid , Details : " + e.getMessage());
        }
        return seat;
    }
    
    public int getMinSeatIDByFlightID (int flightID){
        Connection conn = DBUtils.getConnection();
        int minID = 0;
        try {
            String sql = " SELECT MIN(seatID) FROM seat WHERE flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, flightID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()) {
                if(!rs.wasNull()){
                    minID = rs.getInt(1);
                }
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return minID;
    }
    
    public boolean deleteSeat (List<Integer> listid) {
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " DELETE FROM seat WHERE seatID in ( ";
            int size = listid.size();
            sql += " ? ";
            size--;
            for (int i = 1 ; i <= size; i ++) {
                sql += " , ? ";
            }
            sql += " ) ";
            PreparedStatement ps = conn.prepareStatement(sql);
            int indexcount = 1;
            for (Integer id : listid) {
                ps.setInt(indexcount++, id);
            }
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
            return false;
        }
        return true;
    }
    
    public LocalDateTime getArrivalTimeBySeatId (int seatID){
        Connection conn = DBUtils.getConnection();
        LocalDateTime time = null;
        try {
            String sql  = " SELECT arrivalTime from flight f JOIN seat s ON f.flightID = s.flightID WHERE seatID = ?  ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, seatID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                time = rs.getTimestamp(1).toLocalDateTime();
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Get Arrival Time is error, Details : " + e.getMessage());
        }
        return time;
    }
    
    public String getFlightNumberAndSeatNumber (int seatID){
        Connection conn = DBUtils.getConnection();
        String flightseat = null;
        try {
            String sql = " SELECT flightNumber + seatNumber from flight f JOIN seat s ON f.flightID = s.flightID WHERE seatID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, seatID);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                flightseat = rs.getString(1);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Get Flight, Seat number is error, Details : " + e.getMessage());
        }
        return flightseat;
    }
    
    public void updateSeatStatus (int seatID, String status){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " UPDATE seat SET seatStatus = ? WHERE seatID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, seatID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Update status is error, Details: " + e.getMessage());
        }
    }
}
