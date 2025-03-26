/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package flightbooking.utils;

import flightbooking.model.TicketHistoryDTO;
import java.time.format.DateTimeFormatter;
import java.util.List;

/**
 *
 * @author ADMIN
 */
public class EmailContent {
    public static String emailContent(List<TicketHistoryDTO> listticket) {
        StringBuilder emailContent = new StringBuilder();

        emailContent.append("<h2 style='text-align: center; color: #0073e6'>Ticket Confirmation</h2>");

        if (listticket != null && !listticket.isEmpty()) {
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");

            for (TicketHistoryDTO ticket : listticket) {
                emailContent.append("<div style='border: 1px solid #ddd; padding: 15px; margin-bottom: 15px; border-radius: 5px;'>")
                        .append("<h3 style='color: gold'>").append(ticket.getFareClass()).append(" Class</h3>")
                        .append("<p><strong>Ticket Code:</strong> ").append(ticket.getTicketCode()).append("</p>")        
                        .append("<p><strong>Passenger Name:</strong> ").append(ticket.getName()).append("</p>")
                        .append("<p><strong>Date & Time:</strong> ").append(ticket.getDepartureDate().format(formatter)).append("</p>")
                        .append("<p><strong>From - To:</strong> ").append(ticket.getDepartureArrival()).append("</p>")
                        .append("<p><strong>Flight No:</strong> ").append(ticket.getFlightNumber()).append("</p>")
                        .append("<p><strong>Seat:</strong> ").append(ticket.getSeatNumber()).append("</p>")
                        .append("<p><strong>Price:</strong> ").append(ticket.getPrice()).append(" VND</p>")
                        .append("<p><strong>Status:</strong> <span style='color: #008000; font-weight: bold'>")
                        .append(ticket.getStatus()).append("</span></p>")
                        .append("</div>");
            }
        }

        emailContent.append("<p style='text-align: center; color: #555; font-size: 17px'>Thank you for booking with Flighter!</p>");

        return emailContent.toString();
    }
}
