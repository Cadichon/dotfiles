GPG_TTY=$(tty)
export GPG_TTY
export EDITOR=emacs
export ANDROID_HOME=$HOME/Library/Android/sdk
export PATH=$PATH:$ANDROID_HOME/platform-tools/
export PATH=$PATH:$HOME/bin

if command -v most &> /dev/null
then
    export PAGER=most
fi

if ! command -v __git_ps1 &> /dev/null
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

export PROMPT_COMMAND="prompt ; $PROMPT_COMMAND"

prompt()
{
    local EXIT=$?
    local EXIT_SYMBOL
    local RED
    local BLUE
    local GREEN
    local RESET
    local CHECK
    RED="\[$(tput setaf 1)\]"
    BLUE="\[$(tput setaf 4)\]"
    GREEN="\[$(tput setaf 2)\]"
    RESET="\[$(tput sgr0)\]"
    CHECK=$'\xE2\x9C\x94'
    CROSS=$'\xE2\x9C\x98'
    if [ $EXIT -eq 0 ]
    then
        EXIT_SYMBOL="$GREEN$CHECK$RESET"
    else
        EXIT_SYMBOL="$RED$CROSS [$EXIT]$RESET"
    fi
    PS1="\t "
    PS1+="$EXIT_SYMBOL"
    PS1+=" \u $(__git_ps1 "$RED"\(%s\)"$RESET":)$BLUE\w$RESET \$ "
}

alias debian='docker run --privileged --rm -it -v $(pwd):/app debian bash'
alias ubuntu='docker run --privileged --rm -it -v $(pwd):/app ubuntu bash'
alias bat='bat --pager never'
alias ls='ls -pG'
alias ne='emacs'
#alias ls="ls --color=auto"
alias la='ls -lAh'
alias mr_clean='find . -name "*~" -ls -delete'

extract () {
    if [ -f "$1" ] ; then
        case "$1" in
            *.tar.bz2)   tar xjf "$1"     ;;
            *.tar.gz)    tar xzf "$1"     ;;
            *.bz2)       bunzip2 "$1"     ;;
            *.rar)       unrar e "$1"     ;;
            *.gz)        gunzip "$1"      ;;
            *.tar)       tar xf "$1"      ;;
            *.tbz2)      tar xjf "$1"     ;;
            *.tgz)       tar xzf "$1"     ;;
            *.zip)       unzip "$1"       ;;
            *.Z)         uncompress "$1"  ;;
            *.7z)        7z x "$1"        ;;
            *)     echo "'$1' cannot be extracted via extract()" ;;
        esac
    else
        echo "'$1' is not a valid file"
    fi
}
