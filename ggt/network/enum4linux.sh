#! /bin/bash

CWD=$(pwd)

sudo apt-get clean
tput reset clear

printf "[+] GITGUN(gg) - THE TOOLKIT MANAGER\n" | lolcat
echo -e "------------------------------------\n" | lolcat

if [ ! -d $HOME/.local/bin/ ];
then
    mkdir -p $HOME/.local/bin
fi

if [ ! -d $HOME/.local/tools/ ];
then
    mkdir -p $HOME/.local/tools
fi

if [ ! -f $HOME/.bash_profile ];
then
    if [ -f $HOME/.zshrc ];
    then
    	(grep -q 'export PATH=' $HOME/.zshrc) || printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.zshrc
    elif [ -f $HOME/.bashrc ];
    then
    	(grep -q 'export PATH=' $HOME/.bashrc) || printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.bashrc
    fi
fi

printf "[+] Installing Pre-requisites\n" | lolcat
sudo apt-get install -y git python3.10 python3-pip perl rpcbind smbclient samba polenum ldap-utils

if [ -d $HOME/.local/tools/enum4linux ];
then
	printf "\n[+] Updating Enum4linux\n" | lolcat

	cd $HOME/.local/tools/enum4linux
	git pull
else
	printf "\n[+] Installing Enum4linux\n" | lolcat

	git clone https://github.com/CiscoCXSecurity/enum4linux.git $HOME/.local/tools/enum4linux
	ln -sf $HOME/.local/tools/enum4linux/enum4linux.pl $HOME/.local/bin/enum4linux
fi

printf "\n[+] Type 'enum4linux' to use\n\n" | lolcat

(grep -q 'enum4linux' $HOME/.gg/update-cache/gg_network.list) || printf "enum4linux\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD
