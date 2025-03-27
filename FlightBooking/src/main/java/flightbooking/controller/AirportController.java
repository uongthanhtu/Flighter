/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.AirportDAO;
import flightbooking.model.UserDTO;
import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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
@WebServlet(name = "AirportController", urlPatterns = {"/AirportController"})
public class AirportController extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        String action = request.getParameter("action") ;
        if(session != null){
            UserDTO adminsession =  (UserDTO) session.getAttribute("adminsession");
            if(adminsession != null){
                String nextaction = (String) request.getAttribute("nextaction");
                if("insertflight".equals(nextaction) || "updateflight".equals(nextaction) || "insertflight".equals(nextaction)){
                    AirportDAO dao = new AirportDAO();
                    List<Map<String, String>> airports = (List<Map<String, String>>) dao.loadAllAirport();   
                    request.setAttribute("airports", airports);
                    request.getRequestDispatcher("adminflightedit.jsp").forward(request, response);
                    return;
                }else{
                    request.getRequestDispatcher("AdminController").forward(request, response);
                    return;
                }
            }
        }
         
        AirportDAO dao = new AirportDAO();
        List<Map<String, String>> airports = (List<Map<String, String>>) dao.loadAllAirport();   
        request.setAttribute("airports", airports);
        if(action == null || action.equals("login") || action.equals("logout")){  
            request.getRequestDispatcher("index2.jsp").forward(request, response);
            return;
        }else if(action.equals("searchflight")){
            request.getRequestDispatcher("flight-list.jsp").forward(request, response);
            return;
        }else {
            request.getRequestDispatcher("index2.jsp").forward(request, response);
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
