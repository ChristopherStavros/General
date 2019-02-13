# INDEXES

- Think of the primary key as the word in a dictionary and the other columns as the definition.
- To allows a table to perform searches more efficiently, create indexes
- The primary key is is an index by default
  - The primary key is a 'unique index', a special kind of index
- Indexes are stored in a binary tree
- Indexes can become corrupted so it is important to periodically reindex your data

## Single column indexes

```sql
CREATE INDEX index_name ON table_name(column_name)
```

## Multi-column indexes

- It is more efficient to create a multicolumn idnex if you are performing a log of multicolumn filtering
- This only useful when you are doing 'AND' filtering
- You generally don't want to create multi-column indexes

```sql
CREATE INDEX index_name ON table_name(column1_name, column2_name)
```

# REINDEX

- Indexes can become corrupted so it is important to periodically reindex your data
  - Reindexing will delete the existing index and rebuild it
- indexes can also use a lot of disk space over time if there are a lot of updates, so reindexing will also help with this

## REINDEX specific INDEX

```sql
REINDEX INDEX index_name
```

## REINDEX ALL indexes in a TABLE

```sql
REINDEX TABLE table_name
```

## REINDEX ALL indexes in a DATABASE

```sql
REINDEX DATABASE database_name
```

# VIEWs

## Create VIEW
```sql
CREATE VIEW total_revenue_per_customer AS
SELECT customers.first_name, customers.last_name, sum(items.price) FROM customers
INNER JOIN purchases on customers.id = purchases.customer_id
INNER JOIN items on purchases.item_id = items.id
GROUP BY  customers.id;

CREATE VIEW awesome_customers AS
SELECT * FROM total_revenue_per_customer WHERE sum > 150;
``` 

## DELETE VIEW

```sql
DROP VIEW total_revenue_per_customer;
```

## INSERT VALUES into VIEWs

```sql
CREATE VIEW expensive_items AS
SELECT * FROM items WHERE price >= 100;

INSERT INTO expensive_items(id, name, price)
VALUES (10, 'DSLR', 400.00);
```

## Preventing an INSERT where criteria doesn't match

```sql
CREATE VIEW expensive_items AS
SELECT * FROM items WHERE price >= 100
WITH LOCAL CHECK OPTION;  -- postgres ONLY
-- this will limit INSERT to only items that match the WHERE criteria

INSERT INTO expensive_items(id, name, price)
VALUES (11, 'Pencil', 2.00);
```

**NOTE:** Without using the ```WITH LOCAL CHECK OPTION```,  this code will throw an error:  

```new row violates check option for view "expensive_items"```

**Note:** ```WITH LOCAL CHECK OPTION``` will only check the current VIEW (local) not parent or related VIEWs

```WITH CASCADED CHECK OPTION``` will check related VIEWs as well

# FUNCTIONS

- COUNT
- SUM
- AVG
- MAX
- MIN
- HAVING

## COUNT

```sql
SELECT customers.first_name, customers.last_name, COUNT(purchases.id) AS purchase_count
FROM customers
INNER JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id;
```

## SUM

```sql
SELECT customers.first_name, customers.last_name, SUM(purchases.id) AS purchase_sum
FROM customers
INNER JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id;
```

## AVG

```sql
-- sold items
SELECT AVG(items.price) FROM items
INNER JOIN purchases ON items.id = purchases.item_id;

--items
SELECT AVG(items.price) FROM items;
```

## MAX

### Similar to MAX

```sql
SELECT items.name, items.price FROM items
INNER JOIN purchases ON items.id = purchases.item_id
ORDER BY price DESC
LIMIT 1
```

### Perhaps Better but you lose out on detail

```sql
SELECT MAX(items.price) FROM items
INNER JOIN purchases ON items.id = purchases.item_id
```

## HAVING

**NOTE:** The HAVING construct is placed AFTER the aggregation

```sql
SELECT customers.first_name, customers.last_name, COUNT(purchases.id) AS purchase_count
FROM customers
INNER JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id
HAVING COUNT(purchases.id) > 3;
```

# DATES

- Storing dates in databases can be challenging for a number of reasons
    - Dates can be formatted in many ways
    - Dates can have a timezone attached to them
- A good practice is to store dates without timezone information and have your program convert them later
- Use ISO8601 standard -> 'YYYY-MM-DD hh:mm:ss'
  - American format -> Postgres standard format

## Postgres datatypes for storing dates and times

- timespace
- date
- time
- interval

```sql
SELECT timestamp '2005-10-10 5:16:45';
SELECT timestamp '2005-10-10 5:16:45.123'
```

## Convert timestand

```sql
SELECT NOW();
```