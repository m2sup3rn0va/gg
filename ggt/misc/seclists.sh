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
        (grep -q 'seclists' $HOME/.zshrc) || printf 'alias seclists="cd $HOME/.local/tools/seclists/"\n' >> $HOME/.zshrc
    elif [ -f $HOME/.bashrc ];
    then
    	(grep -q 'export PATH=' $HOME/.bashrc) || printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.bashrc
        (grep -q 'seclists' $HOME/.bashrc) || printf 'alias seclists="cd $HOME/.local/tools/seclists/"\n' >> $HOME/.bashrc
    fi
fi

if [ -d $HOME/.local/tools/seclists ];
then
    printf "\n[+] Updating SecLists\n" | lolcat

    cd $HOME/.local/tools/seclists
    git pull
else
    printf "\n[+] Installing SecLists\n" | lolcat
    git clone https://github.com/danielmiessler/SecLists.git $HOME/.local/tools/seclists
    wget -q https://github.com/brannondorsey/naive-hashcat/releases/download/data/rockyou.txt -O $HOME/.local/tools/seclists/rockyou.txt
fi

printf "\n[+] Type 'seclists' to use\n\n" | lolcat

(grep -q 'seclists' $HOME/.gg/update-cache/gg_misc.list) || printf "seclists\n" >> $HOME/.gg/update-cache/gg_misc.list
sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD