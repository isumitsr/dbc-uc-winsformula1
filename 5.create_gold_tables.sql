-- Databricks notebook source
-- MAGIC %md
-- MAGIC ### Create managed table in the Gold table
-- MAGIC
-- MAGIC Join drivers and results to identify the number of wins per drivers

-- COMMAND ----------

DROP TABLE IF EXISTS formula1_dev.gold.driver_wins;

CREATE TABLE formula1_dev.gold.driver_wins
AS
SELECT d.name, count(1) AS number_of_wins
FROM formula1_dev.silver.drivers d
JOIN formula1_dev.silver.results r 
ON (d.driver_id = r.driver_id)
WHERE r.position = 1
GROUP BY d.name;

-- COMMAND ----------

select * from formula1_dev.gold.driver_wins order by number_of_wins desc;
