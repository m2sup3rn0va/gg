#! /bin/bash

sudo apt-get clean
tput reset clear

printf "[+] GITGUN(gg) - THE TOOLKIT MANAGER\n" | lolcat
echo -e "------------------------------------\n" | lolcat

if hash nmap &> /dev/null;
then
        printf "[+] Updating NMAP\n" | lolcat
else
        printf "[+] Installing NMAP\n" | lolcat    
fi

sudo apt-get install -y nmap
sudo nmap --script-updatedb

if [ ! -f $HOME/.bash_profile ];
then
	if [ -f $HOME/.zshrc ];
	then
		(grep -q 'nsescripts' $HOME/.zshrc) || printf "alias nsescripts='ll /usr/share/nmap/scripts'\n" >> $HOME/.zshrc
	elif [ -f $HOME/.bashrc ];
	then
		(grep -q 'nsescripts' $HOME/.bashrc) || printf "alias nsescripts='ll /usr/share/nmap/scripts'\n" >> $HOME/.bashrc
	fi
fi

wget -q https://raw.githubusercontent.com/mubix/tools/master/nmap/scripts/smb-check-vulns.nse -O /tmp/smb-check-vulns.nse
sudo mv -f /tmp/smb-check-vulns.nse /usr/share/nmap/scripts/smb-check-vulns.nse
sudo nmap --script-updatedb

printf "\n[+] Type 'nmap' to use and 'nsescripts' to see the list of NMAP scripts\n\n" | lolcat

(grep -q 'nmap' $HOME/.gg/update-cache/gg_network.list) || printf "nmap\n" >> $HOME/.gg/update-cache/gg_network.list
