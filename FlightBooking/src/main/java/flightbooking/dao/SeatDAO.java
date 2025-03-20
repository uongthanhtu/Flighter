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
    
    public List<Integer> getListSeatByFlightID (int flightID ) {
        Connection conn = DBUtils.getConnection();
        SeatDTO seat = null;
        List<Integer> seatlistid = new ArrayList<Integer>();
        try {
            String sql = " SELECT * FROM seat WHERE flightID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);;
            ps.setInt(1, flightID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                seat = new SeatDTO();
                seatlistid.add(rs.getInt("seatID"));
            }
            conn.close();
        } catch (Exception e) {
            System.out.println(e.getMessage());
        }
        return seatlistid;
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
}
