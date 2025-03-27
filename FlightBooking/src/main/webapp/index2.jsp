<%@page import="java.util.Map"%> <%@ page import="java.util.Map, java.util.List"
%> <%@page import="java.util.List"%> <%@page
import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flighter - Take your dream to the new height</title>

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
    <meta name="msapplication-TileColor" content="#ffffff" />
    <meta
      name="msapplication-TileImage"
      content="./assets/favicon/ms-icon-144x144.png"
    />
    <meta name="theme-color" content="#ffffff" />

    <link rel="stylesheet" href="assets/css/main.css" />

    <style>
        .flight-search__form-group {
            position: relative;
        }
      .autocomplete-list {
        position: absolute;
        top: 100px;
        background: white;
        border: 1px solid #ddd;
        border-radius: 10px;
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
  <body>
    <main>
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

      <!-- Header -->
      <section class="hero">
        <div class="container">
          <img src="./assets/img/plane.png" alt="hero-img" class="hero__img" />
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
                  placeholder="From..."
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
                  placeholder="To..."
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
      </section>
      <!-- Features -->
      <section class="feature">
        <div class="container">
          <h2 class="feature--title">Features</h2>
          <div
            class="row row-cols-4 row-cols-sm-1 row-cols-md-2 row-cols-lg-2 row-cols-xl-3 row-cols-xxl-4 gy-3"
          >
            <article class="feature--block">
              <div class="feature--article">
                <h3 class="article--title">Tourist attractions</h3>
                <div class="article--img"></div>
              </div>
            </article>
            <article class="feature--block">
              <div class="feature--article">
                <h3 class="article--title">Travel guide</h3>
                <div class="article--img"></div>
              </div>
            </article>
            <article class="feature--block">
              <div class="feature--article">
                <h3 class="article--title">Tour reviews</h3>
                <div class="article--img"></div>
              </div>
            </article>
            <article class="feature--block">
              <div class="feature--article">
                <h3 class="article--title">Flight reviews</h3>
                <div class="article--img"></div>
              </div>
            </article>
          </div>
        </div>
      </section>
      <!-- Stats -->
      <section class="stats">
        <div class="container">
          <div class="stats--title row">
            <p class="stats--title__left">fly into the future with</p>
            <p class="stats--title__right">Flighter</p>
          </div>
          <div class="row row-cols-4 row-cols-sm-1 row-cols-md-2 row-cols-lg-2">
            <div class="stats--group">
              <strong class="stats--num">120+</strong>
              <p class="stats--desc">Domestic and international routes</p>
            </div>
            <div class="stats--group">
              <strong class="stats--num">400+</strong>
              <p class="stats--desc">Daily flights</p>
            </div>
            <div class="stats--group">
              <strong class="stats--num">6000+</strong>
              <p class="stats--desc">Friendly and dedicated staffs</p>
            </div>
            <div class="stats--group">
              <strong class="stats--num">7*</strong>
              <p class="stats--desc">
                The highest ranking for aviation safety with 7 stars
              </p>
            </div>
          </div>
        </div>
      </section>
      <!-- Footer -->
      <footer class="footer">
        <div class="container">
          <div
            class="row row-cols-3 row-cols-sm-1 row-cols-md-1 row-cols-lg-2 gy-3"
          >
            <div class="footer--group">
              <h4 class="footer--title">Contact Us</h4>
              <div class="media">
                <a href="#!" class="media--icon">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
                    <path
                      fill="#3e05eb"
                      d="M512 256C512 114.6 397.4 0 256 0S0 114.6 0 256C0 376 82.7 476.8 194.2 504.5V334.2H141.4V256h52.8V222.3c0-87.1 39.4-127.5 125-127.5c16.2 0 44.2 3.2 55.7 6.4V172c-6-.6-16.5-1-29.6-1c-42 0-58.2 15.9-58.2 57.2V256h83.6l-14.4 78.2H287V510.1C413.8 494.8 512 386.9 512 256h0z"
                    />
                  </svg>
                </a>
                <a href="#!" class="media--icon">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 448 512">
                    <!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
                    <path
                      fill="#e543a1"
                      d="M224.1 141c-63.6 0-114.9 51.3-114.9 114.9s51.3 114.9 114.9 114.9S339 319.5 339 255.9 287.7 141 224.1 141zm0 189.6c-41.1 0-74.7-33.5-74.7-74.7s33.5-74.7 74.7-74.7 74.7 33.5 74.7 74.7-33.6 74.7-74.7 74.7zm146.4-194.3c0 14.9-12 26.8-26.8 26.8-14.9 0-26.8-12-26.8-26.8s12-26.8 26.8-26.8 26.8 12 26.8 26.8zm76.1 27.2c-1.7-35.9-9.9-67.7-36.2-93.9-26.2-26.2-58-34.4-93.9-36.2-37-2.1-147.9-2.1-184.9 0-35.8 1.7-67.6 9.9-93.9 36.1s-34.4 58-36.2 93.9c-2.1 37-2.1 147.9 0 184.9 1.7 35.9 9.9 67.7 36.2 93.9s58 34.4 93.9 36.2c37 2.1 147.9 2.1 184.9 0 35.9-1.7 67.7-9.9 93.9-36.2 26.2-26.2 34.4-58 36.2-93.9 2.1-37 2.1-147.8 0-184.8zM398.8 388c-7.8 19.6-22.9 34.7-42.6 42.6-29.5 11.7-99.5 9-132.1 9s-102.7 2.6-132.1-9c-19.6-7.8-34.7-22.9-42.6-42.6-11.7-29.5-9-99.5-9-132.1s-2.6-102.7 9-132.1c7.8-19.6 22.9-34.7 42.6-42.6 29.5-11.7 99.5-9 132.1-9s102.7-2.6 132.1 9c19.6 7.8 34.7 22.9 42.6 42.6 11.7 29.5 9 99.5 9 132.1s2.7 102.7-9 132.1z"
                    />
                  </svg>
                </a>
                <a href="#!" class="media--icon">
                  <svg xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512">
                    <!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
                    <path
                      fill="#74C0FC"
                      d="M459.4 151.7c.3 4.5 .3 9.1 .3 13.6 0 138.7-105.6 298.6-298.6 298.6-59.5 0-114.7-17.2-161.1-47.1 8.4 1 16.6 1.3 25.3 1.3 49.1 0 94.2-16.6 130.3-44.8-46.1-1-84.8-31.2-98.1-72.8 6.5 1 13 1.6 19.8 1.6 9.4 0 18.8-1.3 27.6-3.6-48.1-9.7-84.1-52-84.1-103v-1.3c14 7.8 30.2 12.7 47.4 13.3-28.3-18.8-46.8-51-46.8-87.4 0-19.5 5.2-37.4 14.3-53 51.7 63.7 129.3 105.3 216.4 109.8-1.6-7.8-2.6-15.9-2.6-24 0-57.8 46.8-104.9 104.9-104.9 30.2 0 57.5 12.7 76.7 33.1 23.7-4.5 46.5-13.3 66.6-25.3-7.8 24.4-24.4 44.8-46.1 57.8 21.1-2.3 41.6-8.1 60.4-16.2-14.3 20.8-32.2 39.3-52.6 54.3z"
                    />
                  </svg>
                </a>
              </div>
              <p class="contact">Hotline: <span>123456789</span></p>
              <p class="contact">Gmail: <span>flighter@gmail.com</span></p>
            </div>
            <div class="footer--group">
              <h4 class="footer--title">Download Flighter Application</h4>
              <img
                src="./assets/img/downloadlogo.png"
                alt="download logo"
                class="download-logo"
              />
            </div>
            <div class="footer--group">
              <h4 class="footer--title">
                Flighter Aviation Joint Stock Company
              </h4>
              <p class="address">123 Skyway Avenue, New York, NY10001, USA</p>
              <div class="sponsorship">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  height="30"
                  width="35"
                  viewBox="0 0 640 512"
                >
                  <!--!Font Awesome Free 6.7.2 by @fontawesome - https://fontawesome.com License - https://fontawesome.com/license/free Copyright 2025 Fonticons, Inc.-->
                  <path
                    fill="#a04bce"
                    d="M323.4 85.2l-96.8 78.4c-16.1 13-19.2 36.4-7 53.1c12.9 17.8 38 21.3 55.3 7.8l99.3-77.2c7-5.4 17-4.2 22.5 2.8s4.2 17-2.8 22.5l-20.9 16.2L512 316.8 512 128l-.7 0-3.9-2.5L434.8 79c-15.3-9.8-33.2-15-51.4-15c-21.8 0-43 7.5-60 21.2zm22.8 124.4l-51.7 40.2C263 274.4 217.3 268 193.7 235.6c-22.2-30.5-16.6-73.1 12.7-96.8l83.2-67.3c-11.6-4.9-24.1-7.4-36.8-7.4C234 64 215.7 69.6 200 80l-72 48 0 224 28.2 0 91.4 83.4c19.6 17.9 49.9 16.5 67.8-3.1c5.5-6.1 9.2-13.2 11.1-20.6l17 15.6c19.5 17.9 49.9 16.6 67.8-2.9c4.5-4.9 7.8-10.6 9.9-16.5c19.4 13 45.8 10.3 62.1-7.5c17.9-19.5 16.6-49.9-2.9-67.8l-134.2-123zM16 128c-8.8 0-16 7.2-16 16L0 352c0 17.7 14.3 32 32 32l32 0c17.7 0 32-14.3 32-32l0-224-80 0zM48 320a16 16 0 1 1 0 32 16 16 0 1 1 0-32zM544 128l0 224c0 17.7 14.3 32 32 32l32 0c17.7 0 32-14.3 32-32l0-208c0-8.8-7.2-16-16-16l-80 0zm32 208a16 16 0 1 1 32 0 16 16 0 1 1 -32 0z"
                  />
                </svg>
                <span>Sponsored</span>
              </div>
            </div>
          </div>
        </div>
      </footer>
    </main>
        <script src="../js/search-form.js"></script>
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
