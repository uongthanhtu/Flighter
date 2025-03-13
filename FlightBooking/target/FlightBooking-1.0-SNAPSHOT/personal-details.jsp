<%@page import="flightbooking.model.UserDTO"%> 
<%@page import="flightbooking.model.UserDTO" %>
    
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Personal Details</title>
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/main.css"  />
  </head>
  <body>
    <header class="header">
        <div class="container">
          <nav class="navbar">
            <!-- Logo -->
            <a href="index2.jsp" class="logo__link"
              ><img
                src="./assets/img/logo-removebg-preview.png"
                alt="logo"
                class="logo" />
            </a>
            <div class="navbar__actions">
              <a href="#!" class="navbar__link">My booking</a>
              <a href="#!" class="navbar__link">Flights</a>
              <a href="#!" class="navbar__link">Support</a>
              <% UserDTO usersession = (UserDTO)session.getAttribute("usersession"); 
              if(usersession == null){ %>
              <a href="login.jsp" class="navbar__link">Sign in</a>
              <a href="register.jsp" class="navbar__link">Sign up</a>
              <% }else{%>

              <a
                href="ProfileController?action=profile_details"
                class="user__avt">
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

    <div class="account">
      <div class="account__menu">
        <h3>My account</h3>
        <ul>
          <li class="account__list">
            <i class="fa-solid fa-user"></i> Profile
          </li>
          <li><i class="fa-solid fa-users"></i> Saved Travellers</li>
          <li><i class="fa-solid fa-arrow-right-from-bracket"></i> Log Out</li>
        </ul>
      </div>

      <div class="account__details">
        <div class="account__data">
          <h2>Personal Details</h2>
          <div class="account__item">
            <div class="account__email">
              <p>Email (For account log in):</p>
              <p class="account__info"><%= usersession.getEmail() %></p>
            </div>
            <div class="account_name">
              <p>Full Name:</p>
              <p class="account__info"><%= usersession.getFullName() %></p>
            </div>
          </div>
          <div class="account__item">
            <div class="account__dob">
              <p>Date of Birth:</p>
              <p class="account__info"><%= usersession.getDOB() %></p>
            </div>
            <div class="account__phone">
              <p>Mobile Number:</p>
              <p class="account__info"><%= usersession.getPhoneNumber()%></p>
            </div>
          </div>
          <button
            class="account__button"
            onclick="window.location.href='edit-profile.jsp';">
            Edit
          </button>
        </div>
      </div>
    </div>
    <script src="./assets/javascripts/profile.js"></script>
  </body>
</html>
