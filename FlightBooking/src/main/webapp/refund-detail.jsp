<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Refund Policy - Flight Booking</title>
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
      
    <main class="refund">
      <section class="refund__section">
        <div class="container-support">
          <a href="support.jsp" class="refund__back">Back to Support</a>
          <h1 class="refund__title">Refund Policy</h1>
          <div class="refund__content">
            <h2 class="refund__content-subtitle">Our Refund Terms</h2>
            <div class="refund__grid">
              <div class="refund__item">
                <h3 class="refund__item-title">Standard Tickets</h3>
                <p>
                  Refund available up to 24 hours before departure with a 10%
                  processing fee.
                </p>
              </div>
              <div class="refund__item">
                <h3 class="refund__item-title">Flexible Tickets</h3>
                <p>
                  Full refund available up to 2 hours before departure with no
                  processing fee.
                </p>
              </div>
              <div class="refund__item">
                <h3 class="refund__item-title">Non-Refundable Tickets</h3>
                <p>
                  These tickets are not eligible for refunds but may be eligible
                  for future travel credit.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
