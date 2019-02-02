# Getting started
## Run redis:alpine Docker container with default port mapping

```bash
#Using default port mapping (redis port is 32768:6379)
docker container run -idt --name redis -P redis:alpine
```

## Install redis-cli locally

```bash
apt install redis-tools
```

## Connect to redis server (container)

```bash
redis-cli -p 32768
```

# Commands

- ADD
- GET
- DEL
- HGET => Returns value for single key passed
- HSET => set/updates value for the single key
- HMGET => Returns value for single/multiple keys passed
- HMSET => set/updates values for the multiple key
- HGETALL => Returns all the (key, value) pairs in the mapping.

## Set Key

```bash
127.0.0.1:32768> SET foo "Hello world"
OK
```

## Get Key

```bash
127.0.0.1:32768> GET foo
"Hello world"
```

## Delete Key

```bash
127.0.0.1:32768> DEL foo
(integer) 1
```

# Python redis module

## Redis commands and their respective methods in redis-py library

- ADD => add
- GET => get
- DEL => delete
- HGET => hget
- HSET => hset
- HMGET => hmget
- HMSET => hmset
- HGETALL => hgetall

### Quick and dirty Python example

**NOTE:** Use connection pools in the real world

```python
'''pip3 install redis'''

import redis

redis_host = "localhost"
redis_port = 32768   # 6379
redis_password = ""

def set_value(key, value):
    try:
        r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
        r.set(key, value)       
   
    except Exception as e:
        print(e)

def get_value(key):
    try:
        r = redis.StrictRedis(host=redis_host, port=redis_port, password=redis_password, decode_responses=True)
        
        msg = r.get(key)
        print(msg)       
   
    except Exception as e:
        print(e)

set_value("foo", "bar")

get_value("foo")
```

# Sources

https://codeburst.io/redis-what-and-why-d52b6829813  
https://redis.io/topics/rediscli

