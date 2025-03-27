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
import flightbooking.model.SeatDTO;
import flightbooking.model.UserDTO;
import java.io.IOException;
import java.io.PrintWriter;
import java.time.LocalDateTime;
import java.time.format.DateTimeFormatter;
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
        UserDTO adminsession = null;
        if (session != null) {
            adminsession = (UserDTO) session.getAttribute("adminsession");
            if (adminsession == null) {
                request.getRequestDispatcher("AirportController").forward(request, response);
                return;
            }
        } else {
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }
        FlightDAO flightDao = new FlightDAO();
        AirportDAO airportDao = new AirportDAO();
        if (action == null || action.equals("flightlist")) {
            List<FlightDTO> listFlight = flightDao.loadAllFlightList();
            if (listFlight != null) {
                Map<Integer, String> listAirportName = new HashMap<>();
                for (FlightDTO flightDTO : listFlight) {
                    listAirportName.put(flightDTO.getDepartureID(),
                            airportDao.getAirportNameByAirportId(flightDTO.getDepartureID()));
                    listAirportName.put(flightDTO.getArrivalID(),
                            airportDao.getAirportNameByAirportId(flightDTO.getArrivalID()));
                }
                request.setAttribute("airportname", listAirportName);
                request.setAttribute("flightlist", listFlight);
            } else {
                request.setAttribute("error", "No flights available.");
            }
            request.getRequestDispatcher("adminflightlist.jsp").forward(request, response);
            return;
        } else if (action.equals("addflight")) {
            request.setAttribute("nextaction", "insertflight");
            request.setAttribute("flightid", flightDao.getMaxFlightID() + 1);
            request.getRequestDispatcher("adminflightedit.jsp").forward(request, response);
            return;
        } else if (action.equals("insertflight")) {
            int flightId = Integer.parseInt(request.getParameter("flightId"));
            String flightNumber = request.getParameter("flightNumber");
            String departure = request.getParameter("departureAirport");
            String arrival = request.getParameter("arrivalAirport");
            int departureId = airportDao.getAirportIdByAirportName(departure);
            int arrivalId = airportDao.getAirportIdByAirportName(arrival);
            if (departureId == -1 || arrivalId == -1) {
                if (departureId == -1) {
                    request.setAttribute("errordeparture", "Please enter an existing departure airport name.");
                }
                if (arrivalId == -1) {
                    request.setAttribute("errorarrival", "Please enter an existing arrival airport name.");
                }
                request.setAttribute("nextaction", "insertflight");
                request.getRequestDispatcher("adminflightedit.jsp").forward(request, response);
                return;
            }
            String departureDateTimeInput = request.getParameter("departuredatetime");
            String arrivalDateTimeInput = request.getParameter("arrivaldatetime");
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            LocalDateTime departureDateTime, arrivalDateTime;
            try {
                departureDateTime = LocalDateTime.parse(departureDateTimeInput, formatter);
                arrivalDateTime = LocalDateTime.parse(arrivalDateTimeInput, formatter);
            } catch (Exception e) {
                System.out.println("Details : " + e.getMessage());
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
            if (flightDao.insertFlight(flight)) {
                SeatDAO seatDao = new SeatDAO();
                SeatDTO seat = null;
                int seatId = seatDao.getMaxSeatID();
                char[] seatCol = {'A', 'B', 'C', 'D', 'E', 'F'};
                for (int i = 1; i <= 20; i++) {
                    for (char s : seatCol) {
                        seatId++;
                        seat = new SeatDTO();
                        seat.setSeatID(seatId);
                        seat.setSeatNumber(String.valueOf(s) + i);
                        seat.setSeatStatus("Available");
                        if (i <= 4) {
                            seat.setFareClass("Business");
                        } else {
                            seat.setFareClass("Economy");
                        }
                        seat.setFlightID(flightId);
                        seatDao.insertSeat(seat);
                    }
                }
                response.sendRedirect("AdminController?action=flightlist");
                return;
            } else {
                request.setAttribute("error", "Something went wrong, the server cannot insert.....");
                request.getRequestDispatcher("adminflightedit.jsp");
                return;
            }
        } else if (action.equals("editflight")) {
            int flightid = Integer.parseInt(request.getParameter("flightid"));
            FlightDTO flight = flightDao.loadFlightById(flightid);
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");
            request.setAttribute("nextaction", "updateflight");
            request.setAttribute("flightid", flightid);
            request.setAttribute("departurename", airportDao.getAirportNameByAirportId(flight.getDepartureID()));
            request.setAttribute("arrivalname", airportDao.getAirportNameByAirportId(flight.getArrivalID()));
            request.setAttribute("departuretime", flight.getDepartureTime().format(formatter));
            request.setAttribute("arrivaltime", flight.getArrivalTime().format(formatter));
            request.setAttribute("flight", flight);
            request.getRequestDispatcher("adminflightedit.jsp").forward(request, response);
            return;
        } else if (action.equals("updateflight")) {
            int flightId = Integer.parseInt(request.getParameter("flightId"));
            String flightNumber = request.getParameter("flightNumber");
            String departure = request.getParameter("departureAirport");
            String arrival = request.getParameter("arrivalAirport");
            int departureId = airportDao.getAirportIdByAirportName(departure);
            int arrivalId = airportDao.getAirportIdByAirportName(arrival);
            if (departureId == -1 || arrivalId == -1) {
                if (departureId == -1) {
                    request.setAttribute("errordeparture", "Please enter an existing departure airport name.");
                }
                if (arrivalId == -1) {
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
                departureDateTime = LocalDateTime.parse(departureDateTimeInput, formatter);
                arrivalDateTime = LocalDateTime.parse(arrivalDateTimeInput, formatter);
            } catch (Exception e) {
                System.out.println("Details : " + e.getMessage());
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
            if (flightDao.updateFlight(flight)) {
                response.sendRedirect("AdminController?action=flightlist");
                return;
            } else {
                request.setAttribute("error", "Something went wrong, the server cannot insert.....");
                request.getRequestDispatcher("adminflightedit.jsp");
                return;
            }
        } else if (action.equals("deleteflight")) {
            int flightId = Integer.parseInt(request.getParameter("flightid"));
            FlightDTO flight = null;
            flight = flightDao.loadFlightById(flightId);
            if (flight != null) {
                SeatDAO seatdao = new SeatDAO();
                List<Integer> seatlist = seatdao.getListSeatIDByFlightID(flightId);
                if (seatlist != null) {
                    seatdao.deleteSeat(seatlist);
                }
                if (flightDao.deleteFlight(flightId)) {
                    response.sendRedirect("AdminController?action=flightlist");
                    return;
                } else {
                    request.setAttribute("error", "Something went wrong, the server cannot insert.....");
                    request.getRequestDispatcher("adminflightlist.jsp");
                    return;
                }
            }
            request.getRequestDispatcher("AdminController?action=flightlist").forward(request, response);
            return;
        } else if (action.equals("detailflight")) {
            int flightId = Integer.parseInt(request.getParameter("flightid"));
            FlightDTO flight = null;
            flight = flightDao.loadFlightById(flightId);

            if (flight != null) {
                SeatDAO seatdao = new SeatDAO();
                List<Integer> seatlist = seatdao.getListSeatIDByFlightID(flightId);
                if (seatlist != null) {
                    seatdao.deleteSeat(seatlist);
                }
                if (flightDao.deleteFlight(flightId)) {
                    response.sendRedirect("AdminController?action=flightlist");
                    return;
                } else {
                    request.setAttribute("error", "Something went wrong, the server cannot insert.....");
                    request.getRequestDispatcher("adminflightlist.jsp");
                    return;
                }
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
