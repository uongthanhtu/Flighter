/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.UserDAO;
import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "AuthController", urlPatterns = {"/AuthController"})
public class AuthController extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        String action = request.getParameter("action");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        UserDAO userDao = new UserDAO();
        if(action == null){  
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }else if (action.equals("register")){
            int id = userDao.getMaxUserId() + 1;
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            String fullName = firstName + " " + lastName;
            String phoneNumber = request.getParameter("phoneNumber");
            String passwordCon = request.getParameter("password-confirm");
            int day, month, year;
            Date dob= null;
            try {
                day = Integer.parseInt(request.getParameter("day")) ;
                month = Integer.parseInt(request.getParameter("month"));
                year = Integer.parseInt(request.getParameter("year"));
                dob = Date.valueOf(year+"-"+month+"-"+day);
            } catch (Exception e) {
                System.out.println(e.getMessage());
            }
            if(userDao.checkEmail(email)){
                request.setAttribute("erroremail", "Email already exists. Please enter a different email.");
                request.getRequestDispatcher("AuthController?action=register").forward(request, response);
                return;
            }
            if (!password.equals(passwordCon)) {
                request.setAttribute("errorpassword", "Passwords do not match!");
                request.getRequestDispatcher("AuthController?action=register").forward(request, response);
                return;
            }
            UserDTO user = new UserDTO(id, fullName, password, email, phoneNumber, dob);
            userDao.insertUser(user);
            RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
            rd.forward(request, response); 
            return;        
        }else if (action.equals("login")){
            if(email.isEmpty() || password.isEmpty() || email == null || password == null){
                request.setAttribute("error", "Email or password is empty.");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }
            UserDTO user = userDao.loginUser(email, password);
            if(user != null && user.getRole().equals("Customer")) {
                HttpSession session = request.getSession(true);
                user = userDao.loadUser(email);
            session.setAttribute("usersession", user);
                response.sendRedirect("./BookingController");
                return;
            }else if (user != null && user.getRole().equals("Admin")){
                HttpSession session = request.getSession(true);
                user = userDao.loadUser(email);
                session.setAttribute("adminsession", user);
                response.sendRedirect("./AdminController");
                return;
            }else {
                request.setAttribute("error", "Email or password is incorrect");
                RequestDispatcher rd = request.getRequestDispatcher("login.jsp");
                rd.forward(request, response);
                return;
            }
        }else if (action.equals("logout")){
            HttpSession session = request.getSession(false);
            if(session != null) {
                session.invalidate();
                request.setAttribute("logout", "Logout successfully");
                request.setAttribute("action", "logout");
                RequestDispatcher rd = request.getRequestDispatcher("AirportController");
                rd.forward(request, response);
            }
        }
    }
    
    
    
    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
