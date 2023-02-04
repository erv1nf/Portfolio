SELECT 
	a.CLIENTNUM,
	a."Customer_Age",
	a."Gender" ,
	a."Dependent_count",
	a."Income_Category" ,
	a."Months_Inactive_12_mon"  ,
	a."Credit_Limit" ,
	a."Total_Revolving_Bal" ,
	a."Total_Trans_Amt" ,
	a."Avg_Open_To_Buy" ,
	a."Total_Trans_Ct" ,
	a."Avg_Utilization_Ratio" ,
	b."status" ,
	c."Card_Category" ,
	d."Education_Level" ,
	e."Marital_Status" 
	FROM PROJECT_AKHIR.CUSTOMER_DATA_HISTORY a
	LEFT JOIN PROJECT_AKHIR.STATUS_DB b ON a."idstatus" = b."id" 
	LEFT JOIN PROJECT_AKHIR.CATEGORY_DB c ON a."card_categoryid" = c."id" 
	LEFT JOIN PROJECT_AKHIR.EDUCATION_DB d ON a."Educationid" = d."id"
	LEFT JOIN PROJECT_AKHIR.MARITAL_DB e ON a."Maritalid" = e."id";
	
SELECT
	b."status",
	a."Customer_Age",
	COUNT(CASE WHEN "Gender" = 'M' THEN "Gender" END) AS Total
	FROM PROJECT_AKHIR.CUSTOMER_DATA_HISTORY a
	LEFT JOIN PROJECT_AKHIR.STATUS_DB b ON a."idstatus" = b."id"
	LEFT JOIN PROJECT_AKHIR.CATEGORY_DB c ON a."card_categoryid" = c."id"
	WHERE LOWER(b."status") = 'attrited customer'
	GROUP BY b."status", a."Customer_Age"
	ORDER  BY Total DESC;
	
SELECT
	b."status",
	a."Customer_Age",
	COUNT(CASE WHEN "Gender" = 'F' THEN "Gender" END) AS Total
	FROM PROJECT_AKHIR.CUSTOMER_DATA_HISTORY a
	LEFT JOIN PROJECT_AKHIR.STATUS_DB b ON a."idstatus" = b."id"
	LEFT JOIN PROJECT_AKHIR.CATEGORY_DB c ON a."card_categoryid" = c."id"
	WHERE LOWER(b."status") = 'attrited customer'
	GROUP BY b."status", a."Customer_Age"
	ORDER  BY Total DESC;

SELECT 
	a."Income_Category", 
	COUNT(a."Income_Category") AS total_customer
	FROM PROJECT_AKHIR.CUSTOMER_DATA_HISTORY a
	LEFT JOIN PROJECT_AKHIR.STATUS_DB b ON a."idstatus" = b."id"
	WHERE LOWER(b."status") = 'attrited customer'
	GROUP BY a."Income_Category"
	ORDER BY total_customer;

SELECT
	a."Income_Category",
	COUNT(a."Income_Category") AS total_customer
	FROM PROJECT_AKHIR.CUSTOMER_DATA_HISTORY a
	LEFT JOIN PROJECT_AKHIR.STATUS_DB b ON a."idstatus" = b."id"
	WHERE LOWER(b."status") = 'attrited customer'
	GROUP BY a."Income_Category"
	ORDER BY total_customer;	
