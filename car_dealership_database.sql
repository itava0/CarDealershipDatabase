# ---------------------------------------------------------------------- #
# Target DBMS:           MySQL                                           #
# Project name:          carDealership                                      #
# ---------------------------------------------------------------------- #
-- Drop the database if it exists
DROP DATABASE IF EXISTS carDealership;

-- Create the database if it doesn't exist
CREATE DATABASE IF NOT EXISTS carDealership;

-- Switch to the carDealership database
USE carDealership;

-- Create the dealerships table
CREATE TABLE dealerships (
    dealership_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50),
    address VARCHAR(50),
    phone VARCHAR(50)
);

-- Create the vehicles table
CREATE TABLE vehicles (
    vin VARCHAR(17) PRIMARY KEY,
    model VARCHAR(50),
    year INT,
    price DECIMAL(10, 2),
    sold BOOLEAN
);

-- Create the inventory table
CREATE TABLE inventory (
    dealerships_id INT,
    vin VARCHAR(17),
    PRIMARY KEY (dealerships_id, vin),
    FOREIGN KEY (dealerships_id) REFERENCES dealerships(dealership_id),
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Create the sales_contracts table
CREATE TABLE sales_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17),
    sale_date DATE,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Create the lease_contracts table
CREATE TABLE lease_contracts (
    id INT AUTO_INCREMENT PRIMARY KEY,
    vin VARCHAR(17),
    sale_date DATE,
    FOREIGN KEY (vin) REFERENCES vehicles(vin)
);

-- Sample query: Insert data into the dealerships table
INSERT INTO dealerships (name, address, phone) VALUES
('ABC Motors', '123 Main St', '555-1234'),
('XYZ Autos', '456 Oak St', '555-5678');

-- Insert data into the vehicles table
INSERT INTO vehicles (vin, model, year, price, sold) VALUES
('1HGCM82633A123456', 'Honda Accord', 2022, 25000.00, FALSE),
('5XYZH4AG0CG001234', 'Hyundai Santa Fe', 2023, 28000.00, TRUE),
('2C3CDXBG5KH123456', 'Dodge Charger', 2022, 30000.00, FALSE),
('JM1GL1UM5H1234567', 'Mazda 6', 2023, 27000.00, FALSE),
('1G1FH1R75H1234567', 'Chevrolet Camaro', 2022, 35000.00, FALSE),
('1C4RJFCM2EC123456', 'Jeep Grand Cherokee', 2023, 40000.00, TRUE),
('WAUENAF44HN123456', 'Audi A6', 2022, 45000.00, FALSE),
('5YJ3E1EB5KF123456', 'Tesla Model 3', 2023, 55000.00, FALSE),
('1FTFW1E52K1234567', 'Ford F-150', 2022, 35000.00, TRUE),
('JTDKARFU2G1234567', 'Toyota Prius', 2023, 30000.00, FALSE),
('1N4BL4EV8KC123456', 'Nissan Altima', 2022, 28000.00, TRUE),
('KM8J3CA26LU123456', 'Hyundai Tucson', 2023, 32000.00, FALSE),
('3C6JR7EG5HG123456', 'Ram 1500', 2022, 38000.00, FALSE),
('2HGFC2F55LH123456', 'Honda Civic', 2023, 23000.00, FALSE),
('5FNRL6H76KB123456', 'Honda Odyssey', 2022, 35000.00, TRUE);

-- Insert data into the inventory table
INSERT INTO inventory (dealerships_id, vin) VALUES
(1, '1HGCM82633A123456'),  
(1, '5XYZH4AG0CG001234'),  
(1, '2C3CDXBG5KH123456'),  
(1, 'JM1GL1UM5H1234567'),  
(1, '1G1FH1R75H1234567'),  
(1, '1C4RJFCM2EC123456'),  
(1, 'WAUENAF44HN123456'),  
(2, '5YJ3E1EB5KF123456'),  
(2, '1FTFW1E52K1234567'),  
(2, 'JTDKARFU2G1234567'), 
(2, '1N4BL4EV8KC123456'), 
(2, 'KM8J3CA26LU123456'), 
(2, '3C6JR7EG5HG123456'), 
(2, '2HGFC2F55LH123456'), 
(2, '5FNRL6H76KB123456'); 


-- Insert data into the sales_contracts table
INSERT INTO sales_contracts (vin, sale_date) VALUES
('1HGCM82633A123456', '2023-01-15'),
('5XYZH4AG0CG001234', '2022-10-20');

-- Insert data into the lease_contracts table
INSERT INTO lease_contracts (vin, sale_date) VALUES
('1HGCM82633A123456', '2023-01-15'),
('5XYZH4AG0CG001234', '2023-02-20');
