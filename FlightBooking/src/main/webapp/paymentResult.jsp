<%@page import="flightbooking.model.UserDTO"%> <%@page contentType="text/html"
pageEncoding="UTF-8"%> <%@taglib prefix="c"
uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>The transaction result</title>
    <link
      rel="stylesheet"
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
      integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
      crossorigin="anonymous"
      referrerpolicy="no-referrer"
    />
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>

  <body
    style="
      background-color: #f4f4f4;
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 20px;
    "
  >
    <header class="header">
      <div class="container">
        <nav class="navbar">
          <!-- Logo -->
          <a href="AirportController" class="admin-logo"
            ><img
              src="./assets/img/airplane-flight.png"
              alt="logo"
              class="logo"
            />
            <p class="admin-logo__title">Flighter</p>
          </a>

          <div class="navbar__actions">
            <a href="BookingController?action=mybooking" class="navbar__link"
              >My booking</a
            >
            <a href="BookingController?action=searchflight" class="navbar__link"
              >Flights</a
            >
            <a href="support.jsp" class="navbar__link">Support</a>
            <% UserDTO usersession =
            (UserDTO)session.getAttribute("usersession"); if(usersession ==
            null){ %>
            <a href="login.jsp" class="navbar__link">Sign in</a>
            <a href="register.jsp" class="navbar__link">Sign up</a>
            <% }else{%>
          </div>
          <div class="navbar__users">
            <a
              href="ProfileController?action=profile_details"
              class="user__avt"
            >
              <img src="./assets/img/user-avt.png" alt="User avt" /> </a
            ><a href="./AuthController?action=logout" class="user__logout__btn"
              >Log out</a
            >
          </div>
          <%}%>
        </nav>
      </div>
    </header>
    <section style="margin-top: 50px; text-align: center">
      <div>
        <img
          src="https://cdn2.cellphones.com.vn/insecure/rs:fill:150:0/q:90/plain/https://cellphones.com.vn/media/wysiwyg/Review-empty.png"
          alt="Transaction Status"
          style="width: 120px; height: 120px; margin-bottom: 20px"
        />
      </div>

      <c:if test="${transResult}">
        <div>
          <h3 style="font-weight: bold; color: #28a745">
            You have successfully completed the transaction!
            <i class="fas fa-check-circle"></i>
          </h3>
          <p style="font-size: 18px; margin-top: 15px">
            <a href="BookingController?action=mybooking"
              >Return to your flight ticket management page.</a
            >
          </p>
        </div>
      </c:if>

        <c:if test="${transResult == false || transResult == nuill}" >
            <div>
                <h3 style="font-weight: bold; color: #dc3545;">
                    Transaction failed!
                </h3>
                <p style="font-size: 18px; margin-top: 15px;">
                    <form class="payment__btn-wrap" action="payment" method="POST">
                        <input type="hidden" name="totalBill" value="<%= Long.parseLong(request.getParameter("vnp_Amount")) /100 %>">
                        <input type="hidden" name="bookingID" value="${requestScope.booking.bookingID}">
                        <input class="flight--detail--btn" type="submit" value="Return to the payment page.">
                    </form>
                <p style="font-size: 18px; margin-top: 15px;">
                    <a href="BookingController?action=mybooking">Return to your flight ticket management page.</a></p>
            </div>
        </c:if>

        
    </section>
  </body>
</html>
