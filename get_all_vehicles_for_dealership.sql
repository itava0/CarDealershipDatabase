-- Query to get all vehicles for a specific dealership
SELECT v.*
FROM vehicles v
JOIN inventory i ON v.vin = i.vin
WHERE i.dealerships_id = 1;
