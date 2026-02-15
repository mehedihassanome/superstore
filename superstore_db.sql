CREATE TABLE sales (
  `Row ID` INT PRIMARY KEY,
  `Order ID` VARCHAR(50) NOT NULL,
  `Order Date` DATE NOT NULL,
  `Ship Date` DATE NOT NULL,
  `Ship Mode` VARCHAR(50) NOT NULL,
  `Customer ID` VARCHAR(50) NOT NULL,
  `Customer Name` VARCHAR(100) NOT NULL,
  `Segment` VARCHAR(50) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Postal Code` VARCHAR(20),
  `Region` VARCHAR(50) NOT NULL,
  `Product ID` VARCHAR(50) NOT NULL,
  `Category` VARCHAR(50) NOT NULL,
  `Sub-Category` VARCHAR(50) NOT NULL,
  `Product Name` VARCHAR(255) NOT NULL,
  `Sales` DECIMAL(10, 4) NOT NULL,
  `Quantity` INT NOT NULL,
  `Discount` DECIMAL(3, 2) NOT NULL,
  `Profit` DECIMAL(10, 4) NOT NULL
);

-- Step 1: Create table with VARCHAR for dates
CREATE TABLE orders (
  `Row ID` INT,
  `Order ID` VARCHAR(50),
  `Order Date` VARCHAR(20),
  `Ship Date` VARCHAR(20),
  `Ship Mode` VARCHAR(50) NOT NULL,
  `Customer ID` VARCHAR(50) NOT NULL,
  `Customer Name` VARCHAR(100) NOT NULL,
  `Segment` VARCHAR(50) NOT NULL,
  `Country` VARCHAR(50) NOT NULL,
  `City` VARCHAR(50) NOT NULL,
  `State` VARCHAR(50) NOT NULL,
  `Postal Code` VARCHAR(20),
  `Region` VARCHAR(50) NOT NULL,
  `Product ID` VARCHAR(50) NOT NULL,
  `Category` VARCHAR(50) NOT NULL,
  `Sub-Category` VARCHAR(50) NOT NULL,
  `Product Name` VARCHAR(255) NOT NULL,
  `Sales` DECIMAL(10, 4) NOT NULL,
  `Quantity` INT NOT NULL,
  `Discount` DECIMAL(3, 2) NOT NULL,
  `Profit` DECIMAL(10, 4)
);

-- Step 2: Load raw data
LOAD DATA LOCAL INFILE '"C:\ProgramData\MySQL\MySQL Server 8.4\Uploads\superstore_sales.csv"'
INTO TABLE orders
FIELDS TERMINATED BY '\t'
LINES TERMINATED BY '\n'
IGNORE 1 LINES
(`Row ID`, `Order ID`, `Order Date`, `Ship Date`, `Ship Mode`, `Customer ID`, 
 `Customer Name`, `Segment`, `Country`, `City`, `State`, `Postal Code`, `Region`, 
 `Product ID`, `Category`, `Sub-Category`, `Product Name`, `Sales`, `Quantity`, 
 `Discount`, `Profit`);

-- Step 3: Convert VARCHAR dates to DATE type
UPDATE orders 
SET 
  `Order Date` = STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
  `Ship Date` = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');

-- Step 4: Alter columns to DATE type
ALTER TABLE orders 
MODIFY `Order Date` DATE,
MODIFY `Ship Date` DATE;

# Error Code: 1290. The MySQL server is running with the --secure-file-priv option so it cannot execute this statement
