<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Edit Profile</title>
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

    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
    />
  </head>
  <body>
    <!-- Navbar -->
    <nav class="navbar">
      <!-- Logo -->
      <a href="index.html">
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
        src="img/Cartoon Tourismus Einfachen.jpg"
        alt=""
        srcset=""
        class="profile__picture"
      />
      <div class="profile__container">
        <a href="edit-profile.html" class="profile__back">&lt; Back</a>
        <h2 class="profile__title">Edit Password</h2>

        <form action="" class="profile__form">
          <div class="profile__group">
            <label class="profile__label">Current Password*</label>
            <div class="profile__password">
              <input
                type="password"
                class="profile__input"
                id="current-password"
              />
              <i
                class="fa-regular fa-eye profile__eye"
                onclick="togglePassword('current-password', this)"
              ></i>
            </div>
          </div>

          <div class="profile__group">
            <label class="profile__label">New Password</label>
            <div class="profile__password">
              <input type="password" class="profile__input" id="new-password" />
              <i
                class="fa-regular fa-eye profile__eye"
                onclick="togglePassword('new-password', this)"
              ></i>
            </div>
          </div>

          <div class="profile__group">
            <label class="profile__label">Confirm Password</label>
            <div class="profile__password">
              <input
                type="password"
                class="profile__input"
                id="confirm-password"
              />
              <i
                class="fa-regular fa-eye profile__eye"
                onclick="togglePassword('confirm-password', this)"
              ></i>
            </div>
          </div>

          <div class="profile__actions">
            <button
              onclick="window.location.href='edit-profile.html';"
              type="button"
              class="profile__button profile__button--cancel"
            >
              Cancel
            </button>
            <button type="submit" class="profile__button profile__button--save">
              Save
            </button>
          </div>
        </form>
      </div>
    </div>
    <script src="scripts/profile.js"></script>
  </body>
</html>
