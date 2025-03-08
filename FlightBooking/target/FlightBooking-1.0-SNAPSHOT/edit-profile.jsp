<%@page import="flightbooking.model.UserDTO"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile</title>
    <link rel="stylesheet" href="css/main.css" />
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar">
      <!-- Logo -->
      <a href="AirportController">
        <img
          src="./assets/img/logo-removebg-preview.png"
          alt="logo"
          class="logo"
        />
      </a>
      <!-- Navigation -->
      <ul>
        <li>
          <a href="#!" class="booking-btn">My booking</a>
        </li>
        <li class="support-btn__wrapper">
          <a href="#!" class="support-btn">Support</a>
        </li>
      </ul>
      <form action="/search" method="GET" class="search-form">
        <input
          type="text"
          name="search"
          placeholder="Search destinations ..."
        />
        <button type="submit">Search</button>
      </form>
      <!-- Action -->
      <div class="actions">
        <a href="#!">Sign in</a>
        <a href="#!">Sign up</a>
      </div>
    </nav>

    <div class="profile">
      <img
        src="img/Airplane Travel.jpg"
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
        <% UserDTO usersession = (UserDTO) session.getAttribute("usersession"); %> 
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
              <select class="profile__select" name="day">
                <option value="" disabled selected hidden>Day</option>
                <script>
                  for (let i = 1; i <= 31; i++) {
                    document.write(`<option value="${i}">${i}</option>`);
                  }
                </script>
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

              <select class="profile__select" name="year">
                <option value="" disabled selected hidden>Year</option>
                <script>
                  const currentYear = new Date().getFullYear();
                  for (let i = currentYear; i >= 1900; i--) {
                    document.write(`<option value="${i}">${i}</option>`);
                  }
                </script>
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
              <input type="hidden" name="action" value="update_profile">
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
            <!-- có thể add thêm country vào đây nhá -->
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
    <script src="scripts/profile.js"></script>
  </body>
</html>
