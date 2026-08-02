-- CLEANING --
===================================

-- CREATING A STAGING TABLE 
SELECT *
FROM machine_failure_data;

CREATE TABLE `machine_failure_staging` (
  `Product ID` text,
  `Type` text,
  `Air temperature [K]` double DEFAULT NULL,
  `Process temperature [K]` double DEFAULT NULL,
  `Rotational speed [rpm]` int DEFAULT NULL,
  `Torque [Nm]` double DEFAULT NULL,
  `Tool wear [min]` int DEFAULT NULL,
  `Machine failure` int DEFAULT NULL,
  `TWF` int DEFAULT NULL,
  `HDF` int DEFAULT NULL,
  `PWF` int DEFAULT NULL,
  `OSF` int DEFAULT NULL,
  `RNF` int DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;


INSERT INTO machine_failure_staging
SELECT *
FROM machine_failure_data;

SELECT *
FROM machine_failure_staging;


-- RENAME COLUMN NAMES 

ALTER TABLE machine_failure_staging
RENAME COLUMN `Product ID` TO `product_ID`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Type` TO `product_type`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Air temperature [K]` TO `air_temperature_k`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Process temperature [K]` TO `process_temperature_k`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Rotational speed [rpm]` TO `rotational_speed_rpm`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Torque [Nm]` TO `torque_nm`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Tool wear [min]` TO `tool_wear_min`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `Machine failure`TO `machine_failure`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `TWF` TO `tool_wear_failure`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `HDF` TO `heat_dissipation_failure`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `PWF` TO `power_failure`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `OSF` TO `overstrain_failure`;

ALTER TABLE machine_failure_staging
RENAME COLUMN `RNF` TO `random_failure`;

SELECT *
FROM machine_failure_staging;


-- CHECKING FOR DUPLICATES --

WITH duplicate_cte AS(
SELECT *,
ROW_NUMBER() OVER(
PARTITION BY 
  `product_ID`,
  `product_type`,
  `air_temperature_k`,
  `process_temperature_k`,
  `rotational_speed_rpm`,
  `torque_nm`,
  `tool_wear_min`,
  `machine_failure`,
  `tool_wear_failure`,
  `heat_dissipation_failure`,
  `power_failure`,
  `overstrain_failure`,
  `random_failure`
ORDER BY product_ID
) AS row_num
FROM machine_failure_staging
)
SELECT *
FROM duplicate_cte 
WHERE row_num > 1;



-- CREATING A STAGING TABLE WITH DUPLICATE RECORDS REMOVED

CREATE TABLE machine_failure_staging_deduplicated AS

WITH duplicate_cte AS(

SELECT *,
ROW_NUMBER() OVER(
PARTITION BY 
  `product_ID`,
  `product_type`,
  `air_temperature_k`,
  `process_temperature_k`,
  `rotational_speed_rpm`,
  `torque_nm`,
  `tool_wear_min`,
  `machine_failure`,
  `tool_wear_failure`,
  `heat_dissipation_failure`,
  `power_failure`,
  `overstrain_failure`,
  `random_failure`
ORDER BY product_ID
) AS row_num
FROM machine_failure_staging
)
SELECT 
  `product_ID`,
  `product_type`,
  `air_temperature_k`,
  `process_temperature_k`,
  `rotational_speed_rpm`,
  `torque_nm`,
  `tool_wear_min`,
  `machine_failure`,
  `tool_wear_failure`,
  `heat_dissipation_failure`,
  `power_failure`,
  `overstrain_failure`,
  `random_failure`
FROM duplicate_cte
WHERE row_num = 1;

SELECT *
FROM machine_failure_staging_deduplicated;




-- CHECKING FOR NULL values 

SELECT *
FROM machine_failure_staging_deduplicated;

SELECT
SUM(CASE WHEN air_temperature_k IS NULL THEN 1 ELSE 0 END) AS missing_air_temperature_k,
SUM(CASE WHEN process_temperature_k IS NULL THEN 1 ELSE 0 END) AS missing_process_temperature_k,
SUM(CASE WHEN rotational_speed_rpm IS NULL THEN 1 ELSE 0 END) AS missing_rotational_speed_rpm,
SUM(CASE WHEN torque_nm IS NULL THEN 1 ELSE 0 END) AS missing_torque_nm,
SUM(CASE WHEN tool_wear_min IS NULL THEN 1 ELSE 0 END) AS missing_tool_wear_min,
SUM(CASE WHEN machine_failure IS NULL THEN 1 ELSE 0 END) AS missing_machine_failure,
SUM(CASE WHEN tool_wear_failure IS NULL THEN 1 ELSE 0 END) AS missing_tool_wear_failure,
SUM(CASE WHEN heat_dissipation_failure IS NULL THEN 1 ELSE 0 END) AS missing_heat_dissipation_failure,
SUM(CASE WHEN power_failure IS NULL THEN 1 ELSE 0 END) AS missing_power_failure,
SUM(CASE WHEN overstrain_failure IS NULL THEN 1 ELSE 0 END) AS missing_overstrain_failure,
SUM(CASE WHEN random_failure IS NULL THEN 1 ELSE 0 END) AS missing_random_failure
FROM machine_failure_staging_deduplicated;