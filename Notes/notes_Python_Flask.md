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

### Basic Restful API

#### With Flask Restful, there is no need to use JSONify, you can just return dictionaries
```python
from flask import Flask
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

class Student(Resource):
    def get(self, name):
        return {'student': name}

api.add_resource(Student, '/student/<string:name>')

app.run(port=5000)
```

### Slightly more advanced Restful API

```python
from flask import Flask, request
from flask_restful import Resource, Api

app = Flask(__name__)
api = Api(app)

items = []

class Item(Resource):
    def get(self, name):
        item = next(filter(lambda x: x['name']==name, items), None)
        return {'item': item}, 200 if items else 404

    def post(self, name):
        if next(filter(lambda x: x['name']==name, items), None) is not None:
            return {'Message': "An items with name '{}' already exists.".format(name)}, 400
            
        data = request.get_json()
        item = {'name': name, 'price': data['price']}
        items.append(item)
        return item, 201

class ItemList(Resource):
    def get(self):
        return {'items': items}

api.add_resource(Item, '/item/<string:name>')
api.add_resource(ItemList, '/items')

app.run(port=5000, debug=True)
```

## Flask-JWT

### Install

```bash
$ pip3 install Flask-JWT
```

### What is JWT?

- JSON Web Token
- It is an obfuscation of data
- Encoding

#### Postman header using access token

- New header
  - Authorization
    - JWT eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJleHAiOjE1NTQ2NjQ0MDAsImlhdCI6MTU1NDY2NDEwMCwibmJmIjoxNTU0NjY0MTAwLCJpZGVudGl0eSI6MX0.FNY7gYzVkP0KXPyNPv9Hu5hHfOVFrxtZRoJ_HDy4H8w







