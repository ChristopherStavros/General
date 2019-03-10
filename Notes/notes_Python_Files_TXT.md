# Read from txt file

```python
with open('my_file.txt', 'r') as f:
    content = f.read()
```

## Methods

- read(size) >> size is an optional numeric argument and this func returns a quantity of data equal to size. If size if omitted, then it reads the entire file and returns it

- readline() >> reads a single line from file with newline at the end

- readlines() >> returns a list containing all the lines in the file

- xreadlines() >> Returns a generator to loop over every single line in the file

# Read/write from txt file - be careful!

```python
with open('my_file.txt', 'r+') as f:
    content = f.read()
    print(content)
    f.write("Hello \n")
```

# Write to txt file

```python
myFile = open('file.txt', 'w')
myFile.write("Hello")
myFile.close()

numbers = [1, 2, 3]
file = open("numbers.txt", "w")
for i in numbers:
        file.write(str(i) + "\n")
file.close()
```

## BETTER - use 'WITH' construct

```python
with open('my_file.txt', 'w') as f:
    f.write("Hello")
```

# Seek and truncate

- Use seek(0) to place pointer at beginning of file
- Use truncate to remove all text after the location of the current pointer


```python
website_list = ["www.facebook.com", "facebook.com"]

with open(hosts_temp, 'r+') as file:
    content = file.readlines()
    file.seek(0)
    for line in content:
        if not any(website in line for website in website_list):
            file.write(line)
    file.truncate()
```