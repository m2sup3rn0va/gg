#! /bin/bash

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

sudo apt-get install -y git python3 python3-pip perl rpcbind smbclient samba polenum ldap-utils
grep -q snmpenum $(ls $HOME/.local/tools/) || git clone https://github.com/ajohnston9/snmpenum.git $HOME/.local/tools/snmpenum

ln -sf $HOME/.local/tools/snmpenum/snmpenum.pl $HOME/.local/bin/snmpenum