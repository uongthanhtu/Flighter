package flightbooking.controller;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import flightbooking.dao.FlightDAO;
import flightbooking.dao.PaymentDAO;
import flightbooking.dao.SeatDAO;
import flightbooking.dao.TicketDAO;
import flightbooking.dao.UserDAO;
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
@WebServlet(urlPatterns = {"/AdminController"})
public class AdminController extends HttpServlet {

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
        
        if(session != null){
            UserDTO adminsession =  (UserDTO) session.getAttribute("adminsession");
            if(adminsession == null){
                request.getRequestDispatcher("AirportController").forward(request, response);
                return;
            }
        }else{
            request.getRequestDispatcher("AirportController").forward(request, response);
            return;
        }
        if(action == null || action.equals("flightlist")){
            request.getRequestDispatcher("FlightController").forward(request, response);
            return;
        }else if(action.equals("addflight")){  
            request.getRequestDispatcher("FlightController").forward(request, response);
            return;
        }else if (action.equals("editaccount")){
            request.getRequestDispatcher("adminaccountmanager.jsp").forward(request, response);
            return;
        }else if(action.equals("reportflight")){
            UserDAO userdao = new UserDAO();
            TicketDAO ticketdao = new TicketDAO();
            PaymentDAO paymentdao = new PaymentDAO();
            FlightDAO flightdao = new FlightDAO();
            SeatDAO seatdao = new SeatDAO();
            request.setAttribute("countflight", flightdao.countFlightScheduled());
            request.setAttribute("revenue", paymentdao.getRevenue());
            request.setAttribute("countuser", userdao.countAccountUser());
            request.setAttribute("coutnticketbooked", ticketdao.countTicketBooked());
            request.setAttribute("coutnticketpending", ticketdao.countTicketPending());
            request.setAttribute("seatrate", (seatdao.countSeatBooked() / seatdao.countAllSeat()) * 100);
            request.getRequestDispatcher("adminreportflight.jsp").forward(request, response);
            return;
        }else if(action.equals("accountlist")){
            request.getRequestDispatcher("UserController").forward(request, response);
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
