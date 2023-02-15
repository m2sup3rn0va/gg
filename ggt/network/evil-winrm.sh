#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] GITGUN(gg) - THE TOOLKIT MANAGER\n" | lolcat
echo -e "------------------------------------\n" | lolcat

printf "[+] Installing Pre-requisites\n" | lolcat
sudo apt-get install -y ruby ruby-dev ruby-bundler

if hash evil-winrm &> /dev/null;
then
        printf "\n[+] Updating Evil-Winrm\n" | lolcat
else
        printf "\n[+] Installing Evil-Winrm\n" | lolcat    
fi

sudo gem install evil-winrm

printf "\n[+] Type 'evil-winrm' to use...\n\n" | lolcat

(grep -q 'evil-winrm' $HOME/.gg/update-cache/gg_network.list) || printf "evil-winrm\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
