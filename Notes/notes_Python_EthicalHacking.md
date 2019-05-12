# Kali in Docker

This is perhaps not a great way to go?

```bash
docker container run -idt --name kali -v ~/Git/Python_Study/Projects/EthicalHacking:/scripts kalilinux/kali-linux-docker sh

docker exec -it kali sh

$ apt update
$ apt install python3
$ apt install net-tools
```

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

# Change MAC address

```python
import subprocess

interface =  input("interface > ")
new_mac = input("new MAC > ")

print("[+] Changing MAC address for " + interface + " to " + new_mac)

subprocess.call(["ifconfig", interface, "down"])
subprocess.call(["ifconfig", interface, "hw", "ether", new_mac])
subprocess.call(["ifconfig", interface, "up"])
```

