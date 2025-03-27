<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.TicketHistoryDTO"%>
<%@page import="flightbooking.model.UserDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
    <header class="header">
        <div class="container">
          <nav class="navbar">
            <!-- Logo -->
            <a href="AirportController" class="admin-logo"
              ><img
                src="./assets/img/airplane-flight.png"
                alt="logo"
                class="logo"
              />
              <p class="admin-logo__title">Flighter</p>
            </a>
            
            <div class="navbar__actions">
              <a href="BookingController?action=mybooking" class="navbar__link">My booking</a>
              <a href="BookingController?action=searchflight" class="navbar__link">Flights</a>
              <a href="support.jsp" class="navbar__link">Support</a>
              <% UserDTO usersession =
              (UserDTO)session.getAttribute("usersession"); if(usersession ==
              null){ %>
              <a href="login.jsp" class="navbar__link">Sign in</a>
              <a href="register.jsp" class="navbar__link">Sign up</a>
              <% }else{%>
            </div>
            <div class="navbar__users">
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
            </div>
            <%}%>
          </nav>
        </div>
      </header>
    <section class="payment">
      <div class="container">
        <h2 class="payment__title">Payment</h2>
        <div class="payment__content row">
          <div
            class="payment__summary col-8 col-sm-12 col-md-12 col-lg-6 col-xl-8 col-xxl-8">
            <% List<TicketHistoryDTO> ticketlist = (List<TicketHistoryDTO>) request.getAttribute("ticketlist");
                if(ticketlist != null && !ticketlist.isEmpty()){
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
                    for (TicketHistoryDTO ticket : ticketlist) {%>
            <div class="payment__summary__info">
              <h3 class="payment__summary__flight">Flight Number: <%= ticket.getFlightNumber() %></h3>
              <p class="payment__summary__departure-and-arrival">
                <span><%= ticket.getDepartureArrival() %></span>
              </p>
              <p class="payment__summary__time">
                <span><%= ticket.getDepartureDate().format(formatter) %></span>
                -
                <span><%= ticket.getArrivalDate().format(formatter) %></span>
              </p>
              <p class="payment__summary__baggage">
                <span>Seat number: <%= ticket.getSeatNumber() %></span>
              </p>
              <div class="payment__summary__class--row">
                <span class="payment__summary__class">Fare class: <%= ticket.getFareClass() %></span>
                <span>x1</span>
              </div>
            </div>
                <br>
                    <%}
                }
            %>         
          </div>
          <div
            class="payment__price col-4 col-sm-12 col-md-12 col-lg-6 col-xl-4 col-xxl-4">
            <div class="payment__price-ticket">
                <div class="payment__price--style payment__price-ticket__temp">
                <span>Fare Class</span>
                <span>Price</span>
              </div>
              <%long totalPrice = 0;
                  if(ticketlist != null && !ticketlist.isEmpty()){
                  for (TicketHistoryDTO ticket : ticketlist) {
                      totalPrice += ticket.getPrice();
              %>
              
              <ul class="payment__price-ticket-list">
                <li class="payment__price--style payment__price__ticket__item">
                  <span><%= ticket.getFareClass() %> (x1)</span>
                  <span><fmt:formatNumber value="<%= ticket.getPrice() %>" type="number" groupingUsed="true" /> VND</span>
                </li>
              </ul>
           
            <%}
              }
             %>
              </div>
            <div class="payment__total">       
              <div class="payment__price--style payment__total-price">
                <span>Total</span>
                <span><fmt:formatNumber value="<%= totalPrice %>" type="number" groupingUsed="true" /> VND</span>
              </div>
            </div>
          </div>
        </div>
        <form class="payment__btn-wrap" action="payment" method="POST">
            <input type="hidden" name="totalBill" value="<%= totalPrice %>">
            <input type="hidden" name="bookingID" value="${requestScope.booking.bookingID}">
            <input class="flight--detail--btn" type="submit" value="Continue">
        </form>
      </div>
    </section>
  </body>
</html>
