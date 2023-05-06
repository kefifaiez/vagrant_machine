#!/bin/sh

# Setting and configuring the VM
apt-get update 
apt-get upgrade -y 
apt-get install -y python3 git vim bash-completion sshpass openssh-server curl

sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
systemctl restart sshd

# Créer l'utilisateur "faiez" avec le mot de passe "faiez123"
PASS=$(echo "faiez123" | openssl passwd -1 -stdin)
useradd -p  "$PASS" -s /bin/bash -d /home/faiez -m  faiez
echo "faiez  ALL=(ALL:ALL) NOPASSWD: ALL"  >> /etc/sudoers.d/faiez

cat <<EOF > /etc/hosts
10.0.0.90 docker.clevory.local
EOF

# Install docker
curl -fsSL https://get.docker.com -o get-docker.sh
sh get-docker.sh
#La commande usermod -aG docker faiez permet d'ajouter l'utilisateur faiez au groupe docker sur le système
usermod -aG docker faiez

# Install docker-compose
curl -SL https://github.com/docker/compose/releases/download/v2.17.2/docker-compose-linux-x86_64 -o /usr/local/bin/docker-compose
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose
#La commande chmod +x /usr/bin/docker-compose ajoute l'autorisation d'exécution (ou "permission d'exécution") pour le fichier docker-compose.
chmod +x /usr/bin/docker-compose
