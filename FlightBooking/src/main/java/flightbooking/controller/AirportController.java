/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.controller;

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
    private static final String AIRPORTS_URL = "https://raw.githubusercontent.com/jpatokal/openflights/master/data/airports.dat";

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        String action = request.getParameter("action") ; 
        List<Map<String, String>> airports = (List<Map<String, String>>) fetchAirportData();   
        request.setAttribute("airports", airports);
        if(action == null || action.equals("login") || action.equals("logout")){  
            request.getRequestDispatcher("index2.jsp").forward(request, response);
            return;
        }else if(action.equals("searchflight")){
            String departure = (String) request.getAttribute("departure");
            String arrival = (String) request.getAttribute("arrival");
            request.getRequestDispatcher("flight-list.jsp").forward(request, response);
            return;
        }
       
        return;
}   
    private List<Map<String, String>> fetchAirportData() throws IOException {
        URL url = new URL(AIRPORTS_URL);
        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
        conn.setRequestMethod("GET");
        
        BufferedReader reader = new BufferedReader(new InputStreamReader(conn.getInputStream()));
        List<Map<String, String>> airportList = new ArrayList<>();
        String line; 
        
        while ((line = reader.readLine()) != null) {
            String[] parts = line.split(",");
            if (parts.length > 3) {
                String airportName = parts[1].replace("\"", "");
                String airportCountry = parts[3].replace("\"", "");
                if (!airportName.isEmpty() && !airportCountry.isEmpty()) {
                    Map<String, String> airport = new HashMap<>();
                    airport.put("name", airportName);
                    airport.put("country", airportCountry);
                    airportList.add(airport);
                }
            }
        }
        reader.close();
        return airportList;
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
