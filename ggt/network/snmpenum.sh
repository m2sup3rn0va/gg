#! /bin/bash

CWD=$(PWD)

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

if [ ! -d $HOME/.local/bin/ ];
then
    printf "[+] Creating BIN folder in $HOME/.local/ \n" | lolcat
    mkdir -p $HOME/.local/bin
fi

if [ ! -d $HOME/.local/tools/ ];
then
    printf "[+] Creating Tools folder in $HOME/.local/ \n" | lolcat
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

printf "\n"

sudo apt-get install -y git python3.10 python3-pip perl rpcbind smbclient samba polenum ldap-utils

if [ -d $HOME/.local/tools/snmpenum ];
then
	cd $HOME/.local/tools/snmpenum
	git pull

	printf "[+] SNMPEnum has been updated successfully...\n" | lolcat
else
	git clone https://github.com/ajohnston9/snmpenum.git $HOME/.local/tools/snmpenum
	ln -sf $HOME/.local/tools/snmpenum/snmpenum.pl $HOME/.local/bin/snmpenum

	(grep -q 'snmpenum' $HOME/.gg/update-cache/gg_network.list) || printf "snmpenum\n" >> $HOME/.gg/update-cache/gg_network.list

	printf "[+] SNMPEnum has been installed successfully...\n" | lolcat
	printf "[+] Type 'snmpenum' to use...\n" | lolcat
fi

sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD