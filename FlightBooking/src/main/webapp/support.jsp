<%@page import="flightbooking.model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Support - Flight Booking</title>
    <link rel="stylesheet" href="./assets/css/main.css" />
  </head>
  <body>
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
              <a href="BookingController?action=mybooking" class="navbar__link">My booking</a>
              <a href="BookingController?action=searchflight" class="navbar__link">Flights</a>
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
              ><a
                href="./AuthController?action=logout"
                class="user__logout__btn"
                >Log out</a
              >
            </div>
            <%}%>
          </nav>
        </div>
      </header> 
      
    <main class="support">
      <section class="help">
        <div class="container-support">
          <h1 class="help__title">Support Center</h1>
          <p class="help__text">We are here to help you 24/24</p>
        </div>
      </section>

      <section class="faq">
        <div class="container-support">
          <h2 class="faq__title">Frequently Asked Questions</h2>
          <div class="faq__grid">
            <a href="booking-detail.html" class="faq__item">
              <h3 class="faq__item-title">How to book a flight ?</h3>
              <p>
                You can book flights directly on our website or call our hotline
                for assistance.
              </p>
            </a>
            <a href="refund-detail.html" class="faq__item">
              <h3 class="faq__item-title">Refund Policy</h3>
              <p>
                We offer flexible refund policies depending on the ticket type
                and refund timing.
              </p>
            </a>
            <a href="payment-detail.html" class="faq__item">
              <h3 class="faq__item-title">Payment Methods</h3>
              <p>
                We accept various payment methods: credit cards, bank transfers,
                and e-wallets.
              </p>
            </a>
            <a href="flight-tracking.html" class="faq__item">
              <h3 class="faq__item-title">Flight Tracking</h3>
              <p>
                Track your flight status, check real-time updates, and get
                notifications about any changes.
              </p>
            </a>
            <a href="baggage-info.html" class="faq__item">
              <h3 class="faq__item-title">Baggage Information</h3>
              <p>
                Learn about baggage allowance, restrictions, and special
                handling requirements.
              </p>
            </a>
            <a href="checkin-docs.html" class="faq__item">
              <h3 class="faq__item-title">Check-in & Documents</h3>
              <p>
                Information about check-in procedures and required travel
                documents.
              </p>
            </a>
          </div>
        </div>
      </section>

      <section class="support-contact">
        <div class="container-support">
          <h2 class="support-contact__title">Contact Us</h2>
          <div class="support-contact__grid">
            <div class="support-contact__info">
              <h3 class="support-contact__info-title">Contact Information</h3>
              <ul class="support-contact__info-list">
                <li class="support-contact__info-item">
                  <strong>Email:</strong> flighter@gmail.com
                </li>
                <li class="support-contact__info-item">
                  <strong>Working Hours:</strong> 24/24
                </li>
              </ul>
            </div>
            <div class="support-contact__form">
              <form>
                <div class="support-contact__form-group">
                  <label for="email" class="support-contact__form-label"
                    >Email</label
                  >
                  <input
                    type="email"
                    id="email"
                    name="email"
                    class="support-contact__form-input"
                    required />
                </div>

                <div class="support-contact__form-group">
                  <label for="name" class="support-contact__form-label"
                    >Full Name</label
                  >
                  <input
                    type="text"
                    id="name"
                    name="name"
                    class="support-contact__form-input"
                    required />
                </div>

                <div class="support-contact__form-group">
                  <label for="problem" class="support-contact__form-label">
                    Describe the problem you're having
                  </label>
                  <input
                    type="text"
                    id="problem"
                    name="problem"
                    class="support-contact__form-input"
                    placeholder="Having a discussion"
                    required />
                </div>

                <div class="support-contact__form-group">
                  <label for="details" class="support-contact__form-label">
                    Give us the details
                  </label>
                  <textarea
                    id="details"
                    name="details"
                    class="support-contact__form-textarea"
                    placeholder="Give us the details and please be as specific as possible. We'll reply within a few hours."
                    required></textarea>
                </div>
                <button type="submit" class="support-contact__form-submit">
                  Send Message
                </button>
              </form>
            </div>
          </div>
        </div>
      </section>
    </main>
  </body>
</html>
