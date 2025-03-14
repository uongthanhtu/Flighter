/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 *
 * @author ADMIN
 */
public class AirportDAO {
    public List<Map<String, String>> loadAllAirport (){
        List<Map<String, String>> airportList = new ArrayList<>();
        try {
            Connection conn = DBUtils.getConnection();
            String sql = " SELECT name, city, country FROM airport ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            while(rs.next()){
                Map<String, String> airport = new HashMap<>();
                airport.put("name", rs.getString("name") );
                airport.put("city", rs.getString("city"));
                airport.put("country", rs.getString("country"));
                airportList.add(airport);
            }
            conn.close();
        } catch (Exception e) {
            System.err.println("Load airport error , " + e.getMessage() );
        }
        return airportList;
    }
    
    public int getAirportIdByAirportName (String airportName){
        int id = -1;
        try {
            Connection conn = DBUtils.getConnection();
            String sql = " SELECT airportID FROM airport WHERE name = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setString(1, airportName);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                id = rs.getInt("airportID");
            }
            conn.close();
        } catch (SQLException ex) {
            System.out.println("Get AirportId By AirportName - Error, Details: " + ex.getMessage());
        }
        return id;
    }  
    
}
