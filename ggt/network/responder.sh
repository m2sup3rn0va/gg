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
	    if [ -f $HOME/.zshrc ];
	    then
	    	(grep -q 'export PATH=' $HOME/.zshrc) || printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.zshrc
	    elif [ -f $HOME/.bashrc ];
	    then
	    	(grep -q 'export PATH=' $HOME/.bashrc) || printf 'export PATH="$PATH:$HOME/.local/bin"\n' >> $HOME/.bashrc
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

if [ ! -d $HOME/.local/tools/responder ];
then
	git clone https://github.com/lgandx/Responder.git $HOME/.local/tools/responder
	sudo python3 -m pip install -r $HOME/.local/tools/responder/requirements.txt --user --no-warn-script-location
	printf '#!/bin/bash\nsudo python3 $HOME/.local/tools/responder/Responder.py' > $HOME/.local/bin/responder
	sudo chmod +x $HOME/.local/bin/responder

	if [ -f $HOME/.zshrc ];
	then
		echo "alias responder_conf='vim $HOME/.local/tools/responder/Responder.conf'" >> $HOME/.zshrc
	elif [ -f $HOME/.bashrc ];
	then
		echo "alias responder_conf='vim $HOME/.local/tools/responder/Responder.conf'" >> $HOME/.bashrc
	fi

	sudo chown -R $USER:$USER $HOME/.local/*

	(! grep -q 'responder' $HOME/.gg/update-cache/gg_network.list) && printf "responder\n" >> $HOME/.gg/update-cache/gg_network.list

	printf "\n[+] Responder Installed Successfully...\n" | lolcat
	printf "[+] Type 'responder_conf' to edit the config file...\n" | lolcat
else
	printf "\n[+] Responder is already installed...\n" | lolcat
fi
