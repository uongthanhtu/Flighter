 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.AirportDAO;
import flightbooking.dao.FlightDAO;
import flightbooking.dao.SeatDAO;
import flightbooking.model.FlightDTO;
import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
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
        String actionseat = (String) request.getAttribute("actionseat");
        if(actionseat != null && !actionseat.isEmpty() && actionseat.equals("selecteseat")){
            action = "selecteseat";
        }
        if(action == null){
            if(userSession == null){
                request.getRequestDispatcher("AirportController").forward(request, response);
                return;
            }
            request.setAttribute("action", "index");
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }
        else if(action.equals("searchflight")){
            String departure = request.getParameter("departure");
            String arrival = request.getParameter("arrival");
            String departureDateInput = request.getParameter("departuredate");
            Date departureDate = null;
            if(departureDateInput != null && !departureDateInput.isEmpty() ){
                departureDate = Date.valueOf(departureDateInput);
            }
            AirportDAO airportdao = new AirportDAO();
            int departureId = airportdao.getAirportIdByAirportName(departure);
            int arrivalId = airportdao.getAirportIdByAirportName(arrival);
            FlightDAO flightDao = new FlightDAO();
            AirportDAO airportDao = new AirportDAO();
            List<FlightDTO> listFlight = flightDao.loadAllFlightListByAirportIDAndTime(departureId, arrivalId, departureDate);
            if(listFlight != null ) {
                Map<Integer, String> listAirportName = new HashMap<> ();
                String departurename, departurecountry, arrivalname, arrivalcountry;
                for (FlightDTO flightDTO : listFlight) {
                    departurename = airportDao.getAirportNameByAirportId(flightDTO.getDepartureID());
                    departurecountry = airportDao.getAirportCountryByAirportId(flightDTO.getDepartureID());
                    arrivalname = airportDao.getAirportNameByAirportId(flightDTO.getArrivalID());
                    arrivalcountry = airportDao.getAirportCountryByAirportId(flightDTO.getArrivalID());
                    listAirportName.put(flightDTO.getDepartureID(), 
                        departurename + " - " + departurecountry);
                    listAirportName.put(flightDTO.getArrivalID(), 
                        arrivalname + " - " + arrivalcountry);
                }
                request.setAttribute("airport", listAirportName);
                request.setAttribute("flightlist", listFlight);
            }else {
                request.setAttribute("error", "No flights available.");
            }
            
            request.setAttribute("departure", departure);
            request.setAttribute("arrival", arrival);
            request.setAttribute("action", "searchflight");
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }else if(action.equals("flightdetails")){
            FlightDAO flightdao = new FlightDAO();
            int flightid = Integer.parseInt(request.getParameter("flightid"));
            FlightDTO flight = flightdao.loadFlightById(flightid);
            AirportDAO airdao = new AirportDAO();
            String departurename = airdao.getAirportNameByAirportId(flight.getDepartureID()) 
                                    + " - " + airdao.getAirportCountryByAirportId(flight.getDepartureID());
            String arrivalname = airdao.getAirportNameByAirportId(flight.getArrivalID())
                                    + " - " + airdao.getAirportCountryByAirportId(flight.getArrivalID());
            
            request.setAttribute("flightobject", flight);
            request.setAttribute("departurename", departurename);
            request.setAttribute("arrivalname", arrivalname);
            request.getRequestDispatcher("flight-details.jsp").forward(request, response);
            return;
        }else if(action.equals("selecteseat")){
            int flightid = Integer.parseInt(request.getParameter("flightid")) ;
            if(userSession == null){
                request.setAttribute("nextaction", "selecteseat");
                request.setAttribute("flightid", flightid); 
                request.getRequestDispatcher("login.jsp").forward(request, response);
                return;
            }
            FlightDAO flightdao = new FlightDAO();
            SeatDAO seatdao = new  SeatDAO();
            request.setAttribute("flightnumber", flightdao.loadFlightById(flightid).getFlightNumber());
            request.setAttribute("seats", seatdao.getListSeatByFlightID(flightid));
            request.getRequestDispatcher("seat-selected.jsp").forward(request, response);
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
