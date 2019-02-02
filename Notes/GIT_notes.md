# Basics

### Usage

```bash
git
```

### Help

```bash
git <command> --help
git <command> -h
```

### git version

```bash
git --version
```

# Configurations

- [Customizing Git - Git Configuration](https://git-scm.com/book/en/v2/Customizing-Git-Git-Configuration)
- [git-config docs](https://git-scm.com/docs/git-config)
### Config levels

- ```---project``` = project specific
- ```---global``` = user specific (git.config file in home directory)
- ```---system``` = system wide

### Global configs

```bash
git config --global user.name "name"
git config --global user.email "a@a.com"
git config --global color.ui auto
git config --global core.editor vim
```

# Working with Repositories

## Create bare repository - not a 'working copy'

### Notice that the files structure contains file normally found in the .git folder of a working repository

```bash
git init --bare myapp.git
```

### Clone bare respository to create a working copy

```bash
git clone --local myapp,git myapp
```

## Tracking files

### Add file to repository

```bash
touch README.md
```

### Stage changes - Add file to staging area

```bash
# Add single file
git add README.md

# Add all files
git add -A
```

### Unstage changes

```bash
git reset
```

### View status message

```bash
git status
```

### Commit changes

```bash
# commit single file fromt he staging area
git commit README.md -m "Added README.md" 

# commit (and stage) all changes
git commit -a --message "Added stuff" # or -m to add commit message
```

### View Git logs

```bash
git log
```

### View unstaged edits

```bash
git diff
```


