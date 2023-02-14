#! /bin/bash

if ! hash lolcat git jq &> /dev/null;
then
		printf "[+] Please install the pre-requisites first...\n"
		exit 1
fi

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

if [ ! -d $HOME/.gg ];
then
	mkdir -p $HOME/.gg/update-cache
	touch $HOME/.gg/update-cache/gg_network.list
	touch $HOME/.gg/update-cache/gg_web.list

	wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/gg -O $HOME/.gg/gg
	wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/gg.list -O $HOME/.gg/gg.list
	chmod +x $HOME/.gg/gg
	sudo ln -sf $HOME/.gg/gg /usr/bin/gg

	printf "\n[+] GitGun(gg) has been installed successfully...\n" | lolcat
	printf "[+] Type 'gg' or 'gg help' to get going...\n" | lolcat
	printf "[+] Type 'gg version' to get the version date...\n" | lolcat
else
	printf "\n[+] GitGun(gg) is already installed...\n" | lolcat
	printf "[+] Type 'gg' or 'gg help' to get going...\n\n" | lolcat

	cat $HOME/.gg/gg.list | grep 'NOTE:' | lolcat
	echo ""
fi