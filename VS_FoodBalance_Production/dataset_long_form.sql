CREATE TABLE foodbalance.fb_dataset_v1 AS
SELECT 
 f."Area Code",
 f."Area Code (M49)",
 f."Area",
 f."Item Code",
 f."Item Code (FBS)",
 f."Item",
 f."Element Code",
 f."Element",
 f."Unit",
 t.*
FROM 
 foodbalance.fb_dataset_v0 f
  CROSS JOIN LATERAL (
   VALUES
     (f."Y2010", '2010'),
	 (f."Y2011", '2011'),
	 (f."Y2012", '2012'),
	 (f."Y2013", '2013'),
	 (f."Y2014", '2014'),
	 (f."Y2015", '2015'),
	 (f."Y2016", '2016'),
	 (f."Y2017", '2017'),
	 (f."Y2018", '2018'),
	 (f."Y2019", '2019'),
	 (f."Y2020", '2020'),
	 (f."Y2021", '2021')
  ) AS t(total, years)
;
	

 