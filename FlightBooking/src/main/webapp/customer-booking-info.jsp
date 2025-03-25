<%@page import="flightbooking.model.SeatDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.UserDTO"%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flighter - Take your dream to the new height</title>

    <link
      rel="apple-touch-icon"
      sizes="57x57"
      href="./assets/favicon/apple-icon-57x57.png" />
    <link
      rel="apple-touch-icon"
      sizes="60x60"
      href="./assets/favicon/apple-icon-60x60.png" />
    <link
      rel="apple-touch-icon"
      sizes="72x72"
      href="./assets/favicon/apple-icon-72x72.png" />
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="./assets/favicon/apple-icon-76x76.png" />
    <link
      rel="apple-touch-icon"
      sizes="114x114"
      href="./assets/favicon/apple-icon-114x114.png" />
    <link
      rel="apple-touch-icon"
      sizes="120x120"
      href="./assets/favicon/apple-icon-120x120.png" />
    <link
      rel="apple-touch-icon"
      sizes="144x144"
      href="./assets/favicon/apple-icon-144x144.png" />
    <link
      rel="apple-touch-icon"
      sizes="152x152"
      href="./assets/favicon/apple-icon-152x152.png" />
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="./assets/favicon/apple-icon-180x180.png" />
    <link
      rel="icon"
      type="image/png"
      sizes="192x192"
      href="./assets/favicon/android-icon-192x192.png" />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="./assets/favicon/favicon-32x32.png" />
    <link
      rel="icon"
      type="image/png"
      sizes="96x96"
      href="./assets/favicon/favicon-96x96.png" />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="./assets/favicon/favicon-16x16.png" />
    <link rel="manifest" href="./assets/favicon/manifest.json" />
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta
      name="msapplication-TileImage"
      content="./assets/favicon/ms-icon-144x144.png" />
    <meta name="theme-color" content="#ffffff" />

    <link rel="stylesheet" href="assets/css/main.css" />
  </head>
  <body>
    <main>
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
      <section class="customer-booking">
        <div class="container">
          <h2 class="customer-booking__title">Customer Booking Information</h2>
          <form action="BookingController">
            <% List<SeatDTO> listselectseat = (List<SeatDTO>) request.getAttribute("listselectseat");
            for (SeatDTO seat : listselectseat) {
                pageContext.setAttribute("seat", seat);
            %>
            <div class="customer-booking__info-block">
              <div class="customer-booking__top-bar">
                <h3 class="customer-booking__top-label">
                  Seat On Plane: <span>${ seat.seatNumber }</span>
                </h3>
                <h3 class="customer-booking__top-label">
                  Class: <span> ${seat.fareClass} </span>
                </h3>
                <h3 class="customer-booking__top-label">
                  Ticket Price: <span> ${seat.price} VND</span>
                </h3>
              </div>
                <input type="hidden" name="seatid" value="<%= seat.getSeatID() %>" />
                <input type="hidden" name="ticketprice" value="<%= seat.getPrice() %>" />
                <div class="customer-booking__info-component col col-4 col-sm-12">
                  <label for="firstname" class="customer-booking__info-label"
                    >First Name</label
                  ><input type="text" name="fname" class="customer-booking__info-input" />
                </div>
                <div class="customer-booking__info-component col col-4 col-sm-12">
                  <label for="lastname" class="customer-booking__info-label"
                    >Last name</label
                  ><input type="text" name="lname" class="customer-booking__info-input" />
                </div>
                <div class="customer-booking__info-component col col-4 col-sm-12">
                  <label for="phone" class="customer-booking__info-label"
                    >Phone Number</label
                  ><input type="text" name="phone" class="customer-booking__info-input" />
                </div>
            </div>
                <%}
            %>
            <input type="hidden" name="action" value="submit_ticket">
            <div class="customer-booking__btn-wrap">
                <button class="customer-booking__btn">Go to payment</button>
          </div>
          </form>
          </div>
          
        </div>
      </section>
    </main>
  </body>
</html>
