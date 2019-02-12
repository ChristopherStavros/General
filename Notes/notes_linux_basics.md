# Resources

[Integraton tools and screen resolution](https://www.ceos3c.com/hacking/changing-screen-resolution-kali-linux-hyper-v/)

# Basic Linux Commands - Debian based distros (tested on Kali and Ubuntu)

### Shutdown and restart

```bash
#Restart
restart
shutdown -r now

#Shutdown
shutdown -P now
```

### Get current user

```bash
whoami
```

### Switch user

```bash
su other_user
```

### Clear screen

```bash
clear
```

### Get info for a command

```bash
man <command>
```

### Help

```bash
ls --help
```

### List files and folders

```bash
ls
ls -la
```

### Change directory

```bash
cd
cd /root
```

### Get current directory

```bash
pwd
```

### Make directory

```bash
mkdir
```

### Remove empty directory

```bash
rmdir /My_Directory
```

### Remove non-empty directory

```bash
rm -rf /My_Directory
```

### Create text file

```bash
touch my_file.txt
> my_file.txt
```

### Remove file

```bash
rm my_file
```

### Copy file

```bash
cp file SomeFolder
```

### Monitor a program process

```bash
watch git status
```

### Retrieve content from web server - [wget](https://en.wikipedia.org/wiki/Wget)

```bash
wget https://dl.pstmn.io/download/latest/linux64
```

### Curl

```bash
curl http://127.0.0.1:5000/ 
```

# Time

### View time settings

```bash
$ timedatectl
 ```

### Use local time (unsupported) to resolve Windows dual boot time issues 

```bash
$ timedatectl set-local-rtc 1 --adjust-system-clock
```

### Use UTC time (Linux default)

```bash
$ timedatectl set-local-rtc 0 --adjust-system-clock
```

# Installing programs

### apt or apt-get

```bash
# Get list of programs available for install
apt update

# Install a program
apt install python3-pip
```

### Some essential items to install

#### tree - for files system tree view

```bash
apt install tree
```

#### emacs - text editor

```bash
apt install emacs
```

### [Kali - resolve unable to locate packages error](https://iamjagjeetubhi.wordpress.com/2017/04/10/fix-unable-to-locate-package-error-in-kali-linux/)

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

# Network

### Install network tools

```bash
apt-get install net-tools
apt-get install iputils-ping
```

### Get network information

```bash
ifconfig
```

### Disable/Enable network interface

```bash
# For the first parameter, specify the netwrok interface you want to change
ifconfig eth0 down
ifconfig eth0 up
```

### Change MAC address

```bash
ifconfig eth0 down
ifconfig eth0 hw ether 00:11:22:33:44:55
ifconfig eth0 up
```

# Keyboard Shortcuts

### Copy from terminal

        Highlight text and CTRL + ALT + C

### Paste in terminal

        CTRL + ALT + V