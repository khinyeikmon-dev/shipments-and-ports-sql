CREATE TABLE dbo.ports_data (
    port_id INT PRIMARY KEY,
    port_name VARCHAR(100),
    country VARCHAR(50),
    region VARCHAR(50),
    capacity_tonnes INT,
    avg_docking_time_hours INT
);

CREATE TABLE dbo.shipments (
    shipment_id INT PRIMARY KEY,
    origin_port_id INT,
    destination_port_id INT,
    shipment_year INT,
    shipment_weight_tonnes INT,
    cargo_type VARCHAR(50)
);
