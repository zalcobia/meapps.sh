#!/bin/bash

# Descrição: Programa 'My Essential Apps' ou 'meapps' para Debian. Instala aplicações essenciais.

# Versão: 0.1
# Data: 4/Agosto/2021
# Desenvolvedor: Pedro Graça
# País: Portugal
# Contacto: xalcobia@gmail.com

# INSTRUÇÕES DE EXECUÇÂO
# 1. As LISTAS podem ser modificadas para adicionar os teus repositórios e programas
# 2. Navegar até a directório onde se encontra o script com "cd /nome_do_caminho/nome_do_diretório"
# 3. Digitar "sudo -s" antes de executar este script
# 4. Tornar o script executavel com comando "chmod +x mea.sh"
# 5. Executar com comando "./mea.sh"

# INÍCIO DAS LISTAS

# Processadores Intel apenas (descomentar no fim do script com # caso não seja necessário)
INTEL=(
intel-microcode
iucode-tool
)

# Placas Gráficas AMD apenas (descomentar no fim do script com # caso não seja necessário)
ATI_MESA=(
mesa-vulkan-drivers
libvulkan1 
vulkan-tools 
vulkan-utils 
vulkan-validationlayers
mesa-opencl-icd
)

# Root Path Custom Fonts
ROOT_FONT_PATH="/usr/share/fonts/custom_fonts"

# Downloads Path
DOWNLOADS="/$HOME/Downloads"

# Transferências Path
TRANSFERENCIAS="/$HOME/Transferências"

# Git Clone
GIT_CLONE="git clone https://github.com/zalcobia"

# Instalação de Programas APT
PROGRAMAS=(
aptitude
curl
git
python
net-tools
build-essential
traceroute
software-properties-common
ttf-mscorefonts-installer
preload
libreoffice
gimp
inkscape
kdenlive
kazam
synaptic
manpages-pt
manpages-pt-dev
gnome-system-monitor
gnome-disk-utility
gufw
cinnamon
lightdm
vlc
audacity
steghide
nmap
wireshark
crunch
john
gedit
gedit-plugins
engrampa
zip
unzip
rar
unrar
gzip
tar
python
)

# Purge de Programas
PURGE_PROGRAMAS=(
termit
file-roller
nemo-fileroller
)

# FIM DAS LISTAS

remover_locks () {
sudo rm /var/lib/dpkg/lock-frontend
sudo rm /var/cache/apt/archives/lock
}

# Adicionar Arquitectura 32bit
adicionar_arquitetura_i386 () {
sudo dpkg --add-architecture i386
}

# Software_Github
software_github () {
$GIT_CLONE/custom_fonts_A.git
$GIT_CLONE/custom_fonts_B.git
$GIT_CLONE/dark_walls.git
}

# Instalar Programas
instalar_pacotes_apt () {
sudo apt install $PROGRAMAS -y
}

# Software_Deb
software_deb () {
wget -p https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
wget -p https://github.com/VSCodium/vscodium/releases/download/1.59./codium_1.59.1-1629418630_amd64.deb
wget -p https://atom-installer.github.com/v1.58.0/atom-amd64.deb
}

# Instalação de Programas DEB
instalacao_debs () {
sudo chmod +x $TRANSFERENCIAS/*.deb* >& /dev/null
sudo chmod +x $DOWNLOADS/*.deb* >& /dev/null
sudo apt install https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install https://github.com/VSCodium/vscodium/releases/download/1.59.1/codium_1.59.1-1629418630_amd64.deb
sudo apt install https://atom-installer.github.com/v1.58.0/atom-amd64.deb
}

# Actualizar Repositorios
actualizar_repositorios () {
sudo apt update -y
}

# Purge de Programas
purge_pacotes () {
sudo apt remove --purge $PURGE_PROGRAMAS -y
}

# Upgrade e Limpar
upgrade_limpeza () {
sudo rm -R ./*deb* >& /dev/null
sudo apt --fix-broken install -y
sudo apt upgrade -y
sudo apt autoclean 
sudo apt autoremove -y
sudo systemctl enable preload
}

# Instalar Custom Fonts
custom_fonts () {
sudo mkdir -p /usr/share/fonts/custom_fonts
sudo mv $DOWNLOADS/custom_fonts_A/* $ROOT_FONT_PATH >& /dev/null
sudo mv $DOWNLOADS/custom_fonts_B/* $ROOT_FONT_PATH >& /dev/null
sudo mv $TRANSFERENCIAS/custom_fonts_A/* $ROOT_FONT_PATH >& /dev/null
sudo mv $TRANSFERENCIAS/custom_fonts_B/* $ROOT_FONT_PATH >& /dev/null
sudo chmod 755 -R /usr/share/fonts/custom_fonts
sudo fc-cache -f -v
}

# Instalar Wallpappers
wallpappers () {
sudo mv $DOWNLOADS/dark_walls/*.png /$HOME/Pictures/ >& /dev/null
sudo mv $TRANSFERENCIAS/dark_walls/*.png /$HOME/Imagens/ >& /dev/null
}

# Mensagem
mensagem () {
echo "Todos os processos foram executados com sucesso 'Pressionar CTRL+D' para sair."
echo "Reinicia o computador com o comando 'sudo reboot now'"
}

# Descomentar aqui com # caso não queira instalar algum pacote
remover_locks
adicionar_arquitetura_i386
actualizar_repositorios
instalar_pacotes_apt
software_deb
software_github
purge_pacotes
upgrade_limpeza
custom_fonts
wallpappers
mensagem
