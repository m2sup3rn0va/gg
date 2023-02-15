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
sudo apt-get install -y git python3.10 python3-pip perl rpcbind smbclient samba polenum ldap-utils libsnmp-perl

if [ -d $HOME/.local/tools/snmpenum ];
then
	printf "\n[+] Updating SNMPEnum\n" | lolcat

	cd $HOME/.local/tools/snmpenum
	git pull
else
	printf "\n[+] Installing SNMPEnum\n" | lolcat

	sudo perl -MCPAN -e 'install Net::SNMP'
	git clone https://github.com/ajohnston9/snmpenum.git $HOME/.local/tools/snmpenum
	ln -sf $HOME/.local/tools/snmpenum/snmpenum.pl $HOME/.local/bin/snmpenum
fi

printf "\n[+] Type 'snmpenum' to use\n\n" | lolcat

(grep -q 'snmpenum' $HOME/.gg/update-cache/gg_network.list) || printf "snmpenum\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD