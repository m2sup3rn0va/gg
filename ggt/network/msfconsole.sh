#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

curl -s https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall && \
chmod +x /tmp/msfinstall && \
bash /tmp/msfinstall && \
rm -rf /tmp/msfinstall

printf "\n[+] Metasploit Installed Successfully...\n" | lolcat
printf "[+] Type 'msfconsole' or 'msfvenom' to use...\n" | lolcat
printf "[+] Type 'msfupdate' to update...\n" | lolcat