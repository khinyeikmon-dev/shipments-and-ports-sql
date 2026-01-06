-- Example CSV load (path will vary by machine)
BULK INSERT dbo.ports_data
FROM 'C:\data\ports_data.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);

BULK INSERT dbo.shipments
FROM 'C:\data\shipments.csv'
WITH (
    FIRSTROW = 2,
    FIELDTERMINATOR = ',',
    ROWTERMINATOR = '\n'
);
