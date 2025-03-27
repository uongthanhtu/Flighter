/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.TicketDTO;
import flightbooking.utils.DBUtils;
import java.net.ConnectException;
import java.sql.*;

/**
 *
 * @author ADMIN
 */
public class TicketDAO {
    public boolean insertTicket (TicketDTO ticket){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " INSERT INTO ticket "
                    + "(ticketID, issuedDate, TicketCode, ticketPrice, "
                    + " ticketStatus, bookingID, seatID, passengerName, passengerPhone) "
                    + " VALUES ( ? , ? , ? , ? , ? , ? , ? , ? , ? ) ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, ticket.getTicketID());
            ps.setTimestamp(2, Timestamp.valueOf(ticket.getIssuedDate()));
            ps.setString(3, ticket.getTicketCode());
            ps.setDouble(4, ticket.getTicketPrice());
            ps.setString(5, ticket.getTicketStatus());
            ps.setInt(6, ticket.getBookingID());
            ps.setInt(7, ticket.getSeatID());
            ps.setString(8, ticket.getPassengerName());
            ps.setString(9, ticket.getPassengerPhone());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Insert ticket is error! Details : " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public int getMaxTicketID (){
        Connection conn = DBUtils.getConnection();
        int maxid = 0;
        try {
            String sql = " SELECT MAX(ticketID) FROM ticket ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery() ;
            if(rs.next()){
                maxid = rs.getInt(1);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Get max ticketid is error, Details: " + e.getMessage());
        }
        return maxid;
    }
    
    public void updateTicketStatus (int ticketID, String status){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " UPDATE ticket SET ticketStatus = ? WHERE ticketID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, status);
            ps.setInt(2, ticketID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Update ticket status is error, Details: " + e.getMessage());
        }
    }
    public String getPassegerBySeatID (String seatID){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " SELECT passengerName FROM ticket WHERE seatID = ? ";
            PreparedStatement ptm = conn.prepareStatement(sql);
            ptm.setString(1,seatID);
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
