# DevEnvDevilbox Ubuntu 20.04

**[important]Caso nao for uma instalação limpa do ubuntu, verifique os repositorios abaixo e remova para nao ser duplicados**
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

## Instalação 

### Faça o upgrade do sistema

```
sudo apt update
```
```
sudo apt upgrade
```

### Agora rode esse comando para começar a instalação

```
sudo apt install git && cd /home/$USER && git clone https://github.com/jonatanaxe/DevEnvDevilbox.git && cd DevEnvDevilbox && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```

### Erros possiveis

Possível erro de apt-key rode esse comando abixo altere no final por sua key
```
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4773BD5E130D1D45
```
