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

sudo apt-get install -y git python3.10 python3-pip

if [ -d $HOME/.local/tools/responder ];
then
	cd $HOME/.local/tools/responder
	git pull

	printf "\n[+] Responder has been updated successfully...\n" | lolcat
else
	git clone https://github.com/lgandx/Responder.git $HOME/.local/tools/responder
	sudo python3 -m pip install -r $HOME/.local/tools/responder/requirements.txt --user --no-warn-script-location
	printf '#!/bin/bash\nsudo python3 $HOME/.local/tools/responder/Responder.py $@' > $HOME/.local/bin/responder
	sudo chmod +x $HOME/.local/bin/responder

	if [ -f $HOME/.zshrc ];
	then
		(grep -q 'responder_conf' $HOME/.zshrc) || printf "alias responder_conf='vim $HOME/.local/tools/responder/Responder.conf'\n" >> $HOME/.zshrc
	elif [ -f $HOME/.bashrc ];
	then
		(grep -q 'responder_conf' $HOME/.bashrc) || printf "alias responder_conf='vim $HOME/.local/tools/responder/Responder.conf'\n" >> $HOME/.bashrc
	fi

	(grep -q 'responder' $HOME/.gg/update-cache/gg_network.list) || printf "responder\n" >> $HOME/.gg/update-cache/gg_network.list

	printf "\n[+] Responder has been installed successfully...\n" | lolcat
	printf "[+] Type 'responder' to use 'responder_conf' to edit the config file...\n" | lolcat
fi

sudo chown -R $USER:$USER $HOME/.local/*
cd $CWD