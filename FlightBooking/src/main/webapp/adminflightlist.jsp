<%@page import="flightbooking.model.FlightDTO"%>
<%@page import="java.util.List"%>
<%@page import="java.time.format.DateTimeFormatter"%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Flight List</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet" />
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
              class="admin-logo__img" />
            <p class="admin-logo__title">Flighter</p>
          </a>
          <nav class="admin-navbar">
            <a
              href="AdminController?action=flightlist"
              class="admin-navbar__item admin-navbar__item--active"
              >DashBoard</a
            >
            <a href="AdminController?action=addflight" class="admin-navbar__item"
              >Add Flight</a
            >
            <a href="AdminController?action=editaccount" class="admin-navbar__item"
              >Account</a
            >
            <a href="AdminController?action=reportflight" class="admin-navbar__item"
              >Reports & Analytics</a
            >
          </nav>
          <!-- Action -->
          <div class="admin-header__avatar">
            <a href="#!" class="admin-header__name">Admin</a>
            <img
              src="./assets/img/tourist-attraction.jpg"
              alt=""
              class="admin-header__img" />
            <a class="admin-header__btn" href="AuthController?action=logout">Logout</a>
          </div>
        </div>
      </div>
    </header>
    <main style="height: 10000px">
      <!-- Account manager -->
      <section class="account-manager">
        <div class="container">
          <div class="account-manager__inner">
            <h1 class="account-manager__title">Flight List</h1>
            <table class="account-manager__table">
              <thead>
                <tr>
                  <th>FlightID</th>
                  <th>Flight Number</th>
                  <th>Departure-Arrival Airport</th>
                  <th>Departure-Arrival Time</th>
                  <th>Flight Status</th>
                  <th>Action</th>
                </tr>
              </thead>
              <tbody>
                  <% List <FlightDTO> flightlist = (List<FlightDTO>) request.getAttribute("flightlist");
                  if(flightlist != null){
                      for (FlightDTO flight : flightlist) {
                          pageContext.setAttribute("flight", flight);
                  %> 
                      
                   
                <tr>
                  <td>${flight.flightID}</td>
                  <td>${flight.flightNumber}</td>
                  <td>From ${requestScope.airportname[flight.departureID]} <br> to ${requestScope.airportname[flight.arrivalID]}</td>
                  <% 
                    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("dd-MM-yyyy HH:mm:ss");           
                    %>
                    <td>From <%= flight.getDepartureTime().format(formatter) %> <br> to
                    <%= flight.getArrivalTime().format(formatter) %></td>
                  <td>${flight.flightStatus}</td>
                  <td>
                    <a
                      class="account-manager__btn account-manager__btn--edit"
                      href="FlightController?action=editflight&flightid=${flight.flightID}">
                      <i class="fas fa-edit"></i> Update
                    </a>
                    <a
                      class="account-manager__btn account-manager__btn--delete"
                      href="FlightController?action=delete&flightid=${flight.flightID}">
                      <i class="fas fa-trash"></i> Delete
                    </a>
                    <a
                      class="account-manager__btn account-manager__btn--detail"
                      href="FlightController?action=details&flightid=${flight.flightID}">
                      <i class="fas fa-trash"></i> Detail
                    </a>
                  </td>
                </tr>
                <%   
                      }
                  }  
                  %>
              </tbody>
            </table>
            <div class="account-manager__pagination">
              <a class="account-manager__pre-btn" href="">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="32"
                  height="32"
                  viewBox="0 0 32 32"
                  fill="none">
                  <path
                    d="M19 8.5L11.5 16L19 23.5"
                    stroke="#6E7491"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round" />
                </svg>
              </a>
              <span class="account-manager__pagenumber">1</span>
              <span class="account-manager__pagenumber">2</span>
              <span class="account-manager__pagenumber">...</span>
              <a class="account-manager__next-btn" href="">
                <svg
                  xmlns="http://www.w3.org/2000/svg"
                  width="32"
                  height="32"
                  viewBox="0 0 32 32"
                  fill="none">
                  <path
                    d="M12 8.5L19.5 16L12 23.5"
                    stroke="#6E7491"
                    stroke-width="2"
                    stroke-linecap="round"
                    stroke-linejoin="round" />
                </svg>
              </a>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
