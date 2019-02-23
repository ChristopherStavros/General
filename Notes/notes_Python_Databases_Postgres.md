# Getting started

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

# Connections

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

### cursor.execute()

**Examples:**

```python
cursor = connection.cursor()
```

## Better

This is a better practice than the code above since you should close your curser when you are finished using it

```python
connection = psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd")
with connection.cursor() as cursor:
    cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                (self.email, self.first_name, self.last_name))
    connection.commit()
    connection.close()
```

## Even better

This is a better practice than the code above because we always want to commit our changes and close the connection

```python
with psycopg2.connect(host = "localhost", database="learning", user = "postgres", password = "P@ssw0rd") as connection:
    with connection.cursor() as cursor:
        cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                    (self.email, self.first_name, self.last_name))
```

## Better still

Define the connection string in a separate function in database.py to make code more succinct

```python
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

- If you execute a change but do not commit the change then the transaction will take place however the data wlll not be saved.
- This be be illustrated when using sequences.  The sequence will still increment even though no data is commited.
- Using the 'with' construct will automatically commit changes and close the connection

# Connection pools

- Creating database connections is one of the slower parts of interacting with the database
- This means we cannot use ```with connect() as connection:```, as it will close the connection
- Connection pools should be used
- Connection pools with require you to put each connection back into the pool, once they are finished being used

## ...and better still (but still not great)- using Connection pools...incorrectly

Create a connection pool in a separate function in database.py to make code more succinct

```python
from psycopg2 import pool
connection_pool = pool.SimpleConnectionPool(1, 10,
                                            host = "localhost", 
                                            database="learning", 
                                            user = "postgres", 
                                            password = "P@ssw0rd") 
```

**NOTE:** The first and second arguments passed to the 'SimpleConnectionPool' are - the number of initial connections, max number of connections pool can handle

In another file

```python
from database import connection_pool

connection = connection_pool.getconn()
with connection.cursor() as cursor:
    cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                (self.email, self.first_name, self.last_name))
connection_pool.putconn(connection)
```

**Note:** This code is still a problem because you need to put the connection back into the pool every time.  

If you were to return some values and where then unable to return the connection, this could cause an error to be thrown.  

We still need to find a way to use the 'with' construct here, which will require some more programming as psycopg2 does not handle this out of the box.

## Using 'with' and connection pools - still not quite right

**Note:** This attempt is using the with construct to create connection pools, however while the run works, it actually creates multiple connection pools, which is even more inefficient that just creating multiple connection (as in on the the earlier examples).   

With this current code, a new connection pool object is created every time that ```with ConnectionPool() as connection:``` runs.  This is bad.

database.py

```python
from psycopg2 import pool

class ConnectionPool:
    def __init__(self):
        connection_pool = pool.SimpleConnectionPool(1, 10,
                                            host = "localhost", 
                                            database="learning", 
                                            user = "postgres", 
                                            password = "P@ssw0rd")
    def __enter__(self):
        return self.connection_pool.getconn()

    def __exit__(self, exc_type, exc_val, exc_tb):
        # We really should be returning the connections, but how?
        pass
```

Another file (excerpt)

```python
from database import ConnectionPool

def save_to_db(self):
    with ConnectionPool() as connection:
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                        (self.email, self.first_name, self.last_name))
```

## Still better! - Connection pools implemented properly, but with some redundant code

**Note:** This version is better still.  This time, when '__init__' is called , new connection pool object is not created however a connection to the pool occurs when the '\__enter\__' function runs, and disconnects (and commits!) when the '\__exit\__' function runs.

database.py

```python
from psycopg2 import pool

connection_pool = pool.SimpleConnectionPool(1, 10,
                                    host = "localhost", 
                                    database="learning", 
                                    user = "postgres", 
                                    password = "P@ssw0rd")

class ConnectionFromPool:
    def __init__(self):
        self.connection = None

    def __enter__(self):
        self.connection = connection_pool.getconn()
        return self.connection

    def __exit__(self, exc_type, exc_val, exc_tb):
        self.connection.commit()
        connection_pool.putconn(self.connection)
```

**Note:** Commit() is required even though we are using 'with' because the connection to the pool actually occurs outside the the 'ConnectionFromPool' class, so we still have to commit here

Another file (excerpt)

```python
from database import ConnectionFromPool

def save_to_db(self):
    with ConnectionFromPool() as connection:
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                        (self.email, self.first_name, self.last_name))
```

## More details on the '\__exit\__' function

### Arguments

It is a good practice to handle errors within the '\__exit__\' function

- self
- exception_type
- exception_value
- exception_traceback

```python
def __exit__(self, exception_type, exception_value, exception_traceback):
    if exception_value is not None:
        self.connection.rollback()
    else:
        self.cursor.close()
        self.connection.commit()
    connection_pool.putconn(self.connection)
```

## Still better...in many situations but not all

**Note:** This version is removes the redundant code from the previous version, but does have a couple downsides.  

- No longer able to perform multiple operations with the same cursor
  - If your app requires a lot of database writes, then this may not be the best option
- We also lose the ability to roll back a connection...unless we handle it in the '\__exit\__' function, which we will do here

database.py

```python
from psycopg2 import pool

connection_pool = pool.SimpleConnectionPool(1, 10,
                                    host = "localhost", 
                                    database="learning", 
                                    user = "postgres", 
                                    password = "P@ssw0rd")

class CursorFromConnectionFromPool:
    def __init__(self):
        self.connection = None
        self.cursor = None

    def __enter__(self):
        self.connection = connection_pool.getconn()
        self.cursor = self.connection.cursor()
        return self.cursor

    def __exit__(self, exception_type, exception_value, exception_traceback):
        if exception_value is not None:
            self.connection.rollback()
        else:
            self.cursor.close()
            self.connection.commit()
        connection_pool.putconn(self.connection)
```

**Note:** Commit() is required even though we are using 'with' because the connection to the pool actually occurs outside the the 'ConnectionFromPool' class, so we still have to commit here

Another file (excerpt)

```python
from database import CursorFromConnectionFromPool

def save_to_db(self):
    with CursorFromConnectionFromPool() as connection:
        with connection.cursor() as cursor:
            cursor.execute('INSERT INTO users (email, first_name, last_name) VALUES (%s, %s, %s)', 
                        (self.email, self.first_name, self.last_name))
```

# More on imports

- from users import User
  - a file is run to make classes within the file available
- Python code needs to be compiled and imports need to be cleared

# Make variables private in Python

Add two underscores in front

# Resources

[Security - pgpass](https://stackoverflow.com/questions/28800880/python-connect-to-postgresql-with-libpq-pgpass)