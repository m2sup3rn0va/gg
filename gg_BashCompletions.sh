#! /bin/bash

# gg - help version list install update
# list - help tools shell
# install - help tools
# install tools - network web
# update - help gg shell tools
# update tools - network web

_ggCompletions()
{
	local cur prev opts
	COMPREPLY=()
	
	cur="${COMP_WORDS[COMP_CWORD]}"
	prev="${COMP_WORDS[COMP_CWORD-1]}"
	
	ggSwitches="help version list install update"
	gglistSwitches="help tools shell"
	gginstallSwitches="help tools"
	gginstallupdatetoolsSwitches="network web"
	ggupdateSwitches="help gg tools shell"

	if [[ ${prev} == "gg" ]] ; then
	COMPREPLY=( $(compgen -W "${ggSwitches}" -- ${cur}) )
	return 0
	fi
	
	if [[ ${prev} == "list" ]] ; then
	COMPREPLY=( $(compgen -W "${gglistSwitches}" -- ${cur}) )
	return 0
	fi
	
	if [[ ${prev} == "install" ]] ; then
	COMPREPLY=( $(compgen -W "${gginstallSwitches}" -- ${cur}) )
	return 0
	fi

	if [[ ${prev} == "tools" ]] ; then
	COMPREPLY=( $(compgen -W "${gginstallupdatetoolsSwitches}" -- ${cur}) )
	return 0
	fi

	if [[ ${prev} == "update" ]] ; then
	COMPREPLY=( $(compgen -W "${ggupdateSwitches}" -- ${cur}) )
	return 0
	fi
}

complete -F _ggCompletions gg
