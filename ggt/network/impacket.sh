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

if [ -d $HOME/.local/tools/impacket ];
then
    cd $HOME/.local/tools/impacket/
    git pull

    printf "\n[+] Impacket has been updated successfully...\n" | lolcat
else
    git clone https://github.com/fortra/impacket.git $HOME/.local/tools/impacket
    cd $HOME/.local/tools/impacket
    python3 -m pip install -r requirements.txt --user --no-warn-script-location
    sudo python3 setup.py build
    sudo python3 setup.py install

    sudo chown -R $USER:$USER $HOME/.local/*

    ln -sf $HOME/.local/tools/impacket/examples/* $HOME/.local/bin/

    (grep -q 'impacket' $HOME/.gg/update-cache/gg_network.list) && printf "impacket\n" >> $HOME/.gg/update-cache/gg_network.list

    printf "\n[+] Impacket has been installed successfully...\n" | lolcat
    printf "[+] All the 'impacket' scripts are in $HOME/.local/tools/impacket...\n" | lolcat
fi

sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD
