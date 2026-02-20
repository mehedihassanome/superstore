SELECT * FROM st_sales;
#Superstore database broken into relational database by doing de-normalization on the master table:

SELECT `Customer ID` as CustomerID, `Customer Name`,  segment FROM st_sales;

# attempting to remove duplicates with CTE
WITH ctable as (SELECT `Customer ID` as CustomerID, `Customer Name`,  segment FROM st_sales)
DELETE t1 FROM ctable t1 INNER JOIN ctable t2 WHERE t1.CustomerID < id2.CustomerID;
# Error Code: 1288. The target table t1 of the DELETE is not updatable

# Solution:
SELECT DISTINCT `Customer ID` as CustomerID, `Customer Name`,  segment FROM st_sales;





SELECT `Row ID`, `Order ID`, Category, `Sub-Category`, `Product Name` FROM st_sales;

SELECT Distinct `Customer ID`, `Product ID` FROM st_sales;

SELECT Distinct Region, Country, City, State, `Postal Code` FROM st_sales;

SELECT `Row ID`, `Order ID`, `Order Date`, 
		`Ship Date`, `Ship Mode`, `Customer ID`, 
        `Region`, `Sales`, `Quantity`, 
        `Discount`, `Profit` FROM st_sales;
        
SELECT 	`Order ID`, `Order Date`, `Ship Date`, `Ship Mode`,Region, `Postal Code`, `Customer ID`, 
         round(sum(`Sales`),2) as Sales, sum(`Quantity`) as Quantity, 
        round(sum(`Discount`),2) as Discount, round(sum(`Profit`),2) as Profit 
FROM st_sales GROUP BY `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`, `Customer ID`, Region, `Postal Code`;

SELECT `Order ID`, Discount FROM st_sales;

# Error Code: 1064. You have an error in your SQL syntax; check the manual that corresponds to your MySQL server version for the right syntax to use near '[Customer Name] as Customer_Name  FROM st_sales' at line 1


SELECT Distinct Region, Country, City, State, `Postal Code` FROM st_sales;

