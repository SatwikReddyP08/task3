# SQL Task 3: Shipments & Sales Analysis

A quick MySQL exercise on real-world CSV data, covering everything from simple selects to joins, aggregates, views and indexes.

---

## What’s in this repo

- **data/**  
  - `geo.csv`       → table `geo` (GeoID, Geo, Region)  
  - `people.csv`    → table `people` (Sales Person, SP ID, Team, Location)  
  - `products.csv`  → table `products` (Product ID, Product, Category, Size, Cost per Box)  
  - `shipments.csv` → table `shipments` (Sales Person, Geo, Product, Date, Amount, Boxes)

- **sql/task3_queries.sql**  
  All the SQL you’ll need:  
  1. The **10 core** queries from the video (list shipments, filter by person/date/region, pattern-matching, etc.)  
  2. A handful of **extras** to practice `GROUP BY`, `SUM()`, `AVG()`, `INNER/LEFT/RIGHT JOIN`, `DISTINCT`, `HAVING`, creating a `VIEW`, and adding an `INDEX`.

- **screenshots/**  
  (Optional) PNGs of your query results for the first 10 video tasks.

---

## How to run

1. `LOAD DATA INFILE` (or use Workbench’s import) to get each CSV into its matching table.  
2. Open `task3_queries.sql` in MySQL Workbench (or CLI) and execute all statements.  
3. Check your results, and if you like, grab screenshots for queries 1–10.

---

## Why this matters

By the end you’ll have practiced:

- Picking the right filters (`WHERE`, `IN`, `LIKE`, date patterns)  
- Summarizing with `GROUP BY`, `SUM`, `AVG`, `HAVING`  
- Combining tables via `INNER`, `LEFT` and `RIGHT JOIN`  
- Building reusable logic in a `VIEW`  
- Speeding up lookups with an `INDEX`

It’s the kind of query toolkit every data analyst leans on daily.

---

> _Feel free to tweak the queries, add your own subqueries or indexes, and really make it yours!_  

— Satwik Reddy Pathapati  
