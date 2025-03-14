<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet" />
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body class="admin-body">
    <!-- Header -->
    <header class="admin-header">
      <div class="container">
        <div class="admin-header__inner">
          <a href="AdminController" class="admin-logo">
            <img
              src="./assets/img/airplane-flight.png"
              alt=""
              class="admin-logo__img" />
            <p class="admin-logo__title">Flighter</p>
          </a>
          <nav class="admin-navbar">
            <a
              href="AdminController"
              class="admin-navbar__item"
              >DashBoard</a
            >
            <a href="AdminController?action=addflight" class="admin-navbar__item admin-navbar__item--active"
              >Add Flight</a
            >
            <a href="AdminController?action=editaccount" class="admin-navbar__item"
              >Account</a
            >
            <a href="AdminController?action=reportflight" class="admin-navbar__item"
              >Reports & Analytics</a
            >
          </nav>
          <!-- Action -->
          <div class="admin-header__avatar">
            <a href="#!" class="admin-header__name">Admin</a>
            <img
              src="./assets/img/tourist-attraction.jpg"
              alt=""
              class="admin-header__img" />
            <a class="admin-header__btn" href="AuthController?action=logout">Logout</a>
          </div>
        </div>
      </div>
    </header>
    <main>
      <section class="flight-edit">
        <div class="container">
          <div class="flight-edit__inner">
            <h1 class="flight-edit__title">${requestScope.nextaction != null 
                                             && requestScope.nextaction == 'addflight' 
                                             ? 'Add Flight' : 'Edit Flight'}</h1>
            <form action="FlightController" class="flight-edit__form" action="${requestScope.nextaction}">
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for="flightId"
                    >Flight ID</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    placeholder="Enter Flight ID" 
                    name="flightId"
                    id="flightId" readonly
                    value="${requestScope.flightid}"/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for="flightNumber"
                    >Flight Number</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    id="flightNumber"
                    name="flightNumber"
                    placeholder="Enter Flight Number" 
                    required/>
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Departure Airport</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    placeholder="Enter Departure Airport" 
                    name="departureAirport"
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Arrival Airport</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    placeholder="Enter Arrival Airport"
                    name="arrivalAirport"
                    required/>
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Departure Date-Time</label
                  >
                  <input
                    class="flight-edit__form-input"
                    name="departuredatetime"
                    type="text"
                    placeholder="Enter Departure Date-Time"
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Arrival Date-Time</label
                  >
                  <input
                    class="flight-edit__form-input"
                    name="arrivaldatetime"
                    type="text"
                    placeholder="Enter Arrival Date-Time"
                    required/>
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for="">Airline</label>
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    placeholder="Enter Airline" 
                    name="airline"
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Aircraft Type</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    placeholder="Enter Aircraft Type"
                    name="aircraftType"
                    required/>
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Business Class Ticket</label
                  >
                  <input
                    class="flight-edit__form-input"
                    min="0"
                    type="number"
                    name="businessPrice"
                    placeholder="Enter Price" 
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Economy Class Ticket</label
                  >
                  <input
                    class="flight-edit__form-input"
                    min="0"
                    type="number"
                    name="economyPrice"
                    placeholder="Enter Price" 
                    required/>
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Flight Status</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    name="flightStatus"
                    placeholder="Enter Flight Status" 
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Baggage Allowance</label
                  >
                  <input
                    class="flight-edit__form-input"
                    min="0"
                    type="number"
                    name="baggageAllow"
                    placeholder="Enter Price" 
                    required/>
                </div>
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Seat Capacity</label
                  >
                  <input
                    class="flight-edit__form-input"
                    min="1"
                    type="number"
                    name="totalSeat"
                    placeholder="Enter Price" 
                    required/>
                </div>
              </div>
                <input type="hidden" name="action" value="insert_flight">
              <button class="flight-edit__form-btn">${requestScope.nextaction != null 
                                             && requestScope.nextaction == 'addflight' 
                                             ? 'Add Flight' : 'Edit'}</button>
            </form>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
