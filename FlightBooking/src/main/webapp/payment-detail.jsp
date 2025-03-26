<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment Methods - Flight Booking</title>
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
      
    <main class="payment-detail">
      <section class="payment-detail__section">
        <div class="container-support">
          <a href="support.jsp" class="payment-detail__back"
            > Back to Support</a
          >
          <h1 class="payment-detail__title">Payment Methods</h1>
          <div class="payment-detail__content">
            <h2 class="payment-detail__content-subtitle">
              Available Payment Options
            </h2>
            <div class="payment-detail__grid">
              <div class="payment-detail__item">
                <h3 class="payment-detail__item-title">Credit Cards</h3>
                <p>
                  We accept all major credit cards including Visa, MasterCard,
                  and American Express.
                </p>
              </div>
              <div class="payment-detail__item">
                <h3 class="payment-detail__item-title">Bank Transfer</h3>
                <p>
                  Direct bank transfer is available for domestic and
                  international payments.
                </p>
              </div>
              <div class="payment-detail__item">
                <h3 class="payment-detail__item-title">E-Wallets</h3>
                <p>
                  Pay using popular e-wallets like PayPal, Google Pay, and Apple
                  Pay.
                </p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
