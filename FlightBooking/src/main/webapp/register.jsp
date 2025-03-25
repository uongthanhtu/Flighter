<%-- Document : register Created on : Feb 26, 2025, 6:11:45 PM Author : ADMIN
--%> <%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Register Page</title>
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
            <a href="login.jsp" class="navbar__link">Sign in</a>
            <a href="register.jsp" class="navbar__link">Sign up</a>
          </div>
        </nav>
      </div>
    </header>
    <section class="register__section">
      <div class="register__container">
        <form action="AuthController" class="register-form">
          <h2 class="register-form__title">
            Ready to join our Skywards ? Let's get started
          </h2>
          <p class="register__login-prompt">
            Already have an account ?
            <a class="register__login-prompt__link" href="login.jsp">Log In</a>
          </p>
          <h3 class="register-form__subtitle">Personal Information</h3>
          <div class="register-form__name">
            <div>
              <label class="register-form__label">First name*</label>
              <div class="register-form__component--flex">
                <input
                  name="firstName"
                  class="register-form__name__input"
                  type="text"
                  required
                  placeholder="Enter First Name"
                />
              </div>
            </div>
            <div>
              <label class="register-form__label">Last name</label>
              <div class="register-form__component--flex">
                <input
                  name="lastName"
                  class="register-form__name__input"
                  type="text"
                  required
                  placeholder="Enter Last Name"
                />
              </div>
            </div>
          </div>

          <div class="register-form__email">
            <label class="register-form__label">Email*</label>
            <div class="register-form__component--flex">
              <input
                name="email"
                class="register-form__email__input"
                type="email"
                required
                placeholder="Enter email"
              />
              <i class="fa-regular fa-envelope"></i>
            </div>
          </div>
          <% String error = (String) request.getAttribute("erroremail"); %> <%
          if (error != null) { %>
          <h4 style="color: red"><%= error %></h4>
          <% } %>
          <div class="register-form__dob-and-phone">
            <div class="register-form__dob">
              <label class="register-form__label">Date of Birth*</label>
              <div class="register-form__dob__detail">
                <select
                  class="register-form__dob__value"
                  id="day"
                  name="day"
                  required
                >
                  <option value="" disabled selected hidden>Day</option>
                </select>
                <select
                  class="register-form__dob__value"
                  id="month"
                  name="month"
                  required
                >
                  <option value="" disabled selected hidden>Month</option>
                  <option value="1">January</option>
                  <option value="2">February</option>
                  <option value="3">March</option>
                  <option value="4">April</option>
                  <option value="5">May</option>
                  <option value="6">June</option>
                  <option value="7">July</option>
                  <option value="8">August</option>
                  <option value="9">September</option>
                  <option value="10">October</option>
                  <option value="11">November</option>
                  <option value="12">December</option>
                </select>
                <select
                  class="register-form__dob__value"
                  id="year"
                  name="year"
                  required
                >
                  <option value="" disabled selected hidden>Year</option>
                </select>
              </div>
            </div>
            <div class="register-form__phone">
              <label class="register-form__label">Mobile Number*</label>
              <div class="register-form__phone__detail">
                <select
                  class="register-form__phone__country-code"
                  id="countryCode"
                  name="countryCode"
                  required
                >
                  <option value="+1">+1 (USA)</option>
                  <option value="+44">+44 (UK)</option>
                  <option value="+84">+84 (Vietnam)</option>
                  <!-- có thể add thêm country vào đây nhá -->
                </select>

                <!-- <div class="input-phone"> -->
                <input
                  class="register-form__phone__number"
                  type="tel"
                  required
                  name="phoneNumber"
                  placeholder="Mobile Number"
                />
                <!-- </div> -->
              </div>
            </div>
          </div>

          <div class="register-form__password-and-confirm">
            <div class="register-form__password">
              <label class="register-form__label">Password</label>
              <div class="register-form__password__detail">
                <input
                  name="password"
                  class="register-form__password__value"
                  type="password"
                  id="password"
                  placeholder="Enter password"
                />
                <i class="fa-regular fa-eye eye-icon" id="togglePassword1"></i>
              </div>
            </div>
            <div class="register-form__password-confirm">
              <label class="register-form__label">Confirm Password*</label>
              <div class="register-form__password__detail">
                <input
                  name="password-confirm"
                  class="register-form__password__value"
                  type="password"
                  id="password-confirm"
                  placeholder="Enter password"
                />
                <i class="fa-regular fa-eye eye-icon" id="togglePassword2"></i>
              </div>
              <% String errorpass = (String)
              request.getAttribute("errorpassword"); %> <% if (errorpass !=
              null) { %>
              <h4 style="color: red"><%= errorpass %></h4>
              <% } %>
            </div>
          </div>

          <div class="register-form__policy-1">
            <input
              class="register-form__policy__checkbox"
              type="checkbox"
              required
            />
            <label class="register-form__label"
              >I have read and agreed with
              <a href="#!">Flighter's terms and conditions</a>
            </label>
          </div>
          <div class="register-form__policy-2">
            <input
              class="register-form__policy__checkbox"
              type="checkbox"
              required
            />
            <label class="register-form__label"
              >I acknowledge and accept the terms of
              <a href="#!">Flighter's Privacy Policy</a>
            </label>
          </div>
          <input type="hidden" value="register" name="action" />
          <button class="register-form__btn" type="submit">Register</button>
        </form>
      </div>
    </section>
    <script src="./assets/javascripts/register.js"></script>
    <script>
      document.addEventListener("DOMContentLoaded", function () {
        // Thêm ngày
        let daySelect = document.getElementById("day");
        for (let i = 1; i <= 31; i++) {
          let option = document.createElement("option");
          option.value = i;
          option.textContent = i;
          daySelect.appendChild(option);
        }

        // Thêm năm
        let yearSelect = document.getElementById("year");
        const currentYear = new Date().getFullYear();
        for (let i = currentYear; i >= 1900; i--) {
          let option = document.createElement("option");
          option.value = i;
          option.textContent = i;
          yearSelect.appendChild(option);
        }
      });
    </script>
  </body>
</html>
