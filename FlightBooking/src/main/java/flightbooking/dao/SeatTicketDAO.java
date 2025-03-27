/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.SeatDTO;
import flightbooking.model.SeatTicketDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class SeatTicketDAO {
    public List<SeatTicketDTO> getListSeatByFlightID (int flightID ) {
        Connection conn = DBUtils.getConnection();
        SeatTicketDTO seat = null;
        List<SeatTicketDTO> seatlist = new ArrayList<SeatTicketDTO>();
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
                seat = new SeatTicketDTO();
                seat.setSeatID(rs.getInt("seatID"))  ;
                seat.setSeatNumber(rs.getString("seatNumber"));
                seat.setFareClass(rs.getString("fareClass"));
                seat.setSeatStatus(rs.getString("seatStatus"));
                seat.setFlightID(rs.getInt("flightID"));
                seat.setPrice(rs.getDouble("price"));
                seat.setPassengerName(getPassegerBySeatID(seat.getSeatID()));
                seatlist.add(seat);
                System.out.println(seat.getSeatID() + " - " + seat.getPrice());
            }
            conn.close();
        } catch (Exception e) {
            System.out.println( "Get list seat by flightID is error: " + e.getMessage());
        }
        return seatlist;
    }
    
    public String getPassegerBySeatID (int seatID){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " SELECT passengerName FROM ticket WHERE seatID = ? ";
            PreparedStatement ptm = conn.prepareStatement(sql);
            ptm.setInt(1,seatID);
            ResultSet rs = ptm.executeQuery();
            if(rs.next()){
                return rs.getString("passengerName");
            }
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
        return "";
    }
}
