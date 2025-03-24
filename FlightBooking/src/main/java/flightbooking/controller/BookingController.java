 /*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.AirportDAO;
import flightbooking.dao.BookingDAO;
import flightbooking.dao.FlightDAO;
import flightbooking.dao.SeatDAO;
import flightbooking.dao.TicketDAO;
import flightbooking.model.BookingDTO;
import flightbooking.model.FlightDTO;
import flightbooking.model.SeatDTO;
import flightbooking.model.TicketDTO;
import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.time.LocalDateTime;
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
            request.setAttribute("flightid", flightid);
            request.getRequestDispatcher("seat-selected.jsp").forward(request, response);
            return;
        }else if(action.equals("customer_booking_info")){
            int flightid = Integer.parseInt(request.getParameter("flightid"));
            SeatDAO seatdao = new SeatDAO();
            String[] listSeadID = request.getParameterValues("selectedSeats");
            if(listSeadID == null){
                request.setAttribute("errorseat", "No seat selected");
                request.getRequestDispatcher("BookingController?action=selecteseat").forward(request, response);
                return;
            }
            List<SeatDTO> listseat = new ArrayList<SeatDTO>();
            int minseatid = seatdao.getMinSeatIDByFlightID(flightid);
            for (String seatid : listSeadID) {
                if(seatdao.getSeatBySeatID(Integer.parseInt(seatid) + minseatid - 1) != null){
                    listseat.add(seatdao.getSeatBySeatID(Integer.parseInt(seatid) + minseatid - 1));
                }
            }
            request.setAttribute("listselectseat", listseat);
            request.getRequestDispatcher("customer-booking-info.jsp").forward(request, response);
        }else if(action.equals("submit_ticket")){
            String[] seatIDs = request.getParameterValues("seatid");
            String[] fNames = request.getParameterValues("fname");
            String[] lNames = request.getParameterValues("lname");
            String[] phoneNumber = request.getParameterValues("phone");
            String[] ticketPrices = request.getParameterValues("ticketprice");
            
            SeatDAO seatDao = new SeatDAO();
            LocalDateTime arrivalTime = seatDao.getArrivalTimeBySeatId(Integer.parseInt(seatIDs[0]));
            FlightDAO flightDao = new FlightDAO();
            BookingDAO bookingDao = new BookingDAO();
            int bookingID = bookingDao.getMaxBookingID() + 1;
            
            TicketDAO ticketDAO = new TicketDAO();
            double totalPrice = 0;
            LocalDateTime timeNow = LocalDateTime.now();
            BookingDTO booking = new BookingDTO(bookingID, "Pending", 
                    timeNow, totalPrice, userSession.getUserID());
            bookingDao.insertBooking(booking);
            for (int i = 0; i < seatIDs.length ; i ++) {
                int seadID = Integer.parseInt(seatIDs[i]);
                double price = Double.parseDouble(ticketPrices[i]);
                String pName = fNames[i] + " " + lNames[i];
                String pPhone = phoneNumber[i];

                String flightseat = seatDao.getFlightNumberAndSeatNumber(seadID);
                TicketDTO ticket = new TicketDTO(ticketDAO.getMaxTicketID() + 1, 
                        arrivalTime, flightseat, price, "Booked", bookingID, seadID, pName, pPhone );
                ticketDAO.insertTicket(ticket);
                seatDao.updateSeatStatus(Integer.parseInt(seatIDs[i]), "Booked");
                totalPrice += price;
            }
            
            bookingDao.updateTotalPrice(bookingID, totalPrice);
            
            
            response.sendRedirect("payment.jsp");
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
