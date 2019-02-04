# Getting started

## Installation (using Docker)

#### using default ports

```bash
$ docker container run -idt --name jenkins -P jenkins:alpine
```

#### using specific ports and reboot behavior

```bash
 docker container run -idt --name jenkins -p 32769:8080 -p 32768:50000 --restart always jenkins:alpine
 ```

## Setup

### Retreive default password

#### On Docker host

```bash
$ docker exec -it jenkins sh
```
#### In Docker container

```bash
$ cat /var/jenkins_home/secrets/initialAdminPassword
```

#### Log in to Jenkins

- Copy password to clipboard
- Browse to http://localhost:32769 (run ```docker ps``` to verify port mapping - Jenkins port is 8080)
- Paste default password in browser window

### Initial setup wizard

- Install plugins (optional)
- Create 'First admin user'

### Initial configurations

- Manage Jenkins
  - Configure System
  - Configure Global Security
  - Manage Plugins


