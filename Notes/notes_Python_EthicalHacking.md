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

=======
# Network Scanning

## NetDiscover (other program NMap)

## Scapy !

https://scapy.readthedocs.io/en/latest/

### Send'n'receive

https://scapy.readthedocs.io/en/latest/usage.html

# ARP

## arp table
```bash
arp
# or add -a in Windows
```

**NOTE** This appears to reset after a reboot

[When are ARP tables updated?](https://networkengineering.stackexchange.com/questions/22980/when-will-an-arp-table-be-updated)

## ARP spoofing - Man in the middle

- Kali - arpspoof

```bash
arpspoof -i eth0 -t 10.0.2.7 10.0.2.1
```

```bash
arpspoof -i eth0 -t 10.0.2.1 10.0.2.7
```

### Enable port forwarding

THs allows packet to run through the "hacker" computer

```bash
echo 1 > /proc/sys/net/ipv4/ip_forward
```

# Routing table

```bash
route -n
```

# Windows VMs

https://developer.microsoft.com/en-us/microsoft-edge/tools/vms/
>>>>>>> 913321fa50374094131ba0987ed191e9849abbe3
