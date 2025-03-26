<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Baggage Information - Flight Booking</title>
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
      
    <main class="baggage">
      <section class="baggage__section">
        <div class="container-support">
          <a href="support.jsp" class="baggage__back"> Back to Support</a>
          <h1 class="baggage__title">Baggage Information</h1>
          <div class="baggage__content">
            <h2 class="baggage__content-subtitle">Baggage Guidelines</h2>
            <div class="baggage__grid">
              <div class="baggage__item">
                <h3 class="baggage__item-title">Carry-on Baggage</h3>
                <p>
                  One carry-on bag (up to 7kg) and one personal item are
                  allowed. Maximum dimensions: 55cm x 40cm x 20cm.
                </p>
              </div>
              <div class="baggage__item">
                <h3 class="baggage__item-title">Checked Baggage</h3>
                <p>
                  Allowance varies by fare class: Economy (23kg), Business
                  (32kg), First Class (40kg).
                </p>
              </div>
              <div class="baggage__item">
                <h3 class="baggage__item-title">Special Items</h3>
                <p>
                  Special handling available for sports equipment, musical
                  instruments, and fragile items.
                </p>
              </div>
              <div class="baggage__item">
                <h3 class="baggage__item-title">Restricted Items</h3>
                <p>
                  Learn about items not allowed in carry-on or checked baggage
                  for safety and security.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
