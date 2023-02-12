#! /bin/bash

sudo apt-get clean
printf "[+] Installing Lolcat...\n"
sudo apt-get install -y lolcat > /dev/null 2>&1
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y python3 python3-pip python3-venv && \
python3 -m pip install -U pip crackmapexec --user --no-warn-script-location

(! grep -q 'crackmapexec' $HOME/.gg/update-cache/gg_network.list) && printf "crackmapexec\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] CrackMapExec Installed Successfully...\n" | lolcat
printf "[+] Type 'crackmapexec' to use...\n" | lolcat