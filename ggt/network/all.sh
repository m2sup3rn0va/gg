#! /bin/bash

curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].nmap' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].crackmapexec' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].dsniff' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].enum4linux' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].evil_winrm' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].impacket' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].msfconsole' | tr -d '"') | bash
curl -s $(cat $HOME/.gg/gg.json | jq '.tools[].network[].responder' | tr -d '"') | bash

printf "[+] All Network Tools Installed\n" | lolcat
printf "[+] Please logoff and login back\n" | lolcat
