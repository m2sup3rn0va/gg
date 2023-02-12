#! /bin/bash

sudo apt-get clean
printf "[+] Installing Lolcat...\n"
sudo apt-get install -y lolcat > /dev/null 2>&1
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

sudo apt-get install -y git libssl-dev python3 python3-pip python3-distutils python3-apt
git clone https://github.com/nmap/nmap.git
temp=$PWD && cd nmap && ./configure && make && sudo make install && sudo ./nmap --script-updatedb

if [ ! -f $HOME/.bash_profile ];
then
	if [ -f $HOME/.zshrc ] && [ $(cat $HOME/.zshrc | grep -q 'nsescripts') ];
	then
		printf "alias nsescripts='ll /usr/local/share/nmap/scripts'" >> $HOME/.zshrc
	elif [ -f $HOME/.bashrc ] && [ $(cat $HOME/.bashrc | grep -q 'nsescripts') ];
	then
		printf "alias nsescripts='ll /usr/local/share/nmap/scripts'" >> $HOME/.zshrc
	fi
fi

cd $temp && rm -rf nmap

wget -q https://raw.githubusercontent.com/mubix/tools/master/nmap/scripts/smb-check-vulns.nse
sudo mv -f smb-check-vulns.nse /usr/local/share/nmap/scripts/
sudo nmap --script-updatedb

(! grep -q 'nmap' $HOME/.gg/update-cache/gg_network.list) && printf "nmap\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] NMAP Installation Successful...\n" | lolcat
printf "[+] Type 'nsescripts' to see the list of NMAP scripts...\n" | lolcat