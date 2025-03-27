<%@page import="flightbooking.model.SeatTicketDTO"%>
<%@ page import="flightbooking.model.SeatDTO" %>
<%@ page import="java.util.List" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
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
              class="admin-navbar__item admin-navbar__item--active"
              >Add Flight</a
            >
            <a
              href="UserController?action=accountlist"
              class="admin-navbar__item"
              >Account</a
            >
            <a
              href="AdminController?action=reportflight"
              class="admin-navbar__item"
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
      <div class="container">
        <section class="header-flight-details">
          <h2 class="header-flight-details__title">Flight Information</h2>
          <div class="flight-info">
            <div class="flight-info-item">
              <h3 class="flight-info-item__title">Flight ID</h3>
              <p class="flight-info-item__desc">${requestScope.flight.flightID}</p>
            </div>
            <div class="flight-info-item">
              <h3 class="flight-info-item__title">Flight Number</h3>
              <p class="flight-info-item__desc">${requestScope.flight.flightNumber}</p>
            </div>
            <div class="flight-info-item">
              <h3 class="flight-info-item__title">Flight Status</h3>
              <p class="flight-info-item__desc">${requestScope.flight.flightStatus}</p>
            </div>
            <div class="flight-info-item">
              <h3 class="flight-info-item__title">Date</h3>
              <p class="flight-info-item__desc">${requestScope.flight.departureTime}</p>
            </div>
            <div class="flight-info-item">
              <h3 class="flight-info-item__title">Time</h3>
              <p class="flight-info-item__desc">${requestScope.flight.departureTime}</p>
            </div>
          </div>
        </section>
      </div>
      <div class="container">
        <section class="seat-ticket-list">
          <h2 class="seat-ticket-list__title">Seat List</h2>
          

          <table class="seat-ticket-table">
            <thead>
              <tr>
                <th>Seat ID</th>
                <th>Seat Number</th>
                <th>Passenger Name</th>
                <th>Ticket Class</th>
                <th>Status</th>
              </tr>
            </thead>
            <tbody>
              <%
                List<SeatTicketDTO> seatlist = (List<SeatTicketDTO>)request.getAttribute("seatlist");
                if(seatlist != null || seatlist.isEmpty()){
                  for (SeatTicketDTO seat : seatlist) {
                    pageContext.setAttribute("seat",seat);

              %>
              <tr>
                <td>${seat.seatID}</td>
                <td>${seat.seatNumber}</td>
                <td>${seat.passengerName}</td>
                <td>
                  <span class="class-badge ${seat.fareClass.equals("business")?"class-business": "class-economy" } ">${seat.fareClass}</span>
                </td>
                <td>
                  <span class="status-badge  ${seat.seatStatus.equals("booked")?"status-booked": "status-available" }">${seat.seatStatus}</span>
                </td>
                <td>
                </td>
              </tr>
            <%
              }
              }
            %>
            </tbody>
          </table>

          <div class="seat-ticket-list__pagination">
            <a href="seat-ticket-list__pagination-btn">Previous</a>
            <a
              href=""
              class="seat-ticket-list__pagination-btn seat-ticket-list__pagination-btn--active"
            >
              1
            </a>
            <a href="" class="seat-ticket-list__pagination-btn">Next</a>
          </div>
        </section>
      </div>
    </main>
  </body>
</html>
