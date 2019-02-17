# Get current working directory

```python
import os
os.getcwd()
```
# Get path of current script

```python
import sys

script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')
```

# List files and folders

## One level down

```python
import os
os.listdir()
```

## Get-ChildItem -recurse equivalent

```python
import os

def dir(folder):
    lst = []
    for foldername, subfolder, filenames in os.walk(folder):
        for file in filenames:
            f = os.path.join(foldername, file)
            lst.append(f)
            print(f)
    return lst
```

# Rename files

## os.rename()

```python
import os

for filename in os.listdir("."):
    if filename.startswith("cheese_"):
        os.rename(filename, filename[7:])
```

```python
for fileName in os.listdir("."):
    os.rename(fileName, fileName.replace("CHEESE_CHEESE_", "CHEESE_"))
```

[More info](https://stackoverflow.com/questions/2759067/rename-multiple-files-in-a-directory-in-python)

# Copy files 

### shutil functions

Function | Copies metadata | Copies permissions | Can use buffer | Dest dir OK |
--- | --- | --- | --- | ---
shutil.copy | No | Yes | No | Yes 
shutil.copyfile | No | No | No | No     
shutil.copy2 | Yes | Yes | No | Yes    
shutil.copyfileobj | No | No | Yes | No

[More info](https://stackoverflow.com/questions/123198/how-do-i-copy-a-file-in-python)