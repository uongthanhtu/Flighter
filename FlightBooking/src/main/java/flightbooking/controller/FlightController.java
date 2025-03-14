/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.AirportDAO;
import flightbooking.dao.FlightDAO;
import flightbooking.model.FlightDTO;
import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
@WebServlet(name = "FlightController", urlPatterns = {"/FlightController"})
public class FlightController extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        UserDTO adminsession =  (UserDTO) session.getAttribute("adminsession");
        if(adminsession == null){
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }
        FlightDAO flightDao = new FlightDAO();
        AirportDAO airportDao = new AirportDAO();
        if(action.equals("addflight")){
            request.setAttribute("flightid", flightDao.getMaxFlightID() + 1);
            request.getRequestDispatcher("adminflightedit.jsp").forward(request, response);
        }
        if(action.equals("insert_flight")){
            int flightId = Integer.parseInt(request.getParameter("flightId"));
            String flightNumber = request.getParameter("flightNumber");
            String departure = request.getParameter("departureAirport");
            String arrival = request.getParameter("arrivalAirport");
            int departureId = airportDao.getAirportIdByAirportName(departure);
            int arrivalId = airportDao.getAirportIdByAirportName(arrival);
            if(departureId == -1 || arrivalId == -1){
                if(departureId == -1){
                    request.setAttribute("errordeparture", "Please enter an existing departure airport name.");
                }
                if(arrivalId == -1){
                    request.setAttribute("errorarrival", "Please enter an existing arrival airport name.");    
                }
                request.setAttribute("nextaction", "addflight");
                request.getRequestDispatcher("adminflightedit.jsp");
                return;
            }
            String departureDateTimeInput = request.getParameter("departuredatetime");
            String arrivalDateTimeInput = request.getParameter("arrivaldatetime");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            LocalDateTime departureDateTime, arrivalDateTime;
            try {
                departureDateTime = LocalDateTime.parse(departureDateTimeInput , formatter);
                arrivalDateTime = LocalDateTime.parse(arrivalDateTimeInput , formatter);
            } catch (Exception e) {
                System.out.println("Details : "+ e.getMessage());
                request.setAttribute("errortime", "Please enter the correct time format.");
                request.getRequestDispatcher("adminflightedit.jsp");
                return;
            }
            String airline = request.getParameter("airline");
            double businessPrice = Double.parseDouble(request.getParameter("businessPrice"));
            double economyPrice = Double.parseDouble(request.getParameter("economyPrice"));
            String aircraftType = request.getParameter("aircraftType");
            float baggageAllow = Float.parseFloat(request.getParameter("baggageAllow"));  
            String flightStatus = request.getParameter("flightStatus");
            int totalSeat = Integer.parseInt(request.getParameter("totalSeat"));
            int adminId = adminsession.getUserID();
            FlightDTO flight = new FlightDTO(flightId, flightNumber, airline, departureId, arrivalId, departureDateTime, arrivalDateTime, totalSeat, businessPrice, economyPrice, aircraftType, baggageAllow, flightStatus, adminId);
            if(flightDao.insertFlight(flight)){
                response.sendRedirect("AdminController");
                return;
            }else{
                request.setAttribute("error", "Something went wrong, the server cannot insert.....");
                request.getRequestDispatcher("adminflightedit.jsp");
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
