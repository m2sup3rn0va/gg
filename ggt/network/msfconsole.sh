#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] GITGUN(gg) - THE TOOLKIT MANAGER\n" | lolcat
echo -e "------------------------------------\n" | lolcat

printf "[+] Installing Metasploit Community Edition\n" | lolcat 
curl -s https://raw.githubusercontent.com/rapid7/metasploit-omnibus/master/config/templates/metasploit-framework-wrappers/msfupdate.erb > /tmp/msfinstall
chmod +x /tmp/msfinstall
bash /tmp/msfinstall
rm -rf /tmp/msfinstall

printf "\n[+] Type 'msfconsole' or 'msfvenom' to use...\n" | lolcat
printf "[+] Type 'msfupdate' to update...\n\n" | lolcat