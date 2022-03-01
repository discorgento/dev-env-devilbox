# 🏴‍☠️DevEnvDevilbox Ubuntu 19|20|21

- aliases
- global mage2tv/magento-cache-clean
- global n98-magerun2
- xdebug3
- composer 1
- composer 2
- devilbox v1.9.2

# About Devilbox

A modern Docker LAMP stack and MEAN stack for local development

http://devilbox.org/

https://github.com/cytopia/devilbox

## Installation 

### Update the system

```
sudo apt update && sudo apt upgrade && sudo apt autoremove && sudo apt autoclean
```

### Now run this command to start the installation

```
cd ~ && curl -O https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devenvdevilbox.sh && chmod +x devenvdevilbox.sh && ./devenvdevilbox.sh
```
You can select what you want to install, type the letter to select and press enter

![what do you want to install](https://i.imgur.com/tdlXnrF.png)

If you select the apps or everything will have another menu like this

![install apps](https://i.imgur.com/Dlo55J9.png)


### Optional Alias

https://github.com/Discorgento/DevEnvDevilbox/blob/main/devilbox/.aliases


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
--elasticsearch-host=172.16.238.240 
```

🐓

