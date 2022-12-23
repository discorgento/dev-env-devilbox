
#!/bin/bash

echo "Install Prerequisite"
sudo apt install \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    ubuntu-restricted-extras

clear

}

installenv(){
    echo "Install Docker"

    echo "Add docker repository? y/n"
    read repodocker
    if [ $repodocker = "y" ]
    then
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
        echo "***Docker repository added"  
    else
        echo "***Do not add repository Docker"
    fi

    sudo apt update

    echo "Install Docker"
    apt-cache policy docker-ce
    sudo apt install docker-ce

    echo "Applying user Docker permission"
    sudo usermod -aG docker ${USER}

    echo "Install docker-compose 1.27.4"

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Install Devilbox"
    cd ~

    git clone https://github.com/cytopia/devilbox.git

    cd ~/devilbox/
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/.env
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/docker-compose.override.yml
    mkdir sh
    cd ~/devilbox/sh
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/sh/docker-entrypoint-es.sh
    cd ~/devilbox/bash/
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/bash/aliases.sh
    cd ~/devilbox/autostart/
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/autostart/autostart.sh
    cd ~/devilbox/cfg/php-fpm-8.1/
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/cfg/php-fpm-x.x/www_server.conf
    cd ~/devilbox/cfg/php-ini-8.1/
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/cfg/php-ini-x.x/memory_limit.ini
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/cfg/php-ini-x.x/timeouts.ini
    curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/cfg/php-ini-x.x/xdebug.ini
    cd ~/devilbox/
    
    clear
}

aliases(){
    clear
    echo "Add Aliases? y/n"
    read aliases
    if [ $aliases = "y" ]
    then
        echo "if [ -f ~/.aliases ]; then
        source ~/.aliases
        fi" >> ~/.zshrc
        cd ~
        curl -O https://raw.githubusercontent.com/Discorgento/dev-env-devilbox/main/devilbox/.aliases
        echo "***Aliases added"
    else
        echo "***Do not add Aliases"
    fi
}

welcomeenv(){
    echo "
####################
Installed environment :D
If you have trouble starting the docker, restart the system
Obs (save these commands and links below)
Abraços
Jonatan Machado
Read the readme.md
####################
    "
    echo "
Environment Development DevilBox

Enter the folder
    cd ~/devilbox
    
Command to lift containers
    docker-compose up
    
Command to drop the containers
    docker-compose down
    "
    echo "
Useful links
Devilbox DOC -> https://devilbox.readthedocs.io/en/latest/
Gnome Docker -> https://extensions.gnome.org/extension/2224/easy-docker-containers/
VSCODE Docker -> https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
    "
}

echo -n "
    What you want to install?
        (D)evilBox
        (C)omplete
        (A)liases
        (E)xit
"
read answerini
case "$answerini" in
    d|D)
        installenv
        welcomeenv
    ;;
    c|C)
        installenv
        aliases
        welcomeenv
    ;;
    a|A)
        aliases
        welcomeenv
    ;;
    e|E)
        clear
        echo "Bye..."
    ;;
    *|"")
        clear
        echo "Invalid option"
    ;;
esac
