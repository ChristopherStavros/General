#Preparation

#Add Docker pgp key:

curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -

#Configure Docker apt repository:

echo 'deb https://download.docker.com/linux/debian stretch stable' > /etc/apt/sources.list.d/docker.list

#Update :

apt-get update

#Install Docker

#As we want a clean installation, what we do is verify that there are no obseleta versions and we give it:

apt-get remove docker docker-engine docker.io

#Install Docker:

apt-get install docker-ce

#Verify if it was installed correctly

docker run hello-world