# Try - except

```python
number = input("Enter a number: ")
try:
    print(int(number) * 2)
except ValueError:
    print("You did not enter a base 10 number! Try again")
```

# Docs

[Exceptions]("https://docs.python.org/3/library/exceptions.html")