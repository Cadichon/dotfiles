export CLICOLOR=1
export GPG_TTY=$(tty)
export EDITOR=emacs
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=${PATH}:$ANDROID_HOME/platform-tools/
export PATH=${PATH}:$HOME/bin

if type most &> /dev/null
then
    export PAGER=most
fi

if ! type __git_ps1 &> /dev/null
then
    function __git_ps1
    {
        echo -n
    }
fi

if [ -f "/usr/local/etc/profile.d/bash_completion.sh" ]
then
    . "/usr/local/etc/profile.d/bash_completion.sh"
fi

if [ -f ~/.sensible.bash ]
then
    . ~/.sensible.bash
fi

export PROMPT_COMMAND=prompt

prompt()
{
    local EXIT=$?
    local EXIT_SYMBOL
    local YELLOW="\[\e[0;33m\]"
    local RED="\[\e[0;31m\]"
    local BLUE="\[\e[0;34m\]"
    local GREEN="\[\e[0;32m\]"
    local RESET="\[\e[0;0m\]"
    if [ $EXIT -eq 0 ]
    then
        EXIT_SYMBOL="${GREEN}✔${RESET}"
    else
        EXIT_SYMBOL="${RED}✘ [${EXIT}]${RESET}"
    fi
    PS1="\t "
    PS1+="${EXIT_SYMBOL}"
    PS1+=" \u $(__git_ps1 ${RED}\(%s\)${RESET}:)${BLUE}\w${RESET} \$ "
}

if type docker &> /dev/null
then
    alias debian="docker run --rm -it -v $(pwd):/app debian bash"
fi

alias bat="bat --pager never"
alias ls="ls -p"
alias ne="emacs"
#alias ls="ls --color=auto"
alias la="ls -lah"
alias mr_clean="find . -name '*~' -delete"
