# Pandas

## From CSV file
```python
data = pandas.read_csv('Volcanoes.csv')
```

## To CSV file

```python
data.to_csv('Pandas_Volcanoes.csv')
```

# CSV module

## Read CSV file and convert to JSON format (dict)

```python
with open('file.csv') as f:
    data = csv.DictReader(f)
    lst = []
    for dct in map(dict, data):
        lst.append(dct)
contractors = {"contractors":lst}
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
