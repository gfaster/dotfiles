# shorten dir
export PROMPT_DIRTRIM=2

export SSH_AUTH_SOCK=~/.1password/agent.sock

# remap caps to escape
setxkbmap -option caps:escape

alias l="ls -a"
alias ll="ls -la"
alias ..="cd .."
alias fd="fdfind"

alias slp="systemctl suspend"
alias noslp="xset -dpms; xset s noblank; xset s off"

alias py="python3"
alias python="python3"
alias pip="pip3"
alias nb="guake -r feedreader; newsboat; guake -r -"

alias gc="git commit -m"
alias ga="git add"

cs() { cd "$@" && ls; }

start() { nohup "$@" </dev/null >/dev/null 2>&1 && disown & }

alias h="history 20"

alias dt="cd ~/Desktop"
alias dn="cd ~/Downloads"

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
