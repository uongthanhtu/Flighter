﻿CREATE DATABASE FlightBookingWebApp
USE FlightBookingWebApp

CREATE TABLE users (
	userID INT IDENTITY(1,1) Primary Key ,
	fullName NVARCHAR (20),
	password VARCHAR (255),
	email VARCHAR (50),
	phoneNumber VARCHAR(11),
	DOB DATE,
	role VARCHAR(10) NOT NULL CHECK (role IN ('Customer', 'Admin'))
) 

CREATE TABLE airport (
    airportID INT IDENTITY(1,1) Primary Key,
    name NVARCHAR(255) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    country NVARCHAR(50) NOT NULL
);

CREATE TABLE flight(
	flightID INT IDENTITY(1,1) Primary Key,
	airline VARCHAR(20), 
	departuretTime DATETIME,
	arrivalTime DATETIME,
	totalSeats INT,
	businessPrice DECIMAL(10,2),
	economyPrice DECIMAL(10,2),
	flightStatus VARCHAR(20) NOT NULL CHECK (flightStatus IN ('Open', 'Delayed', 'Canceled')) DEFAULT 'Open',
	adminID INT FOREIGN KEY REFERENCES users (userID),
	departureId INT FOREIGN KEY REFERENCES airport(airportID) ,
	arrivalAirport INT FOREIGN KEY REFERENCES airport(airportID)
)

CREATE TABLE seat (
	seatID INT IDENTITY(1,1) PRIMARY KEY,
	seatNumber VARCHAR(10) NOT NULL,
	fareClass VARCHAR(20) NOT NULL CHECK (fareClass IN ('Economy', 'Business')) DEFAULT 'Economy',
	seatStatus VARCHAR(20) NOT NULL CHECK (seatStatus IN ('Available', 'Booked')) DEFAULT 'Available',
	flightID INT FOREIGN KEY REFERENCES flight (flightID),
	CONSTRAINT unique_seat UNIQUE (seatNumber, flightID)
)

CREATE TABLE booking (
	bookingID INT IDENTITY(1,1) PRIMARY KEY,
	bookingStatus VARCHAR(20) NOT NULL CHECK (bookingStatus IN ('Pending', 'Confirmed', 'Canceled')) DEFAULT 'Pending',
	bookingDate DATE NOT NULL,
	TotalPrice DECIMAL(10,2) NOT NULL,
	customerID INT FOREIGN KEY REFERENCES users (userID) 
)

CREATE TABLE ticket(
	ticketID INT IDENTITY(1,1) PRIMARY KEY,
	issuedDate DATE,
	TicketCode VARCHAR(10) UNIQUE NOT NULL,
	ticketPrice DECIMAL(10,2) NOT NULL,
	ticketStatus VARCHAR(20) NOT NULL CHECK (ticketStatus IN ('Booked', 'Canceled', 'Checked-in', 'Completed')) DEFAULT 'Booked',
	bookingID INT FOREIGN KEY REFERENCES booking (bookingID),
	seatID INT FOREIGN KEY REFERENCES seat (seatID),
	passengerName NVARCHAR(50),
	passengerPhone NVARCHAR(11)
)

CREATE TABLE payment(
	paymentID INT IDENTITY(1,1) PRIMARY KEY,
	amount DECIMAL(10,2) NOT NULL,
	paymentMethod VARCHAR(20) NOT NULL CHECK (paymentMethod IN ('Momo', 'VNPay')) DEFAULT 'Momo',
	paymentStatus VARCHAR(20) NOT NULL CHECK (paymentStatus IN('Pending', 'Completed', 'Failed')) DEFAULT 'Pending',
	bookingID INT FOREIGN KEY REFERENCES booking (bookingID) ON DELETE CASCADE
)


BULK INSERT airport
FROM 'D:\PRJ\Asm_Project\prj301-25sp-se1832-01\airports.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,  -- Bỏ qua dòng tiêu đề
    CODEPAGE = '65001' -- UTF-8
);





CREATE TABLE airportTemp1 (
    name NVARCHAR(255) NOT NULL,
    city NVARCHAR(100) NOT NULL,
    country NVARCHAR(50) NOT NULL
);

BULK INSERT airportTemp
FROM 'D:\PRJ\Asm_Project\prj301-25sp-se1832-01\airport.csv'
WITH (
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n',
    FIRSTROW = 2,
    MAXERRORS = 1000,
    CODEPAGE = '65001'
);

INSERT INTO airport (name, city, country)
SELECT name, city, country FROM airportTemp1;

DROP TABLE airportTemp


SELECT * FROM airport