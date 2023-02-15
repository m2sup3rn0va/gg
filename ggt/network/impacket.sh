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
sudo apt-get install -y git python3.10 python3-pip

if [ -d $HOME/.local/tools/impacket ];
then
    printf "\n[+] Updating Impacket\n" | lolcat

    cd $HOME/.local/tools/impacket/
    git pull
else
    printf "\n[+] Installing Impacket\n" | lolcat

    git clone https://github.com/fortra/impacket.git $HOME/.local/tools/impacket
    cd $HOME/.local/tools/impacket
    python3 -m pip install -r requirements.txt --user --no-warn-script-location
    sudo python3 setup.py build
    sudo python3 setup.py install

    sudo chown -R $USER:$USER $HOME/.local/*
    ln -sf $HOME/.local/tools/impacket/examples/* $HOME/.local/bin/    
fi

printf "\n[+] All the 'impacket' scripts are in '$HOME/.local/tools/impacket'\n\n" | lolcat

(grep -q 'impacket' $HOME/.gg/update-cache/gg_network.list) || printf "impacket\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD
