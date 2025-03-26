<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Check-in & Documents - Flight Booking</title>
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
      
    <main class="checkin">
      <section class="checkin__section">
        <div class="container-support">
          <a href="support.jsp" class="checkin__back"> Back to Support</a>
          <h1 class="checkin__title">Check-in & Documents</h1>
          <div class="checkin__content">
            <h2 class="checkin__content-subtitle">Check-in Information</h2>
            <div class="checkin__grid">
              <div class="checkin__item">
                <h3 class="checkin__item-title">Online Check-in</h3>
                <p>
                  Available 48 hours before departure. Save time by checking in
                  online and printing your boarding pass at home.
                </p>
              </div>
              <div class="checkin__item">
                <h3 class="checkin__item-title">Airport Check-in</h3>
                <p>
                  Counter opens 3 hours before departure and closes 45 minutes
                  before departure for international flights.
                </p>
              </div>
              <div class="checkin__item">
                <h3 class="checkin__item-title">Required Documents</h3>
                <p>
                  Valid passport, visa (if required), and booking confirmation
                  are essential for international travel.
                </p>
              </div>
              <div class="checkin__item">
                <h3 class="checkin__item-title">Special Assistance</h3>
                <p>
                  Contact us in advance if you need special assistance during
                  check-in or boarding.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
