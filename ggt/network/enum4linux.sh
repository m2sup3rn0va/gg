#! /bin/bash

sudo apt-get clean
printf "[+] Installing Lolcat...\n"
sudo apt-get install -y lolcat > /dev/null 2>&1
tput reset clear

printf "[+] Initiating Installation...\n" | lolcat

if [ ! -d $HOME/.local/bin/ ];
then
    printf "[+] Creating BIN folder in $HOME/.local/ \n" | lolcat
    mkdir -p $HOME/.local/bin

    if [ ! -f $HOME/.bash_profile ];
    then
	    if [ -f $HOME/.zshrc ] && [ $(cat $HOME/.zshrc | grep -q 'export PATH') ];
	    then
	    	printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.zshrc
	    elif [ -f $HOME/.bashrc ] && [ $(cat $HOME/.bashrc | grep -q 'export PATH') ];
	    then
	    	printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.bashrc
	    fi
	fi
fi

if [ ! -d $HOME/.local/tools/ ];
then
    printf "[+] Creating Tools folder in $HOME/.local/ \n" | lolcat
    mkdir -p $HOME/.local/tools
fi

printf "\n"

sudo apt-get install -y git python3 python3-pip perl rpcbind smbclient samba polenum ldap-utils

[ -d $HOME/.local/tools/enum4linux ] && rm -rf $HOME/.local/tools/enum4linux
git clone https://github.com/CiscoCXSecurity/enum4linux.git $HOME/.local/tools/enum4linux
ln -sf $HOME/.local/tools/enum4linux/enum4linux.pl $HOME/.local/bin/enum4linux

sudo chown -R $USER:$USER $HOME/.local/*

(! grep -q 'enum4linux' $HOME/.gg/update-cache/gg_network.list) && printf "enum4linux\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] Enum4Linux Installed Successfully...\n" | lolcat
printf "[+] Type 'enum4linux' to use...\n" | lolcat
