
#!/bin/bash
echo "Seu nome de usuário é:"
whoami
echo "Info de hora atual e tempo que o computador está ligado:"
uptime
echo "O script está executando do diretório:"
pwd

echo "Install Pré-requisito"
sudo apt install \
    curl \
    wget \
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    ubuntu-restricted-extras


echo "Adicionando repositórios usados"
wget -O- https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
sudo add-apt-repository "deb http://repository.spotify.com stable non-free"

wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -
sudo sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google-chrome.list'

wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add --
sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"

echo "Update repositório"
sudo apt update

echo "Install apps"
sudo apt -y install \
  code \
  google-chrome-stable \
  tilix \
  spotify-client

echo "Install Docker"

echo "Repositório fontes do APT"
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/ubuntu \
   $(lsb_release -cs) \
   stable"

echo "Update repositório"
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

cd devilbox

wget -c https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/.env

clear

echo "
    ####################
    Tudo foi instalado :D
    Caso tenha problema para iniciar o docker reinicie o sistema
    Obs(guarde esses comandos e links abaixo)
    Abraços
    Jonatan Machado
    ####################
"

echo "
Apps instalados Instalado
  code
  google-chrome-stable
  tilix
  spotify-client
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
