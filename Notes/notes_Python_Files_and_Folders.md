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

## os.rename(original, new)

### Example 1

```python
import os

for filename in os.listdir("."):
    if filename.startswith("cheese_"):
        os.rename(filename, filename[7:])
```

### Example 2

```python
for fileName in os.listdir("."):
    os.rename(fileName, fileName.replace("CHEESE_CHEESE_", "CHEESE_"))
```
### Example 3

Removes 'notes_'from all files in the folder where the script resides

```python
import os, sys

script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')

for f in os.listdir(script_path):
    if 'notes_' in f:
        os.rename('{}/{}'.format(script_path, f), '{}/{}'.format(script_path, f.replace('notes_', '')))
```

### Example 4

Add 'notes_' to the beginning of all '.md' files in the folder where the script resides

```python
import os, sys

script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')

for f in os.listdir(script_path):
    if '.md' in f:
        os.rename('{}/{}'.format(script_path, f), '{}/{}'.format(script_path, f.replace(f, 'notes_{}'.format(f))))
```

[More info](https://stackoverflow.com/questions/2759067/rename-multiple-files-in-a-directory-in-python)

# Copy files 

## shutil functions

Function | Copies metadata | Copies permissions | Can use buffer | Dest dir OK |
--- | --- | --- | --- | ---
shutil.copy | No | Yes | No | Yes 
shutil.copyfile | No | No | No | No     
shutil.copy2 | Yes | Yes | No | Yes    
shutil.copyfileobj | No | No | Yes | No

### Example
```python
shutil.copy2(src, dst)
```

### Example 2

```python
import os, sys, shutil

script_path = os.path.dirname(sys.argv[0])
if script_path[-1:]=='\\':
    script_path = script_path.strip('\\')

for f in os.listdir(script_path):
    if 'notes_' in f:
        shutil.copy2('{}/{}'.format(script_path, f), '{}/{}'.format(script_path, f.replace('notes_', '')))
```

[More info](https://stackoverflow.com/questions/123198/how-do-i-copy-a-file-in-python)