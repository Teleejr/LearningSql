/*1. Writes a query to display Name, Product Line, and Buy Price of products in descending order*/
SELECT productName AS 'Name', productLine AS 'Product Line', buyPrice AS 'Buy Price' FROM products ORDER BY buyPrice DESC;

/*2. Writes a query displaying First Name, Last Name, and City of all Customers in Germany. Sorted by Last Name in ascending order.*/
SELECT contactFirstName AS 'First Name', contactLastName AS 'Last Name', city FROM customers WHERE country = 'Germany' ORDER BY contactLastName;

/*3. Writes a query that lists status types in alphabetical order*/
SELECT distinct STATUS AS 'Status Types' FROM orders;

/*4. Writes a query sorting all fields after January 1, 2005*/
SELECT * FROM payments WHERE paymentDate BETWEEN '2005-01-01' AND '9999-01-01' ORDER BY paymentDate;

/*5. Writes a query for info about all employees in San Francisco*/
SELECT lastName AS 'Last', firstName AS 'First', email, jobTitle AS 'Job Title' FROM employees WHERE officeCode = '1' ORDER BY lastName;

/*6. Writes a query displaying the Name, Product Line, and Vendor of all products. Vintage is sorted first, then Classic.*/
SELECT productName, productLine, productScale, ProductVendor FROM products WHERE productLine IN('Classic Cars', 'Vintage Cars') ORDER BY productName, productLine desc;