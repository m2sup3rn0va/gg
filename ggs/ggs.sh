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

printf "\n"

if [ ! -d $HOME/.fonts ];
then
    printf "[+] Installing Font... \n" | lolcat
    mkdir -p $HOME/.fonts 2> /dev/null
    wget -q https://github.com/ryanoasis/nerd-fonts/raw/master/patched-fonts/CascadiaCode/Bold/complete/Caskaydia%20Cove%20Nerd%20Font%20Complete%20Mono%20Bold.otf \
        -O $HOME/.fonts/CaskaydiaCoveNerdFont_MonoBold.otf
    fc-cache -f -v $HOME/.fonts/
fi

printf "\n"

printf "[+] Installing Terminator Terminal...\n" | lolcat
sudo apt-get install -y terminator
printf "\n"

if [ ! -f $HOME/.vimrc ];
then
    printf "[+] Installing VIM...\n" | lolcat
    sudo apt-get install -y vim
    wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/ggs/shell/vimrc -O $HOME/.vimrc
fi

printf "\n"

printf "[+] Installing EXA... \n" | lolcat
sudo apt-get install -y exa
printf "\n"

printf "[+] Installing BatCat... \n" | lolcat
sudo apt-get install -y bat
printf "\n"

printf "[+] Installing Git... \n" | lolcat
sudo apt-get install -y git
printf "\n"

printf "[+] Installing WGet and cURL... \n" | lolcat
sudo apt-get install -y wget curl
printf "\n"

printf "[+] Installing Python3...\n" | lolcat
sudo apt-get install -y python3 python3-pip python3-venv
python3 -m pip install -U pip rich bs4 --user --no-warn-script-location
printf "\n"

if [ ! -d $HOME/.tmux/ ];
then
    printf "[+] Creating TMUX folder in $HOME/ \n" | lolcat
    mkdir -p $HOME/.tmux/

    printf "[+] Installing TMUX...\n" | lolcat
    sudo apt-get install -y tmux
    git clone https://github.com/arcticicestudio/nord-tmux.git $HOME/.tmux/nord-tmux
    wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/ggs/shell/tmux.conf -O $HOME/.tmux/tmux.conf
fi

printf "\n"

if [ ! -f $HOME/.local/bin/apt-update ];
then
    printf "[+] Installing APT-UPDATE...\n" | lolcat
    wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/ggs/shell/apt-update -O $HOME/.local/bin/apt-update
    chmod +x $HOME/.local/bin/apt-update
fi

printf "\n"

if [ ! -f $HOME/.local/bin/clearRam ];
then
    printf "[+] Installing ClearRam...\n" | lolcat
    wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/ggs/shell/clearRam -O $HOME/.local/bin/clearRam
    chmod +x $HOME/.local/bin/clearRam
fi

printf "\n"

if [ ! -f $HOME/.bash_profile ];
then
    printf "[+] Updating User Profile...\n" | lolcat
    wget -q https://raw.githubusercontent.com/m2sup3rn0va/gg/main/ggs/shell/bash_profile -O $HOME/.bash_profile
    [ -f $HOME/.zshrc ] && echo -e "source $HOME/.bash_profile" >> $HOME/.zshrc || echo -e "source $HOME/.bash_profile" >> $HOME/.bashrc
fi

printf "\n"

printf "[+] ALL FINISHED [+]\n" | lolcat
printf "[+] PLEASE LOGOFF AND LOGIN BACK [+]\n" | lolcat

printf "\n"
