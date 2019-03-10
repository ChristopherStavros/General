# SQLite

## Overview

1. Connect to a database
1. Create a curser object
1. Write an SQL query
1. Commit changes to database
1. Close connection

## Very basic program

```python
import sqlite3

conn = sqlite3.connect("lite.db")
cur = conn.cursor()

cur.execute("DROP TABLE IF EXISTS store")
cur.execute("CREATE TABLE store (item TEXT, quantity INTEGER, price REAL)")
cur.execute("INSERT INTO store(item, quantity, price) VALUES ('Hat', 2, 3.50)")

cur.execute("SELECT * FROM store")
print(cur.fetchall())
    
conn.commit()
conn.close()
```

# Resources

https://www.pythonlearn.com/html-008/cfbook015.html
[Firefox SQLlite Manager Add-on](https://addons.mozilla.org/en-US/firefox/addon/sqlite-manager-webext/)