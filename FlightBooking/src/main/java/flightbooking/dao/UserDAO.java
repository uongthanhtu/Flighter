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
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class UserDAO {
    
    public boolean insertUser(UserDTO user){
        Connection conn = DBUtils.getConnection();
        String sql = "INSERT INTO users(userID, fullName, password, email, phoneNumber, role, DOB) "               
                + " VALUES (?, ?, ?, ?, ?, ?, ? )";    
        try {
            PreparedStatement ps = conn.prepareStatement(sql);                      
            ps.setInt(1, user.getUserID());
            ps.setString(2, user.getFullName());
            ps.setString(3, user.getPassword());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPhoneNumber());
            ps.setString(6, user.getRole());
            ps.setDate(7, user.getDob());
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
        Connection conn = DBUtils.getConnection();
        String query = "SELECT COUNT(*) FROM users WHERE email = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setString(1, email);
            ResultSet rs = ps.executeQuery();
            if (rs.next() && rs.getInt(1) > 0) {
                return true;
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
        return false;
    }
    
    public String getMailByUserId(int userid) {
        Connection conn = DBUtils.getConnection();
        String email = "";
        String query = "SELECT email FROM users WHERE userID = ?";
        try (PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, userid);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                email = rs.getString("email");
            }
            conn.close();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return email;
    }
    
    public UserDTO loginUser (String email, String password){
        Connection conn = DBUtils.getConnection();
        UserDTO user = null;
        try {
            String sql = " SELECT email, fullName, phoneNumber, role FROM users ";
            sql += " WHERE email = ?  AND password = ?";
                               
            PreparedStatement stmt = conn.prepareStatement(sql);
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
            conn.close();
        } catch (SQLException ex) {                
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return user;
    }
    
    public boolean updateUser (UserDTO user){
        Connection conn = DBUtils.getConnection();
        String sql = " UPDATE users SET fullName = ? , phoneNumber = ? , DOB = ? WHERE email = ? ";
            try{
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setString(1, user.getFullName());
                ps.setString(2, user.getPhoneNumber());
                ps.setDate(3, user.getDob());
                ps.setString(4, user.getEmail());
                ps.executeUpdate();
                conn.close();
            }catch(SQLException ex){
                System.out.println("Update user error: " + ex.getMessage()) ;
                ex.printStackTrace();
                return false;
            }
        return true;
    }
    
    public boolean updateUserAdminSide (UserDTO user){
        String sql = " UPDATE users SET fullName = ? , phoneNumber = ? , password = ? , DOB = ?, email = ? WHERE userID = ? ";
            try{
                Connection connect = DBUtils.getConnection();
                PreparedStatement ps = connect.prepareStatement(sql);

                ps.setString(1, user.getFullName());
                ps.setString(2, user.getPhoneNumber());
                ps.setString(3, user.getPassword());
                ps.setDate(4, user.getDob());
                ps.setString(5, user.getEmail());
                ps.setInt(6, user.getUserID());
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
                String sql = " SELECT userID , email, fullName, phoneNumber, DOB , role FROM users ";
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
                        user.setDob(rs.getDate("DOB"));
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
    
    public List<UserDTO> loadAllUser (){
        UserDTO user = null;
        List<UserDTO> list = new ArrayList<>();
        try {
            Connection con = DBUtils.getConnection();            
            String sql = " SELECT userID , email, fullName, phoneNumber, role FROM users ";
            PreparedStatement stmt = con.prepareStatement(sql);
            ResultSet rs = stmt.executeQuery();    
            while (rs.next()){
                user = new UserDTO(); 
                user.setUserID(rs.getInt("userID"));
                user.setEmail(rs.getString("email"));
                user.setFullName(rs.getString("fullName"));
                user.setPhoneNumber(rs.getString("phoneNumber"));
                user.setRole(rs.getString("role"));
                list.add(user);
            }
            con.close();
        } catch (SQLException ex) {                
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return list;
    }
    
    public boolean deleteUser (int id){
        Connection conn = DBUtils.getConnection();   
        try {
            String sql = " DELETE FROM users WHERE userID = ? ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ps.setInt(1, id);
            ps.executeUpdate();
            conn.close();
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            return false;
        }
        return true;
    }
    
    public UserDTO loadUserById (int id){
        UserDTO user = null;
        try {
                Connection con = DBUtils.getConnection();            
                String sql = " SELECT userID , email, fullName, phoneNumber, password , DOB , role FROM users ";
                sql += " WHERE userID = ? ";
                               
                PreparedStatement stmt = con.prepareStatement(sql);
                stmt.setInt(1, id);
                
                ResultSet rs = stmt.executeQuery();
                
                if (rs.next()){
                    user = new UserDTO(); 
                    user.setUserID(rs.getInt("userID"));
                    user.setEmail(rs.getString("email"));
                    user.setFullName(rs.getString("fullName"));
                    user.setPhoneNumber(rs.getString("phoneNumber"));
                    user.setPassword(rs.getString("password"));
                    user.setDob(rs.getDate("DOB"));
                    user.setRole(rs.getString("role"));
                }
                con.close();
            } catch (SQLException ex) {                
                System.out.println("Error in servlet. Details:" + ex.getMessage());
                ex.printStackTrace();
            }
            return user;
    }
    
    public int getMaxUserId(){
        Connection conn = DBUtils.getConnection();   
        int id = 0;
        try {
            String sql = " SELECT MAX(userID) FROM users ";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                id = rs.getInt(1);
            }
        } catch (Exception ex) {
            System.out.println("Error in servlet. Details:" + ex.getMessage());
            ex.printStackTrace();
        }
        return id;
    }
    
    public int countAccountUser (){
        Connection con = DBUtils.getConnection();   
        int count = 0; 
        try {
            String sql = " SELECT COUNT(*) FROM users ";
            PreparedStatement ps = con.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();
            if(rs.next()){
                count = rs.getInt(1);
            }
            con.close();
        } catch (Exception e) {
            System.out.println("Count account user error. Details: " + e.getMessage());
        }
        return count;
    }
}
