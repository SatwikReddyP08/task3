-- 1. See all shipments
SELECT *
FROM shipments;

-- 2. All shipments by SP02
SELECT *
FROM shipments
WHERE `Sales Person` = 'SP02';

-- 3. All shipments by SP02 to G3
SELECT *
FROM shipments
WHERE `Sales Person` = 'SP02'
  AND Geo = 'G3';

-- 4. All shipments in January 2023
SELECT *
FROM shipments
WHERE Date BETWEEN '2023-01-01' AND '2023-01-31';

-- 5. All shipments by SP02, SP03, SP12, SP15
SELECT *
FROM shipments
WHERE `Sales Person` IN ('SP02', 'SP03', 'SP12', 'SP15');

-- 6. Products containing 'choco'
SELECT *
FROM products
WHERE Product LIKE '%choco%';

-- 7. Salespersons whose names begin with 'S'
SELECT *
FROM people
WHERE `Sales Person` LIKE 'S%';

-- 8. Sales per box of chocolates in Feb 2023
SELECT s.Product,
       SUM(s.Amount) / SUM(s.Boxes) AS SalesPerBox
FROM shipments s
JOIN products p
  ON s.Product = p.Product
WHERE p.Category = 'Chocolates'
  AND s.Date BETWEEN '2023-02-01' AND '2023-02-28'
GROUP BY s.Product;

-- 9. All shipment data for Subba Rao
SELECT *
FROM shipments
WHERE `Sales Person` = 'Subba Rao';

-- 10. All shipment data for Subba Rao by month
SELECT MONTH(Date) AS Month,
       SUM(Amount) AS TotalAmount
FROM shipments
WHERE `Sales Person` = 'Subba Rao'
GROUP BY MONTH(Date);

-- 11. Total shipment amount by Geo
SELECT Geo,
       SUM(Amount) AS Total_Amount
FROM shipments
GROUP BY Geo;

-- 12. Average and total shipment amount
SELECT AVG(Amount)   AS Average_Amount,
       SUM(Amount)   AS Total_Amount
FROM shipments;

-- 13. INNER JOIN: Products with their total shipped amounts
SELECT p.Product,
       SUM(s.Amount) AS TotalShippedAmount
FROM products p
INNER JOIN shipments s
  ON p.Product = s.Product
GROUP BY p.Product;

-- 14. LEFT JOIN: All people and any shipments they made
SELECT p.`Sales Person` AS PersonName,
       s.Product,
       s.Amount
FROM people p
LEFT JOIN shipments s
  ON p.`Sales Person` = s.`Sales Person`;

-- 15. RIGHT JOIN: All products and any shipments for them
SELECT pr.Product,
       s.`Sales Person`,
       s.Amount
FROM shipments s
RIGHT JOIN products pr
  ON s.Product = pr.Product;

-- 16. DISTINCT: Salespersons who shipped above the average amount
SELECT DISTINCT `Sales Person`
FROM shipments
WHERE Amount > (
  SELECT AVG(Amount)
  FROM shipments
);

-- 17. HAVING: Geos with total shipments > 20000
SELECT Geo,
       SUM(Amount) AS Total_Amount
FROM shipments
GROUP BY Geo
HAVING SUM(Amount) > 20000;

-- 18 Create or replace a summary VIEW
DROP VIEW IF EXISTS Sales_Summary;
CREATE VIEW Sales_Summary AS
SELECT `Sales Person`,
       SUM(Amount) AS Total_Amount
FROM shipments
GROUP BY `Sales Person`;

-- 19. Query the Sales_Summary view
SELECT *
FROM Sales_Summary;

-- 20. Index on Amount for optimization
CREATE INDEX idx_amount ON shipments(Amount);

-- 21. Show all indexes on shipments
SHOW INDEXES FROM shipments;
