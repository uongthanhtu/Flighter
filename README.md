<!-- # prj301-25sp-se1832-01 -->

# Online Flight Booking

---

### Course: PRJ301

### Team: 2025SPSJ

### Class: SE1832

| STT | Member                        |
| :-: | ----------------------------- |
|  1  | SE183853 - Uông Thanh Tú      |
|  2  | SE184137 - Nguyễn Hoài Phương |
|  3  | SE192316 - Vũ Hoàng Minh Thái |
|  4  | SE193130 - Phạm Anh Quân      |

---

### Requirements:

#### Admin Features

```
1. Flight Management:
    - Add, delete, and update flight details.
    - Update flight information (Flight ID, Airline, Time, Location, Ticket Price, Available Seats).
    - Automatically update seat status when booked.
    - Manage flight status (Open, Delayed, Canceled).
    - Manage tickets.
2. User Account Management:
    - Add, delete, and edit user accounts.
3. Data Management & Reports:
    - User Statistics
    - Booking & Transaction Reports
    - Flight Management Reports
```

#### User Features

```
1. Account Management
    - Register an account .
    - Log in and log out.
2. Flight Search & Booking
    - Search for flights by date, time, departure, arrival Ariport.
    - Select fare class (Economy, Business, First Class).
    - Choose an exact seat (if available).
    - Make payments via Momo, VNPay.
3. Booking History
    - View successfully booked flights.
    - Flight details (Flight ID, Airline, Time, Location, Fare Class, Seat Number).
4. Email Notifications
    - Receive confirmation emails for successful bookings.
    - Get notifications if a flight is canceled or delayed.
```

### Database

![erd](images/ERD.jpg)
![diagrams](images/diagrams.png)

### GUI

### User

#### Home

![home](images/homepage.jpg)

#### Login & Register

![login](images/login.png)
![register](images/register.png)

#### Search by departure, arrival Ariport and departure date

![search](images/search.jpg)

#### Flight Details Display:

#### After selecting a flight, the system will display the following details:

![bookingdetails](images/bookingdetail.jpg)

#### Seat Selection: After viewing flight details and selecting a fare class, the user will proceed to seat selection

![seat](images/bookingseat.jpg)

#### Passenger information

![passengerinfo](images/passengerInfo.jpg)

#### Payment

![payment](images/payment.jpg)

#### Booking History

![bookinghis](images/bookinghis1.jpg)
![bookinghis](images/bookinghis.jpg)

### Admin

#### Flight List Management

![flightlistmanage](images/admin_dashboard.jpg)

#### Ticket List Management (After clicking "View" button)

![ticketlist](images/admin_ticketmana.png)

#### Add Flight

![addflight](images/admin_addflight.jpg)

#### User Account Management

![useraccuntmanagement](images/admin_useraccount.jpg)

#### Report & Analytics

![report](images/admin_report.jpg)

#### Self Evaluation

**_Project Overview_**

- Allows users to easily book flights, receive emails and conduct payment.
- Allows admin to perform operations on flights (create, modify info, delete ...), manage flight list, user list, be aware of statistics and report.
  **_Accomplishments_**
- User-friendly UI/UX
- Automatically sending email to user's email
- Integrate payment
  **_Challenges Faced_**
- Face difficulties when trying to design a good-looking user interface
- Faced problems with integrating payment service
- Facing problems when working with Git, mostly with merge conflicts
  **_Skills Learned & Improved_**
- Improve proficiency in Java by implementing complex backend logic
- Learned how to use SQL Server for managing relational data
- Improved Git workflow when working in a team
- Improved team work skills
  **_Future Improvements_**
- Refactor the project to keep track of every step in the booking process
- Implement Front-end frameworks such as ReactJS to make UI/UX more user-friendly

```
Mail: uongthanhtu5@gmail.com, tuutse183853@fpt.edu.vn
```
