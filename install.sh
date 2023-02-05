#!/bin/bash
color(){
  RED="\e[31m"
  CYAN="\e[36m"
  ENDCOLOR="\e[0m"
  BLINK="\e[5m"
  BOLD="\e[1m"
  GREEN="\e[32m"
  Yellow="\e[33m"

}

##
sudo apt update -y
sudo apt upgrade -y
sudo apt install snapd -y
# Install other tools
sudo apt install curl -y
sudo apt install wget -y
sudo apt install screen -y
sudo apt install p7zip-full -y
sudo apt install vlc -y
# Install python
sudo apt install -y python3
sudo apt install -y python-pip 
sudo apt install python3.10-venv -y

sudo apt install ruby-full -y
# Install Telegram
sudo snap install telegram-desktop
# Install Termius
sudo snap install termius-app
# Install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb
rm google-chrome*.deb
google-chrome --version
# Installing Orchis GTK theme
git clone https://github.com/vinceliuice/Orchis-theme.git
cd Orchis-theme
bash install.sh -d ~/.themes
rm -rf Orchis-theme
sudo apt install chrome-gnome-shell -y
sudo apt install gnome-tweak-tool -y
sudo apt install gnome-shell-extensions -y
# Shell theme installation (manual)
# https://itsfoss.com/install-switch-themes-gnome-shell/
# https://extensions.gnome.org/extension/1160/dash-to-panel/
# https://extensions.gnome.org/extension/4624/alphatint/
# https://extensions.gnome.org/extension/2980/internet-speed-meter/
# Install VS code
sudo snap install code --classic
# Install VLC
sudo snap install vlc
# Install terminator
sudo apt install terminator -y
# Install JAVA
sudo apt install default-jre -y
sudo apt install default-jdk -y
# Install Anydesk
curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/anydesk.gpg
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update -y
sudo apt install anydesk -y
# Install Spotify (ad blocker)
curl -sS https://download.spotify.com/debian/pubkey_5E3C45D7B312C643.gpg | sudo apt-key add - 
echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
sudo apt-get update && sudo apt-get install spotify-client -y 
git clone https://github.com/abba23/spotify-adblock-linux.git
cd spotify-adblock-linux
wget -O cef.tar.bz2 https://cef-builds.spotifycdn.com/cef_binary_88.1.6%2Bg4fe33a1%2Bchromium-88.0.4324.96_linux64_minimal.tar.bz2
tar -xf cef.tar.bz2 --wildcards '*/include' --strip-components=1
sudo make install
echo "[Desktop Entry]
Type=Application
Name=Spotify (adblock)
GenericName=Music Player
Icon=spotify-client
TryExec=spotify
Exec=env LD_PRELOAD=/usr/local/lib/spotify-adblock.so spotify %U
Terminal=false
MimeType=x-scheme-handler/spotify;
Categories=Audio;Music;Player;AudioVideo;
StartupWMClass=spotify" >> ~/Desktop/Spotify.desktop
rm -rf spotify-adblock-linux
# Install Virtualbox
sudo apt-get install virtualbox -y
# Install Xmind
cd ~/Downloads
wget https://vip.linuxia.ir/VIP/software/xmind/XMind%20Premium%20Linux%2010.1.3%20hide01.ir.zip
7z x -p"hide01.ir" "XMind Premium Linux 10.1.3 hide01.ir.zip"
cd "XMind Premium Linux 10.1.3 hide01.ir"
sudo dpkg -i "XMind ZEN Premium Linux  10.1.3 hide01.ir.deb"
sudo rm "/opt/XMind ZEN/resources/app.asar"
cd Crack 
sudo cp app.asar "/opt/XMind ZEN/resources/"

golanguage(){
    echo -e "${GREEN}starting intall Go-lang ....${ENDCOLOR}\n"
    goversion=$(curl -ks -L https://go.dev/VERSION?m=text)
    wget https://go.dev/dl/$goversion.linux-amd64.tar.gz -q
    sudo rm -rf /usr/local/go && sudo tar -C /usr/local -xzf $goversion.linux-amd64.tar.gz
    export PATH=$PATH:/usr/local/go/bin
    echo "export PATH=$PATH:/usr/local/go/bin" >> .bashrc
    if command -v go &> /dev/null; then
        echo -e " ${GREEN}Go installed done ${ENDCOLOR}"
    else
        echo -e " ${Yellow}There's a proplem , try to install it  manually ${ENDCOLOR}"
    fi
    rm -rf $goversion.linux-amd64.tar.gz
}
