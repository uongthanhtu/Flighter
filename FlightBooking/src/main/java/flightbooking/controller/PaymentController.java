/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

import flightbooking.dao.BookingDAO;
import flightbooking.dao.PaymentDAO;
import flightbooking.dao.SeatDAO;
import flightbooking.dao.TicketDAO;
import flightbooking.dao.TicketHistoryDAO;
import flightbooking.model.BookingDTO;
import flightbooking.model.TicketHistoryDTO;
import flightbooking.model.UserDTO;
import flightbooking.utils.EmailContent;
import flightbooking.utils.EmailUtils;
import flightbooking.vnpay.Config;
import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;
import java.nio.charset.StandardCharsets;
import java.util.Enumeration;
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
@WebServlet(name = "PaymentController", urlPatterns = {"/PaymentController"})
public class PaymentController extends HttpServlet {

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
        HttpSession session = request.getSession(false);
        UserDTO userSession = (session != null) ? (UserDTO) session.getAttribute("usersession") : null;
        try ( PrintWriter out = response.getWriter()) {
            Map fields = new HashMap();
            for (Enumeration params = request.getParameterNames(); params.hasMoreElements();) {
                String fieldName = URLEncoder.encode((String) params.nextElement(), StandardCharsets.US_ASCII.toString());
                String fieldValue = URLEncoder.encode(request.getParameter(fieldName), StandardCharsets.US_ASCII.toString());
                if ((fieldValue != null) && (fieldValue.length() > 0)) {
                    fields.put(fieldName, fieldValue);
                }
            }
            String vnp_SecureHash = request.getParameter("vnp_SecureHash");
            if (fields.containsKey("vnp_SecureHashType")) {
                fields.remove("vnp_SecureHashType");
            }
            if (fields.containsKey("vnp_SecureHash")) {
                fields.remove("vnp_SecureHash");
            }
            String signValue = Config.hashAllFields(fields);
            if (signValue.equals(vnp_SecureHash)) {
                String bookingID = request.getParameter("vnp_TxnRef");
                BookingDTO booking = new BookingDTO();
                booking.setBookingID(Integer.parseInt(bookingID));
                BookingDAO bookingDao = new  BookingDAO();
                boolean transSuccess = false;
                List<Integer> listticketid = bookingDao.getAllTicketIDByBookingID(booking.getBookingID());
                TicketDAO ticketDao = new TicketDAO();
                PaymentDAO paymentDao = new PaymentDAO();
                if ("00".equals(request.getParameter("vnp_TransactionStatus"))) {
                    booking.setBookingStatus("Confirmed");
                    paymentDao.updatePaymentStatusByBookingID(booking.getBookingID(), "Completed");
                    List<Integer> listseatid = bookingDao.getAllSeatIDByBookingID(booking.getBookingID());
                    SeatDAO seatDao = new SeatDAO();
                    for (Integer seatid : listseatid) {
                        seatDao.updateSeatStatus(seatid, "Booked");
                    }
                    for (Integer ticketid : listticketid) {
                        ticketDao.updateTicketStatus(ticketid, "Booked");
                    }
                    TicketHistoryDAO ticketHisDao = new TicketHistoryDAO();
                    List<TicketHistoryDTO> ticketList = ticketHisDao.getAllTicketHistoryByBookingID(booking.getBookingID());
                    String emailContent = EmailContent.emailContent(ticketList);
                    EmailUtils.sendEmail(userSession.getEmail(), "Booking Successful" , emailContent);
                    transSuccess = true;
                } else {
                    booking.setBookingStatus("Canceled");
                    paymentDao.updatePaymentStatusByBookingID(booking.getBookingID(), "Failed");
                    for (Integer ticketid : listticketid) {
                        ticketDao.updateTicketStatus(ticketid, "Canceled");
                    }
                }
                
                bookingDao.updateBookingStatus(booking.getBookingID(), booking.getBookingStatus() );
                request.setAttribute("transResult", transSuccess);
                request.setAttribute("booking", booking);
                request.getRequestDispatcher("paymentResult.jsp").forward(request, response);
            } else {
                System.out.println("Transaction error(invalid signature)");
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
