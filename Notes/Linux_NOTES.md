# Notes

[Integraton tools and screen resolution](https://www.ceos3c.com/hacking/changing-screen-resolution-kali-linux-hyper-v/)

## Basic Linux Commands

Shutdown and restart

```bash
#Restart

restart
shutdown -r now

#Shutdown

shutdown -P now
```

Clear screen

```bash
clear
```

Get info for a command

```bash
man ls
man pwd
```

Help

```bash
ls --help
```

List files and folders

```bash
ls
ls -la
```

Change directory

```bash
cd
cd /root
```

Get current directory

```bash
pwd
```

Make directory

```bash
mkdir
```

Remove empty directory

```bash
rmdir /My_Directory
```

Remove non-empty directory

```bash
rm -rf /My_Directory
```

Create text file

```bash
touch my_file.txt
> my_file.txt
```

Remove file

```bash
rm my_file
```

Copy file

```bash
cp folders.sh Repostories/general/
```

## Installing programs

```bash
# Get list of programs available for install

apt-get update

# Install a program

apt-get install terminator
```

[Resolve unable to locate packages error](https://iamjagjeetubhi.wordpress.com/2017/04/10/fix-unable-to-locate-package-error-in-kali-linux/)

- Open /etc/apt/sources.list in a text editor
- Copy in the following text

        deb http://http.kali.org/kali kali-rolling main contrib non-free
        # For source package access, uncomment the following line
        # deb-src http://http.kali.org/kali kali-rolling main contrib non-free
        deb http://http.kali.org/kali sana main non-free contrib
        deb http://security.kali.org/kali-security sana/updates main contrib non-free
        # For source package access, uncomment the following line
        # deb-src http://http.kali.org/kali sana main non-free contrib
        # deb-src http://security.kali.org/kali-security sana/updates main contrib non-free
        deb http://old.kali.org/kali moto main non-free contrib
        # For source package access, uncomment the following line
        # deb-src http://old.kali.org/kali moto main non-free contrib

## Network

Get network information

```bash
ifconfig
```

Disable/Enable network interface

```bash
# For the first parameter, specify the netwrok interface you want to change

ifconfig eth0 down

ifconfig eth0 up
```

Change MAC address

```bash
ifconfig eth0 down
ifconfig eth0 hw ether 00:11:22:33:44:55
ifconfig eth0 up
```

