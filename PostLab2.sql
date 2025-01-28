-- SQL Script for Solmaris Condominium Group Database

-- Create Renters Table
CREATE TABLE Renters (
    renter_number INT PRIMARY KEY,
    first_name VARCHAR(50),
    middle_initial CHAR(1),
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    postal_code VARCHAR(10),
    telephone VARCHAR(15),
    email VARCHAR(100)
);

-- Create Properties Table
CREATE TABLE Properties (
    location_number INT PRIMARY KEY,
    location_name VARCHAR(100),
    address VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    postal_code VARCHAR(10),
    unit_number VARCHAR(10),
    square_footage INT,
    bedrooms INT,
    bathrooms INT,
    max_persons INT,
    base_weekly_rate DECIMAL(10, 2)
);

-- Create Rental Agreements Table
CREATE TABLE RentalAgreements (
    rental_id INT AUTO_INCREMENT PRIMARY KEY,
    renter_number INT,
    first_name VARCHAR(50),
    middle_initial CHAR(1),
    last_name VARCHAR(50),
    address VARCHAR(100),
    city VARCHAR(50),
    state CHAR(2),
    postal_code VARCHAR(10),
    telephone VARCHAR(15),
    start_date DATE,
    end_date DATE,
    weekly_rental_amount DECIMAL(10, 2),
    FOREIGN KEY (renter_number) REFERENCES Renters(renter_number)
);

-- Insert Sample Data into Renters
INSERT INTO Renters (renter_number, first_name, middle_initial, last_name, address, city, state, postal_code, telephone, email)
VALUES 
(1, 'John', 'D', 'Doe', '123 Main St', 'Orlando', 'FL', '32801', '555-1234', 'john.doe@example.com');

-- Insert Sample Data into Properties
INSERT INTO Properties (location_number, location_name, address, city, state, postal_code, unit_number, square_footage, bedrooms, bathrooms, max_persons, base_weekly_rate)
VALUES 
(101, 'Beachfront Villas', '456 Ocean Ave', 'Miami', 'FL', '33139', 'A1', 1200, 3, 2, 6, 2000);

-- Insert Sample Data into Rental Agreements
INSERT INTO RentalAgreements (renter_number, first_name, middle_initial, last_name, address, city, state, postal_code, telephone, start_date, end_date, weekly_rental_amount)
VALUES 
(1, 'John', 'D', 'Doe', '123 Main St', 'Orlando', 'FL', '32801', '555-1234', '2025-01-01', '2025-01-08', 2000);

-- Query to Display Data
SELECT * FROM Renters;
SELECT * FROM Properties;
SELECT * FROM RentalAgreements;
