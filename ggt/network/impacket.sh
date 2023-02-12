#! /bin/bash

sudo apt-get clean
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

sudo apt-get install -y git python3 python3-pip
python3 -m pip install -U pip impacket

[ -d $HOME/.local/tools/impacket ] && rm -rf $HOME/.local/tools/impacket
git clone https://github.com/fortra/impacket.git $HOME/.local/tools/impacket
python3 -m pip install -r $HOME/.local/tools/impacket/requirements.txt --user --no-warn-script-location

sudo chown -R $USER:$USER $HOME/.local/*

(! grep -q 'impacket' $HOME/.gg/update-cache/gg_network.list) && printf "impacket\n" >> $HOME/.gg/update-cache/gg_network.list

printf "\n[+] Impacket Installed Successfully...\n" | lolcat
printf "[+] All the 'impacket' scripts are in $HOME/.local/tools/impacket...\n" | lolcat
