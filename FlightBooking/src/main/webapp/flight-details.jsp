<%@page import="flightbooking.model.FlightDTO"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight Details</title>
    <link
      rel="apple-touch-icon"
      sizes="57x57"
      href="./assets/favicon/apple-icon-57x57.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="60x60"
      href="./assets/favicon/apple-icon-60x60.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="72x72"
      href="./assets/favicon/apple-icon-72x72.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="76x76"
      href="./assets/favicon/apple-icon-76x76.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="114x114"
      href="./assets/favicon/apple-icon-114x114.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="120x120"
      href="./assets/favicon/apple-icon-120x120.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="144x144"
      href="./assets/favicon/apple-icon-144x144.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="152x152"
      href="./assets/favicon/apple-icon-152x152.png"
    />
    <link
      rel="apple-touch-icon"
      sizes="180x180"
      href="./assets/favicon/apple-icon-180x180.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="192x192"
      href="./assets/favicon/android-icon-192x192.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="32x32"
      href="./assets/favicon/favicon-32x32.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="96x96"
      href="./assets/favicon/favicon-96x96.png"
    />
    <link
      rel="icon"
      type="image/png"
      sizes="16x16"
      href="./assets/favicon/favicon-16x16.png"
    />
    <link rel="manifest" href="./assets/favicon/manifest.json" />
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
    <main>
      <header class="header">
        <div class="container">
          <nav class="navbar">
            <!-- Logo -->
            <a href="AirportController" class="logo__link"
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
              <% UserDTO usersession = (UserDTO)
              session.getAttribute("usersession"); if(usersession == null){ %>
              <a href="login.jsp" class="navbar__link">Sign in</a>
              <a href="register.jsp" class="navbar__link">Sign up</a>
              <% }else{%>
              <a href="./useredit.jsp" class="user__avt">
                <img src="./assets/img/user-avt.png" alt="User avt" /> </a
              ><a
                href="./AuthController?action=logout"
                class="user__logout__btn"
                >Log out</a
              >
              <%}%>
            </div>
          </nav>
        </div>
      </header>
      <section class="flight--detail">
        <div class="container">
            <h1 class="flight--detail--code">Flight No: ${requestScope.flightobject.flightNumber}</h1>
          <div class="flight--detail--component row">
              <h2 class="flight--detail--component--header col-4">Airline: </h2>
            <p class="flight--detail--component--value col-8">${requestScope.flightobject.flightNumber}</p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Departure Airport:
            </h2>
            <p class="flight--detail--component--value col-8">
                ${requestScope.departurename} 
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Arrival Airport:
            </h2>
            <p class="flight--detail--component--value col-8">
              ${requestScope.arrivalname}
            </p>
          </div>
            <% DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy"); %>
          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Departure Date & Time:
            </h2>
            <% FlightDTO flight = (FlightDTO) request.getAttribute("flightobject"); %>
            <p class="flight--detail--component--value col-8">
                <%= flight.getDepartureTime().format(formatter) %> (Local Time)
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Arrival Date & Time:
            </h2>
            <p class="flight--detail--component--value col-8">
               <%= flight.getArrivalTime().format(formatter) %> (Local Time)
            </p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Aircraft Type:
            </h2>
              <p class="flight--detail--component--value col-8">${requestScope.flightobject.aircraftType}</p>
          </div>

          <div class="flight--detail--component row">
            <h2 class="flight--detail--component--header col-4">
              Baggage Allowance:
            </h2>
              <p class="flight--detail--component--value col-8">${requestScope.flightobject.baggageAllow} kg</p>
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
                <span class="flight--ticket--price">${requestScope.flightobject.businessPrice} VND</span>
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
                <span class="flight--ticket--price">${requestScope.flightobject.economyPrice} VND</span>
              </label>
            </form>
          </div>

          <div class="row">
            <a href="BookingController?action=selecteseat&flightid=${requestScope.flightobject.flightID}" class="flight--detail--btn col-2">Continue</a>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
