# Setup

```bash
pip3 install requests
```

# Get

```python 
import requests

# GET HTTP /2 www.example.com
requests.get('http://www.example.com')
```

```bash
<Response [200]>
```

# Post

```python
requests.post('http://www.example.com/stuffstuffstuff')
```

# Save request in a variable
```python
#get file and save it in variable --> res
r = requests.get('https://automatetheboringstuff.com/files/rj.txt')
```

# Print status code

```python
print(r.status_code) #200 is GOOD
```
# Text

## Print text

```python
print(r.text)
```

## Lenth of text

```python
print(len(r.text))
```

## Print the first 500 characters --- using a slice

```python
print(r.text[:500])
```

# Content (same as .text?)

```python
print(r.content)
```

# Bad requests

## Raise exception if bad request occurs

```python
badRes = requests.get('https://automatetheboringstuff.com/files/rzzzzzz.txt')

badRes.raise_for_status()
```

# Download File

- Open file in wb --- write-binary mode
- Specify number of bytes per chunk

```python
playfile = open('rj.txt', 'wb') 
for chunk in res.iter_content(100000):  
    playfile.write(chunk)

playfile.close()
```

# EXTRA - Twitter

```python
r = requests.get('https://api.github.com/user', auth=('user', 'pass'))

print(r.json())
```

# Resources

[Twiiter API reference](https://developer.twitter.com/en/docs/api-reference-index.html)