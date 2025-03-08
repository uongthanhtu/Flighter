<%@page import="flightbooking.model.UserDTO"%>
<%@ page import="flightbooking.model.UserDTO" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Personal Details</title>
    <link rel="stylesheet" href="css/main.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
  </head>
  <body>
     <% UserDTO usersession = (UserDTO) session.getAttribute("usersession");
     %> 
    <header class="personal">
      <div class="personal__left">
        <img
          src="img/avatar.jpg"
          alt="Personal avatar"
          class="personal__avatar"
        />
        <div class="personal__info">
          <h2><%= usersession.getFullName() %></h2>
          <p class="personal__email"><%= usersession.getEmail()%></p>
        </div>
      </div>
      <div class="personal__right">
        <img src="img/logo-web.png" alt="Logo-web" class="personal__logo" />
        <p class="personal__flighter"></p>
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
            onclick="window.location.href='ProfileController?action=edit_profile';"
          >
            Edit
          </button>
        </div>
      </div>
    </div>
    <script src="scripts/profile.js"></script>
  </body>
</html>
