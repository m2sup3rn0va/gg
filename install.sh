#! /bin/bash

hash lolcat git jq &> /dev/null || printf "[+] Please install the pre-requisites first...\n"; exit 1

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

if [ ! -d $HOME/.gg ];
then
	mkdir -p $HOME/.gg/update-cache
	wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/gg -O $HOME/.gg/gg
	wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/gg.json -O $HOME/.gg/gg.json
	chmod +x $HOME/.gg/gg
	touch $HOME/.gg/update-cache/gg_network.list
	touch $HOME/.gg/update-cache/gg_web.list

	sudo ln -s $HOME/.gg/gg /usr/bin/gg

	printf "\n[+] GitGun Installed Successfully...\n" | lolcat
	printf "[+] Type 'gg' or 'gg help' to get going...\n" | lolcat
	printf "[+] Type 'gg list' to get the list of available tools...\n" | lolcat
else
	printf "\n[+] GitGun already installed...\n" | lolcat
	printf "[+] Type 'gg help' to get going...\n" | lolcat
fi