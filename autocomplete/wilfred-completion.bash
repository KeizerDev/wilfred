#!/bin/bash

# bash/zsh provider completion support for wilfred
#
# Usage:
#
# 1. Have wilfred installed and do `npm install -g root`.
# 2. Add the following lines to .bash_profile or .zshrc
#
# if [ -f $(npm root -g)/wilfred/autocomplete/wilfred-completion.bash ]; then
#     . $(npm root -g)/wilfred/autocomplete/wilfred-completion.bash
# fi

if [[ -n ${ZSH_VERSION-} ]]; then
    autoload -U +X compinit && compinit
    autoload -U +X bashcompinit && bashcompinit
fi

_wilfred_completion()
{
    local cur=${COMP_WORDS[COMP_CWORD]}
    local prev=${COMP_WORDS[COMP_CWORD-1]}
    local IFS=$'\n'

    if [[ "$prev" == "wilfred" ]]; then
        # Get all boilerplates using `wilfred -l`
        COMPREPLY=( $(compgen -W "$(wilfred -l  | awk '{print $1;}')" -- $cur) )
    fi

}
complete -o filenames -F _wilfred_completion wilfred