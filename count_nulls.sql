DECLARE @TabName NVARCHAR(261) = 'your_table';
DECLARE @sql NVARCHAR(MAX);

SELECT @sql = STRING_AGG('SUM(CASE WHEN ' + COLUMN_NAME + ' IS NULL THEN 1 ELSE 0 END)', ' + ')
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = @TabName;

SET @sql = 'SELECT ' + @sql + ' AS total_nulls FROM ' + @TabName;
EXEC sp_executesql @sql;
