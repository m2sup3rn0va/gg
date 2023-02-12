#! /bin/bash

CWD=$(pwd)

sudo apt-get clean
tput reset clear

printf "[+] Initiating Installation...\n\n" | lolcat

printf "[+] Installing ZSH Shell...\n" | lolcat
sudo apt-get install -y zsh
printf "\n"

printf "[+] Installing Oh-My-ZSH Shell Themes...\n" | lolcat
sh -c "$(wget -q -O- https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

if [ -f $HOME/.bash_profile ];
then
  echo -e "source $HOME/.bash_profile" >> $HOME/.zshrc
fi

printf "\n"

printf "[+] Updating ZSHRC for Themes...\n" | lolcat
sed -i 's/ZSH_THEME="robbyrussell".*/ZSH_THEME="random"/g' $HOME/.zshrc
themes='ZSH_THEME_RANDOM_CANDIDATES=( "xiong-chiamiov" "mortalscumbag" "dst" "trapd00r" "funky" "clean" "fino-time" "bureau" "dpoggi" "mikeh" "geoffgarside" "crcandy" "simonoff" "rkj-repos" "agnoster" "darkblood" "frisk" "nicoulaj" "duellj" "rkj" )'
sed -i "s/# ZSH_THEME_RANDOM_CANDIDATES=.*/$themes/g" $HOME/.zshrc
printf "[+] ZSH THEMES UPDATED...\n" | lolcat
printf "\n"

printf "[+] Installing ZSH-AUTOSUGGESTIONS...\n" | lolcat
git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
printf "\n"

printf "[+] Installing ZSH-SYNTAX-HIGHLIGHTNING...\n" | lolcat
git clone --progress https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
plugins='plugins=(git zsh-autosuggestions zsh-syntax-highlighting)'
sed -i "s/plugins=(git)/$plugins/g" $HOME/.zshrc
printf "\n"

sudo chsh $USER --shell /usr/bin/zsh
echo 'export SHELL="/usr/bin/zsh"' >> $HOME/.zshrc

printf "[+] ALL FINISHED [+]\n" | lolcat
printf "[+] PLEASE LOGOFF AND LOGIN BACK [+]\n" | lolcat

printf "\n"
