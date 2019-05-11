# Resources

https://pythex.org

# Getting started

```python
import re

ifconfig_result = subprocess.check_output(["ifconfig", options.interface])

mac_address_search_result = re.search(r'\w\w:\w\w:\w\w:\w\w:\w\w:\w\w', ifconfig_result)
if mac_address_search_result:
    print(mac_address_search_result.group(0))

```
# Syntax

### .

whole block of text

### \d

all digits

### <.*>

Anything betweet greater than and less than symbols

## Special characters
pattern | description
--- | ---
\ 	| escape special characters
. 	| matches any character
^ 	| matches beginning of string
$ 	| matches end of string
[5b-d] 	| matches any chars '5', 'b', 'c' or 'd'
[^a-c6] 	| matches any char except 'a', 'b', 'c' or '6'
R|S 	| matches either regex R or regex S
() 	| creates a capture group and indicates precedence

## Quantifiers

pattern | description
--- | ---
* 	|  0 or more (append ? for non-greedy)
+ 	|  1 or more (append ? for non-greedy)
? 	|  0 or 1 (append ? for non-greedy)
{m} 	|  exactly mm occurrences
{m, n} 	|  from m to n. m defaults to 0, n to infinity
{m, n}? 	|  from m to n, as few as possible

## Special sequences

pattern | description
--- | ---
\A 	| start of string
\b 	| matches empty string at word boundary (between \w and \W)
\B 	| matches empty string not at word boundary
\d 	| digit
\D 	| non-digit
\s 	| whitespace: [ \t\n\r\f\v]
\S 	| non-whitespace
\w 	| alphanumeric: [0-9a-zA-Z_]
\W 	| non-alphanumeric
\Z 	| end of string
\g<id> 	| matches a previously defined group

## Special sequences

pattern | description
--- | ---
(?iLmsux) 	| matches empty string, sets re.X flags
(?:...) 	| non-capturing version of regular parentheses
(?P...) 	| matches whatever matched previously named group
(?P=) 	| digit
(?#...) 	| a comment; ignored
(?=...) 	| lookahead assertion: matches without consuming
(?!...) 	| negative lookahead assertion
(?<=...) 	| lookbehind assertion: matches if preceded
(?<!...) 	| negative lookbehind assertion
(?(id)yes-no) | match 'yes' if group 'id' matched, else 'no'