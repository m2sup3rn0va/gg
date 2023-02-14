#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y nmap
sudo nmap --script-updatedb

if [ ! -f $HOME/.bash_profile ];
then
	if [ -f $HOME/.zshrc ];
	then
		(grep -q 'nsescripts' $HOME/.zshrc) || printf "alias nsescripts='ll /usr/local/share/nmap/scripts'\n" >> $HOME/.zshrc
	elif [ -f $HOME/.bashrc ];
	then
		(grep -q 'nsescripts' $HOME/.bashrc) || printf "alias nsescripts='ll /usr/local/share/nmap/scripts'\n" >> $HOME/.bashrc
	fi
fi

wget -q https://raw.githubusercontent.com/mubix/tools/master/nmap/scripts/smb-check-vulns.nse
sudo mv -f smb-check-vulns.nse /usr/local/share/nmap/scripts/
sudo nmap --script-updatedb

(grep -q 'nmap' $HOME/.gg/update-cache/gg_network.list) || printf "nmap\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] NMAP Installation Successful...\n" | lolcat
printf "[+] Type 'nsescripts' to see the list of NMAP scripts...\n" | lolcat