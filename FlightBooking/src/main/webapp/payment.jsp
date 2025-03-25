<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Payment</title>
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
              class="logo" />
          </a>
          <div class="navbar__actions">
            <a href="#!" class="navbar__link">My booking</a>
            <a href="#!" class="navbar__link">Flights</a>
            <a href="#!" class="navbar__link">Support</a>

            <a href="login.jsp" class="navbar__link">Sign in</a>
            <a href="register.jsp" class="navbar__link">Sign up</a>

            <a
              href="ProfileController?action=profile_details"
              class="user__avt">
              <img src="./assets/img/user-avt.png" alt="User avt" /> </a
            ><a href="./AuthController?action=logout" class="user__logout__btn"
              >Log out</a
            >
          </div>
        </nav>
      </div>
    </header>
    <section class="payment">
      <div class="container">
        <h2 class="payment__title">Payment</h2>
        <div class="payment__content row">
          <div
            class="payment__summary col-8 col-sm-12 col-md-12 col-lg-6 col-xl-8 col-xxl-8">
            <div class="payment__summary__info">
              <h3 class="payment__summary__flight">FL9583478</h3>
              <p class="payment__summary__departure-and-arrival">
                <span>Tan Son Nhat, Ho Chi Minh</span>
                -
                <span>Narita, Tokyo</span>
              </p>
              <p class="payment__summary__time">
                <span>23:55, 26/03/2025</span>
                -
                <span>7:30, 27/03/2025</span>
              </p>
              <p class="payment__summary__baggage">
                7 <span>kg baggage allowed</span>
              </p>
              <div class="payment__summary__class--row">
                <span class="payment__summary__class">Economy</span>
                <span>x1</span>
              </div>
            </div>
            <div class="payment-method">
              <p class="payment-method__warning">
                Please choose one of the payment methods below.
              </p>
            </div>
          </div>
          <div
            class="payment__price col-4 col-sm-12 col-md-12 col-lg-6 col-xl-4 col-xxl-4">
            <div class="payment__price-ticket">
              <div class="payment__price--style payment__price-ticket__temp">
                <span>Price</span>
                <span>8,455,000 VND</span>
              </div>
              <ul class="payment__price-ticket-list">
                <li class="payment__price--style payment__price__ticket__item">
                  <span>Eco</span>
                  <span>8,455,000 VND</span>
                </li>
              </ul>
            </div>
            <div class="payment__total">
              <div class="payment__price--style payment__price-ticket__temp">
                <span>Taxes and fees</span>
                <span>1,000,000 VND</span>
              </div>
              <ul class="payment__fees-list">
                <li class="payment__price--style payment__fees__item">
                  <span>Airport tax international</span><span>500,000 VND</span>
                </li>
                <li class="payment__price--style payment__fees__item">
                  <span>Airport security</span><span>50,000 VND</span>
                </li>
                <li class="payment__price--style payment__fees__item">
                  <span>Fuel Surcharge</span><span>450,000 VND</span>
                </li>
              </ul>
              <div class="payment__price--style payment__total-price">
                <span>Total</span>
                <span>9,455,000 VND</span>
              </div>
            </div>
          </div>
        </div>
        <form class="payment__btn-wrap" action="payment" method="POST">
            <input type="hidden" name="totalBill" value="${requestScope.booking.totalPrice}">
            <input type="hidden" name="bookingID" value="${requestScope.booking.bookingID}">
            <input class="flight--detail--btn" type="submit" value="Continue">
        </form>
      </div>
    </section>
  </body>
</html>
