-- Query to get all sales information for a specific dealer within a date range
SELECT s.*, v.*
FROM sales_contracts s
JOIN vehicles v ON s.vin = v.vin
JOIN inventory i ON v.vin = i.vin
WHERE i.dealerships_id = 1
    AND s.sale_date BETWEEN '2020-01-15' AND '2023-12-08';