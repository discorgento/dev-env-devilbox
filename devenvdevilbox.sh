
#!/bin/bash

echo "Install Prerequisite"
sudo apt install \
    curl \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    ubuntu-restricted-extras

clear

installenv(){
    echo "Install Docker"
    
    sudo apt update
    sudo apt install -y docker{,-compose}

    echo "Applying user Docker permission"
    sudo usermod -aG docker ${USER}

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

zshsetup(){
    echo "Add zsh? y/n"
    read zshsetup
    if [ $zshsetup = "y" ]
    then
        sudo apt install zsh
        curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh | sh;
        zsh
        sudo usermod --shell $(which zsh) $USER
        echo "***Which zsh done!"
    else
        echo "***Do not add zsh"
    fi
}

pluginzsh(){
    echo "Add plugin zsh? y/n"
    read pluginzsh
    if [ $pluginzsh = "y" ]
    then
        sudo usermod --shell $(which zsh) $USER
        git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
        git clone https://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
        git clone --depth 1 https://github.com/junegunn/fzf.git ~/.fzf && ~/.fzf/install
        
        echo "***Plugin zsh done!"
    else
        echo "***Do not add plugin zsh"
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
    
    echo "
Enable zsh plugins in file ~/.zshrc
    
dnf
zsh-syntax-highlighting
zsh-autosuggestions
    "
}

echo -n "
    What you want to install?
        (D)evilBox
        (Z)sh
        (P)luginZsh
        (A)liases(*need zsh)
        (E)xit
"
read answerini
case "$answerini" in
    d|D)
        installenv
        welcomeenv
    ;;
    z|Z)
        zshsetup
        welcomeenv
    ;;
    p|P)
        pluginzsh
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
