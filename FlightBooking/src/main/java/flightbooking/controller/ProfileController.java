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
import java.time.LocalDate;
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
@WebServlet(name = "ProfileController", urlPatterns = {"/ProfileController"})
public class ProfileController extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String action = request.getParameter("action");
         
            HttpSession session = request.getSession(false);
            UserDTO userSession = (session != null) ? (UserDTO) session.getAttribute("usersession") : null;
            if(session == null || userSession == null) {
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            if(action.equals("profile_details")){
                request.getRequestDispatcher("personal-details.jsp").forward(request, response);
                return;
            }else if(action.equals("edit_profile")){
                if (userSession.getDob() != null) {
                    LocalDate dob = userSession.getDob().toLocalDate(); 
                    request.setAttribute("selectedDay", dob.getDayOfMonth());
                    request.setAttribute("selectedMonth", dob.getMonthValue());
                    request.setAttribute("selectedYear", dob.getYear());
                }
                request.getRequestDispatcher("edit-profile.jsp").forward(request, response);
                return;
            }else if(action.equals("update_profile")){
                UserDTO user = null;
                UserDAO userDao = new UserDAO();
                String email = request.getParameter("email");
                String fullName = request.getParameter("fullName");
                String phoneNumber = request.getParameter("phoneNumber");
                int day, month, year;
                Date dob= null;
                try {
                    String dayInput = request.getParameter("day");
                    String monthInput = request.getParameter("month");
                    String yearInput = request.getParameter("year");
                    LocalDate dateTemp = null;
                    if (userSession.getDob() != null) {
                        dateTemp = userSession.getDob().toLocalDate(); 
                    }
                    day = (dayInput != null && !dayInput.isEmpty()) ? Integer.parseInt(dayInput) : dateTemp.getDayOfMonth();
                    month = (monthInput != null && !monthInput.isEmpty()) ? Integer.parseInt(monthInput) : dateTemp.getMonthValue();
                    year = (yearInput != null && !yearInput.isEmpty()) ? Integer.parseInt(yearInput) : dateTemp.getYear();
                    dob = Date.valueOf(year+"-"+month+"-"+day);
                } catch (Exception e) {
                    System.out.println(e.getMessage());
                }
                if(email != null){
                    user = userDao.loadUser(email);
                    if (user != null){
                        user.setFullName(fullName);
                        user.setPhoneNumber(phoneNumber);
                        user.setDob(dob);
                        userDao.updateUser(user);
                        session.setAttribute("usersession", user);
                        request.getRequestDispatcher("personal-details.jsp").forward(request, response);
                        return;
                    }
                }else{
                    response.sendRedirect("login.jsp");
                }
                return;
            }else if(action.equals("edit_password")){
                
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
