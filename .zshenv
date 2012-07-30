export SHELL=`which zsh`
export EDITOR=vim
export SVN_EDITOR=vim

PATH=/fractal/home/n-murayama/bin:$PATH
export PATH
export PATH=$HOME/.nodebrew/current/bin:$PATH
export RSENSE_HOME=$HOME/lib/rsense-0.3
#PATH=$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
[[ -s "$HOME/.rvm/scripts/rvm" ]] && . "$HOME/.rvm/scripts/rvm"

eval "$(rbenv init -)"
source ~/.rbenv/completions/rbenv.zsh
