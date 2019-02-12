# Part 1 - Basics

## Resources

- [Python 3 Documentation](https://docs.python.org/3/)
- [Tutorial](https://docs.python.org/3/tutorial/index.html)

## Shebang

First line in script to specific environment for script to run - OPTIONAL

Linux

```python
#!/user/bin/env python3
```

Windows

```python
#!/python
```

## Comments

```python
# Single Line

#Single or multi-line
''' Block ''' 
""" Block """
```

## Multi-line String

```python
#Simlar to muli-line comment - can use """  or '''
x = '''

Hello

'''
```

## Variables and multiple variable assignment

```python
age = 105
days = age * 365

#Multiple assignment
x, y = 1, 2

def returnTwoValues():
    return 1, 2

x, y = returnTwoValues()

```

## The type() method

```python
>>> type(days)
<class 'int'>
>>> type(str(days))
<class 'str'>
```

## Type conversion

```python
# Convert an int to a string
str(5)

# Convert a string to an int
int("5")

 print("There are " + str(days) + " days.")
There are 1825 days.
```

## Get user input from terminal - input()

```python
stuff = input("What is your input:  ")
```

## String formatting

```python
stuff = "info"
"Get the {}, now.".format(stuff)
"Get the {0}, now.".format(stuff)
"Get the {stuff}, now.".format(stuff = stuff)
```

## Conversion specifier

```python
stuff = "info"
"Get the %s, now." % (stuff)
```

## Booleans

```python
1 <= 5
True

1 != 1
False
```

## Conditionals...using in keyword as well as booleans

```python
if "ab" in "abcd":
    print("Pattern found")
elif(1 >= 100):
    print("This code will never be reached")

Pattern found

lst =  [0, 1, 2, 3, 4]
if 3 in lst:
    print("Got it")

Got it
```

## The range() function

```python
for i in range(5): #0-4
    print(i)

for i in range(2,5): #start at index 2, end prior to index 5
    print(i)

for i in range(1,10): #start at index 1, end prior to index 10, and iterate by 2
    print(i)
```

## Import modules

```python
import random
random.randint(0,100)

# OR

from random import *
randint(0,100)
```

## Random numbers

```python
import random
random.randint(1,100)
```

## String methods

**Note:** String are immutable! (cannot be changed)

### split()

```python
lst = "1,2,3,4,5".split(",") # ['1', '2', '3', '4', '5']
```

### Dealing with upper and lower case letters

```python
x = "Hello".upper() #convert to upper case
x = "Hello".lower() #Convert to lower case
x = "Hello".isupper() # returns True if all letters are upper case
x = "Hello".islower() # returns True if all letters are lower case
```

### replace()

```python
x = "Birdman".replace("Bird", "Bat" # Batman
)
```

### More string methods

```python
x = "Hello".startswith("H") # True
x = "Hello".endswith("o") # True
x = "Hello".isalpha # True if string is alphabetical
x = "Hello   ".strip() #strip blank spaces from beginning or end
x = "spamspamHellospamspam".strip("maps") #strip specific character(s) from beginning or end - strips all characters in any order
x = ', '.join("cats", "dogs") # cats, dogs
#more string methods include rstrip(), lstrip(), rjust(), ljust()
```

## Lists

```python
lst =  [0, 1, 2, 3, 4]

for l in lst:
    print(l)

# append a value to the list, in place
# does not return a value
lst.append(5)

# sum() will add list items together... must be numeric values
print(sum([1 , 3,  5]))
```

## Get length of list or string

```python
lst =  [0, 1, 2, 3, 4]
len(lst)
```

## List comprehension

[A good blog post](https://treyhunner.com/2015/12/python-list-comprehensions-now-in-color/)

```python
# An existing list ... you can also use a tuple or another iterable
numbers = [1, 2, 3]

# A quick way of building a new list
# newVariable = [formula loop conditional(optional)]
n2 = [number for number in numbers]
print(n2) # [1, 2, 3]

# SAME AS
n2 = []
for number in numbers:
    n2.append(number)

print(n2) # [1, 2, 3]

# More examples
n2 = [number * 2 for number in numbers]
print(n2) # [2, 4, 6]

numbers = [1, 2, 3]
n2 = [str(number/4) for number in numbers]
print(n2) # ['0.25', '0.5', '0.75']

n2 = [("This is a number: " + str(number**10)) for number in numbers]
print(n2) # ['This is a number: 1', 'This is a number: 1024', 'This is a number: 59049']

#Creates a list of tuples
n2 = [(("This is a number: " + str(number**10)), number*35, "Stuff") for number in numbers]
print(n2) # [('This is a number: 1', 35, 'Stuff'), ('This is a number: 1024', 70, 'Stuff'), ('This is a number: 59049', 105, 'Stuff')]

n2 = [number**4 for number in numbers if (number == 1 or number == 3)]
print(n2) # [1, 81]

#Nested loop - this one creates a list of tuples
numbers = [1, 2, 3]
words = ["one","Two", "three"]
list2 = [(n, w) for n in numbers for w in words]
print(list2) # [(1, 'one'), (1, 'Two'), (1, 'three'), (2, 'one'), (2, 'Two'), (2, 'three'), (3, 'one'), (3, 'Two'), (3, 'three')]

#Nested loop - this one creates a list of dictionaries
numbers = [1, 2, 3]
words = ["one","Two", "three"]
list2 = [{"number":n, "word":w} for n in numbers for w in words]
print(list2) # [{'number': 1, 'word': 'one'}, {'number': 1, 'word': 'Two'}, {'number': 1, 'word': 'three'}, {'number': 2, 'word': 'one'}, {'number': 2, 'word': 'Two'}, {'number': 2, 'word': 'three'}, {'number': 3, 'word': 'one'}, {'number': 3, 'word': 'Two'}, {'number': 3, 'word': 'three'}]

```

## Dictionaries

```python
stuff = {'id': 3, 'thing': 4}
stuff1 = {'id1': 3, 'thing1': 4}
stuff.update(stuff1)
print(stuff) # {'id': 3, 'thing': 4, 'id1': 3, 'thing1': 4}

#Dictionary methods
stuff.keys()
stuff.values()
stuff.items()

# iterate through dictionary
for key, value in stuff.items():

```

## Dictionary comprehension

- https://www.datacamp.com/community/tutorials/python-dictionary-comprehension?

```python
dict_variable = {key:value for (key,value) in dictonary.items()}
```

## Sets

```python
# initialize an empty set
    y = set() # Cannot initialize like {}

# items cannot repeat in a set -- if added, they will be ignored
x = {1 , 2, 3, 4, 4}
print(x) # {1, 2, 3, 4}

y = {1, 2, 5, 7, 9}
    # intersection()
print(x.intersection(y)) #{1, 2}

# add value
x.add(9)

# code block using sets and len method
values = set()
while len(values) < 6:
    values.add(random.randint(1,20))
```

## Set comprehension

- Basically identical to list comprehension except result is a set

## Classes

```python
class User:
     # set parameters for object
    def __init__(self, name):
        self.name = name

    # define a string that represents the object
    def __repr__(self):
        return "<User {}>".format(self.name)

    @classmethod
    def do_something(cls):
        return "This is a class method"
```

```python
my_user = User('Hans_Gruber')

User.do_something()
```

**Note:** 'self' refers to the **currently bound object** (my_user, in the example above)

## Class methods and static methods

https://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod

## Lambda functions

```python
# Lamda functions are unnamed functions
# Each element is passed to the function and processed
{lamda x '''the parameter name''': x.watched '''processing''',  self.movies '''the parameter value for x'''}
```

## Get path of current script

```python
#Set script path and remove trailing \ if path is c:\
import os, sys

scriptPath = os.path.dirname(sys.argv[0])
if scriptPath[-1:]=='\\':
    scriptPath = scriptPath.strip('\\')
```

## Get CWD

```python
os.getcwd()
```

## JSON

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

## Named parameters

Named parameters can be passed to a method or a function

```python
cls(name = json_data['name'], genre = json_data['genre'], watched = json_data['watched'])
```

Example

```python
class Movie:
    #set parameters for object
    def __init__(self, name, genre, watched):
        #Define the class parameters
        self.name = name
        self.genre = genre
        self.watched = watched
    # define a string that represents the object
    def __repr__(self):
        return "<Movie {}>".format(self.name)

    def json(self):
        return {
            'name' : self.name,
            'genre' : self.genre,
            'watched' : self.watched
        }

    @classmethod
    def from_json(cls, json_data):
        return cls(name = json_data['name'], genre = json_data['genre'], watched = json_data['watched'])
```

**Note:** The first passed parameter can be ordered, however once a named parameter is passed all remaining paramters must be named

## Argument unpacking

Pass a set of named parameters

```python
**dictionary_data
```

Example

```python
class Movie:
    #set parameters for object
    def __init__(self, name, genre, watched):
        #Define the class parameters
        self.name = name
        self.genre = genre
        self.watched = watched

    # define a string that represents the object
    def __repr__(self):
        return "<Movie {}>".format(self.name)

    def json(self):
        return {
            'name' : self.name,
            'genre' : self.genre,
            'watched' : self.watched
        }

    @classmethod
    def from_json(cls, json_data):
        return cls(**json_data)
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

### Virtual Environments

- [Python Docs - venv](https://docs.python.org/3/tutorial/venv.html)
- [virtualenv - Older than 3.3](https://packaging.python.org/guides/installing-using-pip-and-virtualenv/)
- [venv  -3.6 and newer](https://docs.python.org/3/library/venv.html)
- [Selecting Virtual Environemnts in VS Code](https://code.visualstudio.com/docs/python/environments)
- [Specify venv path in vsode](https://www.reddit.com/r/vscode/comments/9nku97/using_a_virtualenv/)

It is a best practive to create a virtual environment for each project.  Create the venv if a **separate folder** within your project root.

### virtualenv
```bash
pip3 install virtualenv
```
### venv

```bash
sudo apt install python3-venv
```

### Windows Example using venv

```powershell
python -m venv .\venvTest1

.\venvTest1\Scripts\Activate.ps1

decativate
```

### Linux Example using venv

```bash
$ python -m venv venv

$ source venv/bin/activate

$ devactivate
```

### Linux example using virtualenv

```bash
$ virtualenv venv --python=python3.6

$ source venv/bin/activate

$ pip install Flask-RESTful

$ deactivate
```
Activate/deactivate venv

**NOTE:** You don’t specifically need to activate an environment; activation just prepends the virtual environment’s binary directory to your path, so that “python” invokes the virtual environment’s Python interpreter and you can run installed scripts without having to use their full path.

### pip show installed items - in requirements format

```bash
$ pip3 freeze
```

## Additional resources

[Python to Java](http://home.wlu.edu/~lambertk/pythontojava/)