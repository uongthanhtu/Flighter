<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>How to Book a Flight - Flight Booking</title>
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
      
    <main class="book-flight">
      <section class="book-flight__section">
        <div class="container-support">
          <a href="support.jsp" class="book-flight__back">Back to Support</a>
          <h1 class="book-flight__title">How to Book a Flight</h1>
          <div class="book-flight__content">
            <h2 class="book-flight__content-subtitle">Step-by-Step Guide</h2>
            <ol class="book-flight__content-list">
              <li class="book-flight__content-item">
                <h3 class="book-flight__content-item-title">
                  Search for Flights
                </h3>
                <p>
                  Enter your departure and arrival cities, along with your
                  preferred travel dates.
                </p>
              </li>
              <li class="book-flight__content-item">
                <h3 class="book-flight__content-item-title">
                  Select Your Flight
                </h3>
                <p>
                  Choose from available flights based on your preferences for
                  time and price.
                </p>
              </li>
              <li class="book-flight__content-item">
                <h3 class="book-flight__content-item-title">
                  Enter Passenger Details
                </h3>
                <p>Fill in the required information for all passengers.</p>
              </li>
              <li class="book-flight__content-item">
                <h3 class="book-flight__content-item-title">
                  Choose Additional Services
                </h3>
                <p>
                  Select any extra services like seat selection, meal
                  preferences, or travel insurance.
                </p>
              </li>
              <li class="book-flight__content-item">
                <h3 class="book-flight__content-item-title">Review and Pay</h3>
                <p>Review your booking details and proceed to payment.</p>
              </li>
            </ol>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
