-- Query to find the dealership by VIN
SELECT d.*
FROM dealerships d
JOIN inventory i ON d.dealership_id = i.dealerships_id
WHERE i.vin = '5XYZH4AG0CG001234';