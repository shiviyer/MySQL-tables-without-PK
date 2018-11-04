USE INFORMATION_SCHEMA;
SELECT 
    TABLES.table_name
FROM TABLES
LEFT JOIN KEY_COLUMN_USAGE AS c 
ON (
       TABLES.TABLE_NAME = c.TABLE_NAME
   AND c.CONSTRAINT_SCHEMA = TABLES.TABLE_SCHEMA
   AND c.constraint_name = 'PRIMARY'
)
WHERE 
    TABLES.table_schema <> 'information_schema'
AND TABLES.table_schema <> 'performance_schema'
AND TABLES.table_schema <> 'mysql'
AND c.constraint_name IS NULL;
