# The best is yet to come
export ZSH="/usr/share/oh-my-zsh"
export ZSH="/home/klanc/.oh-my-zsh"
ZSH_THEME="miloshadzic"
ENABLE_CORRECTION="true"
COMPLETION_WAITING_DOTS="true"
HIST_STAMPS="yyyy/mm/dd"
plugins=(
  git
  sudo
  #ssh-agent
  zsh-autosuggestions
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

function x {
    7z x $1 -o${1%.*}
}

source $ZSH/oh-my-zsh.sh
export SSH_KEY_PATH="~/.ssh/id_rsa"
source ~/.profile
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

#HOOKS
alertExclusions="vim ssh"
preexec(){
  return
	echo $1 > /tmp/zshPids/$$/lastCommand
	date +%s > /tmp/zshPids/$$/lastTime
}
precmd(){
  return
	last="$(cat /tmp/zshPids/$$/lastTime)"
	if [ $last -eq "0" ]; then
		return
	fi
	commandName="$(cat /tmp/zshPids/$$/lastCommand)"
	command="$(echo $commandName | cut -d' ' -f1)"
	if [[ $alertExclusions =~ (^|[[:space:]])"$command"($|[[:space:]]) ]] ; then
	       return	
  	fi
	timeNow="$(date +%s)"
	(( dif = $timeNow - $last ))
	if (( dif > 5 ));then
		notify-send "finished command" "$commandName"

	fi
	echo "0" > /tmp/zshPids/$$/lastTime
}


if [ ! -f /tmp/bonsai ] 
then
    bonsai.sh -g "40,20" -n > /tmp/bonsai
fi

neofetch
#neofetch --ascii /tmp/bonsai --ascii_colors 172 130 150 108 247
mkdir -p /tmp/zshPids/$$
echo "zsh" > /tmp/zshPids/$$/lastCommand
date +%s > /tmp/zshPids/$$/lastTime
cat /proc/mdstat
s(){
  /usr/bin/ssh -t "$@" "tmux a -t $USER || tmux new -s $USER";
}
eval "$(starship init zsh)"
