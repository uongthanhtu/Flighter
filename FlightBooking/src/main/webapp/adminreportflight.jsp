<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
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
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body class="admin-body">
    <!-- Header -->
    <header class="admin-header">
      <div class="container">
        <div class="admin-header__inner">
          <a href="AdminController" class="admin-logo">
            <img
              src="./assets/img/airplane-flight.png"
              alt=""
              class="admin-logo__img"
            />
            <p class="admin-logo__title">Flighter</p>
          </a>
          <nav class="admin-navbar">
            <a href="AdminController" class="admin-navbar__item">DashBoard</a>
            <a
              href="AdminController?action=addflight"
              class="admin-navbar__item"
              >Add Flight</a
            >
            <a
              href="UserController?action=accountlist"
              class="admin-navbar__item"
              >Account</a
            >
            <a
              href="AdminController?action=reportflight"
              class="admin-navbar__item admin-navbar__item--active"
              >Reports & Analytics</a
            >
          </nav>
          <!-- Action -->
          <div class="admin-header__avatar">
            <a href="#!" class="admin-header__name">Admin</a>
            <img
              src="./assets/img/tourist-attraction.jpg"
              alt=""
              class="admin-header__img"
            />
            <a class="admin-header__btn" href="AuthController?action=logout"
              >Logout</a
            >
          </div>
        </div>
      </div>
    </header>
    <main>
      <section class="report-anal">
        <div class="container">
          <div class="report-anal__inner">
            <h1 class="report-anal__title">Flighter Report</h1>
            <div class="report-anal__container">
              <div class="report-anal__box">
                <i class="fas fa-user report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Registered Users</h2>
                <p class="report-anal__box-desc">${requestScope.countuser}</p>
              </div>
              <div class="report-anal__box">
                <i class="fas fa-ticket-alt report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Tickets Booked</h2>
                <p class="report-anal__box-desc">${requestScope.coutnticketbooked}</p>
              </div>
              <div class="report-anal__box">
                <i class="fas fa-dollar-sign report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Revenue</h2>
                <p class="report-anal__box-desc"><fmt:formatNumber value="${requestScope.revenue}" type="number" groupingUsed="true" /> VND</p>
              </div>
              <div class="report-anal__box">
                <i class="fas fa-plane report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Flights Scheduled</h2>
                <p class="report-anal__box-desc">${requestScope.countflight}</p>
              </div>
              <div class="report-anal__box">
                <i class="fas fa-ban report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Tickets Pending</h2>
                <p class="report-anal__box-desc">${requestScope.coutnticketpending}</p>
              </div>
              <div class="report-anal__box">
                <i class="fas fa-clock report-anal__box-icon"></i>
                <h2 class="report-anal__box-title">Seat Occupancy Rate</h2>
                <p class="report-anal__box-desc">${requestScope.seatrate} %</p>
              </div>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
