#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y ruby ruby-dev
sudo gem install evil-winrm

(! grep -q 'evil_winrm' $HOME/.gg/update-cache/gg_network.list) && printf "evil_winrm\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] Evil-Winrm Installed Successfully...\n" | lolcat
printf "[+] Type 'evil-winrm' to use...\n" | lolcat