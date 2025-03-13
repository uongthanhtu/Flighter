<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Details</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
    <main>
       <header class="header">
        <div class="container">
          <nav class="navbar">
            <!-- Logo -->
            <a href="index2.jsp" class="logo__link"
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
          <% UserDTO usersession = (UserDTO) session.getAttribute("usersession");
          if(usersession == null){ %>
          <a href="login.jsp" class="navbar__link">Sign in</a>
          <a href="register.jsp" class="navbar__link">Sign up</a>
          <% }else{%>
            <a href="./useredit.jsp" class="user__avt">
              <img src="./assets/img/user-avt.png" alt="User avt" /> </a
            ><a href="./AuthController?action=logout" class="user__logout__btn"
              >Log out</a
            >
          <%}%> 
            </div>
          </nav>
        </div>
      </header>
      <section class="flight--detail">
        <div class="container">
          <h1 class="flight--detail--code">Flight No: FL802</h1>
          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">Airline:</h2>
            <p class="flight--detail--component--value col-8">Flighter</p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Departure Airport:
            </h2>
            <p class="flight--detail--component--value col-8">
              Tan Son Nhat Airport - Ho Chi Minh City
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Arrival Airport:
            </h2>
            <p class="flight--detail--component--value col-8">
              Narita Airport - Tokyo
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Departure Date & Time:
            </h2>
            <p class="flight--detail--component--value col-8">
              23:55, 26/03/2025 (Local Time)
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Arrival Date & Time:
            </h2>
            <p class="flight--detail--component--value col-8">
              7:30, 27/03/2025 (Local Time)
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Aircraft Type:
            </h2>
            <p class="flight--detail--component--value col-8">Boeing 767</p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Baggage Allowance:
            </h2>
            <p class="flight--detail--component--value col-8">7kg</p>
          </div>

          <div class="flight--detail--component row">
            <form action="" method="GET" class="flight--detail--ticket col-12">
              <label class="flight--detail--component--header">
                Business Class Ticket:
              </label>
              <label class="radio-label">
                <input
                  type="radio"
                  name="ticket-price"
                  id="business-class-ticket"
                />
                <span class="custom-radio"></span>
                <span class="flight--ticket--price">15,455,000 VND</span>
              </label>

              <label class="flight--detail--component--header">
                Economy Class Ticket:
              </label>

              <label class="radio-label">
                <input
                  type="radio"
                  name="ticket-price"
                  id="business-class-ticket"
                />
                <span class="custom-radio"></span>
                <span class="flight--ticket--price">8,455,000 VND</span>
              </label>
            </form>
          </div>

          <div class="row">
            <a href="#!" class="flight--detail--btn col-2">Continue</a>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
