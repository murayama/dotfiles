#source ~/.zplug/init.zsh
export ZPLUG_HOME=/usr/local/opt/zplug
source $ZPLUG_HOME/init.zsh

# zplug
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# git
zplug "plugins/git", from:oh-my-zsh

# syntax highlight
zplug 'zsh-users/zsh-syntax-highlighting'

# autocomplete
zplug 'zsh-users/zsh-autosuggestions'
zplug 'zsh-users/zsh-completions'
zplug 'chrissicool/zsh-256color'

zplug 'mollifier/anyframe'
# async
zplug "mafredri/zsh-async", from:github

# history
zplug 'zsh-users/zsh-history-substring-search'

# theme
#zplug "dracula/zsh", as:theme
zplug "sindresorhus/pure", use:pure.zsh, from:github, as:theme

# zplug check はインストールするものがないときに真を返す
# ゆえにそうでないとき zplug install する
if ! zplug check; then
    zplug install
fi

# プラグインを読み込み、コマンドを実行可能にする
zplug load

## Command history configuration
#
HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
setopt hist_ignore_dups
setopt share_history
setopt extended_history

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
setopt list_types
setopt magic_equal_subst
setopt print_eight_bit

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


# completion configuration
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select

# anyframe
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init
zstyle ":anyframe:selector:" use fzf
zstyle ":anyframe:selector:fzf:" command 'fzf --extended'


# fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
# if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
#   source /usr/local/opt/fzf/shell/key-bindings.zsh
#   source /usr/local/opt/fzf/shell/completion.zsh
# fi
export FZF_DEFAULT_COMMAND='rg --files --hidden --follow --glob "!.git/*"'
export FZF_DEFAULT_OPTS='
--height 40%
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -200'"
export FZF_TMUX=1

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}

function gadd() {
    local selected
    selected=$(unbuffer git status -s | fzf -m --ansi --preview="echo {} | awk '{print \$2}' | xargs git diff --color" | awk '{print $2}')
    if [[ -n "$selected" ]]; then
        selected=$(tr '\n' ' ' <<< "$selected")
        git add `echo $selected | xargs`
        echo "Completed: git add $selected"
    fi
  }

#=============================
# anyenv
#=============================
if [ -d $HOME/.anyenv ] ; then
  export PATH="$HOME/.anyenv/bin:$PATH"
  eval "$(anyenv init -)"
  for D in `\ls $HOME/.anyenv/envs`
  do
    export PATH="$HOME/.anyenv/envs/$D/shims:$PATH"
  done
fi

# asdf
if [ -d $HOME/.asdf ]; then
  . $HOME/.asdf/asdf.sh

  . $HOME/.asdf/completions/asdf.bash
fi

eval "$(direnv hook zsh)"

export EDITOR=nvim

# alias
alias vi=nvim
alias g=anyframe-widget-cd-ghq-repository
alias gb=anyframe-widget-checkout-git-branch
alias gh='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'
alias ghe='GITHUB_HOST=github.logica.io hub'

# git log and peco
alias -g C='`git log --oneline | peco | cut -d" " -f1`'
# git reflog and peco
alias -g R='`git reflog | peco | cut -d" " -f1`'

alias ctags="`brew --prefix`/bin/ctags"
export PATH="/usr/local/opt/mysql@5.7/bin:$PATH"

ulimit -u 2048

export GOPATH=$HOME/go
export PATH="$GOPATH/bin:$PATH"

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[[ -f /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh ]] && . /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.zsh
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[[ -f /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh ]] && . /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.zsh
# tabtab source for slss package
# uninstall by removing these lines or running `tabtab uninstall slss`
[[ -f /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh ]] && . /Users/murayama/.npm/_npx/90969/lib/node_modules/serverless/node_modules/tabtab/.completions/slss.zsh
export PATH="/usr/local/opt/postgresql@10/bin:$PATH"
