-- Q1: How many ports in the dataset are located in Europe?
SELECT COUNT(*) AS EuropeanPorts
FROM ports_data
WHERE region = 'Europe';


-- Q2: Total cargo volume handled by North American ports in 2019
SELECT SUM(s.shipment_weight_tonnes) AS TotalCargo2019
FROM shipments s
JOIN ports_data p1 ON s.origin_port_id = p1.port_id
JOIN ports_data p2 ON s.destination_port_id = p2.port_id
WHERE s.shipment_year = 2019
  AND (p1.region = 'North America' OR p2.region = 'North America');


-- Q3: Average shipment weight from South American ports in 2017
SELECT AVG(s.shipment_weight_tonnes) AS AvgWeight2017
FROM shipments s
JOIN ports_data p ON s.origin_port_id = p.port_id
WHERE p.region = 'South America'
  AND s.shipment_year = 2017;


-- Q4: Port with the longest average docking time
SELECT TOP 1 port_name, avg_docking_time_hours
FROM ports_data
ORDER BY avg_docking_time_hours DESC;


-- Q5: Percentage increase in shipments to Asian ports (2012–2020)
WITH Shipments2012 AS (
    SELECT COUNT(*) AS Count2012
    FROM shipments s
    JOIN ports_data p ON s.destination_port_id = p.port_id
    WHERE p.region = 'Asia' AND s.shipment_year = 2012
),
Shipments2020 AS (
    SELECT COUNT(*) AS Count2020
    FROM shipments s
    JOIN ports_data p ON s.destination_port_id = p.port_id
    WHERE p.region = 'Asia' AND s.shipment_year = 2020
)
SELECT 
    ((Count2020 - Count2012) * 100.0 / NULLIF(Count2012,0)) AS PercentageIncrease
FROM Shipments2012, Shipments2020;
