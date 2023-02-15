#! /bin/bash

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
sudo apt-get install -y python3.10 python3-pip

if hash cme &> /dev/null;
then
        printf "\n[+] Updating CrackMapExec" | lolcat
else
        printf "\n[+] Installing CrackMapExec" | lolcat    
fi

wget -q https://github.com/Porchetta-Industries/CrackMapExec/releases/latest/download/cme-ubuntu-latest-3.10.zip -O /tmp/cme.zip
unzip -o /tmp/cme.zip -d /tmp/ &> /dev/null
mv -f /tmp/cme $HOME/.local/bin/cme
chmod +x $HOME/.local/bin/cme
rm -rf /tmp/cme.zip

printf "\n[+] Type 'cme' to use\n\n" | lolcat

(grep -q 'crackmapexec' $HOME/.gg/update-cache/gg_network.list) || printf "crackmapexec\n" >> $HOME/.gg/update-cache/gg_network.list
sudo chown -R $USER:$USER $HOME/.local/*
