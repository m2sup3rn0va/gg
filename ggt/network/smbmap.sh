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

if [ -d $HOME/.local/tools/smbmap ];
then
    printf "\n[+] Updating SMBMap\n" | lolcat

    cd $HOME/.local/tools/smbmap
    git pull
else
    printf "\n[+] Installing SMBMap\n" | lolcat

    git clone https://github.com/ShawnDEvans/smbmap.git $HOME/.local/tools/smbmap
    python3 -m pip install -r $HOME/.local/tools/smbmap/requirements.txt --user --no-warn-script-location

    printf '#!/bin/bash\n\n python3 $HOME/.local/tools/smbmap/smbmap.py $@\n' > $HOME/.local/bin/smbmap
    sudo chmod +x $HOME/.local/bin/smbmap 
fi

printf "\n[+] Type 'smbmap' to use\n\n" | lolcat

(grep -q 'smbmap' $HOME/.gg/update-cache/gg_network.list) || printf "smbmap\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD