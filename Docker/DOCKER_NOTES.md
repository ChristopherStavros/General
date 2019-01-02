
# DOCS

- https://docs.docker.com/get-started/

# BASE VM

```POWERSHELL
C:\Users\Public\Documents\Hyper-V\Virtual Hard Disks\MobyLinuxVM.vhdx
```

# Commands

```CMD
docker help
docker info
docker container ls
docker images
```
```CMD
PS C:\WINDOWS\system32> docker images
REPOSITORY          TAG                 IMAGE ID            CREATED             SIZE
<none>              <none>              b6ffd31fa5d8        4 minutes ago       119MB
python              3.7-alpine          1a8edcb29ce4        7 days ago          78.5MB
```

# Help

```CMD
PS C:\_Repositories> docker help

Usage:  docker [OPTIONS] COMMAND

A self-sufficient runtime for containers

Options:
      --config string      Location of client config files (default
                           "C:\\Users\\chris\\.docker")
  -D, --debug              Enable debug mode
  -H, --host list          Daemon socket(s) to connect to
  -l, --log-level string   Set the logging level
                           ("debug"|"info"|"warn"|"error"|"fatal")
                           (default "info")
      --tls                Use TLS; implied by --tlsverify
      --tlscacert string   Trust certs signed only by this CA (default
                           "C:\\Users\\chris\\.docker\\ca.pem")
      --tlscert string     Path to TLS certificate file (default
                           "C:\\Users\\chris\\.docker\\cert.pem")
      --tlskey string      Path to TLS key file (default
                           "C:\\Users\\chris\\.docker\\key.pem")
      --tlsverify          Use TLS and verify the remote
  -v, --version            Print version information and quit

Management Commands:
  builder     Manage builds
  config      Manage Docker configs
  container   Manage containers
  image       Manage images
  network     Manage networks
  node        Manage Swarm nodes
  plugin      Manage plugins
  secret      Manage Docker secrets
  service     Manage services
  stack       Manage Docker stacks
  swarm       Manage Swarm
  system      Manage Docker
  trust       Manage trust on Docker images
  volume      Manage volumes

Commands:
  attach      Attach local standard input, output, and error streams to a running container
  build       Build an image from a Dockerfile
  commit      Create a new image from a container's changes
  cp          Copy files/folders between a container and the local filesystem
  create      Create a new container
  diff        Inspect changes to files or directories on a container's filesystem
  events      Get real time events from the server
  exec        Run a command in a running container
  export      Export a container's filesystem as a tar archive
  history     Show the history of an image
  images      List images
  import      Import the contents from a tarball to create a filesystem image
  info        Display system-wide information
  inspect     Return low-level information on Docker objects
  kill        Kill one or more running containers
  load        Load an image from a tar archive or STDIN
  login       Log in to a Docker registry
  logout      Log out from a Docker registry
  logs        Fetch the logs of a container
  pause       Pause all processes within one or more containers
  port        List port mappings or a specific mapping for the container
  ps          List containers
  pull        Pull an image or a repository from a registry
  push        Push an image or a repository to a registry
  rename      Rename a container
  restart     Restart one or more containers
  rm          Remove one or more containers
  rmi         Remove one or more images
  run         Run a command in a new container
  save        Save one or more images to a tar archive (streamed to STDOUT by default)
  search      Search the Docker Hub for images
  start       Start one or more stopped containers
  stats       Display a live stream of container(s) resource usage statistics
  stop        Stop one or more running containers
  tag         Create a tag TARGET_IMAGE that refers to SOURCE_IMAGE
  top         Display the running processes of a container
  unpause     Unpause all processes within one or more containers
  update      Update configuration of one or more containers
  version     Show the Docker version information
  wait        Block until one or more containers stop, then print their exit codes

Run 'docker COMMAND --help' for more information on a command.
```

# Image build

#### Build docker image based on Dockerfile in same directory

- Add a name before the . to gve the image a name
docker build .

```CMD
PS C:\_Repositories\recipe-app-api> docker build .

Sending build context to Docker daemon  66.05kBStep 1/12 : FROM python:3.7-alpine
3.7-alpine: Pulling from library/python
cd784148e348: Pull complete
a5ca736b15eb: Pull complete
f320f547ff02: Pull complete
2edd8ff8cb8f: Pull complete
9381128744b2: Pull complete
Digest: sha256:f708ad35a86f079e860ecdd05e1da7844fd877b58238e7a9a588b2ca3b1534d8
Status: Downloaded newer image for python:3.7-alpine
 ---> 1a8edcb29ce4
Step 2/12 : LABEL filename="Dockerfile"
 ---> Running in 3c37c3c193dd
Removing intermediate container 3c37c3c193dd
 ---> 5011608cc895
Step 3/12 : LABEL baseImage="python:3.7-alpine"
 ---> Running in 0d1ca6385115
Removing intermediate container 0d1ca6385115
 ---> 9db8908b569a
Step 4/12 : LABEL author="ChristopherStavros"
 ---> Running in 2b9443dd16f3
Removing intermediate container 2b9443dd16f3
 ---> ca6a582d7d32
Step 5/12 : ENV PYTHONUNBUFFERED 1
 ---> Running in 8e4797316ed3
Removing intermediate container 8e4797316ed3
 ---> c522a0ddbad0
Step 6/12 : COPY ./requirements.txt /requirements.txt
 ---> 81cfdd851e70
Step 7/12 : RUN pip install -r /requirements.txt
 ---> Running in ebedf5b453b7
Collecting Django<2.2.0,>=2.1.4 (from -r /requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/fd/9a/0c028ea0fe4f5803dda1a7afabeed958d0c8b79b0fe762ffbf728db3b90d/Django-2.1.4-py3-none-any.whl (7.3MB)Collecting djangorestframework<3.10.0,>=3.9.0 (from -r /requirements.txt (line 2))
  Downloading https://files.pythonhosted.org/packages/99/0b/d37a5a96c5d301e23adcabcc2f3fa659fb34e6308590f95ebb50cdbe98a1/djangorestframework-3.9.0-py2.py3-none-any.whl (924kB)
Collecting pytz (from Django<2.2.0,>=2.1.4->-r /requirements.txt (line 1))
  Downloading https://files.pythonhosted.org/packages/f8/0e/2365ddc010afb3d79147f1dd544e5ee24bf4ece58ab99b16fbb465ce6dc0/pytz-2018.7-py2.py3-none-any.whl (506kB)
Installing collected packages: pytz, Django, djangorestframework
Successfully installed Django-2.1.4 djangorestframework-3.9.0 pytz-2018.7
Removing intermediate container ebedf5b453b7
 ---> a0a9ef7ead0a
Step 8/12 : RUN mkdir /app
 ---> Running in 53f47136b302
Removing intermediate container 53f47136b302
 ---> 1c673e08108d
Step 9/12 : WORKDIR /app
 ---> Running in d649487d2822
Removing intermediate container d649487d2822
 ---> f34006210311
Step 10/12 : COPY ./app /app
 ---> ac5826fb748f
Step 11/12 : RUN adduser -D user
 ---> Running in a829c83251d8
Removing intermediate container a829c83251d8
 ---> e1107001da02
Step 12/12 : USER user
 ---> Running in 06c1528e3346
Removing intermediate container 06c1528e3346
 ---> b6ffd31fa5d8
Successfully built b6ffd31fa5d8
SECURITY WARNING: You are building a Docker image from Windows against a non-Windows Docker host. All files and directories added to build context will have '-rwxr-xr-x' permissions. It is recommended to double check and reset permissions for sensitive files and directories.
```

# Requirements.txt example

```txt
Django>=2.1.4,<2.2.0
djangorestframework>=3.9.0,<3.10.0
```

# Docker file example

```DOCKER
#IMAGE NAME - Add a base image and then just add the customize bits for you particular project
FROM python:3.7-alpine

#OPTIONAL LABELS
LABEL filename="Dockerfile"
LABEL baseImage="python:3.7-alpine"
LABEL author="ChristopherStavros"

#Tell Python to run in unbuffered mode -- recommended when runnning Python in Docker images
ENV PYTHONUNBUFFERED 1 

#Copy ./requirements.txt (adjecent to Docker file) and copy it to /requirements.txt on the Docker image
COPY ./requirements.txt /requirements.txt

#Install requirements on the Docker image
RUN pip install -r /requirements.txt

#create /app on DOcker image, set it as working directory, and copy ./app (adjecent to Docker file) to /app on Docker image
RUN mkdir /app
WORKDIR /app
COPY ./app /app

#Create user and swtich to user (-D means that it can it only be used to run an application processes - security best practice)
RUN adduser -D user
USER user
```