/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.dao;

import flightbooking.model.UserDTO;
import flightbooking.utils.DBUtils;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author ADMIN
 */
public class UserDAO {
    Connection conn = DBUtils.getConnection();
    public boolean insertUser(UserDTO user){
        String sql = "INSERT INTO users( fullName, password, email, phoneNumber, role) "               
                + " VALUES (?, ?, ?, ?, ?)";    
        try {
            PreparedStatement ps = conn.prepareStatement(sql);                      
            
            ps.setString(1, user.getFullName());
            ps.setString(2, user.getPassword());
            ps.setString(3, user.getEmail());
            ps.setString(4, user.getPhoneNumber());
            ps.setString(5, user.getRole());
            ps.executeUpdate();
            conn.close();
            return true;
	}
        catch (SQLException ex) {
            System.out.println("Insert Student error!" + ex.getMessage());
            ex.printStackTrace();
        }
        return false;
    }
    
    public boolean checkEmail(String email) {
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
    
    
    public UserDTO loginUser (String email, String password){
        UserDTO user = null;
        try {
            Connection con = DBUtils.getConnection();            
            String sql = " SELECT email, fullName, phoneNumber, role FROM users ";
            sql += " WHERE email = ?  AND password = ?";
                               
            PreparedStatement stmt = con.prepareStatement(sql);
            stmt.setString(1, email);
            stmt.setString(2, password);
                
            ResultSet rs = stmt.executeQuery();
                
            while (rs.next()){
                if (rs != null){
                user = new UserDTO();  
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullName"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setRole(rs.getString("role"));
                }
            }
            con.close();
        } catch (SQLException ex) {                
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser (UserDTO user){
        String sql = " UPDATE users SET fullName = ? , phoneNumber = ? WHERE email = ? ";
            try{
                Connection connect = DBUtils.getConnection();
                PreparedStatement ps = connect.prepareStatement(sql);

                ps.setString(1, user.getFullName());
                ps.setString(2, user.getPhoneNumber());
                ps.setString(3, user.getEmail());
                ps.executeUpdate();
                connect.close();
            }catch(SQLException ex){
                System.out.println("Update user error: " + ex.getMessage()) ;
                ex.printStackTrace();
                return false;
            }
        return true;
    }
    
    public UserDTO loadUser (String email){
        UserDTO user = null;
        try {
                Connection con = DBUtils.getConnection();            
                String sql = " SELECT userID , email, fullName, phoneNumber, role FROM users ";
                sql += " WHERE email = ? ";
                               
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setString(1, email);
                
                ResultSet rs = stmt.executeQuery();
                
                while (rs.next()){
                    if (rs != null){
                        user = new UserDTO(); 
                        user.setUserID(rs.getInt("userID"));
                        user.setEmail(rs.getString("email"));
                        user.setFullName(rs.getString("fullName"));
                        user.setPhoneNumber(rs.getString("phoneNumber"));
                        user.setRole(rs.getString("role"));
                    }
                }
                con.close();
            } catch (SQLException ex) {                
                System.out.println("Error in servlet. Details:" + ex.getMessage());
                ex.printStackTrace();
            }
            return user;
    }
    
}
