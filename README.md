# DevEnvDevilbox Ubuntu 20.04

**[important]
Caso não for uma instalação limpa do ubuntu, verifique os repositorios abaixo se for instalar os apps ja estao no seu sistema e remova para nao ser duplicados**
```
http://repository.spotify.com
https://packages.microsoft.com/repos/vscode
https://download.docker.com/linux/ubuntu
http://dl.google.com/linux/chrome/deb/
```
![repo](https://i.imgur.com/Jk4Uy6S.png)

## Instalação 

### Faça o update do sistema

```
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
```

### Agora rode esse comando para começar a instalação

```
sudo apt install git && cd $HOME && git clone https://github.com/jonatanaxe/DevEnvDevilbox.git && cd DevEnvDevilbox && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```
Você pode selecionar o que deseja instalar, digite a letra pra selecionar e aperte entrer

![o que deseja instalar](https://i.imgur.com/JqD1Toi.png)

Caso selecione os apps ou tudo vai ter um outro menu assim 

![install apps](https://i.imgur.com/gOMsclV.png)


### Erros possiveis

Possível erro de apt-key rode esse comando abaixo altere no final por sua key
```
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4773BD5E130D1D45
```

### Alias Opcional nano ~/.zshrc

```
alias zshconf="nano ~/.zshrc"
alias ohmyzsh="nano ~/.oh-my-zsh"
alias dup="cd ~/devilbox && docker-compose up -d && ./shell.sh"
alias ddown="cd ~/devilbox && docker-compose down && docker-compose stop"
alias dr="cd ~/devilbox && docker-compose stop && docker-compose rm -f && docker-compose up -d && ./shell.sh"
alias denv="cd ~/devilbox && ./shell.sh"
alias upgrade="sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean"
alias grun="grunt clean && grunt exec && grunt less && grunt watch"
alias mgcmd='magento-cloud mount:download'
alias mgdd='magento-cloud db:dump'
# habilita o xdebug
alias xh="cd ~/devilbox && sed -i '/PHP_MODULES_DISABLE/s/xdebug/ /g' .env && dr"
# desabilita o xdebug
alias xd="cd ~/devilbox && sed -i '/PHP_MODULES_DISABLE/s/ /xdebug/g' .env && dr"
```
