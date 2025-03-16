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
import java.util.List;
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
@WebServlet(name = "UserController", urlPatterns = {"/UserController"})
public class UserController extends HttpServlet {

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
        UserDAO userdao = new UserDAO();
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
        if(action.equals("accountlist")){
            List<UserDTO> list = userdao.loadAllUser();
            if(list != null){
                request.setAttribute("userlist", list);
            }
            request.getRequestDispatcher("adminaccountmanager.jsp").forward(request, response);
            return;
        }
        else if (action.equals("deleteaccount")){
            Integer userid = null;
            try {
                userid = Integer.parseInt(request.getParameter("userid"));
            } catch (Exception e) {
                System.out.println("Can not get user id, Details: " + e.getMessage());
                request.getRequestDispatcher("AdminController?action=accountlist").forward(request, response);
                return;
            }
            if(userdao.deleteUser(userid)){
                request.getRequestDispatcher("AdminController?action=accountlist").forward(request, response);
                return;
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
