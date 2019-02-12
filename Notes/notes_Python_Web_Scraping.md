# Basics

```python
from bs4 import BeautifulSoup
import requests

r = requests.get("https://en.wikipedia.org/wiki/Eagle")
print(r.content)

soup = BeautifulSoup(r.content)
print(soup.prettify)
```