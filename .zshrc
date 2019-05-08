# The best is yet to come
export ZSH="/home/klanc/.oh-my-zsh"
ZSH_THEME="miloshadzic"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(
  git
  sudo
  ssh-agent
)

function hex2string () {
  if [ "$#" -eq 0 ]; then
    while read line
    do
      hex2string $line
    done
  else
    while [ "$#" -gt 1 ]; do
      hex2string $1
      shift 1
    done
    I=0
    while [ $I -lt ${#1} ];
    do
      echo -en "\x"${1:$I:2}
      let "I += 2"
    done
    echo ""
  fi
}


function ranger-cd {
    tempfile="$(mktemp -t tmp.XXXXXX)"
    /usr/bin/ranger --choosedir="$tempfile" "${@:-$(pwd)}"
    test -f "$tempfile" &&
    if [ "$(cat -- "$tempfile")" != "$(echo -n `pwd`)" ]; then
        cd -- "$(cat "$tempfile")"
    fi  
    rm -f -- "$tempfile"
}

source $ZSH/oh-my-zsh.sh
export SSH_KEY_PATH="~/.ssh/id_rsa"
source ~/.aliases
export SYSTEMD_EDITOR="/usr/bin/vim"
export INPUTRC=~/.inputrc
export STEAM_DIR=~/.steam/steam/
export PATH=$HOME/.scripts/:$PATH

unsetopt correct_all

autoload -U compinit && compinit

bindkey "^H" backward-delete-word
bindkey "^[[3^" delete-word
unset LD_PRELOAD

if [ ! -f /tmp/bonsai ] 
then
    bonsai -g "40,30" -T | ~/.scripts/bonsaifix.sh | tr ! \\ 2> /dev/null > /tmp/bonsai
fi

neofetch --ascii "$(cat /tmp/bonsai)" --ascii_colors 172 130 150 108 247