SELECT * from orderdetails; SELECT * FROM products; /*Select * from productlines; select * from customers; SELECT * FROM employees;*/
/*1. Write a query to display each customer’s name (as “Customer Name”) alongside the name of the employee who is responsible
 for that customer’s orders. The employee name should be in a single “Sales Rep” column formatted as “lastName, firstName”. 
 The output should be sorted alphabetically by customer name.*/
SELECT c.customerName AS 'Customer Name', CONCAT(e.lastName, ", ", e.firstName) AS 'Sales Rep' FROM customers AS c
JOIN employees AS e ON c.salesRepEmployeeNumber = e.employeeNumber ORDER BY e.lastName desc;

/*2. Determine which products are most popular with our customers. For each product, list the total quantity ordered along with the total sale generated (total quantity ordered * priceEach) for that product. The column headers should be “Product Name”, “Total # Ordered” and “Total Sale”. List the products by Total Sale descending.*/
SELECT productCode AS 'Product Name', count(productCode) AS 'Total # Ordered', quantityOrdered * priceEach AS 'Total Sale' FROM orderdetails GROUP by productCode ORDER BY quantityOrdered * priceEach desc;

/*3. Write a query which lists order status and the # of orders with that status. Column headers should be “Order Status” and “# Orders”. Sort alphabetically by status.*/
SELECT status AS 'Order Status', count(STATUS) AS '# Orders' FROM orders GROUP BY STATUS ORDER BY STATUS;

/*4. Write a query to list, for each product line, the total # of products sold from that product line. The first column should be “Product Line” and the second should be “# Sold”. Order by the second column descending.*/
SELECT p.productLine AS 'Product Line', COUNT(p.productCode * od.quantityOrdered) AS '# Sold' FROM products AS p
JOIN orderdetails AS od ON p.productCode = od.productCode ORDER BY 2 DESC; 

/*5. For each employee who represents customers, output the total # of orders that employee’s customers have placed alongside the total sale amount of those orders. The employee name should be output as a single column named “Sales Rep” formatted as “lastName, firstName”. The second column should be titled “# Orders” and the third should be “Total Sales”. Sort the output by Total Sales descending. Only (and all) employees with the job title ‘Sales Rep’ should be included in the output, and if the employee made no sales the Total Sales should display as “0.00”.*/


/*6. Your product team is requesting data to help them create a bar-chart of monthly sales since the company’s inception. Write a query to output the month (January, February, etc.), 4-digit year, and total sales for that month. The first column should be labeled ‘Month’, the second ‘Year’, and the third should be ‘Payments Received’. Values in the third column should be formatted as numbers with two decimals – for example: 694,292.68.*/