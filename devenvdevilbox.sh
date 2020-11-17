
#!/bin/bash

echo "Install Pré-requisito"
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
    Qual app deseja instalar?
        (V)scode
        (C)hrome
        (T)ilix
        (S)potify
        (A)ll
        (E)xit/não quero instalar apps
"
read respostaapps
case "$respostaapps" in
    v|V)
        vscode
        clear
        echo "Instalado vscode"
        installapps
    ;;
    c|C)
        chrome
        clear
        echo "Instalado google chrome"
        installapps
    ;;
    t|T)
        tilix
        clear
        echo "Instalado tilix"
        installapps
    ;;
    s|S)
        spotify
        clear
        echo "Instalado spotify"
        installapps
    ;;
    a|A)
        vscode
        chrome
        tilix
        spotify
        clear
        echo "Instalado vscode, chrome, tilix e spotify"
    ;;
    e|E)
        clear
        echo "Xau..."
    ;;
    *|"")
        clear
        echo "Opção inválida"
        installapps
    ;;
esac

}


tilix(){
    clear
    echo "***Instalando tilix"
    sudo apt -y install tilix
}

vscode(){
    clear
    echo "Adicionar repositorio vscode? y/n"
    read repovscode
    if [ $repovscode = "y" ]
    then
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        echo "***Repositorio vscode adicionado"
    else
        echo "***Não Adicionado Repositorio"
    fi
    echo "***Instalando vscode"
    sudo apt -y install code
}

chrome(){
    clear
    echo "Adicionar repositorio chrome? y/n"
    read repochrome
    if [ $repochrome = "y" ]
    then
        wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
        sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'
        echo "***Repositorio chrome adicionado"
    else
        echo "***Não Adicionado Repositorio"
    fi
    echo "***Instalando google chrome"
    sudo apt -y install google-chrome-stable
}

spotify(){
    clear
    echo "Adicionar repositorio spotify? y/n"
    read repospotify
    if [ $repospotify = "y" ]
    then
        wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
        sudo add-apt-repository "deb http://repository.spotify.com stable non-free"
        echo "***Repositorio spotify adicionado"
    else
        echo "***Não Adicionado Repositorio"
    fi
    echo "***Instalando spotify"
    sudo apt -y install spotify-client
}



installenv(){
    echo "Install Docker"

    echo "Adicionar repositorio docker? y/n"
    read repodocker
    if [ $repodocker = "y" ]
    then
        curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
        sudo add-apt-repository \
        "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
        $(lsb_release -cs) \
        stable"
        echo "***Repositorio docker adicionado"  
    else
        echo "***Não Adicionado Repositorio"
    fi

    sudo apt update

    echo "Install Docker"
    apt-cache policy docker-ce
    sudo apt install docker-ce

    echo "Aplicando permissão user Docker"
    sudo usermod -aG docker ${USER}

    echo "Install docker-compose 1.27.4"

    sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
    sudo chmod +x /usr/local/bin/docker-compose

    echo "Install Devilbox"
    cd $HOME

    git clone https://github.com/cytopia/devilbox.git

    cd ~/devilbox/

    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/.env
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/docker-compose.override.yml
    cd ~/devilbox/bash/
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/bash/aliases.sh
    cd ~/devilbox/autostart/
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/autostart/update_composer.sh
    cd ~/devilbox/cfg/php-fpm-7.2/
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/cfg/php-fpm-x.x/www_server.conf
    cd ~/devilbox/cfg/php-ini-7.2/
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/memory_limit.ini
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/timeouts.ini
    wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/devilbox/cfg/php-ini-x.x/xdebug.ini
    
    cd ~/devilbox/
    
    clear
}

welcomeenv(){
    echo "
####################
Ambiente instalado :D
Caso tenha problema para iniciar o docker reinicie o sistema
Obs(guarde esses comandos e links abaixo)
Abraços
Jonatan Machado
####################
    "
    echo "
Ambiente Desenvolvimento DevilBox
Entre na pasta
    cd $HOME/devilbox
Comando para subir containers
    docker-compose up
Comando para derrubar os containers
    docker-compose down
    "
    echo "
Links uteis
Devilbox DOC -> https://devilbox.readthedocs.io/en/latest/
Gnome Docker -> https://extensions.gnome.org/extension/2224/easy-docker-containers/
VSCODE Docker -> https://marketplace.visualstudio.com/items?itemName=ms-azuretools.vscode-docker
    "
}

echo -n "
    O que deseja instalar?
        (A)pps
        (D)evilBox
        (T)udo
        (E)xit
"
read resposta
case "$resposta" in
    a|A)
        installapps
    ;;
    d|D)
        installenv
        welcomeenv
    ;;
    t|T)
        installapps
        installenv
        welcomeenv
    ;;
    e|E)
        clear
        echo "Xau..."
    ;;
    *|"")
        clear
        echo "Opção inválida"
    ;;
esac
