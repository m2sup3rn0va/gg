#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y dsniff

(! grep -q 'dsniff' $HOME/.gg/update-cache/gg_network.list) && printf "dsniff\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] DSniff Installed Successfully...\n" | lolcat
printf "[+] You can use 'arpspoof' or 'dsniff' now...\n" | lolcat