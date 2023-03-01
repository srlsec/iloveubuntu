#!/bin/bash

green="\e[1;32m"
yellow="\033[33;1m"
indigo="\033[34;1m"
red="\033[35;1m"
purple="\033[37;1m"
cyan="\033[36;1m"
white="\033[39;1m"

# https://github.com/olaviolacerda/ubuntu-setup

lagi=1
while [ $lagi -lt 6 ];
do
echo -e "\e[1;36m"
printf "\e[1;93m=================[\e[0m\e[1;95mAll Tools Installer]\e[0m\e[1;93m==================\e[0m\n"
printf "         \e[1;40m\tCreated by: sarathlalsrl\e[0m\n"
echo -e "\e[1;36m"
echo ' 1. All                   '
echo ' 2. Update & Upgrade                '
echo ' 3. Snap (Package Manager)  '
echo ' 4. Ruby (Langauge)    '
echo ' 5. Python (Langauge)         '
echo ' 6. Java (Langauge)         '
echo ' 7. Go lang (Langauge)         '
echo ' 8. PHP (Langauge)       '
echo ' 9. Sticky Notes (Simple note taking)       '
echo '10. Telegram (Social)       '
echo '11. Termius (Remote shell)       '
echo '12. Google Chrome (Browser)       '
echo '13. Orchis GTK theme (Theme)       '
echo '14. VS code (IDE)       '
echo '15. VLC (Media Player)      '
echo '16. Anydesk (Remote desktop)       '
echo '17. Spotify (Online Music)       '
echo '18. Virtualbox (Virtualization)       '
echo '19. Xmind (Mindmap)       '
echo '20. Advanced terminal       '
echo '21. Wget + Curl       '
echo '22. Screen       '
echo '23. p7zip (Compression)       '
echo '24. Notion (Online Note taking)       '
echo -e "\e[1;36m"
echo "========================================================"

echo -e "\e[1;32m╭─[ Select number to install ]\e[0m"
read -p " ╰─# " pil;
case $pil in
1) echo -e "\e[1;32m╭─[ Select number to install ]\e[0m"

;;
2) echo -e "\e[1;32m╭─[ Select number to install ]\e[0m"
sudo apt update -y
sudo apt upgrade -y

;;
3) echo -e "\e[1;32m╭─[ Select number to install ]\e[0m"
sudo apt install snapd -y
;;

4) echo -e "hi"
sudo apt install ruby-full -y
;;

5) echo -e "hi"
# Install python
sudo apt install -y python3
sudo apt install -y python-pip 
sudo apt install python3.10-venv -y
;;

6) echo -e "hi"
# Install JAVA
sudo apt install default-jre -y
sudo apt install default-jdk -y
;;

7) echo -e "hi"
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

;;

8) echo -e "hi"

;;

9) echo -e "hi"
# Sticky Notes
sudo add-apt-repository ppa:umang/indicator-stickynotes
sudo apt-get update
sudo apt-get install indicator-stickynotes
;;

10) echo -e "hi"
# Install Telegram
sudo snap install telegram-desktop
;;

11) echo -e "hi"
# Install Termius
sudo snap install termius-app
;;

12) echo -e "hi"
# Install Google Chrome
sudo apt-get install libxss1 libappindicator1 libindicator7
wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
sudo apt install ./google-chrome*.deb
rm google-chrome*.deb
google-chrome --version
;;

13) echo -e "hi"
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
;;

14) echo -e "hi"
# Install VS code
sudo snap install code --classic
;;

15) echo -e "hi"
# Install VLC
sudo snap install vlc
;;

16) echo -e "hi"
# Install Anydesk
curl -fsSL https://keys.anydesk.com/repos/DEB-GPG-KEY|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/anydesk.gpg
echo "deb http://deb.anydesk.com/ all main" | sudo tee /etc/apt/sources.list.d/anydesk-stable.list
sudo apt update -y
sudo apt install anydesk -y
;;

17) echo -e "hi"
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
;;

18) echo -e "hi"
# Install Virtualbox
sudo apt-get install virtualbox -y
;;

19) echo -e "hi"
# Install Xmind
cd ~/Downloads
wget https://vip.linuxia.ir/VIP/software/xmind/XMind%20Premium%20Linux%2010.1.3%20hide01.ir.zip
7z x -p"hide01.ir" "XMind Premium Linux 10.1.3 hide01.ir.zip"
cd "XMind Premium Linux 10.1.3 hide01.ir"
sudo dpkg -i "XMind ZEN Premium Linux  10.1.3 hide01.ir.deb"
sudo rm "/opt/XMind ZEN/resources/app.asar"
cd Crack 
sudo cp app.asar "/opt/XMind ZEN/resources/"
;;

20) echo -e "hi"
# Install terminator
sudo apt install terminator -y
;;

21) echo -e "hi"
sudo apt install curl -y
sudo apt install wget -y
;;

22)  echo -e "Installing"
sudo apt install screen -y
;;

23) echo -e "Installing p7zip"
sudo apt install p7zip-full -y
;;

24) echo -e "Installing Notion"
sudo snap install notion-snap
;;

00)

exit
;;

esac
done
done
