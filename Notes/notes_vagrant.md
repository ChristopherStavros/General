# Install

https://linuxize.com/post/how-to-install-vagrant-on-ubuntu-18-04/

```bash
sudo apt install vagrant

vagrant --version

mkdir ~/my-first-vagrant-project

cd ~/my-first-vagrant-project

vagrant init centos/7

vagrant up

vagrant ssh

vagrant halt

vagrant destroy
```

# download location

```bash
~/.vagrant.d/boxes
```


The VirtualBox VM was created with a user that doesn't match the
current user running Vagrant. VirtualBox requires that the same user
be used to manage the VM that was created. Please re-run Vagrant with
that user. This is not a Vagrant issue.

https://github.com/hashicorp/vagrant/issues/8630