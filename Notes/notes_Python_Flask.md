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








