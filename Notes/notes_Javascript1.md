# Basics

## Hello world

```html
<!DOCTYPE html>
<html lang="en">
    <head>
        <meta charset="UTF-8">
        <title>Hello</title>
    </head>

    <script>
        console.log('Hello world');
    </script> -->

    <body>
        <h1>Hello< world/h1>
    </body>
</html>
```

## Inline script

```html
<script>
    console.log('Hello world');
</script>
```

## Script files

```html
<script src ="script.js"></script>
```

## Console output

```javascript
console.log('Hello world');
```

## Comments

```javascript
// Single line comment

/*
multiline comment
*/
```

## Variables

**Note:** The commont convention in Javascript is to use camel casing for variable names

### Use the 'var' keyword

```javascript
var firstName = 'John';
var age = 30;
var fullAge = true;
var job = 'Teacher';
```
## Datatypes

Datatype | Description
--- | ---
Number | Floating point numbers, for decimals and integers     
String | Sequence of characters used for text
Boolean | Logical value that can only be true or false
Undefined | Data type of a variable that does not have a value yet
Null |  Non-existent

## Type coercion

```javascript
var name = 'John'
var age = 28
console.log(name + " " + age)
```

## Declare multiple variables on a single line

```javascript
var name, age
name = 'John'
age 28
```

## Variable mutation

```javascript
age = "Twentyeight"
```

## Alerts 

```javascript
alert("This is an alert");
```

## Prompt

```javascript
var = prompt("What are you doing?")
```
