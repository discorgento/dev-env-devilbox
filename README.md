# DevEnvDevilbox Ubuntu 20.04

Caso tenha os repositorios abaixo remova para nao ser duplicados
![repo](https://i.imgur.com/Jk4Uy6S.png)
Docker
```
https://download.docker.com/linux/ubuntu
```
Apps
```
http://repository.spotify.com
```
```
http://dl.google.com/linux/chrome/deb/
```
```
https://packages.microsoft.com/repos/vscode
```


```
sudo apt update
```
```
sudo apt upgrade
```
```
sudo apt install git && cd /home/$USER && git clone https://github.com/jonatanaxe/DevEnvDevilbox.git && cd DevEnvDevilbox && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```

Possível erro de apt-key rode esse comando abixo altere no final por sua key
```
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4773BD5E130D1D45
```
