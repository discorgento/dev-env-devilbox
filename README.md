# 🏴‍☠️DevEnvDevilbox Ubuntu 22.04

- aliases
- global mage2tv/magento-cache-clean [latest version] aliase: ccw
- global n98-magerun2 [latest version] aliase: n98
- xdebug [3]
- composer [1]
- composer [2]
- devilbox [latest version]

# About Devilbox

A modern Docker LAMP stack and MEAN stack for local development

http://devilbox.org/

https://github.com/cytopia/devilbox

## Installation 🔧

### Update the system

```
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
```

### Now run this command to start the installation

```
cd ~ && curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devenvdevilbox.sh && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```
You can select what you want to install, type the letter to select and press enter

![what do you want to install](https://i.imgur.com/tdlXnrF.png)

If you select the apps or everything will have another menu like this

![install apps](https://i.imgur.com/Dlo55J9.png)

### Update Devilbox
```
cd ~/devilbox && git pull && docker-compose pull
```

### Optional Alias

https://github.com/Discorgento/dev-env-devilbox/blob/main/devilbox/.aliases

## Usage ⚙️
If you want to use the alias you can run the command "xd" to start the containers without xdebug if you want with xdebug you can run the alias "xe"

Command description alias
```
dr='cd ~/devilbox && docker-compose stop && docker-compose rm -f && docker-compose up -d httpd php mysql bind redis elastic && ./shell.sh'
```

Start without xdebug
```
xd='cd ~/devilbox && sed -i '\''/PHP_MODULES_DISABLE/s/xdxe/xdebug/g'\'' .env && dr'
```

Start with xdebug
```
xe='cd ~/devilbox && sed -i '\''/PHP_MODULES_DISABLE/s/xdebug/xdxe/g'\'' .env && dr'
```

Drop all containers
```
ddown='cd ~/devilbox && docker-compose stop && docker-compose rm -f && docker-compose down'
```

### Install magento 2

```
composer create-project --repository-url=https://repo.magento.com/ magento/project-community-edition ./

bin/magento setup:install \
--base-url=http://magento.local \
--db-host=127.0.0.1 \
--db-name=mage_magento \
--db-user=root \
--db-password= \
--admin-firstname=Jonatan \
--admin-lastname=Machado \
--admin-email=jonatanaxe@pm.me \
--admin-user=admin \
--admin-password=admin123 \
--language=en_US \
--currency=BRL \
--timezone=America/Sao_Paulo \
--use-rewrites=1 \
--elasticsearch-host=elasticsearch
```


Xdebug 3 VSCODE json

```
{
  "version": "0.2.0",
  "configurations": [
    {
      "name": "Listen for XDebug",
      "type": "php",
      "request": "launch",
      "port": 9000,
      "pathMappings": {
        "/shared/httpd/project": "${workspaceFolder}"
      },
      "log": true,
      "xdebugSettings": {
        "max_children": 128,
        "max_data": 512,
        "max_depth": 3
      }
    },
    {
      "name": "Launch currently open script",
      "type": "php",
      "request": "launch",
      "program": "${file}",
      "cwd": "${fileDirname}",
      "port": 9000
    }
  ]
}
```

🐓

## Footer notes 🗒
 - issues and PRs are welcome in this repo;
 - We want **YOU** for [our community](https://discord.io/Discorgento);

