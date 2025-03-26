CREATE DATABASE FlightBookingWebApp
USE FlightBookingWebApp

CREATE TABLE users (
	userID INT Primary Key ,
	fullName NVARCHAR (20),
	password VARCHAR (255),
	email VARCHAR (50),
	phoneNumber VARCHAR(11),
	DOB DATE,
	role VARCHAR(10) NOT NULL CHECK (role IN ('Customer', 'Admin'))
) 

CREATE TABLE airport (
    airportID int Primary Key,
    name NVARCHAR(255) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    country NVARCHAR(50) NOT NULL
);

CREATE TABLE flight(
	flightID INT Primary Key,
	flightNumber VARCHAR(20),
	airline VARCHAR(20), 
	departuretTime DATETIME,
	arrivalTime DATETIME,
	totalSeats INT,
	businessPrice DECIMAL(10,2),
	economyPrice DECIMAL(10,2),
	aircraftType VARCHAR(20),
	baggageAllow FLOAT,
	flightStatus VARCHAR(20) NOT NULL CHECK (flightStatus IN ('Open', 'Delayed', 'Canceled')) DEFAULT 'Open',
	adminID INT FOREIGN KEY REFERENCES users (userID),
	departureId INT FOREIGN KEY REFERENCES airport(airportID) ,
	arrivalId INT FOREIGN KEY REFERENCES airport(airportID)
)

CREATE TABLE seat (
	seatID INT PRIMARY KEY,
	seatNumber VARCHAR(10) NOT NULL,
	fareClass VARCHAR(20) NOT NULL CHECK (fareClass IN ('Economy', 'Business')) DEFAULT 'Economy',
	seatStatus VARCHAR(20) NOT NULL CHECK (seatStatus IN ('Available', 'Booked')) DEFAULT 'Available',
	flightID INT FOREIGN KEY REFERENCES flight (flightID),
	CONSTRAINT unique_seat UNIQUE (seatNumber, flightID)
)

CREATE TABLE booking (
	bookingID int PRIMARY KEY,
	bookingStatus VARCHAR(20) NOT NULL CHECK (bookingStatus IN ('Pending', 'Confirmed', 'Canceled')) DEFAULT 'Pending',
	bookingDate DATE NOT NULL,
	TotalPrice DECIMAL(10,2) NOT NULL,
	customerID INT FOREIGN KEY REFERENCES users (userID) 
)

CREATE TABLE ticket(
	ticketID int PRIMARY KEY,
	issuedDate DATE,
	TicketCode VARCHAR(10) UNIQUE NOT NULL,
	ticketPrice DECIMAL(10,2) NOT NULL,
	ticketStatus VARCHAR(20) NOT NULL CHECK (ticketStatus IN ('Pending' ,'Booked', 'Canceled', 'Checked-in', 'Completed')) DEFAULT 'Pending',
	bookingID INT FOREIGN KEY REFERENCES booking (bookingID),
	seatID INT FOREIGN KEY REFERENCES seat (seatID),
	passengerName NVARCHAR(50),
	passengerPhone NVARCHAR(11)
)

CREATE TABLE payment(
	paymentID int PRIMARY KEY,
	amount DECIMAL(10,2) NOT NULL,
	paymentMethod VARCHAR(20) NOT NULL CHECK (paymentMethod IN ('Momo', 'VNPay')) DEFAULT 'VNPay',
	paymentStatus VARCHAR(20) NOT NULL CHECK (paymentStatus IN('Pending', 'Completed', 'Failed')) DEFAULT 'Pending',
	bookingID INT FOREIGN KEY REFERENCES booking (bookingID) ON DELETE CASCADE
)

BULK INSERT airport
FROM 'D:\PRJ\Asm_Project\prj301-25sp-se1832-01\data\airports_fixed.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    MAXERRORS = 1000,
    CODEPAGE = '65001'
);

UPDATE airport
SET name = REPLACE(name, '"', '');
UPDATE airport
SET city = REPLACE(city, '"', '');
UPDATE airport
SET country = REPLACE(country, '"', '');


SELECT * FROM airport
SELECT * FROM users
INSERT INTO users (userID , fullName , email, password, role) VALUES (1 , 'Admin' ,'admin@gmail.com', 'admin123', 'Admin') 