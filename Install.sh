#!/bin/bash

echo 'Iniciando instalação de Rclone'
# download and install of rclone
curl https://rclone.org/install.sh | sudo bash &&

# Create Directories
echo 'Creando diretorios'
mkdir ~/GoogleDrive
mkdir ~/OneDrive

echo 'Creando scripts de inicio'
# Create autostart scripts Google Drive
echo '#!/bin/bash' > /usr/local/bin/rclone_googledrive
echo 'rclone --vfs-cache-mode writes mount googledrive: ~/GoogleDrive &' >> /usr/local/bin/rclone_googledrive

# Create autostart scripts One Drive
echo '#!/bin/bash' > /usr/local/bin/rclone_onedrive
echo 'rclone --vfs-cache-mode writes mount onedrive: ~/OneDrive &' >> /usr/local/bin/rclone_onedrive

echo 'Estabelecendo permissoes'
# Set permissions
chmod 777 /usr/local/bin/rclone_googledrive
chmod 777 /usr/local/bin/rclone_onedrive

echo 'Creando entradas de autoinicio'
# Create autostart entrie Google Drive
echo '[Desktop Entry]' > ~/.config/autostart/googledrive.desktop
echo 'Name=rclone Drive' >> ~/.config/autostart/googledrive.desktop
echo 'Exec=rclone_google' >> ~/.config/autostart/googledrive.desktop
echo 'Type=Application' >> ~/.config/autostart/googledrive.desktop

# Create autostart entrie One Drive
echo '[Desktop Entry]' > ~/.config/autostart/onedrive.desktop
echo 'Name=rclone OneDrive' >> ~/.config/autostart/onedrive.desktop
echo 'Exec=rclone_onedrive' >> ~/.config/autostart/onedrive.desktop
echo 'Type=Application' >> ~/.config/autostart/onedrive.desktop

echo 'Instalação terminada com sucesso'
