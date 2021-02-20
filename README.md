# DevEnvDevilbox Ubuntu 20.10

**[important]
If it is not a clean install of ubuntu, check the repositories below if you are going to install the apps already on your system and remove them not to be duplicated**
```
http://repository.spotify.com
https://packages.microsoft.com/repos/vscode
https://download.docker.com/linux/ubuntu
http://dl.google.com/linux/chrome/deb/
```
![repo](https://i.imgur.com/Jk4Uy6S.png)

## Installation 

### Update the system

```
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
```

### Now run this command to start the installation

```
sudo apt install git && cd ~ && git clone https://github.com/jonatanaxe/DevEnvDevilbox.git && cd DevEnvDevilbox && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```
You can select what you want to install, type the letter to select and press enter

![what do you want to install](https://i.imgur.com/mUXblDd.png)

If you select the apps or everything will have another menu like this

![install apps](https://i.imgur.com/Dlo55J9.png)


### Possible errors

Possible apt-key error run the command below change at the end by your key
```
sudo apt-key adv --recv-keys --keyserver keyserver.ubuntu.com 4773BD5E130D1D45
```

### Optional Alias nano ~/.zshrc

```
# zsh configs
alias zshconf='nano ~/.zshrc'
alias ohmyzsh='nano ~/.oh-my-zsh'
# devilbox
alias dup='cd ~/devilbox && docker-compose up -d httpd php mysql bind redis elastic && ./shell.sh'
alias ddown='cd ~/devilbox && docker-compose stop && docker-compose rm -f && docker-compose down'
alias dr='cd ~/devilbox && docker-compose stop && docker-compose rm -f && docker-compose up -d httpd php mysql bind redis elastic && ./shell.sh'
alias denv='cd ~/devilbox && ./shell.sh'
alias xe="cd ~/devilbox && sed -i '/PHP_MODULES_DISABLE/s/xdebug/xdxe/g' .env && dr"
alias xd="cd ~/devilbox && sed -i '/PHP_MODULES_DISABLE/s/xdxe/xdebug/g' .env && dr"
alias grun='grunt clean && grunt exec && grunt less && grunt watch'
# magento cloud 
alias mgcmd='magento-cloud mount:download'
alias mgcdd='magento-cloud db:dump'
alias mgclog='magento-cloud log'
alias mgcssh='magento-cloud ssh'
# system update and cleaning
alias upgrade='sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean'
alias cl='clear'
alias q='exit'
```
