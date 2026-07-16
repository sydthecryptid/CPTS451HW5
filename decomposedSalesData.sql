-- break down original sales data to match bcnf form 

--we found in part b that product determines price, month determines discount:
--create a table mapping each product to its price
CREATE TABLE Product(
    pName VARCHAR(10) PRIMARY KEY,
    price int
);

--create a table mapping each month to its discount
CREATE TABLE monthDiscount(
    month VARCHAR(10) PRIMARY KEY,
    discount VARCHAR(10)
);

--name and month are primary keys for sales table
CREATE TABLE sales(
    pName VARCHAR(10) REFERENCES Product(pName),
    month VARCHAR(10) REFERENCES monthDiscount(month),
    PRIMARY KEY(pName, month)
);

--insert data from og table into new tables
INSERT INTO Product(pName, price)
SELECT DISTINCT pName, price
FROM MySales;

INSERT INTO monthDiscount(month, discount)
SELECT DISTINCT month, discount
FROM MySales;

INSERT INTO sales(pName, month)
SELECT DISTINCT pName, month
FROM MySales;