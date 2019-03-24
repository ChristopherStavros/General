# Linux install

```bash
$ sudo apt-get install python3-tk 
```

# Import tkinter

```python
from tkinter import *
```

# tkinter programs - 2 main parts

1. Window
1. Widgets

# Basic program 1

```python
from tkinter import *

window=Tk()

def km_to_miles():
    try:
        miles = float(e1_value.get()) * 1.6
        t1.insert(END, miles)
    except ValueError:
        print("You must enter a number")

b1=Button(window, text = "Execute", command=km_to_miles)
b1.grid(row=0,column=0)

e1_value = StringVar()
e1=Entry(window, textvariable= e1_value)
e1.grid(row=0, column=1)

t1=Text(window, height=1, width=20)
t1.grid(row=0, column=2)
window.mainloop()
```

# Basic program 2

```python
from tkinter import *

window=Tk()

def from_kg():
    try:
        grams = float(e1_value.get()) * 1000
        pounds = float(e1_value.get()) * 2.20462
        ounces = float(e1_value.get()) * 35.274
        t1.delete("1.0", END)
        t1.insert(END, grams)
        t2.delete("1.0", END)
        t2.insert(END, pounds)
        t3.delete("1.0", END)
        t3.insert(END, ounces)
    except ValueError:
        print("You must enter a number")

# Row 0
l1 = Label(window, text= "Kg")
l1.grid(row=0, column=1)

e1_value = StringVar()
e1=Entry(window, textvariable= e1_value)
e1.grid(row=0, column=2)

b1=Button(window, text = "Convert", command=from_kg)
b1.grid(row=0,column=3)

#Row 1
t1=Text(window, height=1, width=20)
t1.grid(row=1, column=1)

t2=Text(window, height=1, width=20)
t2.grid(row=1, column=2)

t3=Text(window, height=1, width=20)
t3.grid(row=1, column=3)

window.mainloop()
```