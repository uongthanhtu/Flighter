package flightbooking.dao;

import flightbooking.model.PaymentDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author ADMIN
 */
public class PaymentDAO {
    public boolean insert (PaymentDTO payment){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " INSERT INTO payment VALUES ( ?, ? , ?, ? , ?) ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, payment.getPaymentID());
            ps.setDouble(2, payment.getAmount());
            ps.setString(3, payment.getPaymentMethod());
            ps.setString(4, payment.getPaymentStatus());
            ps.setInt(5, payment.getBookingID());
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Insert payment is error, Details: " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public boolean updatePaymentStatusByBookingID (int bookingid, String paymentStatus){
        Connection conn = DBUtils.getConnection();
        try {
            String sql = " UPDATE payment SET paymentStatus = ? WHERE bookingID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, paymentStatus);
            ps.setInt(2, bookingid);
            ps.executeUpdate();
            conn.close();
        } catch (Exception e) {
            System.out.println("Update status payment is error. Details: " + e.getMessage());
            return false;
        }
        return true;
    }
    
    public int getMaxPaymentID(){
        Connection conn = DBUtils.getConnection();
        int maxID = 0;
        try {
            String sql = " SELECT MAX(paymentID) FROM payment ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                if(!rs.wasNull()){
                    maxID = rs.getInt(1);
                }
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Get Max PaymentID Errors , Details: " + ex.getMessage());
        }
        return maxID;
    }
}
