/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.TicketHistoryDTO;
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
public class TicketHistoryDAO {
    public List<TicketHistoryDTO> getAllTicketHistoryByUserID (int userID, String pName, String tStatus){
        Connection conn = DBUtils.getConnection();
        List<TicketHistoryDTO> lists = new ArrayList<TicketHistoryDTO>();
        TicketHistoryDTO ticketHis = null;
        try {
            String sql = "  SELECT t.passengerName, f.departuretTime, ad.name + ', ' + ad.city + ', ' + ad.country, \n" +
                            " aa.name + ', ' + aa.city + ', ' + aa.country,  \n" +
                            " s.seatNumber, f.flightNumber, t.ticketPrice, t.ticketStatus, s.fareClass, t.TicketCode\n" +
                            " FROM users u\n" +
                            " JOIN booking b ON u.userID = b.customerID \n" +
                            " JOIN ticket t ON b.bookingID = t.bookingID\n" +
                            " JOIN seat s ON t.seatID = s.seatID\n" +
                            " JOIN flight f ON f.flightID = s.flightID\n" +
                            " JOIN airport ad ON ad.airportID = f.departureId\n" +
                            " JOIN airport aa ON aa.airportID = f.arrivalId\n" +
                            " WHERE u.userID = ?  ";
            if(pName != null && !pName.isEmpty()){
                sql += " AND t.passengerName LIKE ? ";
            }
            if(tStatus != null && !tStatus.isEmpty()){
                sql += " AND t.ticketStatus = ? ";
            }
            sql += " ORDER BY b.bookingID DESC ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, userID);
            int index = 2;
            if(pName != null && !pName.isEmpty()){
                ps.setString(index++, "%"+pName+"%");
            }
            if(tStatus != null && !tStatus.isEmpty()){
                ps.setString(index++, tStatus);
            }
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ticketHis = new TicketHistoryDTO();
                ticketHis.setName(rs.getString(1));
                ticketHis.setDepartureDate(rs.getTimestamp(2).toLocalDateTime());
                ticketHis.setDepartureArrival(rs.getString(3) + " - " + rs.getString(4));
                ticketHis.setSeatNumber(rs.getString(5));
                ticketHis.setFlightNumber(rs.getString(6));
                ticketHis.setPrice(rs.getDouble(7));
                ticketHis.setStatus(rs.getString(8));
                ticketHis.setFareClass(rs.getString(9));
                ticketHis.setTicketCode(rs.getString(10));
                lists.add(ticketHis);
            }
            conn.close();
        } catch (Exception e) {
        System.out.println("Get all ticket history By userid, Details: " + e.getMessage());
        }
        return lists;
    }
    
    public List<TicketHistoryDTO> getAllTicketHistoryByBookingID (int bookingID){
        Connection conn = DBUtils.getConnection();
        List<TicketHistoryDTO> lists = new ArrayList<TicketHistoryDTO>();
        TicketHistoryDTO ticketHis = null;
        try {
            String sql = "  SELECT t.passengerName, f.departuretTime, ad.name + ', ' + ad.city + ', ' + ad.country, \n" +
                            " aa.name + ', ' + aa.city + ', ' + aa.country,  \n" +
                            " s.seatNumber, f.flightNumber, t.ticketPrice, t.ticketStatus, s.fareClass, f.arrivalTime, t.TicketCode\n" +
                            " FROM users u\n" +
                            " JOIN booking b ON u.userID = b.customerID \n" +
                            " JOIN ticket t ON b.bookingID = t.bookingID\n" +
                            " JOIN seat s ON t.seatID = s.seatID\n" +
                            " JOIN flight f ON f.flightID = s.flightID\n" +
                            " JOIN airport ad ON ad.airportID = f.departureId\n" +
                            " JOIN airport aa ON aa.airportID = f.arrivalId\n" +
                            " WHERE b.bookingID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, bookingID);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                ticketHis = new TicketHistoryDTO();
                ticketHis.setName(rs.getString(1));
                ticketHis.setDepartureDate(rs.getTimestamp(2).toLocalDateTime());
                ticketHis.setDepartureArrival(rs.getString(3) + " - " + rs.getString(4));
                ticketHis.setSeatNumber(rs.getString(5));
                ticketHis.setFlightNumber(rs.getString(6));
                ticketHis.setPrice(rs.getDouble(7));
                ticketHis.setStatus(rs.getString(8));
                ticketHis.setFareClass(rs.getString(9));
                ticketHis.setArrivalDate(rs.getTimestamp(10).toLocalDateTime());
                ticketHis.setTicketCode(rs.getString(11));
                lists.add(ticketHis);
            }
            conn.close();
        } catch (Exception e) {
        System.out.println("Get all ticket history By userid, Details: " + e.getMessage());
        }
        return lists;
    }
    
}
