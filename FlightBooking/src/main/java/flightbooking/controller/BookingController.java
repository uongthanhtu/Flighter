 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
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
@WebServlet(name = "BookingController", urlPatterns = {"/BookingController"})
public class BookingController extends HttpServlet {

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
        
        String action = request.getParameter("action");
         
        HttpSession session = request.getSession(false);
        UserDTO userSession = (session != null) ? (UserDTO) session.getAttribute("usersession") : null;
        if(action == null ){
            if(userSession == null){
                request.getRequestDispatcher("index2.jsp").forward(request, response);
                return;
            }
            session.setAttribute("usersession", userSession);
            request.setAttribute("action", "index");
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }
        else if(action.equals("searchflight")){
            String departure = request.getParameter("departure");
            String arrival = request.getParameter("arrival");
            if(userSession == null){
                request.setAttribute("departure", departure);
                request.setAttribute("arrival", arrival);
                request.setAttribute("action", "searchflight");
                request.getRequestDispatcher("AirportController").forward(request, response);
                return;
            }
            request.setAttribute("departure", departure);
            request.setAttribute("arrival", arrival);
            request.setAttribute("action", "searchflight");
            session.setAttribute("usersession", userSession);        
            request.getRequestDispatcher("flight-list.jsp").forward(request, response);
            return;
        }else if(action.equals("flightdetails")){
            if(userSession == null){
                request.getRequestDispatcher("flight-details.jsp").forward(request, response);
                return;
            }
            session.setAttribute("usersession", userSession);
            request.getRequestDispatcher("flight-details.jsp").forward(request, response);
            return;
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
