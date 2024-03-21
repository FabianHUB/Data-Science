/* QUERY OF DATA MANIPULATION 

First, simplify column names to improve fluency on SQL queries*/

ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Area Code" TO area_code;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Area Code (M49)" TO area_code_m49;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Area" TO area;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Item Code" TO item_code;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Item Code (FBS)" TO item_code_fbs;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Element Code" TO element_code;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Element" TO elements;
ALTER TABLE foodbalance.fb_dataset_v1 RENAME COLUMN "Unit" TO unit;

/* fixing data types */

ALTER TABLE foodbalance.fb_dataset_v1 
 ALTER COLUMN years SET DATA TYPE date
  USING TO_DATE(years, 'YYYY');

/* Identify NULL  values  and deal with them modifying the table */

SELECT *
 FROM foodbalance.fb_dataset_v1
  WHERE total IS NOT NULL; /* 4'320,908 ROWS */
  
SELECT *
 FROM foodbalance.fb_dataset_v1
  WHERE total IS NULL; /* 337,264 ROWS */
  
UPDATE foodbalance.fb_dataset_v1
 SET total = 0
  WHERE total IS NULL;
  
/* Create new column */
ALTER TABLE foodbalance.fb_dataset_v1 
ADD COLUMN combined_id VARCHAR(255);

/* Populate new columnd */

UPDATE foodbalance.fb_dataset_v1 
SET combined_id = years || '-' || area_code || item_code || element_code;


SELECT * 
FROM foodbalance.fb_dataset_v1
LIMIT 10;