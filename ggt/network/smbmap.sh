#! /bin/bash

CWD=$(pwd)

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

sudo apt-get install -y git python3.10 python3-pip

if [ -d $HOME/.local/tools/smbmap ];
then
    cd $HOME/.local/tools/smbmap
    git pull

    printf "\n[+] SMBMap has been updated successfully...\n" | lolcat
else
    git clone https://github.com/ShawnDEvans/smbmap.git $HOME/.local/tools/smbmap
    python3 -m pip install -r $HOME/.local/tools/smbmap/requirements.txt --user --no-warn-script-location

    printf '#!/bin/bash\nsudo python3 $HOME/.local/tools/smbmap/smbmap.py $@' > $HOME/.local/bin/smbmap
    sudo chmod +x $HOME/.local/bin/smbmap

    (grep -q 'smbmap' $HOME/.gg/update-cache/gg_network.list) || printf "smbmap\n" >> $HOME/.gg/update-cache/gg_network.list

    printf "\n[+] SMBMap has been installed successfully...\n" | lolcat
    printf "[+] Type 'smbmap' to use...\n" | lolcat
fi

sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD