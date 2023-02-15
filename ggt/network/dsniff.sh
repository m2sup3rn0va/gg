#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] GITGUN(gg) - THE TOOLKIT MANAGER\n" | lolcat
echo -e "------------------------------------\n" | lolcat

if hash dsniff &> /dev/null;
then
        printf "[+] Updating DSniff\n" | lolcat
else
        printf "[+] Installing DSniff\n" | lolcat    
fi

sudo apt-get install -y dsniff
printf "\n[+] Type 'arpspoof' or 'dsniff' to use...\n\n" | lolcat

(grep -q 'dsniff' $HOME/.gg/update-cache/gg_network.list) || printf "dsniff\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*