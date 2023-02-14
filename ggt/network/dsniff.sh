#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y dsniff

(grep -q 'dsniff' $HOME/.gg/update-cache/gg_network.list) || printf "dsniff\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] DSniff has been installed successfully...\n" | lolcat
printf "[+] Type 'arpspoof' or 'dsniff' to use...\n" | lolcat