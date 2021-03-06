# Resources

[Official Documentation](https://www.postgresql.org/docs/10/index.html)

# First things

- Tables should store data related to one thing.  Related data should be stored in separate tables.
- In Postgres, "double quotes" are names of tables and fields, while 'single quotes' are for string constants
- **DDL** - Data Definition Danguage
- **DML** - Data Manipulation Language

### Run query in VS Code

    F5

## Comments

```sql
/* Block comment */

-- Single line comment
```

# QUERY BASICS

## SELECT

Select all rows and columns from a table

```sql
SELECT * FROM customers
```

Select all rows and only specific columns from a table

```sql
SELECT id, last_name
FROM customers
```

## WHERE

Use the 'WHERE' clause to filter returned rows

```sql
SELECT id, last_name 
FROM customers
WHERE last_name='Adam' OR last_name='Watson'
```

## AS

Give a friendly name to a column or table

```sql
SELECT customers.id AS "custID"
FROM customers
```

## LIMIT

Limit the number of rows returned

```sql
SELECT customers.first_name, customers.last_name 
FROM customers 
LIMIT 1;
```

## LIKE

Use LIKE for more advanced filtering

**NOTE:** This is taxing to the server so it should be avoided where possible

### Using underscores to denote the number of characters

```sql
SELECT * FROM customers
WHERE last_name LIKE '____'  /* returns last names with 4 chars*/
```

### Using the wildcard symbol '%'

```sql
SELECT * FROM customers
WHERE last_name LIKE '%'
/* returns all rows */
```

```sql
SELECT * FROM customers
WHERE last_name LIKE 'S%' 
/* returns last names that start with a capital S */
```

```sql
SELECT * FROM customers
WHERE last_name LIKE '%a%' 
/* returns last names that contain an lower case a */
```

### Combining wildcards and underscores

```sql
SELECT * FROM customers
WHERE last_name LIKE '%t_'
/* returns last names where 't' is the second to last character */
```

# JOINS

- JOINs treat rows of data as if they were Sets
- We can perform set operations on the tables
- JOINs are fairly quick and do not caue a major performance hit

## INNER JOIN

- Set intersection is the elements common to two sets
- INNER JOIN is similar to **set intersection**
- INNER JOIN selects rows from table 1 and table2 where they match the selecting column

    ```sql
    SELECT * FROM Customers
    INNER JOIN Orders
    ON Customers.ID = Orders.Customer_ID
    ```

## LEFT JOIN

- This selects all rows from the table1 (on the left), and the rows from table2 (on the right) **if they match**
- If they don't match, the data for the right table is blank

    ```sql
    SELECT * FROM Customers
    LEFT JOIN Orders
    ON Customer.ID = Orders.Customer_ID
    ```

## RIGHT JOIN

- Opposite of LEFT JOIN
- This selects all rows from the table2 (on the right), and the rows from table1 (on the left) **if they match**
- If they don't match, the data for the left table is blank

    ```sql
    SELECT * FROM Customers
    RIGHT JOIN Orders
    ON Customer.ID = Orders.Customer_ID
    ```

## FULL JOIN

- This selects all rows from both tables, matching them if there is a match on the selected column

    ```sql
    SELECT * FROM Customers
    FULL JOIN Orders
    ON Customer.ID = Orders.Customer_ID
    ```

# AGGREGATE FUNCTIONS

**NOTE:** when grouping data using GROUP BY,  some columns may become obsolete as a result of the grouping, however you can still that data using aggregate functions such as COUNT or SUM

## GROUP BY and COUNT

Count all purchases by a customer

```sql
SELECT COUNT(id) AS purchases, customer_id FROM purchases
GROUP BY customer_id;

--OR

SELECT customers.first_name, customers.last_name, COUNT(purchases.id)
FROM customers
LEFT JOIN purchases ON customers.id = purchases.customer_id
GROUP BY customers.id;
```

## SUM

```sql
SELECT customers.first_name, customers.last_name, COUNT(items.name), SUM(items.price)
FROM items
INNER JOIN purchases ON items.id = purchases.item_id
INNER JOIN customers ON purchases.customer_id = customers.id
GROUP BY customers.id
```

```sql
SELECT SUM(items.price)
FROM purchases
INNER JOIN items ON purchases.item_id = items.id
```

## ORDER BY and LIMIT

```sql
SELECT customers.first_name, customers.last_name, COUNT(items.name), SUM(items.price) AS "total_spent"
FROM items
INNER JOIN purchases ON items.id = purchases.item_id
INNER JOIN customers ON purchases.customer_id = customers.id
GROUP BY customers.id
ORDER BY total_spent DESC
LIMIT 1
```
