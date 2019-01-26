# Subprocess module

- [Python docs - subprocess](https://docs.python.org/3/library/subprocess.html)
- [Read the docs - subprocess](https://python.readthedocs.io/en/latest/library/subprocess.html)
- [Python for Beginners - subprocess](https://www.pythonforbeginners.com/os/subprocess-for-system-administrators)

```python
import subprocess
subprocess.call("powershell; get-childitem", shell=True)
```

```python
import subprocess
subprocess.call("ls -la", shell=True)
```

```python
from subprocess import *
p = Popen(["ping", "google.com"], stdout=PIPE)
print(p.communicate())
```