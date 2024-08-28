-- Databricks notebook source
-- MAGIC %md
-- MAGIC Create external location in Unity catalog
-- MAGIC 1. Bronze
-- MAGIC 2. Silver
-- MAGIC 3. Gold
-- MAGIC
-- MAGIC This is medallion architecture

-- COMMAND ----------

--Create Bronze external location linked to external storage account
CREATE EXTERNAL LOCATION IF NOT EXISTS dbcunityexternaldl_bronze
URL 'abfss://bronze@dbcunityexternaldl.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL `dbcunity-ext-storage-credential`)

-- COMMAND ----------

-- MAGIC %fs
-- MAGIC ls "abfss://bronze@dbcunityexternaldl.dfs.core.windows.net/"

-- COMMAND ----------

--Create Silver external location linked to external storage account
CREATE EXTERNAL LOCATION IF NOT EXISTS dbcunityexternaldl_silver
URL 'abfss://silver@dbcunityexternaldl.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL `dbcunity-ext-storage-credential`);

-- COMMAND ----------

--Create Gold external location linked to external storage account
CREATE EXTERNAL LOCATION IF NOT EXISTS dbcunityexternaldl_gold
URL 'abfss://gold@dbcunityexternaldl.dfs.core.windows.net/'
WITH (STORAGE CREDENTIAL `dbcunity-ext-storage-credential`);
