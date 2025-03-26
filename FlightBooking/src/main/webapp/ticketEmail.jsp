<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.TicketHistoryDTO"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Ticket Confirm</title>
  </head>
  <body
    style="
      font-family: Arial, sans-serif;
      background-color: #f4f4f4;
      padding: 20px;
    ">
    <div
      style="
        max-width: 600px;
        margin: auto;
        background: #fff;
        padding: 20px;
        border-radius: 10px;
        box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
      ">
      <h2 style="text-align: center; color: #0073e6">Ticket Confirmation</h2>
      <% List<TicketHistoryDTO> listticket = (List<TicketHistoryDTO>) request.getAttribute("listticket");
        if(listticket != null && !listticket.isEmpty()){
            DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
            for (TicketHistoryDTO ticket : listticket) {%>  
      <div
        style="
          border: 1px solid #ddd;
          padding: 15px;
          margin-bottom: 15px;
          border-radius: 5px;
        ">
        <h3 style="color: gold"><%= ticket.getFareClass() %> Class</h3>
        <p><strong>Passenger Name:</strong> <%= ticket.getName() %> </p>
        <p><strong>Date & Time:</strong> <%= ticket.getDepartureDate().format(formatter) %>  </p>
        <p>
          <strong>From - To:</strong> <%= ticket.getDepartureArrival() %>
        </p>
        <p><strong>Flight No:</strong> <%= ticket.getFlightNumber() %> </p>
        <p><strong>Seat:</strong> <%= ticket.getSeatNumber() %> </p>
        <p><strong>Price:</strong> <%= ticket.getPrice() %> VND</p>
        <p>
          <strong>Status:</strong>
          <span style="color: #008000; font-weight: bold"> <%= ticket.getStatus() %> </span>
        </p>
      </div>
            <%}
        }
      %>

      <p style="text-align: center; color: #555; font-size: 17px">
        Thank you for booking with Flighter!
      </p>
    </div>
  </body>
</html>
