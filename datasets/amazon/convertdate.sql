-- giving the date column proper formatting 
-- CREATE OR REPLACE VIEW dates AS 
-- SELECT 
-- 	Idx, 
-- 	CAST(CONCAT(
-- 		CAST(CAST(SUBSTRING_INDEX(Date, '-', -1) 
-- 				AS UNSIGNED) + 2000 AS NCHAR),  
-- 		SUBSTRING_INDEX(Date, '-', 1),  
-- 		SUBSTRING_INDEX(SUBSTRING_INDEX(Date, '-', 2),'-', -1)  
-- 	) AS DATE) AS Date 
-- FROM orders; 

UPDATE orders 
SET Date = CONCAT(
	'20', 
	IF(CAST(SUBSTRING_INDEX(Date, '-', -1) AS UNSIGNED) > 100, 
	CAST(
	CAST(SUBSTRING_INDEX(Date, '-', -1) AS UNSIGNED) - 2000 AS NCHAR),
	SUBSTRING_INDEX(Date, '-', -1)), 
	'-',   
	SUBSTRING_INDEX(Date, '-', 1), '-',  
	SUBSTRING_INDEX(SUBSTRING_INDEX(Date, '-', 2), '-', -1)
); 

-- ALTER TABLE orders ADD COLUMN NewDate DATE; 
ALTER TABLE orders MODIFY COLUMN Date DATE; 

-- UPDATE orders AS amz
-- INNER JOIN dates AS dt  
-- ON amz.Idx = dt.Idx 
-- SET amz.NewDate = dt.Date;  
-- SET amz.Date = dt.Date; 

-- remove the varchar columns 
-- ALTER TABLE orders DROP COLUMN Date; 
-- ALTER TABLE orders RENAME COLUMN NewDate TO Date; 

-- DROP VIEW IF EXISTS dates; 


