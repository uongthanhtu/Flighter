/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.TicketDTO;
import flightbooking.utils.DBUtils;
import java.net.ConnectException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

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
}
