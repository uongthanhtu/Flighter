/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.BookingDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Timestamp;

/**
 *
 * @author ADMIN
 */
public class BookingDAO {
    public boolean insertBooking (BookingDTO booking) {
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " INSERT INTO booking (bookingID , bookingStatus ,"
                    + " bookingDate , TotalPrice, customerID) VALUES ( ? , ? , ? , ? , ? ) " ;
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, booking.getBookingID());
            ps.setString(2, booking.getBookingStatus());
            ps.setTimestamp(3, Timestamp.valueOf(booking.getBookingDate()));
            ps.setDouble(4, booking.getTotalPrice());
            ps.setInt(5, booking.getCustomerID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Insert booking is error!! Details: " + e.getMessage() );
            return false;
        }
        return true;
    }
    
    public int getMaxBookingID (){
        Connection conn = DBUtils.getConnection();
        int maxid = 0;
        try {
            String sql = " SELECT MAX(bookingID) FROM booking ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery() ;
            if(rs.next()){
                maxid = rs.getInt(1);
            }
            conn.close();
        } catch (Exception e) {
            System.out.println("Get max booking id is error. Details:" + e.getMessage());
        }
        return maxid;
    }
    
    public void updateTotalPrice (int bookingID , double totalPrice) {
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " UPDATE booking SET TotalPrice = ? WHERE bookingID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setDouble(1, totalPrice);
            ps.setInt(2, bookingID);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Update total price, details: " + e.getMessage());
        }
    }
    
}
