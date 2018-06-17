source ~/.zplug/init.zsh

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

# completion configuration
autoload -Uz compinit && compinit

zstyle ':completion:*' menu select

# anyframe
zstyle ":anyframe:selector:" use fzf
fpath=($HOME/.zsh/anyframe(N-/) $fpath)
autoload -Uz anyframe-init
anyframe-init


# fzf
if [ -e /usr/local/opt/fzf/shell/completion.zsh ]; then
  source /usr/local/opt/fzf/shell/key-bindings.zsh
  source /usr/local/opt/fzf/shell/completion.zsh
fi
export FZF_DEFAULT_COMMAND='ag --nocolor -g ""'
export FZF_DEFAULT_OPTS='
--height 40%
--color fg:188,bg:233,hl:103,fg+:222,bg+:234,hl+:104
--color info:183,prompt:110,spinner:107,pointer:167,marker:215
'
export FZF_TMUX=1

fe() {
  local files
  IFS=$'\n' files=($(fzf-tmux --query="$1" --multi --select-1 --exit-0))
  [[ -n "$files" ]] && ${EDITOR:-nvim} "${files[@]}"
}


# asdf
. $HOME/.asdf/asdf.sh

. $HOME/.asdf/completions/asdf.bash

export EDITOR=nvim

# alias
alias vi=nvim
alias g=anyframe-widget-cd-ghq-repository
alias gb=anyframe-widget-checkout-git-branch
alias gh='hub browse $(ghq list | fzf | cut -d "/" -f 2,3)'
alias ghe='GITHUB_HOST=github.logica.io hub'
