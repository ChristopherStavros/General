# Datetime

### [Codes](http://strftime.org/)
```python
from datetime import datetime

delta = datetime.now() - datetime(1900, 12, 31, 5, 20, 22, 91929)  # (YYYY, MM, DD, h, m, s, ms)

now = datetime.now()
then = datetime(1900, 12, 31)

whenever = datetime.strptime("2017-12-31", "%Y-%m-%d")
whenever2 = datetime.strptime("2017:12:31:20:59", "%Y:%m:%d:%H:%M")

print(delta.days)
print(delta.seconds)
print(now - then)
print(whenever)
print(whenever2)

# Convert to string with a particualr format
whenever.strftime("%Y-%m-%d %H:%M")
```

# Background process

### Windows

- .pyw extension for Python scripts will allow them to run as a background process
- Scheduled task - set trigger to pyw file (no need to call python first)

### Linux / Mac

#### Cron

##### Add value to cron table

```bash
sudo crontab -e
```

##### In text editor, add

    @reboot python3 /pathtofile/file.py


# OOP

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

    @staticmethod
    def do_something_else():
        return "This is a static method"
```

```python
my_user = User('Hans_Gruber')

User.do_something()
```

**Note:** 'self' refers to the **currently bound object** (my_user, in the example above)

## Class methods and static methods

https://stackoverflow.com/questions/136097/what-is-the-difference-between-staticmethod-and-classmethod

## Inheritance

```python
class Decimal:
    def __init__(self, number, places):
        self.number = number
        self.places = places
    # def __repr__(self):
    #     return "%.2f" % self.number # 2 for decimal places, f for floating point

    def __repr__(self):
        return "%.{}f".format(self.places) % self.number

    def add(self):
        pass

class Currency(Decimal):
    def __init__(self, symbol, number, places):
        super().__init__(number, places)
        self.symbol = symbol

    def __repr__(self):
        return "{}{}".format(self.symbol, super().__repr__())

    def add_currency(self, currency):
        pass


print(Decimal(15.6789, 3))
print(Currency("$", 15.6789, 3))
```

## Multiple inheritance (probably not useful)

```python
# class SuperBaseClass:
#     def hi(self):
#         print("You are here")

# class ClassA(SuperBaseClass):
#     pass

class ClassA:
    def hi(self):
        print("Hello")

class ClassB:
    def hi(self):
        print("Hallo")

    def another(self):
        print("In Class B")

class ClassC(ClassA, ClassB):
    pass

c = ClassC()

# Will look to first class (or it's parent class if method is not defined) and then to second class
c.hi()
c.another()
```

## Composition

Different than inheritace.  Objects are related but not 'of' eachother.

```python
class Leg:
    pass

class Back:
    pass

class Chair:
    def __init__(self, num_legs):
        self.legs = [Leg() for leg in range(num_legs)]
        self.back = Back()

    def __repr__(self):
        return "I have {} legs and one back".format(len(self.legs))

print(Chair(5))
```

# Encapsulation

Hiding the inner workings of a class when showing those inner workings is not necessary

# Some more built in methods

### Covered elsewhere

1. __init__
1. __repr__

## Or

```python
def to_usd(self, amount = None):
    #to_convert = amount if amount is not None else self.amount
    to_convert = amount or self.amount # TRICK - shorthand for above
    return to_convert * self.exchange_to_usd
```

## __eq__, __gt__ , __lt__, __le__, __ge__

Define equal, greater than, less than.... methods

```python
class Currency:
    def __init__(self, code, exchange_to_usd):
        self.amount = 0.00
        self.code = code
        self.exchange_to_usd = exchange_to_usd

    def set_amount(self, amount):
        self.amount = amount

    def in_currency(self, amount):
        return amount / self.exchange_to_usd
    
    def to_usd(self, amount = None):
        #to_convert = amount if amount is not None else self.amount
        to_convert = amount or self.amount # TRICK - shorthand for above
        return to_convert * self.exchange_to_usd

    def __eq__(self, other):
        return self.to_usd() == other.to_usd()

    def __gt__(self, other):
        return self.to_usd() > other.to_usd()

    def __lt__(self, other):
        return self.to_usd() < other.to_usd()

    def __le__(self, other):
        return self.to_usd() <= other.to_usd()

    def __ge__(self, other):
        return self.to_usd() >= other.to_usd()

pounds = Currency("GBP", 1.21)
pounds.set_amount(1000)
euros = Currency("EUR", 1.07)
euros.set_amount(1000)

print(pounds == euros)
print(pounds > euros)
print(pounds < euros)
print(pounds <= euros)
print(pounds >= euros)

```

# Assertions

- Use assertions if you may want to turn them off later to improve performance (High permormance mode will remove assertions)
- Otherwise, raise exceptions 

```python
def divide_secure(number, divisor):
    # if divisor == 0:
    #     raise ValueError("The divisor is 0!")

    assert divisor != 0  # basically same as above

    return number / divisor

divide_secure(10, 0)
```

# Lambdas

## Basic lambda function
```python
l = lambda x: x**2
l(5)
25
```

## Takes in a paramter x and returns whether x is greater than 5

```python
l = lambda x : x > 5

print(l(10))

''' same
def l(x):
    return x > 5

print(l(10))
'''
```

## Get a new list in the check function is true

### Lambda functions are cheaper in terms of performance than creatng full blown functions

```python
def alter(values, check):
    #return list(filter(check, values))   # SAME
    return [val for val in values if check(val)] # this is more pythonic than filter method

my_list = [1,2,3,4,5]
another_list = alter(my_list, lambda x: x!=5)
print(another_list)

'''same
def check_not_five(x):
    return x != 5

another_list = alter(my_list, check_not_five)
print(another_list)
'''
```