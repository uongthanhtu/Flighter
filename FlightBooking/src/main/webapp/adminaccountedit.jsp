<%-- 
    Document   : adminacccountedit
    Created on : Mar 18, 2025, 5:08:50 AM
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>Document</title>
    <link rel="preconnect" href="https://fonts.googleapis.com" />
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin />
    <link
      href="https://fonts.googleapis.com/css2?family=Poppins:ital,wght@0,100;0,200;0,300;0,400;0,500;0,600;0,700;0,800;0,900;1,100;1,200;1,300;1,400;1,500;1,600;1,700;1,800;1,900&display=swap"
      rel="stylesheet"
    />
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
              class="admin-navbar__item"
              >Add Flight</a
            >
            <a
              href="UserController?action=accountlist"
              class="admin-navbar__item admin-navbar__item--active"
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
      <!-- Account manager -->
      <div class="admin__account-edit">
        <div class="container">
          <div class="admin__account-edit-header">
            <h1 class="admin__account-edit-title">Edit User Account</h1>
          </div>

          <div class="admin__account-edit-content">
              <% String emailexits = (String) request.getAttribute("emailexits");
                      if(emailexits != null && !emailexits.isEmpty()){%>
                      <h5 style="color: red"><%= emailexits%></h5>
                <%}
            %>
            <% String passworderror = (String) request.getAttribute("passworderror");
                      if(passworderror != null && !passworderror.isEmpty()){%>
                      <h5 style="color: red"><%= passworderror%></h5>
                      <%}
            %>
            <% String success = (String) request.getAttribute("success");
                      if(success != null && !success.isEmpty()){%>
                      <h4 style="color: green"><%= success%></h4>
                      <%}
            %>
              <form action="UserController" class="admin__account-edit-form">
              <div class="row row-cols-2">
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="userId" class="admin__account-edit-label"
                      >User ID</label
                    >
                    <input
                      type="text"
                      class="admin__account-edit-input"
                      id="userId"
                      name="userid"
                      value="${requestScope.userobject.userID}"
                      readonly
                    />
                  </div>
                </div>
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="role" class="admin__account-edit-label"
                      >Role</label
                    >
                    <input
                      type="text"
                      class="admin__account-edit-input"
                      id="role"
                      name="role"
                      value="${requestScope.userobject.role}"
                      readonly
                    />
                  </div>
                </div>
              </div>

              <div class="row row-cols-2">
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="fullName" class="admin__account-edit-label"
                      >Full Name</label
                    >
                    <input
                      type="text"
                      class="admin__account-edit-input"
                      id="fullName"
                      name="fullName"
                      value="${requestScope.userobject.fullName}"
                    />
                  </div>
                </div>
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="email" class="admin__account-edit-label"
                      >Email</label
                    >
                    <input
                      type="email"
                      class="admin__account-edit-input"
                      id="email"
                      name="email"
                      value="${requestScope.userobject.email}"
                    />
                  </div>
                </div>
                      
              </div>

              <div class="row row-cols-2">
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="password" class="admin__account-edit-label"
                      >Password</label
                    >
                    <input
                      type="password"
                      class="admin__account-edit-input"
                      id="password"
                      name="password"
                      placeholder="Enter new password"
                    />
                  </div>
                </div>
                <div class="col col-6 col-sm-12">
                    
                  <div class="admin__account-edit-field">
                    <label
                      for="confirmPassword"
                      class="admin__account-edit-label"
                      >Confirm Password</label
                    >
                    <input
                      type="password"
                      class="admin__account-edit-input"
                      id="confirmPassword"
                      name="confirmPassword"
                      placeholder="Confirm new password"
                    />
                  </div>
                </div>
              </div>

              <div class="row row-cols-2">
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="phone" class="admin__account-edit-label"
                      >Phone Number</label
                    >
                    <input
                      type="tel"
                      class="admin__account-edit-input"
                      id="phone"
                      name="phoneNumber"
                      value="${requestScope.userobject.phoneNumber}"
                    />
                  </div>
                </div>
                <div class="col col-6 col-sm-12">
                  <div class="admin__account-edit-field">
                    <label for="dob" class="admin__account-edit-label"
                      >Date of Birth</label
                    >
                    <input
                      type="date"
                      class="admin__account-edit-input"
                      id="dob"
                      name="dob"
                      value="${requestScope.userdob}"
                    />
                  </div>
                </div>
              </div>
                    <input type="hidden" name="action" value="updateaccount">      
              <div class="admin__account-edit-actions">
                <button type="submit" class="admin__account-edit-submit ">
                  Save Changes
                </button>
                <button type="button" class="admin__account-edit-cancel" onclick="history.back()">
                  Cancel
                </button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </main>
  </body>
</html>

