
#!/bin/bash

echo "Install Prerequisite"
sudo apt install \
    curl \
    wget \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    ubuntu-restricted-extras

clear

installapps(){

    echo -n "
    Which APP do you want to install?
        (V)scode
        (C)hrome
        (T)ilix
        (A)ll
        (E)xit/I don't want to install apps
"
read answerapps
case "$answerapps" in
    v|V)
        vscode
        clear
        echo "Installed vscode"
        installapps
    ;;
    c|C)
        chrome
        clear
        echo "Installed google chrome"
        installapps
    ;;
    t|T)
        tilix
        clear
        echo "Installed tilix"
        installapps
    ;;
    a|A)
        vscode
        chrome
        tilix
        clear
        echo "Installed vscode, chrome, tilix e spotify"
    ;;
    e|E)
        clear
        echo "Bye..."
    ;;
    *|"")
        clear
        echo "Invalid option"
        installapps
    ;;
esac

}


tilix(){
    clear
    echo "***Installed tilix"
    sudo apt -y install tilix
}

vscode(){
    clear
    echo "Add vscode repository? y/n"
    read repovscode
    if [ $repovscode = "y" ]
    then
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt update
        echo "***Vscode repository added"
    else
        echo "***Not Added Repository Vscode"
    fi
    echo "***Installing vscode"
    sudo apt -y install code
}

chrome(){
    clear
    echo "Add chrome repository? y/n"
    read repochrome
    if [ $repochrome = "y" ]
    then
        wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
        sudo apt update
        echo "***Chrome repository added"
    else
        echo "***Do not add repository Chrome"
    fi
    echo "***Installing google chrome"
    sudo apt -y install google-chrome-stable
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
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/.env
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/docker-compose.override.yml
    mkdir sh
    cd ~/devilbox/sh
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/sh/docker-entrypoint-es.sh
    cd ~/devilbox/bash/
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/bash/aliases.sh
    cd ~/devilbox/autostart/
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/autostart/autostart.sh
    cd ~/devilbox/cfg/php-fpm-7.3/
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/cfg/php-fpm-x.x/www_server.conf
    cd ~/devilbox/cfg/php-ini-7.3/
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/memory_limit.ini
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/timeouts.ini
    wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/xdebug.ini
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
        wget -c https://raw.githubusercontent.com/Discorgento/DevEnvDevilbox/main/devilbox/.aliases
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
        (S)oftware
        (D)evilBox
        (C)omplete
        (A)liases
        (E)xit
"
read answerini
case "$answerini" in
    s|S)
        installapps
    ;;
    d|D)
        installenv
        welcomeenv
    ;;
    c|C)
        installapps
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
