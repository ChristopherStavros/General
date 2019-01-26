# Postgres

## Install pyscopg2

```python
pip install psycopg2
```

## Test connection

```python
import psycopg2

connection = psycopg2.connect(database="learning", user = "postgres", password = "P@ssw0rd", host = "localhost")

cursor = connection.cursor()
cursor.execute("SELECT * FROM purchases")

for row in cursor:
    print(row)
```

## Database connections

To make a database connections the following arguments need to be passed to the psycopg2.connect() method.

- host
- database
- user
- password

**Example:** ```connection = psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd" )```

**Note:** When database modifications are made, changes should be commited and connections should be closed

```python
connection.commit()
connection.close()

# OR just use the 'with' construct - BEST
with psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd") as connection:
```

## cursor

A cursor i something that lets you:

- Retrieve data and read it row by row
- Execute arbitrary SQL statements

## cursor.execute()

**Examples:**

```python
cursor = connection.cursor()
```

### Better

```python
# This is a better practice than the code above since you should close your curser when you are finished using it
connection = psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd")
with connection.cursor() as cursor:
    cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                (self.email, self.first_name, self.last_name))
    connection.commit()
    connection.close()
```

### Even better

```python
# This is a better practice than the code above because we always want to commit our changes and close the connection
with psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd") as connection:
    with connection.cursor() as cursor:
        cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                    (self.email, self.first_name, self.last_name))
```

### Better still

```python
# Define the connection string in a separate function in database.py to make code more succinct
import psycopg2

def connect():
    return psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd")

#In another file
from database import connect

with connect() as connection:
    with connection.cursor() as cursor:
        cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                    (self.email, self.first_name, self.last_name))
```

**Note:** Using 'conversion specifiers' rather than 'string formatting' is considered more secure in this context.

## More on commit()

- If you execute a change but do not commit the change then the transaction will take place the the data wlll not be saved.
- This be be illustrated when using sequences.  The sequence will still increment even though no data is written.
- Usng the 'with' construct will automatically commit changes and close the connection

## Connection pooling

- Creating database connections is one of the slower parts of interacting with the database
- This means we cannot use ```with connect() as connection:```, as it will close the connection
- Connection pools should be used
- Connection pools with require you to put each connection back into the pool, once they are finished being used

### ...and better still (but still not great)- user Connection pools

```python
# Create a connection pool in a separate function in database.py to make code more succinct
from psycopg2 import pool
connection_pool = pool.SimpleConnectionPool(1, 10,  #maxconn...number of initial connections, max number of connections pool can handle
                                            host = "localhost", 
                                            database="learning", 
                                            user = "postgres", 
                                            password = "P@ssw0rd") 

#In another file
from database import connection_pool

connection = connection_pool.getconn()
with connection.cursor() as cursor:
    cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                (self.email, self.first_name, self.last_name))
connection_pool.putconn(connection)
```

**Note:** This code is still a problem because you need to put the connection back into the pool every time.  IF you were to return some values and where then unable to return the connection, this could cause an error to be thrown.  
We still need to find a way to use the 'with' construct here, whcih will require some more programming as psycopg2 does not handle this out of the box.