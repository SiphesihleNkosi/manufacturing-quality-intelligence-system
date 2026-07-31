-- JOINING TABLES 
-- MANUFACTURING QUALITY INTELLIGENCE SYSTEM

SELECT *
FROM machine_details;

SELECT *
FROM machine_readings;

SELECT *
FROM failure_records;

CREATE TABLE machine_failure_data AS
SELECT 
	md.`Product ID`,
    md.`Type`,
    
    mr.`Air temperature [K]`,
    mr.`Process temperature [K]`,
    mr.`Rotational speed [rpm]`,
    mr.`Torque [Nm]`,
    mr.`Tool wear [min]`,
    fr.`Machine failure`,
    
    fr.TWF,
    fr.HDF,
    fr.PWF,
    fr.OSF,
    fr.RNF
    
FROM machine_details md
JOIN machine_readings mr
ON md.`Product ID` = mr.`Product ID`
JOIN failure_records fr
ON md.`Product ID` = fr.`Product ID`;

SELECT *
FROM machine_failure_data;

