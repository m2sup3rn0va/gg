#! /bin/bash

sudo apt-get clean
printf "[+] Installing Lolcat...\n"
sudo apt-get install -y lolcat > /dev/null 2>&1
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

curl -s https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall && \
chmod +x /tmp/msfinstall && \
bash /tmp/msfinstall && \
rm -rf /tmp/msfinstall

(! grep -q 'msfconsole' $HOME/.gg/update-cache/gg_network.list) && printf "msfconsole\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] Metasploit Installed Successfully...\n" | lolcat
printf "[+] Type 'msfconsole' or 'msfvenom' to use...\n" | lolcat