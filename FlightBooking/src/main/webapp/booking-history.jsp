<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="flightbooking.model.UserDTO"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.TicketHistoryDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Booking History</title>
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
    <section class="booking-history">
      <div class="container">
        <h2 class="booking-history__title">Booking History</h2>
        <form action="BookingController" method="GET" class="booking-history__form">
            <div class="booking-history__form-component">
              <label for="name" class="booking-history__form__label"
                >Passenger Name</label
              ><input
                type="text"
                class="booking-history__form-input"
                name="pname"
                id="name"
                value="<%= request.getAttribute("pname") != null ? request.getAttribute("pname") : "" %>"
              />
            </div>
            <div class="booking-history__form-component custom-select">
              <label for="status" class="booking-history__form__label"
                >Status</label
              >
              <select
                class="booking-history__form-input"
                id="status"
                name="status"
              >
                  <option value="" <%= (request.getAttribute("status") == null || request.getAttribute("status").equals("")) ? "selected" : "" %>>Select status</option>
                <option value="Pending" <%= "Pending".equals(request.getAttribute("status")) ? "selected" : "" %>>Pending</option>
                <option value="Booked" <%= "Booked".equals(request.getAttribute("status")) ? "selected" : "" %>>Booked</option>
              </select>
            </div>
            <input type="hidden" name="action" value="mybooking">
            <input type="submit" value="Search" />
          </form>
        <div class="row">
          <div class="col col-12">
              <% List<TicketHistoryDTO> lists = (List<TicketHistoryDTO>) request.getAttribute("listtickethis");
              if(lists == null || lists.isEmpty()){%>
                  <p class="booking-history__message--empty">
                    No tickets booked yet.
                  </p>
              <%}else{ 
                DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");
                for (TicketHistoryDTO tickethis : lists) {%>
            <div class="booking-history__ticket">
              <div class="booking-history__ticket__img">
                <img
                  src="./assets/img/airplane-flight.png"
                  alt="Nothing special" />
              </div>
              <div class="booking-history__ticket__info">
                <h3 class="booking-history__ticket-class"><%= tickethis.getFareClass() %></h3>
                <div class="booking-history__ticket__info__row">
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Name</p>
                    <p class="booking-history__ticket__value">
                      <%= tickethis.getName()%>
                    </p>
                  </div>
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Date & Time</p>
                    <p class="booking-history__ticket__value">
                      <%= tickethis.getDepartureDate().format(formatter) %>
                    </p>
                  </div>
                    <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Ticket Code</p>
                    <p class="booking-history__ticket__value"> <%= tickethis.getTicketCode()%></p>
                  </div>
                </div>
                <div class="booking-history__ticket__info__row">
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">From - To</p>
                    <p class="booking-history__ticket__value">
                      <%= tickethis.getDepartureArrival()%>
                    </p>
                  </div>
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Seat</p>
                    <p class="booking-history__ticket__value"><%= tickethis.getSeatNumber()%></p>
                  </div>
                </div>
                <div class="booking-history__ticket__info__row">
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Flight No</p>
                    <p class="booking-history__ticket__value"><%= tickethis.getFlightNumber()%></p>
                  </div>
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Price</p>
                    <p class="booking-history__ticket__value"><%= tickethis.getPrice()%> VND</p>
                  </div>
                  <div class="booking-history__ticket__info__col">
                    <p class="booking-history__ticket__label">Status</p>
                    <p class="booking-history__ticket__value"><%= tickethis.getStatus()%></p>
                  </div>
                </div>
              </div>
            </div>
                 <%}
                }
              %>
          </div>
        </div>
      </div>
    </section>
  </body>
</html>
