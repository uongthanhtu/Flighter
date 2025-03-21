<%@page import="java.time.format.DateTimeFormatter"%>
<%@page import="flightbooking.model.FlightDTO"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight list</title>
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
    
    <style>
        .autocomplete-list {
            position: absolute;
            background: white;
            border: 1px solid #ddd;
            max-height: 200px;
            overflow-y: auto;
            z-index: 1000;
        }
        .autocomplete-item {
            padding: 5px;
            cursor: pointer;
        }
        .autocomplete-item:hover {
            background: #f0f0f0;
        }
    </style>
    
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
        <div class="flight-search__container">
        <div class="container">
          <div class="flight-search__box row row-cols-1">
            <form
              action="BookingController"
              method="GET"
              class="flight-search__form"
            >
              <div class="flight-search__form-group">
                <label class="flight-search__form__label" for="departure"
                  >Point of departure</label
                >
                <input
                  class="flight-search__form__input"
                  type="text"
                  id="departure"
                  name="departure"
                  placeholder="<%=(String)request.getAttribute("departure")%>"
                  autocomplete="off"
                />
                <div id="departure-list" class="autocomplete-list"></div>
              </div>

              <div class="flight-search__form-group">
                <label class="flight-search__form__label" for="arrival"
                  >Destination</label
                >
                <input
                  class="flight-search__form__input"
                  type="text"
                  id="arrival"
                  name="arrival"
                  placeholder="<%=(String)request.getAttribute("arrival")%>"
                  autocomplete="off"
                />
                <div id="arrival-list" class="autocomplete-list"></div>
              </div>

              <div class="flight-search__form-group">
                <label class="flight-search__form__label" for="date"
                  >Departure date</label
                >
                <input
                  class="flight-search__form__input"
                  type="date"
                  id="date"
                  name="departuredate"
                  class="custom-date"
                />
              </div>
              <input type="hidden" name="action" value="searchflight" />
              <button class="flight-search__form-btn" type="submit">
                Search Flights
              </button>
            </form>
          </div>
        </div>
      </div>
      <section class="flight-list">
        <div class="container">
            <% List<FlightDTO> flightlist = (List<FlightDTO>) request.getAttribute("flightlist");
                if(flightlist != null){
                    for (FlightDTO flight : flightlist) {
                        pageContext.setAttribute("flight", flight);
                        DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm:ss dd-MM-yyyy");           
                    %>   
          <div class="flight row row-cols-1">
          <a href="BookingController?action=flightdetails&flightid=${flight.flightID}" class="flight--link">
              <div class="flight--overview">
              <h2 class="flight--code">Flight No: ${flight.flightNumber}</h2>
              <div class="flight--time">
                <p class="flight--time__departure">
                    
                  <b class="flight--time__bold">From: </b> 
                  <%= flight.getDepartureTime().format(formatter) %>
                  (Local time)
                </p>
                <p class="flight--time__arrival">
                  <b class="flight--time__bold">To: </b>
                  <%= flight.getArrivalTime().format(formatter) %>
                  (Local time)
                </p>
              </div>
              <div class="flight--location">
                <p class="flight--location__departure">
                    ${requestScope.airport[flight.departureID]}
                </p>
                <p class="flight--location__arrival">
                    ${requestScope.airport[flight.arrivalID]}
                </p>
              </div>
            </div>
            
        </a>
 
        </div>
        <%}
            }
        %>
      </div>
      </section>
      </div>
    
    </main>
    <script src="./assets/javascripts/script.js"></script>
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
