# Install VM on Virtual Box

```bash
vagrant init https://vagrant-osx.nyc3.digitaloceanspaces.com/osx-sierra-0.3.1.box
vagrant up
```

# List VMs

```bash
vboxmanage list vms
```

# Set screen resolution

```bash
vboxmanage setextradata "Mac-01" "VBoxInternal2/EfiGraphicsResolution" "1920x1080"
```


# Resources

https://app.vagrantup.com/AndrewDryga/boxes/vagrant-box-osx