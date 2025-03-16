<%@page import="flightbooking.model.UserDTO"%> <%@ page
contentType="text/html;charset=UTF-8" language="java" %>
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
    <header class="header">
      <div class="container">
        <nav class="navbar">
          <!-- Logo -->
          <a href="index2.jsp" class="logo__link"
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

            <a
              href="ProfileController?action=profile_details"
              class="user__avt"
            >
              <img src="./assets/img/user-avt.png" alt="User avt" /> </a
            ><a href="./AuthController?action=logout" class="user__logout__btn"
              >Log out</a
            >
            <%}%>
          </div>
        </nav>
      </div>
    </header>

    <div class="profile">
      <img
        src="./assets/img/airplanetravel.jpg"
        alt=""
        srcset=""
        class="profile__img"
      />
      <div class="profile__forms">
        <h2 class="profile__title">Edit Details</h2>
        <p class="profile__introduction">
          Update your personal information and make
        </p>
        <p class="profile__introduction-1">your profile truly yours!</p>
        <form action="ProfileController" class="profile__form">
          <div class="profile__group">
            <label class="profile__label">Email</label>
            <input
              type="email"
              class="profile__input"
              name="email"
              value="<%= usersession.getEmail() %>"
              disabled
            />
            <input
              type="hidden"
              name="email"
              value="<%= usersession.getEmail()%>"
            />
          </div>

          <div class="profile__row">
            <div class="profile__group">
              <label class="profile__label">Full Name</label>
              <input
                type="text"
                class="profile__input"
                name="fullName"
                placeholder="<%= usersession.getFullName() %>"
              />
            </div>
          </div>

          <div class="profile__group">
            <label class="profile__label">Date of Birth</label>
            <div class="profile__dob">
              <select class="profile__select" id="day" name="day">
                <option value="" disabled selected hidden>Day</option>
              </select>

              <select class="profile__select" name="month">
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

              <select class="profile__select" id="year" name="year">
                <option value="" disabled selected hidden>Year</option>
              </select>
            </div>
          </div>

          <div class="profile__group">
            <label class="profile__label">Mobile Number</label>
            <input
              type="text"
              class="profile__input"
              name="phoneNumber"
              placeholder="<%= usersession.getPhoneNumber()%>"
            />
            <div class="profile__addNumber">
              <a href="#" id="openModal">+ Add Mobile Number</a>
            </div>
          </div>

          <div class="profile__redirect">
            <a href="ProfileController?action=edit_password">Change Password</a>
          </div>

          <div class="profile__actions">
            <button
              type="button"
              class="profile__button profile__button--cancel"
              onclick="window.location.href='personal-details.jsp';"
            >
              Cancel
            </button>
            <input type="hidden" name="action" value="update_profile" />
            <button type="submit" class="profile__button profile__button--save">
              Save
            </button>
          </div>
        </form>
      </div>
    </div>

    <!-- Add number pop up modal -->
    <div id="mobileModal" class="modal">
      <div class="modal__content">
        <h2 class="modal__title">Add Mobile Number</h2>
        <label>Mobile Number*</label>
        <div class="modal__input">
          <select id="countryCode" name="countryCode" required>
            <option value="">Country code</option>
            <option value="+1">+1 (USA)</option>
            <option value="+44">+44 (UK)</option>
            <option value="+84">+84 (Vietnam)</option>
            <!-- cÃ³ thá» add thÃªm country vÃ o ÄÃ¢y nhÃ¡ -->
          </select>

          <input type="tel" required placeholder="Mobile Number" />
        </div>
        <div class="modal__buttons">
          <button class="modal__button modal__button--cancel">Cancel</button>
          <button type="submit" class="modal__button modal__button--save">
            Save
          </button>
        </div>
      </div>
    </div>
    <script src="./assets/javascripts/profile.js"></script>
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
