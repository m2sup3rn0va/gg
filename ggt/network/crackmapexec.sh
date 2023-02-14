#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y python3.10 python3-pip
wget -q https://github.com/Porchetta-Industries/CrackMapExec/releases/latest/download/cme-ubuntu-latest-3.10.zip -O /tmp/cme.zip
unzip /tmp/cme.zip
mv -f /tmp/cme $HOME/.local/bin/
chmod +x $HOME/.local/bin/cme
rm -rf /tmp/cme.zip

(grep -q 'crackmapexec' $HOME/.gg/update-cache/gg_network.list) || printf "crackmapexec\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] CrackMapExec has been installed successfully...\n" | lolcat
printf "[+] Type 'cme' to use...\n" | lolcat