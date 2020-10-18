
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
    apt-transport-https \
    ca-certificates \
    software-properties-common \
    ubuntu-restricted-extras \
    libavcodec-extra \
    libav-tools


echo "Adicionando repositórios usados"
sudo add-apt-repository ppa:webupd8team/terminix
curl -sS https://download.spotify.com/debian/pubkey.gpg | sudo apt-key add -
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list

echo "Update repositório"
sudo apt update

echo "Install apps"
sudo apt -y install \
  vscode \
  google-chrome-stable \
  ubuntu-tweak \
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
su - ${USER}
id -nG


echo "Install docker-compose 1.27.4"

sudo curl -L "https://github.com/docker/compose/releases/download/1.27.4/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
docker-compose --version

echo "Subindo container hello-world"
docker run hello-world

echo "Install Devilbox"
cd /home/$USER

git clone https://github.com/cytopia/devilbox.git

cd devilbox

wget -C https://raw.githubusercontent.com/jonatanaxe/DevEnvDevilbox/main/.env

echo "Agora você pode subir os container com 'docker-compose u'"