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

![what do you want to install](https://i.imgur.com/tdlXnrF.png)

If you select the apps or everything will have another menu like this

![install apps](https://i.imgur.com/Dlo55J9.png)


### Optional Alias

https://github.com/jonatanaxe/DevEnvDevilbox/blob/main/devilbox/.aliases

