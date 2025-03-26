<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Tracking - Flight Booking</title>
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
      
    <main class="flight-tracking">
      <section class="flight-tracking__section">
        <div class="container-support">
          <a href="support.jsp" class="flight-tracking__back"
            >Back to Support</a
          >
          <h1 class="flight-tracking__title">Flight Tracking</h1>
          <div class="flight-tracking__content">
            <h2 class="flight-tracking__content-subtitle">Track Your Flight</h2>
            <div class="flight-tracking__grid">
              <div class="flight-tracking__item">
                <h3 class="flight-tracking__item-title">Real-time Updates</h3>
                <p>
                  Get instant updates about your flight status, including
                  departure time, gate changes, and arrival information.
                </p>
              </div>
              <div class="flight-tracking__item">
                <h3 class="flight-tracking__item-title">SMS Notifications</h3>
                <p>
                  Subscribe to SMS alerts to receive important updates about
                  your flight directly on your phone.
                </p>
              </div>
              <div class="flight-tracking__item">
                <h3 class="flight-tracking__item-title">Flight History</h3>
                <p>
                  Access your past flight information and track your travel
                  history with our airline.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
