# shorten dir
export PROMPT_DIRTRIM=3

export SSH_AUTH_SOCK=~/.1password/agent.sock

export PS1="[\[\e[1;35m\]\W/\[\e[0m\]]\[\e[1m\]\$\[\e[0m\] "
# export PS1="[\e[1;35m\W/\e[0m]\e[1m\$\e[0m "
#
# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\w\a\]$PS1"
    ;;
*)
    ;;
esac

# remap caps to escape
setxkbmap -option caps:escape

alias tree="exa -T"
alias ls="exa"
alias l="ls -a"
alias ll="ls -lah"
alias fd="fdfind"

alias slp="systemctl suspend"
alias noslp="xset -dpms; xset s noblank; xset s off"

alias py="python3"
alias python="python3"
alias pip="pip3"
alias nb="newsboat"

alias gc="git commit -m"
alias ga="git add"
gat() { git add $1; git status; }
alias gt="git status"

cs() { cd "$@" && ls; }

alias h="history 20"

alias dt="cd ~/Desktop"
alias dn="cd ~/Downloads"
alias dc="cd ~/Documents"

alias bashrc="source ~/.gfasters-bashrc"
alias def="xfce4-dict -d"


# from https://superuser.com/a/611582
countdown() {
    start="$(( $(date '+%s') + $1))"
    while [ $start -ge $(date +%s) ]; do
        time="$(( $start - $(date +%s) ))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

stopwatch() {
    start=$(date +%s)
    while true; do
        time="$(( $(date +%s) - $start))"
        printf '%s\r' "$(date -u -d "@$time" +%H:%M:%S)"
        sleep 0.1
    done
}

# from https://unix.stackexchange.com/a/186502
mdw() {
    pandoc "$@" | w3m -T text/html
}

eval "$(starship init bash)"
