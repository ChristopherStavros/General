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


