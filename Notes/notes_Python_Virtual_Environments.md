## Virtual Environments

- [Python Docs - venv](https://docs.python.org/3/tutorial/venv.html)
- [virtualenv - Older than 3.3](https://packaging.python.org/guides/installing-using-pip-and-virtualenv/)
- [venv  -3.6 and newer](https://docs.python.org/3/library/venv.html)
- [Selecting Virtual Environemnts in VS Code](https://code.visualstudio.com/docs/python/environments)
- [Specify venv path in vsode](https://www.reddit.com/r/vscode/comments/9nku97/using_a_virtualenv/)

It is a best practive to create a virtual environment for each project.  Create the venv if a **separate folder** within your project root.

### virtualenv
```bash
pip3 install virtualenv
```
### venv

```bash
sudo apt install python3-venv
```

### Windows Example using venv

```powershell
python -m venv .\venvTest1

.\venvTest1\Scripts\Activate.ps1

decativate
```

### Linux Example using venv

```bash
$ python -m venv venv

$ source venv/bin/activate

$ devactivate
```

### Linux example using virtualenv

```bash
$ virtualenv venv --python=python3.6

$ source venv/bin/activate

$ pip install Flask-RESTful

$ deactivate
```
Activate/deactivate venv

**NOTE:** You don’t specifically need to activate an environment; activation just prepends the virtual environment’s binary directory to your path, so that “python” invokes the virtual environment’s Python interpreter and you can run installed scripts without having to use their full path.

### pip show installed items - in requirements format

```bash
$ pip3 freeze
```
