
sudo apt-get -y update

# INSTALANDO DOCKER
sudo apt-get install -y ca-certificates curl gnupg lsb-release
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --batch --yes --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
sudo apt-get -y update
sudo apt-get install -y docker-ce docker-ce-cli containerd.io

# Startando e habilitando docker para já iniciar ativo
sudo systemctl enable docker.service
sudo systemctl enable containerd.service

# Instalando docker-compose
sudo curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

# Configurando permissão no docker para não ter que ficar usando root
sudo usermod -aG docker ubuntu
newgrp docker

# INSTALANDO UI
sudo apt update -y && \
sudo apt upgrade -y && \
sudo apt install xfce4 xfce4-goodies -y 

# Instalando Net 6.0
wget https://packages.microsoft.com/config/ubuntu/18.04/packages-microsoft-prod.deb -O packages-microsoft-prod.deb
sudo dpkg -i packages-microsoft-prod.deb
rm packages-microsoft-prod.deb
sudo apt-get update && \
sudo apt-get install -y dotnet-sdk-6.0

#Instalando VS CODE
sudo snap install --classic code

#Instalando Chrome
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo dpkg -i google-chrome-stable_current_amd64.deb

# INSTALANDO CHROME REMOTE DESKTOP
wget https://dl.google.com/linux/direct/chrome-remote-desktop_current_amd64.deb && \ 
sudo apt install ./chrome-remote-desktop_current_amd64.deb -y
  
# DANDO PERMISSÕES NA PASTA  
sudo chmod 777 /home/