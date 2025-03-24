<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@page import="flightbooking.model.SeatDTO"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
    <!-- Header -->
    <header class="header">
        <div class="container">
          <nav class="navbar">
            <!-- Logo -->
            <a href="AirportController" class="logo__link"
              ><img
                src="./assets/img/logo-removebg-preview.png"
                alt="logo"
                class="logo"
              />
            </a>
            <div class="navbar__actions">
              <a href="#!" class="navbar__link">My booking</a>
              <a href="#!" class="navbar__link">Flights</a>
              <a href="#!" class="navbar__link">Support</a>
              <% UserDTO usersession =
              (UserDTO)session.getAttribute("usersession"); if(usersession ==
              null){ %>
              <a href="login.jsp" class="navbar__link">Sign in</a>
              <a href="register.jsp" class="navbar__link">Sign up</a>
              <% }else{%>

              <a
                href="ProfileController?action=profile_details"
                class="user__avt"
              >
                <img src="./assets/img/user-avt.png" alt="User avt" /> </a
              ><a
                href="./AuthController?action=logout"
                class="user__logout__btn"
                >Log out</a
              >
              <%}%>
            </div>
          </nav>
        </div>
      </header>
    <section class="booking-seat">
      <form action="BookingController" method="GET">
        <div class="booking-seat__container">
          <div class="booking-seat__wrapper">
              <h3 class="booking-seat__flight-title">FLIGHT: ${requestScope.flightnumber}</h3>
            <div class="seats__container" id="seat-container"></div>
          </div>
          <div class="seat-info">
            <h3 class="seat-info__title">Seating Information</h3>
            <div id="seat-info">Hover over chair to see information</div>
            <div class="seat-info__summary">
              <p>
                Selected seats:
                <span id="selected-seats" class="seat__selected"></span>
              </p>
              <p class="seat-info__summary-title">
                <strong>Total price:</strong>
                <span class="seat__total-price" id="total-price">0</span>VND
              </p>
            </div>
          </div>
        </div>
            <input type="hidden" name="action" value="customer_booking_info">
            <input type="hidden" name="flightid" value="${requestScope.flightid}">
        <div class="controls">
          <button id="prev-btn" class="seat__btn seat__btn--prev">Back</button>
          <button type="submit" class="seat__btn seat__btn--submit">
            Confirm Booking
          </button>
        </div>
      </form>
    </section> 
            
    <script>
    let seats = [];
    <% 
        List<SeatDTO> seats = (List<SeatDTO>) request.getAttribute("seats");
        if (seats != null && !seats.isEmpty()) { 
            for (SeatDTO seat : seats) { 
    %>
            seats.push({
                seatID: <%= seat.getSeatID() %>,
                seatNumber: "<%= seat.getSeatNumber() %>",
                fareClass: "<%= seat.getFareClass() %>",
                status: "<%= seat.getSeatStatus() %>",
                price: <%= seat.getPrice() %>
            });
        <% 
                }  
            } 
        %>

        console.log(seats);
    </script>    
            
    <script src="./assets/javascripts/seat.js"></script>
  </body>
</html>
