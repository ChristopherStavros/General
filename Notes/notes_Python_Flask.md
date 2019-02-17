# Hello world

```python
from flask import Flask

app = Flask(__name__)

@app.route("/")
def home():
    return "Hello world"

app.run(port=5000)
```

```bash
curl http://localhost:5000
```

# Flask and Docker

https://medium.com/@mtngt/docker-flask-a-simple-tutorial-bbcb2f4110b5

# HTTP Verbs

Verb | Meaning | Example
--- | --- | ---
GET | Retrieve Something | GET /item/1
POST | Receive data, and use it | POST /item
PUT | Make sure something is there | POST /item
DELETE | Remove something | DELETE /item/1

# REST principles

## What is a REST API

- A way of thinking about how a web server behaves in general
- Doesn't respond with just data
- Responds with resources

## Resources

- Similar of object oriented programming
- Think of the server as having resources, and each is able to interact with the pertinent request

## Stateless

- One request cannot depend on any other requests
- The server only knows about the current request, and not any previous requests
- For example:
    - **POST /item/chair** creates an item
    - The server does not know the item now exists
    - **GET /item/chair** then goes to the database and checks to see if the item is there
    - To get an item you do not need to have created an item before - the item could be in the database from previously
- Another example:
    - A user logs on to a web application
    - The web server does not know the user is logged in (since it does not remember any state)
    - What do we do?
    - The web application must send enough data to identify the user in every request, or else the server won't associate the request with the user

# Flask-RESTful

### virtualenv
```bash
pip3 install virtualenv
```

### Linux example using virtualenv

```bash
$ virtualenv venv --python=python3.6

$ source venv/bin/activate

$ pip install Flask-RESTful

$ deactivate
```








