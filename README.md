<h1><b>GitGun(gg) - The Toolkit Manager<b></h1>

> **Owner** : Mr. Sup3rN0vaa | 13-February-2023

> **Tags** : #toolkit, #penetration_testing

<h2><b>Table Of Contents</b></h2>

- [**Introduction**](#introduction)
- [**Installation**](#installation)
- [**Installed Cmdlets**](#installed-cmdlets)

## **Introduction**

![](img/gg.png)

- `GitGun(gg)` π« is a command-line toolkit manager to `download`, `install` and `update` some of the most common pentesting tools
- It includes some of my favourite **pentesting tools** π±βπ€ with my **custom shell scripts** π and my `bash_profile`
- Additionally it supports **bash completion** as well, so tab works π

> NOTE: To get the list of available tools, check `ggt` folder

## **Installation**

- First, install the **pre-requisites**: `sudo apt-get install -y wget curl lolcat git`
- Then, run 

```bash
curl -s https://raw.githubusercontent.com/m2sup3rn0va/gg/main/install.sh | bash
```

- This will create a new directory `$HOME/.gg` and some files to install and update the tools
- Once completed, you can run `gg help` or `gg` directly and it will show you the help menu
- To see what all tools are available to install run: `gg list`

## **Installed Cmdlets**

- Once you install `shell` with `gg install shell`, you will get some extra commands like:
	- **Updating and upgrading the system** in one command: `apt-update` πΊπΊ
	- **Free ram** using: `clearRam` ποΈ β€οΈ

## **Future Updates**

- Adding more tools, so STAY TUNEDDD !!! ππ
