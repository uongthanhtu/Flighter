<%-- Document : login Created on : Feb 26, 2025, 6:11:30 PM Author : ADMIN --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Change Password</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css" />
  </head>
  <body>
    <header class="header">
      <div class="container">
        <nav class="navbar">
          <!-- Logo -->
          <a href="index.html" class="logo__link"
            ><img
              src="./assets/img/logo-removebg-preview.png"
              alt="logo"
              class="logo" />
          </a>

          <div class="navbar__actions">
            <a href="#!" class="navbar__link">My booking</a>
            <a href="#!" class="navbar__link">Flights</a>
            <a href="#!" class="navbar__link">Support</a>
            <a href="#!" class="navbar__link">Sign in</a>
            <a href="#!" class="navbar__link">Sign up</a>
          </div>
        </nav>
      </div>
    </header>
    <div class="change-password__container">
      <div class="change-password__content">
        <h2 class="change-password__title">Change Password</h2>
        <div class="change-password__password">
          <label for="password" class="change-password__label">Password</label>
          <div class="password-container">
            <input
              class="password-container__input"
              type="password"
              id="password"
              placeholder="Enter password" />
            <i
              class="icon--hover fa-regular fa-eye eye-icon"
              id="togglePassword1"></i>
          </div>
        </div>

        <div class="change-password__confirm">
          <label for="password-confirm" class="change-password__label"
            >Confirm Password</label
          >
          <div class="password-container">
            <input
              class="password-container__input"
              type="password"
              id="password-confirm"
              placeholder="Enter password" />
            <i
              class="icon--hover fa-regular fa-eye eye-icon"
              id="togglePassword2"></i>
          </div>
        </div>
        <p class="change-password__reminder">
          Make sure it's at least 15 characters OR at least 8 characters
          including a number and a lowercase letter. <a href="#!">Learn more</a>
        </p>
        <button class="change-password__btn" onclick="">Change Password</button>
      </div>
    </div>
    <script src="./assets/javascripts/changepass.js"></script>
  </body>
</html>
