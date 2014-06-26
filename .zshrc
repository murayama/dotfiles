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
# PROMPT2="%{${fg[blue]}%}%_> %{${reset_color}%}"
# SPROMPT="%{${fg[red]}%}correct: %R -> %r [nyae]? %{${reset_color}%}"
# RPROMPT="%{${YELLOW}%}[%~]%{${reset_color}%}"

autoload -Uz vcs_info
zstyle ':vcs_info:*' enable git 

# 下のformatsの値をそれぞれの変数に入れてくれる機能の、変数の数の最大。
# デフォルトだと2くらいなので、指定しておかないと、下のformatsがほぼ動かない。
zstyle ':vcs_info:*' max-exports 7

# 左から順番に、vcs_info_msg_{n}_ という名前の変数に格納されるので、下で利用する
zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s'
# 状態が特殊な場合のformats
zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s'

# 4.3.10以上の場合は、check-for-changesという機能を使う。
autoload -Uz is-at-least
if is-at-least 4.3.10; then
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' formats '%R' '%S' '%b' '%s' '%c' '%u'
    zstyle ':vcs_info:*' actionformats '%R' '%S' '%b|%a' '%s' '%c' '%u'
fi

# zshのPTOMPTに渡す文字列は、可読性がそんなに良くなくて、読み書きしたり、つまりデバッグが
# 大変なため、文字列を組み立てるのは関数でやることにする。
# そのほうが分岐などを追加するのが楽。
# この先、追加で表示させたい情報はいろいろでてくるとおもうし。
function echo_rprompt () {
    local repos branch st color

    STY= LANG=en_US.UTF-8 vcs_info
    if [[ -n "$vcs_info_msg_1_" ]]; then
        # -Dつけて、~とかに変換
        repos=`print -nD "$vcs_info_msg_0_"`

        # if [[ -n "$vcs_info_msg_2_" ]]; then
            branch="$vcs_info_msg_2_"
        # else
        #     branch=$(basename "`git symbolic-ref HEAD 2> /dev/null`")
        # fi

        if [[ -n "$vcs_info_msg_4_" ]]; then # staged
            branch="%F{green}$branch%f"
        elif [[ -n "$vcs_info_msg_5_" ]]; then # unstaged
            branch="%F{red}$branch%f"
        else
            branch="%F{blue}$branch%f"
        fi

        print -n "[%25<..<"
        print -n "%F{yellow}$vcs_info_msg_1_%F"
        print -n "%<<]"

        print -n "[%15<..<"
        print -nD "%F{yellow}$repos%f"
        print -n "@$branch"
        print -n "%<<]"

    else
        print -nD "[%F{yellow}%60<..<%~%<<%f]"
    fi
}

setopt prompt_subst
RPROMPT='`echo_rprompt`'

PROMPT+='$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# how to use
# PROMPT='`rprompt-git-current-branch`'

# git current branch
# _set_env_git_current_branch() {
#   GIT_CURRENT_BRANCH=$( git branch &> /dev/null | grep '^\*' | cut -b 3- )
# }

# _update_rprompt () {
#   if [ "`git ls-files 2>/dev/null`" ]; then
# #    RPROMPT="[%~:$GIT_CURRENT_BRANCH]"
#     PROMPT="%{${GREEN}%}[%n@%m %1~][$GIT_CURRENT_BRANCH]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
#   else
# #    RPROMPT="[%~]"
#     PROMPT="%{${GREEN}%}[%n@%m %1~]${WINDOW:+"[$WINDOW]"} %(!.#.$) %{${reset_color}%}"
#   fi
# } 
# 
# precmd() 
# { 
#   _set_env_git_current_branch
#   _update_rprompt
# }
# 
# chpwd()
# {
#   _set_env_git_current_branch
#   _update_rprompt
# }


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

alias php="/usr/local/php5/bin/php"

PS1="$PS1"'$([ -n "$TMUX" ] && tmux setenv TMUXPWD_$(tmux display -p "#D" | tr -d %) "$PWD")'

# alias tmux='tmuxx'
if [ -f /Applications/MacVim.app/Contents/MacOS/Vim ]; then
  alias vi='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
  alias vim='env LANG=ja_JP.UTF-8 /Applications/MacVim.app/Contents/MacOS/Vim "$@"'
fi

