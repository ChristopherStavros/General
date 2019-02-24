  ## JSON

- json.load
  - load from file
- json.loads
  - load from string

**Note:** JSON can be represented by dictionaries in Python

```json
{
    "executives": [
        {
            "ID": 1,
            "firstName": "Steez",
            "lastName": "McQueez",
            "position": "CEO",
            "location": "Hotlanta",
            "species": "strigoi"
        },
        {
            "ID": 2,
            "firstName": "Mister",
            "lastName": "CheesySneasel",
            "position": "CISO",
            "location": "Hotlanta",
            "species": "vampire"
        }
    ]
}
```

## Read JSON

Basic

```python
import json

with open('my_file.json', 'r') as f:
    json_data = json.load(f)
```

Using try/catch

```python
with open(filename, 'r') as f:
    try:
        json_data = json.load(f)
    except json.decoder.JSONDecodeError:
        print("Invalid JSON file")
        return
```

## Write JSON

```python
import json

with open('my_file.json', 'w') as f:
    json.dump(json_data, f)
```

## Write to txt file

```python
myFile = open('file.txt', 'w')
myFile.write("Hello")
myFile.close()

numbers = [1, 2, 3]
file = open("numbers.txt", "w")
for i in numbers:
        file.write(str(i) + "\n")
file.close()

# better - USE 'WITH' CONSTRUCT

with open('my_file.txt', 'w') as f:
    f.write("Hello")
```

### Map

#### Pass an iterable to a function 

```python
# Return double of n 
def addition(n): 
    return n + n 
  
# We double all numbers using map() 
numbers = (1, 2, 3, 4) 
result = map(addition, numbers) 
print(list(result)) 
```

```python
import json

testfiles = ["test1.json", "test2.json"]

# Get dict from json file
def from_json(file):
    with open(file, 'r') as f:
        return json.load(f)
        
# Iterate through JSON files
maps = map(from_json, testfiles)

# Merge dictionaries
dct = {}
for m in maps:
    dct = {**dct, **m} # unpack values

print(dct)
```
