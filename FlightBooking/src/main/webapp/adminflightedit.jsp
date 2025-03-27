<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/main.css" />
    <style>
        .flight-edit__form-group {
            position: relative;
        }
      .autocomplete-list {
        position: absolute;
        top: 37px;
        background: white;
        border: 1px solid #ddd;
        max-height: 200px;
        overflow-y: auto;
        z-index: 1000;
      }
      .autocomplete-item {
        padding: 7px;
        cursor: pointer;
      }
      .autocomplete-item:hover {
        background: #f0f0f0;
      }
    </style>
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
              class="admin-logo__img"
            />
            <p class="admin-logo__title">Flighter</p>
          </a>
          <nav class="admin-navbar">
            <a href="AdminController" class="admin-navbar__item">DashBoard</a>
            <a
              href="AdminController?action=addflight"
              class="admin-navbar__item admin-navbar__item--active"
              >Add Flight</a
            >
            <a
              href="UserController?action=accountlist"
              class="admin-navbar__item"
              >Account</a
            >
            <a
              href="AdminController?action=reportflight"
              class="admin-navbar__item"
              >Reports & Analytics</a
            >
          </nav>
          <!-- Action -->
          <div class="admin-header__avatar">
            <a href="#!" class="admin-header__name">Admin</a>
            <img
              src="./assets/img/tourist-attraction.jpg"
              alt=""
              class="admin-header__img"
            />
            <a class="admin-header__btn" href="AuthController?action=logout"
              >Logout</a
            >
          </div>
        </div>
      </div>
    </header>
    <main>
      <section class="flight-edit">
        <div class="container">
          <div class="flight-edit__inner">
            <h1 class="flight-edit__title">
              ${requestScope.nextaction != null && requestScope.nextaction ==
              'insertflight' ? 'Add Flight' : 'Edit Flight'}
            </h1>
            <form
              action="FlightController"
              class="flight-edit__form"
              action="${requestScope.nextaction}"
            >
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
                    id="flightId"
                    value="${requestScope.flightid}"
                    readonly
                  />
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
                    value="${requestScope.flight.flightNumber}"
                    required
                  />
                </div>
              </div>
              <div class="row">
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Departure Airport</label
                  >
                  <input
                    class="flight-edit__form-input"
                    id="departure"
                    type="text"
                    placeholder="Enter Departure Airport"
                    name="departureAirport"
                    value="${requestScope.departurename}"
                    required
                  />
                  <div id="departure-list" class="autocomplete-list"></div>
                </div>
                
                <div class="flight-edit__form-group col-6">
                  <label class="flight-edit__form-label" for=""
                    >Arrival Airport</label
                  >
                  <input
                    class="flight-edit__form-input"
                    type="text"
                    id="arrival"
                    placeholder="Enter Arrival Airport"
                    name="arrivalAirport"
                    value="${requestScope.arrivalname}"
                    required
                  />
                  <div id="arrival-list" class="autocomplete-list"></div>
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
                    value="${requestScope.departuretime}"
                    required
                  />
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
                    value="${requestScope.arrivaltime}"
                    required
                  />
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
                    value="${requestScope.flight.airline}"
                    required
                  />
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
                    value="Flighter 878"
                    readonly
                  />
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
                    value="${requestScope.flight.businessPrice}"
                    required
                  />
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
                    value="${requestScope.flight.economyPrice}"
                    required
                  />
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
                    value="${requestScope.flight.flightStatus}"
                    required
                  />
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
                    placeholder="Enter Baggage"
                    value="${requestScope.flight.baggageAllow}"
                    required
                  />
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
                    value ="120"
                    readonly
                  />
                </div>
              </div>
              <input
                type="hidden"
                name="action"
                value="${requestScope.nextaction}"
              />
              <button class="flight-edit__form-btn">
                ${requestScope.nextaction != null && requestScope.nextaction ==
                'insertflight' ? 'Add Flight' : 'Edit'}
              </button>
            </form>
          </div>
        </div>
      </section>
    </main>
              
   <script>
          document.addEventListener("DOMContentLoaded", function () {
          let airports = [
              <%
                  List<Map<String, String>> airports = (List<Map<String, String>>) request.getAttribute("airports");
                  if (airports != null) {
                      for (Map<String, String> airport : airports) {
              %>
                  { name: "<%= airport.get("name")%>", city: "<%= airport.get("city")%>", country: "<%= airport.get("country")%>" },

              <%
                      }
                  }
              %>
          ];
          setupAutocomplete("departure", airports);
          setupAutocomplete("arrival", airports);
      });

      function setupAutocomplete(inputId, airports) {

          const input = document.getElementById(inputId);
          const list = document.getElementById(inputId + "-list");

          input.addEventListener("input", function () {
              console.log("dada");
              const query = input.value.trim().toLowerCase();
              list.innerHTML = "";

              if (query.length < 1) {
                  return;
              }

              let filteredAirports = airports.filter(airport =>
                  airport.name.toLowerCase().includes(query) || airport.city.toLowerCase().includes(query) || airport.country.toLowerCase().includes(query)
              );

              showAirportList(filteredAirports, input, list);
          });

          document.addEventListener("click", function (e) {
              if (!list.contains(e.target) && e.target !== input) {
                  list.innerHTML = "";
              }
          });
      }

      function showAirportList(airportList, input, list) {
      list.innerHTML = "";

      airportList.forEach(airport => {
          let displayName = airport.name ? airport.name : "Unknown";
          let displayCity = airport.city ? airport.city : "Unknown";
          let displayCountry = airport.country ? airport.country : "Unknown";
          console.log(displayName);
          console.log(displayCity);
          console.log(displayCountry);
          const div = document.createElement("div");
          div.classList.add("autocomplete-item");

          if (displayCountry && displayCountry.trim() !== "" && displayCountry !== "undefined") {
              div.innerHTML = displayName + " - " + displayCity + " - " + displayCountry;

          } else {
              div.innerHTML = displayName;
          }

          div.onclick = function () {
              input.value = displayName;
              list.innerHTML = "";
          };

          list.appendChild(div);
      });
      }
    </script>           
  </body>
</html>
