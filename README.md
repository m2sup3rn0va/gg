<h1><b>GitGun(gg) - Toolkit Manager<b></h1>

> **Owner** : Mr. Sup3rN0vaa | 13-February-2023

> **Tags** : #toolkit, #penetration_testing

---

<h2><b>Table Of Contents</b></h2>

- [**Introduction**](#introduction)
- [**Installation**](#installation)
- [**Installed Cmdlets**](#installed-cmdlets)

---

## **Introduction**

---

![./img/gg.png]

- `GitGun(gg)` is a command-line toolkit manager to `download`, `install` and `update` some of the most common pentesting tools
- It includes some of my favourite pentesting tools with my custom shell scripts and my `bash_profile`
- Some of the tools include `tmux`, `git`, `vim`, `bat`, `exa` etc.

---

## **Installation**

---

- First, install the pre-requisites: `sudo apt install -y wget curl lolcat git jq`
- Then, run 

```bash
curl -s https://raw.githubusercontent.com/m2sup3rn0va/gg/main/install.sh | bash
```

- This will create a new directory `$HOME/.gg` and some files to install and update the tools
- Once completed, you can run `gg help` or `gg` directly and it will show you the help menu
- To see what all tools are available to install run: `gg list`

## **Installed Cmdlets**

---

- Once you install `shell` with `gg install shell`, you will get some extra commands like:
	- Updating and upgrading the system in one command: `apt-update`
	- Free ram using: `clearRam`

## **Future Updates**

---

- Adding more tools

---

<div style="page-break-after: always; visibility: hidden">
\pagebreak
</div>
