<%-- Document : login Created on : Feb 26, 2025, 6:11:30 PM Author : ADMIN --%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <title>Login Page</title>
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
    <link rel="stylesheet" href="assets/css/main.css" />
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
    <section class="login__section">
      <div class="login-form__container">
        <form class="login-form" action="AuthController">
          <h2 class="login-form__title">Login</h2>
          <% String error = (String) request.getAttribute("error"); %> <% if
          (error != null) { %>
          <h3 style="color: red"><%= error %></h3>
          <% } %>
          <div class="login-form__component">
            <label class="login-form__label" for="email">Email</label>
            <div class="login-form__input-field">
              <input
                class="login-form__input"
                type="email"
                required
                placeholder="Enter email"
                name="email"
              />
              <i class="login-form__fa fa-regular fa-envelope"></i>
            </div>
          </div>
          <div class="login-form__component">
            <label class="login-form__label" for="password">Password</label>
            <div class="login-form__input-field">
              <input
                class="login-form__input"
                type="password"
                required
                placeholder="Enter password"
                id="password"
                name="password"
              />
              <i class="login-form__fa fa-solid fa-lock"></i>
            </div>
          </div>
          <div class="login-form__options">
            <label class="login-form__options__label"
              ><input class="login-form__options__input" type="checkbox" />
              Remember me</label
            >
            <a
              class="login-form__options__link"
              href="../forgotpassword-form/forgotpassword.html"
              >Forgot Password ?</a
            >
          </div>
          <input type="hidden" value="login" name="action" />
          <% String nextaction = (String) request.getAttribute("nextaction");
            if(nextaction != null && !nextaction.isEmpty() && nextaction.equals("selecteseat")){%>
            <input type="hidden" name="nextaction" value="selecteseat">
            <input type="hidden" name="flightid" value="${requestScope.flightid}">
            <%}
          %>
          <button class="login-form__btn" type="submit">Login</button>
          <p class="login-form__register-prompt">
            Don't have an account ?
            <a class="login-form__register__link" href="register.jsp"
              >Register</a
            >
          </p>
        </form>
      </div>
    </section>
  </body>
</html>
