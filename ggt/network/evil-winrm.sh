#! /bin/bash

sudo apt-get clean
printf "[+] Installing Lolcat...\n"
sudo apt-get install -y lolcat > /dev/null 2>&1
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y ruby ruby-dev && \
sudo gem install evil-winrm

(! grep -q 'evil-winrm' $HOME/.gg/update-cache/gg_network.list) && printf "evil-winrm\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] Evil-Winrm Installed Successfully...\n" | lolcat
printf "[+] Type 'evil-winrm' to use...\n" | lolcat