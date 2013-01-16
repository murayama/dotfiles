## Environment variable configuration
#
# LANG
#
#export LANG=ja_JP.eucJP
#export GIT_PAGER='lv'

## Default shell configuration
#
# set prompt
#
autoload colors
colors

local GREEN=$'%{\e[32m%}'
local CYAN=$'%{\e[36m%}'
local YELLOW=$'%{\e[33m%}'

#PROMPT="%{${CYAN}%}[%n@%m] %(!.#.$) %{${reset_color}%}"
PROMPT="%{${GREEN}%}[%n@%m %1~]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
RPROMPT="%{${YELLOW}%}[%~]%{${reset_color}%}"


# git current branch
_set_env_git_current_branch() {
  GIT_CURRENT_BRANCH=$( git branch &> /dev/null | grep '^\*' | cut -b 3- )
}

_update_rprompt () {
  if [ "`git ls-files 2>/dev/null`" ]; then
#    RPROMPT="[%~:$GIT_CURRENT_BRANCH]"
    PROMPT="%{${GREEN}%}[%n@%m %1~][$GIT_CURRENT_BRANCH]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
  else
#    RPROMPT="[%~]"
    PROMPT="%{${GREEN}%}[%n@%m %1~]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
  fi
} 

precmd() 
{ 
  _set_env_git_current_branch
  _update_rprompt
}

chpwd()
{
  _set_env_git_current_branch
  _update_rprompt
}


#case ${UID} in
#	0)
#	PROMPT="%B%{${fg[red]}%}%/#%{${reset_color}%}%b "
#	PROMPT2="%B%{${fg[red]}%}%_#%{${reset_color}%}%b "
#	SPROMPT="%B%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%}%b "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#	PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#	;;
#	*)
#	PROMPT="%{${fg[red]}%}%/%%%{${reset_color}%} "
#	PROMPT2="%{${fg[red]}%}%_%%%{${reset_color}%} "
#	SPROMPT="%{${fg[red]}%}%r is correct? [n,y,a,e]:%{${reset_color}%} "
#	[ -n "${REMOTEHOST}${SSH_CONNECTION}" ] && 
#	PROMPT="%{${fg[white]}%}${HOST%%.*} ${PROMPT}"
#	;;
#esac

#PROMPT="%m:%n%% "
#RPROMPT="[%~]"
#SPROMPT="correct: %R -> %r ? "


#PROMPT="%/%% "
#PROMPT2="%_%% "
#SPROMPT="%r is correct? [n,y,a,e]: "


# auto change directory
#
setopt auto_cd
function chpwd() {ls}

# auto directory pushed that you can get dirs list by cd -[tab]
#
setopt auto_pushd
setopt pushd_ignore_dups

# command correct edition before each completion attempt
#
setopt correct

# compacked complete list display
#
setopt list_packed

## 
#
setopt list_types

##
#
setopt magic_equal_subst

##
#
setopt print_eight_bit

# no remove postfix slash of command line
#
setopt noautoremoveslash

# no beep sound when complete list displayed
#
setopt nolistbeep

setopt nonomatch

## Keybind configuration
#
# vi like keybind
bindkey -e
bindkey "^?"    backward-delete-char
bindkey "^H"    backward-delete-char
bindkey "^[[3~" delete-char
bindkey "^[[1~" beginning-of-line
bindkey "^[[4~" end-of-line

# historical backward/forward search with linehead string binded to ^P/^N
#
autoload history-search-end
zle -N history-beginning-search-backward-end history-search-end
zle -N history-beginning-search-forward-end history-search-end
bindkey "^P" history-beginning-search-backward-end
bindkey "^N" history-beginning-search-forward-end

bindkey "^R" history-incremental-search-backward
bindkey "^S" history-incremental-search-forward

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

## Completion configuration
#
autoload -U compinit
compinit

#autoload predict-on
#predict-on


# set terminal title including current directory
#
case "${TERM}" in
	kterm*|xterm*)
	precmd() {
		echo -ne "\033]0;${USER}@${HOST%%.*}:${PWD}\007"
	}
	;;
esac

#zstyle ':completion:*:default' list-colors ${LS_COLORS}
#export LS_COLORS='di=34:ln=35:so=32:pi=33:ex=31:bd=46;34:cd=43;34:su=41;30:sg=46;30:tw=42;30:ow=43;30'
zstyle ':completion:*' list-colors 'di=01;34' 'ln=35' 'so=31' 'ex=01;32' 'bd=46;34' 'cd=43;34'
#zstyle ':completion:*' list-colors ''
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([%0-9]#)*=0=01;31'

zle_highlight=(default:fg=blue isearch:bold,fg=red)

## alias
#
setopt complete_aliases # aliased ls needs if file/dir completions work

alias du="du -h"
alias df="df -h"

#alias ls="ls --color=auto"
alias ll="ls -ltrAF --color"

alias -g M='| more'
alias -g H='| head'
alias -g G='| grep --color=auto'

alias vi="vim"
alias svndiff="svn diff --diff-cmd ~/.vim/scripts/svndiff"
alias phpctags="ctags -a -R --langmap=PHP:.php.php5 --php-types=c+f+d"

alias r="rails"

alias lv="lv -c"

# [[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm"
# [[ -s "$HOME/.rvm/scripts/rvm" ]] && "$HOME/.rvm/scripts/rvm"

function git_diff() {
  git diff --no-ext-diff -w "$@" | vim -R -
}

### Added by the Heroku Toolbelt
export PATH="/usr/local/heroku/bin:$PATH"
